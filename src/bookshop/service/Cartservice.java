package bookshop.service;

import static common.jdbc.JDBCConnectionPool.*;

import java.sql.Connection;
import java.util.List;

import bookshop.DAO.BookcartDAO;
import bookshop.DAO.VideocartDAO;
import bookshop.VO.BookcartVO;
import bookshop.VO.VideocartVO;

public class Cartservice {

	public int insertBookCart(BookcartVO bookcart) throws Exception {
		Connection conn = getConnection();
		BookcartDAO dao = BookcartDAO.getInstance();
		int result = dao.insertBookCart(conn, bookcart);
		close(conn);
		return result;
	}

	public int getBookListCount(String id) throws Exception {
		Connection conn = getConnection();
		BookcartDAO dao = BookcartDAO.getInstance();
		int result = dao.getBookListCount(conn, id);
		close(conn);
		return result;
	}

	public List<BookcartVO> getBookCart(String id) throws Exception {
		Connection conn = getConnection();
		BookcartDAO dao = BookcartDAO.getInstance();
		List<BookcartVO> list = dao.getBookCart(conn, id);
		close(conn);
		return list;
	}

	public int updateBookCount(int bcid, int count) throws Exception {
		Connection conn = getConnection();
		int result = 0;
		BookcartDAO dao = BookcartDAO.getInstance();
		result = dao.updateBookCount(conn, bcid, count);
		close(conn);
		return result;

	}

	public int deleteBookList(int bcid) throws Exception {
		Connection conn = getConnection();
		BookcartDAO dao = BookcartDAO.getInstance();
		int result = dao.deleteBookList(conn, bcid);
		close(conn);
		return result;
	}

	public int deleteBookAll(String id) throws Exception {
		Connection conn = getConnection();
		BookcartDAO dao = BookcartDAO.getInstance();
		int result = dao.deleteBookAll(conn, id);
		close(conn);
		return result;
	}

	// 비디오카트 서비스
	public int insertVideoCart(VideocartVO videocart) throws Exception {
		Connection conn = getConnection();
		VideocartDAO dao = VideocartDAO.getInstance();
		int result = dao.insertVideoCart(conn, videocart);
		close(conn);
		return result;
	}

	public int getVideoListCount(String id) throws Exception {
		Connection conn = getConnection();
		VideocartDAO dao = VideocartDAO.getInstance();
		int result = dao.getVideoListCount(conn, id);
		close(conn);
		return result;
	}

	public List<VideocartVO> getVideoCart(String id) throws Exception {
		Connection conn = getConnection();
		VideocartDAO dao = VideocartDAO.getInstance();
		List<VideocartVO> list = dao.getVideoCart(conn, id);
		close(conn);
		return list;
	}

	public int updateVideoCount(int vcid, int count) throws Exception {
		Connection conn = getConnection();
		VideocartDAO dao = VideocartDAO.getInstance();
		int result = dao.updateVideoCount(conn, vcid, count);
		close(conn);
		return result;
	}

	public int deleteVideoList(int vcid) throws Exception {
		Connection conn = getConnection();
		VideocartDAO dao = VideocartDAO.getInstance();
		int result = dao.deleteVideoList(conn, vcid);
		close(conn);
		return result;
	}

	public int deleteVideoAll(String id) throws Exception {
		Connection conn = getConnection();
		VideocartDAO dao = VideocartDAO.getInstance();
		int result = dao.deleteVideoAll(conn, id);
		close(conn);
		return result;

	}

}
