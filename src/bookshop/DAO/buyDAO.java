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
import bookshop.VO.videocartVO;
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
	public void insertBuy(int vid, int bid, String id, String account, String deliveryname, String deliverytel,
			String deliveryadd1, String deliveryadd2, int buyprice, int buycount) throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		System.out.println("insertdao들어옴");
		rs = null; pstmt = null;
		Timestamp regDate = null;
		String sql = ""; //구매에서 사용해야 할 sql이 1개 이상이라서 선언해놓고 아래에 바로 sql문 넣을 예정
		String maxDate = "";
		String todayDate = ""; 
		String compareDate = ""; 
		String number;
		long buyid = 0;
		short nowCount; // 상품 수량 재조정할 때 필요한 변수
		try {
			regDate = new Timestamp(System.currentTimeMillis()); //현재시간 
			todayDate = regDate.toString();
			compareDate = todayDate.substring(0, 4) + todayDate.substring(5, 7) +
					todayDate.substring(8,10); 
			pstmt = conn.prepareStatement("select max(buyid) from buy");
			rs = pstmt.executeQuery();
			System.out.println("rs");
			rs.next();
//			if(rs.getLong(1) > 0) {
//				Long val = new Long(rs.getLong(1));
//				maxDate = val.toString().substring(0,0);
//				number = val.toString().substring(0);
//				System.out.println(number);
//				if(compareDate.equals(maxDate)) {
//					if(Integer.parseInt(number+1) < 10000) 
//						buyid = Long.parseLong(maxDate + (Integer.parseInt(number)+1+10000));
//					else 
//						buyid =  Long.parseLong(maxDate + (Integer.parseInt(number)+1));
//				}else {
//					compareDate += "00001";
//					buyid = Long.parseLong(compareDate);
//				}   //구매날짜가 현재 날짜+시간으로 나타날 수 있도록 하는 코드 ex) 202105071047 + 1
//				conn.setAutoCommit(false);
//		
				System.out.println("insertdao들어옴222");
					//해당 아이디에 대한 bookcart 테이블 레코드들을 가져온 후 buy테이블에 추가
					sql = " insert into buy ( buyid, id, bid, vid ";
					sql += " ,buyprice,";
					sql += " buydate,account, deliveryname, deliverytel, deliveryadd1, deliveryadd2, buycount)";
					sql += " values(buy_seq.nextval,?,?,?,?,?,?,?,?,?,?,?)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					pstmt.setInt(2, bid);
					pstmt.setInt(3, vid);
					pstmt.setInt(4, buyprice);
					pstmt.setTimestamp(5, regDate);
					pstmt.setString(6, account);
					pstmt.setString(7, deliveryname);
					pstmt.setString(8, deliverytel);
					pstmt.setString(9, deliveryadd1);
					pstmt.setString(10, deliveryadd2);
					pstmt.setInt(11, buycount);
					
					pstmt.executeUpdate();
					//상품이 구매되었으므로 booktable 에 있는 상품 수량 재조정함 //영상 수량 없음
					pstmt = conn.prepareStatement("select bcount from book where bid=?");
					pstmt.setInt(1,bid);
					rs= pstmt.executeQuery();
					rs.next();
					nowCount = (short)(rs.getShort(1) - buycount); // book테이블 count - 상품 구매수량
					sql = "update book set bcount=? where bid=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setShort(1, nowCount);
					pstmt.setInt(2, bid);
					pstmt.executeUpdate();
					System.out.println("어어어ㅓㅇ");
				
				pstmt = conn.prepareStatement("delete from bookcart where id=?"); //상품이 구매되면 장바구니 테이블에 있던 구매자 자동 삭제
				// 아이디로 로그인 했을 때 장바구니에 담겨있던 상품이 구매되면 자동으로 장바구니에서도 사라짐 
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				
				pstmt = conn.prepareStatement("delete from videocart where id=?");
				pstmt.setString(1, id);
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
		//member id에 해당하는 buy테이블 레코드 수 얻어내는 메소드
		public int getListCount(String id) throws Exception{
			Connection conn = JDBCConnectionPool.getConnection();
			pstmt = null; rs = null;
			String sql = "select count(*) from buy where id=?";
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
			String sql = "select bimage, btitle, vimage, vtitle " ;
				   sql += " ,buyprice, buycount, buydate, account "; 
			       sql += " ,deliveryname, deliverytel, deliveryadd1, deliveryadd2, saction, book.bid, video.vid ";
			       sql += " from buy inner join book";
			       sql += " on buy.bid = book.bid";
			       sql += " inner join video";
			       sql += " on buy.vid = video.vid";
			
			       try {
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						lists = new ArrayList<buyVO>();
						
					while(rs.next()) {
								buyVO buy = new buyVO();
								buy.setBimage(rs.getString("bimage"));
								buy.setBtitle(rs.getString("btitle"));
								buy.setVimage(rs.getString("vimage"));
								buy.setVtitle(rs.getString("vtitle"));
								buy.setBuyprice(rs.getInt("buyprice"));
								buy.setBuycount(rs.getInt("buycount"));
								buy.setAccount(rs.getString("account"));
								buy.setDeliveryname(rs.getString("deliveryname"));
								buy.setDeliverytel(rs.getString("deliverytel"));
								buy.setDeliveryadd1(rs.getString("deliveryadd1"));
								buy.setDeliveryadd2(rs.getString("deliveryadd2"));
								buy.setSaction(rs.getString("saction"));
								buy.setBid(rs.getInt("bid"));
								buy.setVid(rs.getInt("vid"));
								
								lists.add(buy);
								
							}

					} catch (Exception e) {
						e.printStackTrace();
					} finally {
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
			String sql = "select bimage, btitle, bprice, vimage, vtitle, vprice " ;
			   sql += " ,buyprice, buycount, buydate, account "; 
		       sql += " ,deliveryname, deliverytel, deliveryadd1, deliveryadd2, saction, book.bid, video.vid ";
		       sql += " from buy inner join book";
		       sql += " on buy.bid = book.bid";
		       sql += " inner join video";
		       sql += " on buy.vid = video.vid";
		       sql += " where id=?";
			List<buyVO> lists = null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				lists = new ArrayList<buyVO>();
				
				while(rs.next()) {
					buy = new buyVO();
					
					buy.setBimage(rs.getString("bimage"));
					buy.setBtitle(rs.getString("btitle"));
					buy.setVimage(rs.getString("vimage"));
					buy.setVtitle(rs.getString("vtitle"));
					buy.setBuyprice(rs.getInt("buyprice"));
					buy.setBuycount(rs.getInt("buycount"));
					buy.setAccount(rs.getString("account"));
					buy.setDeliveryname(rs.getString("deliveryname"));
					buy.setDeliverytel(rs.getString("deliverytel"));
					buy.setDeliveryadd1(rs.getString("deliveryadd1"));
					buy.setDeliveryadd2(rs.getString("deliveryadd2"));
					buy.setSaction(rs.getString("saction"));
					buy.setVid(rs.getInt("vid"));
					buy.setVprice(rs.getInt("vprice"));
					buy.setBprice(rs.getInt("bprice"));
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
	
	