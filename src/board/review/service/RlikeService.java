package board.review.service;

import static common.jdbc.JDBCConnectionPool.close;
import static common.jdbc.JDBCConnectionPool.commit;
import static common.jdbc.JDBCConnectionPool.getConnection;
import static common.jdbc.JDBCConnectionPool.rollback;

import java.sql.Connection;
import java.sql.SQLException;

import board.review.dao.RlikeDao;


public class RlikeService {
	public int insertLike(String id, int rno) throws SQLException {
		Connection con = getConnection();
		int result = new RlikeDao().insertLike(con, id, rno);
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
		
	}
	
	public int deleteLike(String id, int rno) throws SQLException {
		Connection con = getConnection();
		int result = new RlikeDao().deleteLike(con, id, rno);
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public int isLike(String id, int rno) throws SQLException {
		Connection con = getConnection();
		int result = new RlikeDao().isLike(con, id, rno);
		close(con);
		return result;
	}
	
	public int likeInt(int rno) throws SQLException {
		Connection con = getConnection();
		int result = new RlikeDao().likeInt(con, rno);
		close(con);
		return result;
	}
}
