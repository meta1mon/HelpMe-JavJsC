package shop.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.VO.ShopBookVo;

import static common.jdbc.JDBCConnectionPool.*;

public class ShopBookDAO {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private static ShopBookDAO instance = new ShopBookDAO();

	public static ShopBookDAO getinstance() {
		return instance;
	}

	// 책 등록
	public int insertBook(Connection conn, ShopBookVo book) throws Exception {
		int result = 0;
		String sql = "insert into book values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, book.getBid());
			pstmt.setString(2, book.getBkind());
			pstmt.setString(3, book.getBtitle());
			pstmt.setInt(4, book.getBprice());
			pstmt.setInt(5, book.getBcount());
			pstmt.setString(6, book.getAuthor());
			pstmt.setString(7, book.getPublishing_com());
			pstmt.setString(8, book.getBimage());
			pstmt.setInt(9, book.getDiscountRate());
			pstmt.setTimestamp(10, book.getRegdate());
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pstmt.close();
		}

		return result;
	}

	// 전체등록된 책의 수 얻어내기
	public int getBookCount(Connection conn) throws Exception {
		String sql = "select count(*) from book";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs != null) {
				if (rs.next()) {
					result = rs.getInt(1);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 분류별 또는 전체 등록된 책의 정보를 얻어냄
	public List<ShopBookVo> getBooksList(Connection conn, String bkind) throws SQLException {
		List<ShopBookVo> bookList = null;
		String sql = "select * from book where bkind = ? order by regdate desc";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bkind);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bookList = new ArrayList<ShopBookVo>();
				do {
					ShopBookVo book = new ShopBookVo();
					book.setBid(rs.getString("bid"));
					book.setBkind(rs.getString("bkind"));
					book.setBtitle(rs.getString("btitle"));
					book.setBprice(rs.getInt("bprice"));
					book.setBcount(rs.getInt("bcount"));
					book.setAuthor(rs.getString("author"));
					book.setPublishing_com(rs.getString("publishing_com"));
					book.setBimage(rs.getString("bimage"));
					book.setDiscountRate(rs.getInt("discountRate"));
					book.setRegdate(rs.getTimestamp("regdate"));

					bookList.add(book);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return bookList;
	}

	// bid에 해당하는 책의 정보를 얻어내는 메소드로
	// 등록된 책을 수정하기 위해 수정폼으로 읽어들이기 위한 메소드
	public ShopBookVo getBook(Connection conn, String bid) throws Exception {
		ShopBookVo book = null;
		String sql = "select * from book where bid = ? ";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				book = new ShopBookVo();
				book.setBid(rs.getString("bid"));
				book.setBkind(rs.getString("bkind"));
				book.setBtitle(rs.getString("btitle"));
				book.setBprice(rs.getInt("bprice"));
				book.setBcount(rs.getInt("bcount"));
				book.setAuthor(rs.getString("author"));
				book.setPublishing_com(rs.getString("publishing_com"));
				book.setBimage(rs.getString("bimage"));
				book.setDiscountRate(rs.getInt("discountRate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return book;
	}

	// 책 정보 수정
	public int updateBook(Connection conn, ShopBookVo book, String bid) throws Exception {
		String sql = " update book set bkind=?, btitle=?, bprice=?";
		sql += " ,bcount=?, author=?, publishing_com=? ";
		sql += " ,bimage=?, discountRate=?";
		sql += " where bid=?";
		int result = 0;
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book.getBkind());
			pstmt.setString(2, book.getBtitle());
			pstmt.setInt(3, book.getBprice());
			pstmt.setInt(4, book.getBcount());
			pstmt.setString(5, book.getAuthor());
			pstmt.setString(6, book.getPublishing_com());
			pstmt.setString(7, book.getBimage());
			pstmt.setInt(8, book.getDiscountRate());
			pstmt.setString(9, book.getBid());

			result = pstmt.executeUpdate();
			System.out.println("업데이트 들어옴.다오");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 책 삭제
	public int deleteBook(Connection conn, String bid) throws Exception {
		int result = 0;
		String sql = "delete from book where bid=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bid);
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

//	// shop main에 신간책 목록 얻어내기 위한 메소드
//	// 아직 기능구현 안됨 ㅜ
//	public ShopBookVo[] getBooks(Connection conn, String bkind, int count) throws SQLException {
//		ShopBookVo bookList[] = null;
//		String sql = " select * from (";
//		sql += " select * from book where bkind=?";
//		sql += " order by regdate desc) where rownum < ?";
//		int i = 0;
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, bkind);
//			pstmt.setInt(2, count);
//			System.out.println("????");
//			rs = pstmt.executeQuery();
//
//			if (rs.next()) {
//				bookList = new ShopBookVo[count];
//				do {
//					ShopBookVo book = new ShopBookVo();
//					book.setBid(rs.getString("bid"));
//					book.setBkind(rs.getString("bkind"));
//					book.setBtitle(rs.getString("btitle"));
//					book.setBprice(rs.getInt("bprice"));
//					book.setBcount(rs.getInt("bcount"));
//					book.setAuthor(rs.getString("author"));
//					book.setPublishing_com(rs.getString("publishing_com"));
//					book.setBimage(rs.getString("bimage"));
//					book.setDiscountRate(rs.getInt("discountRate"));
//					book.setRegdate(rs.getTimestamp("regdate"));
//
//					bookList[i] = book;
//					i++;
//				} while (rs.next());
//
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			close(rs);
//			close(pstmt);
//		}
//		return bookList;
//	}
}
