package bookshop.DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.sun.rmi.rmid.ExecOptionPermission;

import bookshop.VO.bookcartVO;
import bookshop.VO.buyVO;
import common.jdbc.JDBCConnectionPool;

public class buyDAO {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private static buyDAO instance = new buyDAO();

	
	public static buyDAO getinstance() {
		return instance;
	}
	
	//bank테이블에 있는 전체 레코드 얻어내는 메소드
	public List<String> getAccount() throws Exception{
		Connection conn = JDBCConnectionPool.getConnection();
		pstmt = null;
		rs = null;
		List<String> accountList = null;
		String sql = "select * from bank";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			accountList = new ArrayList<String>();
			
			while(rs.next()) {
				String account = new String(rs.getString("account")+" "
						+ rs.getString("bank")+ " "
						+ rs.getString("name"));
				accountList.add(account);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		return accountList;
	}
	
	//장바구니 상품 구매테이블(buy)에 구매목록 등록
	@SuppressWarnings("resource")
	public void insertBuy(List<bookcartVO> lists, List<videocartVO> vlists, String id, String account, String deliveryname,
			String deliverytel, String deliveryadd1, String deliveryadd2) throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		System.out.println("insertdao들어옴");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Timestamp regDate = null;
		String sql = ""; //구매에서 사용해야 할 sql이 1개 이상이라서 선언해놓고 아래에 바로 sql문 넣을 예정
		String maxDate = "";
		String todayDate = ""; 
		String compareDate = ""; 
		String number;
		long buyID = 0;
		short nowCount; // 상품 수량 재조정할 때 필요한 변수
		try {
			regDate = new Timestamp(System.currentTimeMillis()); //현재시간 
			todayDate = regDate.toString();
			compareDate = todayDate.substring(0, 4) + todayDate.substring(5, 7) +
					todayDate.substring(8,10); 
			pstmt = conn.prepareStatement("select max(buyID) from buy");
			rs = pstmt.executeQuery();
			rs.next();
			if(rs.getLong(1) > 0) {
				Long val = new Long(rs.getLong(1));
				maxDate = val.toString().substring(0,0);
				number = val.toString().substring(0);
				System.out.println(number);
				if(compareDate.equals(maxDate)) {
					if(Integer.parseInt(number+1) < 10000) 
						buyID = Long.parseLong(maxDate + (Integer.parseInt(number)+1+10000));
					else 
						buyID =  Long.parseLong(maxDate + (Integer.parseInt(number)+1));
				}else {
					compareDate += "00001";
					buyID = Long.parseLong(compareDate);
				}   //구매날짜가 현재 날짜+시간으로 나타날 수 있도록 하는 코드 ex) 202105071047 + 1
				conn.setAutoCommit(false);
			}
			
				for(int i=0; i <lists.size(); i++) {
					System.out.println("인서트 sql");
					//해당 아이디에 대한 bookcart 테이블 레코드들을 가져온 후 buy테이블에 추가
					bookcartVO bookcart = lists.get(i);
					//video cart도 추가할수있을듯?
					sql = " insert into buy ( buyID, buyer, bid, btitle, bimage ";
					sql += " ,buyprice, buycount,";
					sql += " buydate,account, deliveryname, deliverytel, deliveryadd1, deliveryadd2)";
					sql += " values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
					pstmt = conn.prepareStatement(sql);
					System.out.println("sql dd??");
					
					pstmt.setLong(1, buyID);
					pstmt.setString(2, id);
					pstmt.setString(3, bookcart.getBid());
					pstmt.setString(4, bookcart.getBtitle());
					pstmt.setString(5, bookcart.getBimage());
					pstmt.setInt(6, bookcart.getBuyprice());
					pstmt.setInt(7, bookcart.getBuycount());
					pstmt.setTimestamp(8, regDate);
					pstmt.setString(9, account);
					pstmt.setString(10, deliveryname);
					pstmt.setString(11, deliverytel);
					pstmt.setString(12, deliveryadd1);
					pstmt.setString(13, deliveryadd2);
				
					pstmt.executeUpdate();

					for(int j=0; j <vlists.size(); j++) {
						 videocartVO vcart = vlists.get(j);
						sql = " insert into buy ( vid, vtitle, vimage) ";
						sql += " values(?,?,?)";
						
						pstmt=conn.prepareStatement(sql);
						pstmt.setString(1, vcart.getVid()); 
						pstmt.setString(2, vcart.getVtitle());
						pstmt.setString(3, vcart.getVimage());
						
						pstmt.executeQuery();
					}
					//상품이 구매되었으므로 booktable 에 있는 상품 수량 재조정함 //영상 수량 없음
					pstmt = conn.prepareStatement("select bcount from book where bid=?");
					
					pstmt.setString(1, bookcart.getBid());
					rs= pstmt.executeQuery();
					rs.next();
					
					nowCount = (short)(rs.getShort(1) - bookcart.getBuycount()); // book테이블 count - 상품 구매수량
					sql = "update book set bcount=? where bid=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, nowCount);
					pstmt.setString(2, bookcart.getBid());
					pstmt.executeUpdate();
				}
				pstmt = conn.prepareStatement("delete from bookcart where buyer=?"); //상품이 구매되면 장바구니 테이블에 있던 구매자 자동 삭제
				pstmt = conn.prepareStatement("delete from videocart where buyer=?");
				// 아이디로 로그인 했을 때 장바구니에 담겨있던 상품이 구매되면 자동으로 장바구니에서도 사라짐 
				pstmt.setString(1, id);
				pstmt.setString(2, id);
				
				pstmt.executeUpdate();
				conn.commit();
				conn.setAutoCommit(true);
				
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
		//id(buyer)에 해당하는 buy테이블 레코드 수 얻어내는 메소드
		public int getListCount(String id) throws Exception{
			Connection conn = JDBCConnectionPool.getConnection();
			pstmt = null; rs = null;
			String sql = "select count(*) from buy where buyer=?";
			int x = 0;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					x = rs.getInt(1);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
			return x;
		}
		//buy테이블의 전체 레코드 수를 얻어내는 메소드
		public int getListBCount() throws Exception{
			Connection conn = JDBCConnectionPool.getConnection();
			rs = null; pstmt = null;
			int x = 0;
			String sql = "select count(*) from buy";
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					x = rs.getInt(1);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
			return x;
			
		}
		//통계 메소드 
		
		//buy테이블의 전체 목록을 얻어내는 메소드
		public List<buyVO> getBuyBookList() throws Exception{
			Connection conn = JDBCConnectionPool.getConnection();
			rs = null; pstmt = null;
			List<buyVO> lists = null;
			buyVO buybook = null;
			String sql = "select * from buy";
			
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				lists = new ArrayList<buyVO>();
				
				while(rs.next()) {
					buybook = new buyVO();
					
					buybook.setBuyid(rs.getInt("buyid"));
					buybook.setBuyer(rs.getString("buyer"));
					buybook.setBid(rs.getString("bid"));
					buybook.setBtitle(rs.getString("btitle"));
					buybook.setBimage(rs.getString("bimage"));
					buybook.setVid(rs.getString("vid"));
					buybook.setVimage(rs.getString("vimage"));
					buybook.setVtitle(rs.getString("vtitle"));
					buybook.setBuydate(rs.getTimestamp("buydate"));
					buybook.setAccount(rs.getString("account"));
					buybook.setDeliveryname(rs.getString("deliveryname"));
					buybook.setDeliveryadd1(rs.getString("deliveryadd1"));
					buybook.setDeliveryadd2(rs.getString("deliveryadd2"));
					buybook.setDeliverytel(rs.getString("deliverytel"));
					buybook.setSaction(rs.getString("saction"));
					
					lists.add(buybook);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
			return lists;
		}
		
		//id에 해당하는 구매목록을 얻어내는 메소드
		
		public List<buyVO> getBuyList_id(String id) throws Exception{
			Connection conn = JDBCConnectionPool.getConnection();
			rs = null; pstmt = null;
			buyVO buy = null;
			String sql ="select * from buy where buyer=?";
			List<buyVO> lists = null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				lists = new ArrayList<buyVO>();
				
				while(rs.next()) {
					buy = new buyVO();
					
					buy.setBuyid(rs.getLong("buyid"));
					buy.setBid(rs.getString("bid"));
					buy.setBtitle(rs.getString("btitle"));
					buy.setBimage(rs.getString("bimage"));
					buy.setBuycount(rs.getInt("buycount"));
					buy.setBuyprice(rs.getInt("buyprice"));
					buy.setSaction(rs.getString("saction"));
					
					lists.add(buy);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn != null) conn.close();
			}
					return lists;
		}
}
	
	