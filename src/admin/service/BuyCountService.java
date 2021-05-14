package admin.service;

import java.sql.Connection;

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

}
