package shop.DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.jdbc.JDBCConnectionPool;
import shop.VO.BookcartVO;

public class BookcartDAO {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	public static BookcartDAO instance = new BookcartDAO();

	public static BookcartDAO getInstance() {
		return instance;
	}

	public int insertBookCart(Connection conn, BookcartVO bookcart) throws Exception {
		int result = 0;
		String sql = " insert into bookcart (bcid, bid, id, buycount)" + " values(bcid_seq.nextval,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookcart.getBid());
			pstmt.setString(2, bookcart.getId());
			pstmt.setInt(3, bookcart.getBuycount());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
		return result;

	}

	// id에 해당하는 레코드의 수를 얻어내는 메소드
	public int getBookListCount(Connection conn, String id) throws Exception {
		int x = 0;
		String sql = "select count(*) from bookcart where id=?";
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

	// id에 해당하는 레코드의 목록을 얻어내는 메소드
	public List<BookcartVO> getBookCart(Connection conn, String id) throws Exception {
		List<BookcartVO> list = null;
		String sql = " select bcid, bimage,btitle,bprice,bkind,buycount,discountrate, bookcart.bid" + " from bookcart left join book"
				+ " on bookcart.bid = book.bid";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<BookcartVO>();

			while (rs.next()) {
				BookcartVO vo = new BookcartVO();
				vo.setBprice(rs.getInt("bprice"));
				vo.setBtitle(rs.getString("btitle"));
				vo.setBkind(rs.getString("bkind"));
				vo.setBimage(rs.getString("bimage"));
				vo.setBuycount(rs.getInt("buycount"));
				vo.setBid(rs.getString("bid"));
				vo.setBcid(rs.getInt("bcid"));
				vo.setDiscountRate(rs.getInt("discountRate"));

				list.add(vo);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
		}

		return list;
	}

	// 장바구니 수량 수정
	public int updateBookCount(Connection conn, int bcid, int count) throws Exception {
		int result = 0;

		String sql = "update bookcart set buycount=? where bcid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, bcid);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
		return result;
	}

	// 장바구니에서 cart_id에 대한 레코드 삭제하는 메소드
	public int deleteBookList(Connection conn, int bcid) throws Exception {
		int result = 0;
		String sql = "delete from bookcart where bcid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bcid);

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
		
		return result;
	}

	// 장바구니 모두 비우기 메소드
	public int deleteBookAll(Connection conn, String id) throws Exception {
		int result = 0;
		String sql = "delete from bookcart where id =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				pstmt.close();
		}
		
		return result;
	}

}
