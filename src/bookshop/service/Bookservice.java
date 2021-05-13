package bookshop.service;

import static common.jdbc.JDBCConnectionPool.getConnection;

import java.sql.Connection;

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
	public void deleteBook(int bid) throws Exception{
		Connection conn = getConnection();
		ShopBookDAO dao = ShopBookDAO.getinstance();
		dao.deleteBook(conn, bid);
	}
}
