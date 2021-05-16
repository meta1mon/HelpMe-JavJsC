package admin.service;

import java.sql.Connection;
import java.util.ArrayList;

import admin.dao.BuyCountDao;

import static common.jdbc.JDBCConnectionPool.*;

public class BuyCountService {
	public int getBuyBookCount(String pid) throws Exception {
		Connection conn = getConnection();
		int result = new BuyCountDao().getBuyBookCount(conn, pid);
		close(conn);
		return result;
	}
	
	public int getBuyVideoCount(String pid) throws Exception {
		Connection conn = getConnection();
		int result = new BuyCountDao().getBuyVideoCount(conn, pid);
		close(conn);
		return result;
	}
	
	public String[][] getTop5Book() throws Exception {
		Connection conn = getConnection();
		String[][] arr = new BuyCountDao().getTop5Book(conn);
		close(conn);
		return arr;
	}
	
	public String[][] getTop5Video() throws Exception {
		Connection conn = getConnection();
		String[][] arr = new BuyCountDao().getTop5Video(conn);
		close(conn);
		return arr;
	}

}
