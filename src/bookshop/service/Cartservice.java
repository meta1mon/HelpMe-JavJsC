package bookshop.service;

import static common.jdbc.JDBCConnectionPool.getConnection;

import java.sql.Connection;

import bookshop.DAO.BookcartDAO;
import bookshop.DAO.VideocartDAO;
import bookshop.VO.BookcartVO;

public class Cartservice {
	
	
	
	public int updateBookCount(int bcid, int count) throws Exception{
		Connection conn = getConnection();
		int result = 0;
		BookcartDAO dao = BookcartDAO.getInstance();
		result = dao.updateBookCount(conn, bcid, count);
		return result;
		
	}

	public void deleteBookList(int bcid) throws Exception {
		Connection conn = getConnection();
		BookcartDAO dao = BookcartDAO.getInstance();
		dao.deleteBookList(conn, bcid);
	}
	
	public void deleteBookAll(String id)throws Exception {
		Connection conn = getConnection();
		BookcartDAO dao = BookcartDAO.getInstance();
		dao.deleteBookAll(conn, id);	
	}
	//비디오카트 서비스
	public void deleteVideoList(int vcid) throws Exception{
		Connection conn = getConnection();
		VideocartDAO dao = VideocartDAO.getInstance();
		dao.deleteVideoList(conn, vcid);
	}
	
	public void deleteVideoAll(String id)throws Exception {
		Connection conn = getConnection();
		VideocartDAO dao = VideocartDAO.getInstance();
		dao.deleteVideoAll(conn, id);
	}
}
	

