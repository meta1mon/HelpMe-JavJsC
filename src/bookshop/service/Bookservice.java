package bookshop.service;

import static common.jdbc.JDBCConnectionPool.getConnection;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import bookshop.DAO.BookcartDAO;
import bookshop.DAO.ShopBookDAO;
import bookshop.VO.ShopBookVo;

public class Bookservice {
	public void insertBook(ShopBookVo book)throws Exception {
		Connection conn = getConnection();
		ShopBookDAO dao = ShopBookDAO.getinstance();
		dao.insertBook(conn, book);
	}
	
	public void updateBook(ShopBookVo book, String bid) throws Exception{
		Connection conn = getConnection();
		ShopBookDAO dao = ShopBookDAO.getinstance();
		dao.updateBook(conn, book, bid);
	}
	public void deleteBook(String bid) throws Exception{
		Connection conn = getConnection();
		ShopBookDAO dao = ShopBookDAO.getinstance();
		dao.deleteBook(conn, bid);
	}
	public List<ShopBookVo> getBooks(String bkind) throws SQLException{
		Connection conn = getConnection();
		List<ShopBookVo> bookList = null;
		ShopBookDAO dao = ShopBookDAO.getinstance();
		bookList = dao.getBooks(conn,bkind);
		return bookList;
	}
	public int getBookCount() throws Exception {
		Connection conn = getConnection();
		int x = 0;
		ShopBookDAO dao = ShopBookDAO.getinstance();
		x = dao.getBookCount();
		return x;
	}
}
