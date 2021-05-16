package board.review.service;

import static common.jdbc.JDBCConnectionPool.close;
import static common.jdbc.JDBCConnectionPool.commit;
import static common.jdbc.JDBCConnectionPool.getConnection;
import static common.jdbc.JDBCConnectionPool.rollback;

import java.sql.Connection;
import java.sql.SQLException;

import board.review.dao.RrlikeDao;


public class RrlikeService {
	public int insertLike(String id, int rrno) throws SQLException {
		Connection con = getConnection();
		int result = new RrlikeDao().insertLike(con, id, rrno);
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public int deleteLike(String id, int rrno) throws SQLException {
		Connection con = getConnection();
		int result = new RrlikeDao().deleteLike(con, id, rrno);
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public int isLike(String id, int rrno) throws SQLException {
		Connection con = getConnection();
		int result = new RrlikeDao().isLike(con, id, rrno);
		close(con);
		return result;
	}
}
