package shop.DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import shop.VO.BookcartVO;
import shop.VO.BuyVO;
import shop.VO.VideocartVO;

public class BuyDAO {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	// bank테이블에 있는 전체 레코드 얻어내는 메소드
	public List<String> getAccount(Connection conn) throws Exception {
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
		}
		return accountList;
	}

	// 장바구니 상품 구매테이블(buy)에 구매목록 등록
	public int insertBuy1(Connection conn, List<BookcartVO> lists, String id, String account, String deliveryname,
			String deliverytel, String deliveryadd1, String deliveryadd2) throws Exception {
		int result = 0;
		Timestamp regDate = null;
		String sql = ""; // 구매에서 사용해야 할 sql이 1개 이상이라서 선언해놓고 아래에 바로 sql문 넣을 예정
		try {
			regDate = new Timestamp(System.currentTimeMillis()); // 현재시간

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
				if(result > 0) {
					System.out.println("구매 테이블로 이동 완료");
				} else {
					System.out.println("책 구매 이동 실패");
				}
				pstmt.close();
				pstmt = conn.prepareStatement("delete from bookcart where id=?"); // 상품이 구매되면 장바구니 테이블에 있던 구매자 자동 삭제
				// 아이디로 로그인 했을 때 장바구니에 담겨있던 상품이 구매되면 자동으로 장바구니에서도 사라짐
				pstmt.setString(1, id);
				result = pstmt.executeUpdate();
				if(result > 0) {
					System.out.println("책바구니 테이블 비우기 완료");
				} else {
					System.out.println("책바구니 테이블 비우기 실패");
				}
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
		System.out.println("insertBuy2 들어옴 ");
		int result1 = 0;
		Timestamp regDate = null;
		String sql = "";
		try {
			regDate = new Timestamp(System.currentTimeMillis()); // 현재시간
			// 해당 아이디에 대한 bookcart 테이블 레코드들을 가져온 후 buy테이블에 추가
			for (int i = 0; i < vlists.size(); i++) {
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
				if(result1 > 0) {
					System.out.println("영상 구매 테이블로 이동 완료");
				} else {
					System.out.println("영 구매 이동 실패");
				}
				pstmt.close();
				pstmt = conn.prepareStatement("delete from videocart where id=?");
				pstmt.setString(1, id);
				result1 = pstmt.executeUpdate();
				if(result1 > 0) {
					System.out.println("영상 제거 완료");
				} else {
					System.out.println("영상 제거 실패");
				}
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
	public int getListCount(Connection conn, String id) throws Exception {
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
		}
		return x;
	}

	// buy테이블의 전체 레코드 수를 얻어내는 메소드
	public int getListBCount(Connection conn) throws Exception {
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
		}
		return x;

	}

//		//buy테이블의 전체 목록을 얻어내는 메소드
	public List<BuyVO> getBuyBookList(Connection conn) throws Exception {
		List<BuyVO> lists = null;
		BuyVO buybook = null;
		String sql = "select bimage, btitle, bprice, vimage, vtitle, vprice ";
		sql += " buy.* , book.bid, video.vid ";
		sql += " from buy left join book";
		sql += " on buy.pid = book.bid";
		sql += " left join video";
		sql += " on buy.pid = video.vid";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			lists = new ArrayList<BuyVO>();

			while (rs.next()) {
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
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
		}

		return lists;
	}

	// id에 해당하는 구매목록을 얻어내는 메소드

	public List<BuyVO> getBuyList_id(Connection conn, String id) throws Exception {
		List<BuyVO> lists = null;
		BuyVO buy = null;
		String sql = "select buycount, bimage, btitle, bprice, vimage, vtitle, vprice, buyprice, buydate ";
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

			while (rs.next()) {
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
				buy.setBuycount(rs.getInt("buycount"));
				lists.add(buy);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
		}
		return lists;
	}
	public List<BuyVO> getMyBook(Connection conn, String id, boolean bigSize) throws Exception {
		List<BuyVO> lists = null;
		BuyVO buy = null;
		String sql = "";
		if(bigSize == true) { // 더보기로 들어온 경우,
			sql = "select null, buycount, bimage, btitle, bprice, buyprice, buydate, saction, book.bid FROM buy left join book on buy.pid = book.bid  where id = ? and book.bid is not null  order by buydate desc";
		} else { // 마이페이지에 출력하는 경우
			sql = "select rownum, e.* from (select buycount, bimage, btitle, bprice, buyprice, buydate, saction, book.bid FROM buy left join book on buy.pid = book.bid where id = ? and book.bid is not null order by buydate desc) e where rownum <= 4";
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			lists = new ArrayList<BuyVO>();

			while (rs.next()) {
				buy = new BuyVO();

				buy.setBuycount(rs.getInt(2));
				buy.setBimage(rs.getString(3));
				buy.setBtitle(rs.getString(4));
				buy.setBprice(rs.getInt(5));
				buy.setBuyprice(rs.getInt(6));
				buy.setBuydate(rs.getTimestamp(7));
				buy.setSaction(rs.getString(8));
				buy.setBid(rs.getString(9));
				lists.add(buy);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
		}
		return lists;
	}
	
	public List<BuyVO> getMyVideo(Connection conn, String id, boolean bigSize) throws Exception {
		List<BuyVO> lists = null;
		BuyVO buy = null;
		String sql = "";
		if(bigSize == true) { // 더보기로 들어온 경우,
			sql = "select null, buycount, vimage, vtitle, vprice, buyprice, buydate, saction, video.vid FROM buy left join video on buy.pid = video.vid where id = ? and video.vid is not null order by buydate desc";
		} else { // 마이페이지에 출력하는 경우
			sql = "select rownum, e.* from (select buycount, vimage, vtitle, vprice, buyprice, buydate, saction, video.vid FROM buy left join video on buy.pid = video.vid where id = ? and video.vid is not null order by buydate desc) e where rownum <= 4";
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			lists = new ArrayList<BuyVO>();

			while (rs.next()) {
				buy = new BuyVO();

				buy.setBuycount(rs.getInt(2));
				buy.setVimage(rs.getString(3));
				buy.setVtitle(rs.getString(4));
				buy.setVprice(rs.getInt(5));
				buy.setBuyprice(rs.getInt(6));
				buy.setBuydate(rs.getTimestamp(7));
				buy.setSaction(rs.getString(8));
				buy.setVid(rs.getString(9));
				lists.add(buy);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
		}
		return lists;
	}
}
