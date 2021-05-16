package shop.service;

import static common.jdbc.JDBCConnectionPool.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import shop.DAO.ShopBookDAO;
import shop.VO.ShopBookVo;

public class Bookservice {

	public int insertBook(ShopBookVo book) throws Exception {
		Connection conn = getConnection();
		ShopBookDAO dao = ShopBookDAO.getinstance();
		int result = dao.insertBook(conn, book);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}

	public int getBookCount() throws Exception {
		Connection conn = getConnection();
		ShopBookDAO dao = ShopBookDAO.getinstance();
		int result = dao.getBookCount(conn);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public List<ShopBookVo> getBooksList(String bkind) throws SQLException {
		Connection conn = getConnection();
		List<ShopBookVo> bookList = null;
		ShopBookDAO dao = ShopBookDAO.getinstance();
		bookList = dao.getBooksList(conn, bkind);
		close(conn);
		return bookList;
	}

	public ShopBookVo getBook(String bid) throws Exception {
		Connection conn = getConnection();
		ShopBookDAO dao = ShopBookDAO.getinstance();
		ShopBookVo vo = dao.getBook(conn, bid);
		close(conn);
		return vo;
	}
	
	public int updateBook(ShopBookVo book, String bid) throws Exception {
		Connection conn = getConnection();
		ShopBookDAO dao = ShopBookDAO.getinstance();
		int result = dao.updateBook(conn, book, bid);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteBook(String bid) throws Exception {
		Connection conn = getConnection();
		ShopBookDAO dao = ShopBookDAO.getinstance();
		int result = dao.deleteBook(conn, bid);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}
