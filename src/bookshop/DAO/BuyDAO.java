package bookshop.DAO;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


import bookshop.VO.BookcartVO;
import bookshop.VO.BuyVO;
import bookshop.VO.VideocartVO;
import common.jdbc.JDBCConnectionPool;

public class BuyDAO {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
//
////	private static BuyDAO instance = new BuyDAO();
////
////	
////	public static BuyDAO getinstance() {
////		return instance;
////	}

//	public BuyDAO() {
//	}

	// bank테이블에 있는 전체 레코드 얻어내는 메소드
	public List<String> getAccount() throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		pstmt = null;
		rs = null;
		List<String> accountList = null;
		String sql = "select * from bank";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			accountList = new ArrayList<String>();

			while (rs.next()) {
				String account = new String(
						rs.getString("account") + " " + rs.getString("bank") + " " + rs.getString("name"));
				accountList.add(account);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return accountList;
	}

	// 장바구니 상품 구매테이블(buy)에 구매목록 등록
	public int insertBuy1(Connection conn, List<BookcartVO> lists, String id, String account, String deliveryname,
			String deliverytel, String deliveryadd1, String deliveryadd2) throws Exception {
		int result = 0;
		System.out.println("insertdao들어옴");
		rs = null;
		pstmt = null;
		Timestamp regDate = null;
		String sql = ""; // 구매에서 사용해야 할 sql이 1개 이상이라서 선언해놓고 아래에 바로 sql문 넣을 예정
		try {
			regDate = new Timestamp(System.currentTimeMillis()); // 현재시간

			System.out.println("insertdao들어옴222");
			for (int i = 0; i < lists.size(); i++) {
				BookcartVO book = lists.get(i);
				// 해당 아이디에 대한 bookcart 테이블 레코드들을 가져온 후 buy테이블에 추가
				sql = " insert into buy ( buyid, pid, id" + " ,buyprice, buycount, ";
				sql += " buydate,account, deliveryname, deliverytel, deliveryadd1, deliveryadd2)";
				sql += " values(buy_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, book.getBid());
				pstmt.setString(2, id);
				pstmt.setInt(3, book.getBprice());
				pstmt.setInt(4, book.getBuycount());
				pstmt.setTimestamp(5, regDate);
				pstmt.setString(6, account);
				pstmt.setString(7, deliveryname);
				pstmt.setString(8, deliverytel);
				pstmt.setString(9, deliveryadd1);
				pstmt.setString(10, deliveryadd2);

				result = pstmt.executeUpdate();
				pstmt.close();
				
				pstmt = conn.prepareStatement("delete from bookcart where id=?"); // 상품이 구매되면 장바구니 테이블에 있던 구매자 자동 삭제
				// 아이디로 로그인 했을 때 장바구니에 담겨있던 상품이 구매되면 자동으로 장바구니에서도 사라짐
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				pstmt.close();
			

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
		}
		return result;
	}

	public int insertBuy2(Connection conn, List<VideocartVO> vlists, String id, String account, String deliveryname,
			String deliverytel, String deliveryadd1, String deliveryadd2) throws Exception {
		int result1 = 0;
		System.out.println("444444444444들어옴");
		rs = null;
		pstmt = null;
		Timestamp regDate = null;
		String sql = "";
		try {
			regDate = new Timestamp(System.currentTimeMillis()); // 현재시간
			System.out.println("try문 들어옴");
			// 해당 아이디에 대한 bookcart 테이블 레코드들을 가져온 후 buy테이블에 추가
			for (int i = 0; i < vlists.size(); i++) {
				System.out.println("55555555");
				VideocartVO video = vlists.get(i);
				sql = " insert into buy ( buyid, pid, id" + " ,buyprice, buycount, ";
				sql += " buydate,account, deliveryname, deliverytel, deliveryadd1, deliveryadd2)";
				sql += " values(buy_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, video.getVid());
				pstmt.setString(2, id);
				pstmt.setInt(3, video.getVprice());
				pstmt.setInt(4, video.getBuycount());
				pstmt.setTimestamp(5, regDate);
				pstmt.setString(6, account);
				pstmt.setString(7, deliveryname);
				pstmt.setString(8, deliverytel);
				pstmt.setString(9, deliveryadd1);
				pstmt.setString(10, deliveryadd2);

				result1 = pstmt.executeUpdate();
				pstmt.close();
				
				pstmt = conn.prepareStatement("delete from videocart where id=?");
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				pstmt.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
		return result1;
	}

	// member id에 해당하는 buy테이블 레코드 수 얻어내는 메소드
	public int getListCount(String id) throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		pstmt = null;
		rs = null;
		String sql = "select count(*) from buy where id=?";
		int x = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return x;
	}

	// buy테이블의 전체 레코드 수를 얻어내는 메소드
	public int getListBCount() throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null;
		pstmt = null;
		int x = 0;
		String sql = "select count(*) from buy";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return x;

	}

//		//buy테이블의 전체 목록을 얻어내는 메소드
		public List<BuyVO> getBuyBookList() throws Exception{
			Connection conn = JDBCConnectionPool.getConnection();
			rs = null; pstmt = null;
			List<BuyVO> lists = null;
			BuyVO buybook = null;
			String sql = "select bimage, btitle, bprice, vimage, vtitle, vprice " ;
			   sql += " buy.* , book.bid, video.vid ";
		       sql += " from buy left join book";
		       sql += " on buy.pid = book.bid";
		       sql += " left join video";
		       sql += " on buy.pid = video.vid";
			
			       try {
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						lists = new ArrayList<BuyVO>();
						
					while(rs.next()) {
								BuyVO buy = new BuyVO();
								buy.setPid(rs.getString("pid"));
								buy.setBtitle(rs.getString("btitle"));
								buy.setBimage(rs.getString("bimage"));
								buy.setBprice(rs.getInt("bprice"));
								buy.setVimage(rs.getString("vimage"));
								buy.setVtitle(rs.getString("vtitle"));
								buy.setVprice(rs.getInt("vprice"));
								buy.setBuyprice(rs.getInt("buyprice"));
								buy.setBuycount(rs.getInt("buycount"));
								buy.setAccount(rs.getString("account"));
								buy.setDeliveryname(rs.getString("deliveryname"));
								buy.setDeliverytel(rs.getString("deliverytel"));
								buy.setDeliveryadd1(rs.getString("deliveryadd1"));
								buy.setDeliveryadd2(rs.getString("deliveryadd2"));
								buy.setSaction(rs.getString("saction"));
								buy.setBid(rs.getString("bid"));
								buy.setVid(rs.getString("vid"));
								
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

	// id에 해당하는 구매목록을 얻어내는 메소드

		public List<BuyVO> getBuyList_id(String id) throws Exception{
			Connection conn = JDBCConnectionPool.getConnection();
			rs = null; pstmt = null;
			List<BuyVO> lists = null;
			BuyVO buy = null;
			String sql = "select bimage, btitle, bprice, vimage, vtitle, vprice, buyprice, buydate " ;
			   sql += " ,book.bid, video.vid ";
		       sql += " FROM buy left join book ";
		       sql += " on buy.pid = book.bid ";
		       sql += " left join video ";
		       sql += " on buy.pid = video.vid ";
		       sql += " where id = ? ";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				lists = new ArrayList<BuyVO>();
				
				while(rs.next()) {
					buy = new BuyVO();
					
					buy.setBtitle(rs.getString("btitle"));
					buy.setBimage(rs.getString("bimage"));
					buy.setBprice(rs.getInt("bprice"));
					buy.setVimage(rs.getString("vimage"));
					buy.setVtitle(rs.getString("vtitle"));
					buy.setVprice(rs.getInt("vprice"));
					buy.setBuyprice(rs.getInt("buyprice"));
					buy.setBid(rs.getString("bid"));
					buy.setVid(rs.getString("vid"));
					buy.setBuydate(rs.getTimestamp("buydate"));
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
//책 id에 해당하는 전체수량 가져오기 (통계 시 사용)

	public int getBuyBookCount1() throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null;
		pstmt = null;
		int tot1 = 0;

		String sql = "select buycount from buy where pid = 'b00001'";// id직접 써줘야함
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				tot1 += rs.getInt("buycount");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return tot1;
	}

	public int getBuyBookCount2() throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null;
		pstmt = null;
		int tot2 = 0;

		String sql = "select buycount from buy where pid = 'b00002'";// id직접 써줘야함
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				tot2 += rs.getInt("buycount");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return tot2;
	}

	public int getBuyBookCount3() throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null;
		pstmt = null;
		int tot3 = 0;

		String sql = "select buycount from buy where pid = 'b00003'";// id직접 써줘야함
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				tot3 += rs.getInt("buycount");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return tot3;
	}

	public int getBuyBookCount4() throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null;
		pstmt = null;
		int tot4 = 0;

		String sql = "select buycount from buy where pid = 'b00004'";// id직접 써줘야함
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				tot4 += rs.getInt("buycount");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return tot4;
	}

	public int getBuyBookCount5() throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null;
		pstmt = null;
		int tot5 = 0;

		String sql = "select buycount from buy where pid = 'b00005'";// id직접 써줘야함
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				tot5 += rs.getInt("buycount");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return tot5;
	}
	

	public int getBuyBookCount6() throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null;
		pstmt = null;
		int tot6 = 0;

		String sql = "select buycount from buy where pid = 'b00006'";// id직접 써줘야함
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				tot6 += rs.getInt("buycount");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return tot6;
	}
	

	public int getBuyBookCount7() throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null;
		pstmt = null;
		int tot7 = 0;

		String sql = "select buycount from buy where pid = 'b00007'";// id직접 써줘야함
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				tot7 += rs.getInt("buycount");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return tot7;
	}
	public int getBuyBookCount8() throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null;
		pstmt = null;
		int tot8 = 0;

		String sql = " select buycount from buy where pid = 'b00008' ";// id직접 써줘야함
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				tot8 += rs.getInt("buycount");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return tot8;
	}
	
	public int getBuyBookCount9() throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null;
		pstmt = null;
		int tot9 = 0;

		String sql = "select buycount from buy where pid = 'b00009'";// id직접 써줘야함
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				tot9 += rs.getInt("buycount");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return tot9;
	}
	public int getBuyBookCount10() throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null;
		pstmt = null;
		int tot10 = 0;

		String sql = "select buycount from buy where pid = 'b00010'";// id직접 써줘야함
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				tot10 += rs.getInt("buycount");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return tot10;
	}
	
	public int getBuyBookCount11() throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null;
		pstmt = null;
		int tot11 = 0;

		String sql = "select buycount from buy where pid = 'b00011'";// id직접 써줘야함
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				tot11 += rs.getInt("buycount");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return tot11;
	}
	
	public int getBuyBookCount12() throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null;
		pstmt = null;
		int tot12 = 0;

		String sql = "select buycount from buy where pid = 'b00012'";// id직접 써줘야함
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				tot12 += rs.getInt("buycount");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return tot12;
	}
	public int getBuyBookCount13() throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null;
		pstmt = null;
		int tot13 = 0;
		String sql = "select buycount from buy where pid = 'b00013'";// id직접 써줘야함
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				tot13 += rs.getInt("buycount");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return tot13;
	}
	public int getBuyBookCount14() throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null;
		pstmt = null;
		int tot14 = 0;

		String sql = "select buycount from buy where pid = 'b00014'";// id직접 써줘야함
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				tot14 += rs.getInt("buycount");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return tot14;
	}
	public int getBuyBookCount15() throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null;
		pstmt = null;
		int tot15 = 0;
		System.out.println("33333333");

		String sql = "select buycount from buy where pid = 'b00015'";// id직접 써줘야함
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				tot15 += rs.getInt("buycount");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return tot15;
	}
	
	//영상 통계
	
	public int getBuyVideoCount1() throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null;
		pstmt = null;
		int tot15 = 0;

		String sql = "select buycount from buy where pid = 'v00001'";// id직접 써줘야함
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				tot15 += rs.getInt("buycount");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return tot15;
	}
}
