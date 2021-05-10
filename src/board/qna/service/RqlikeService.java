package board.qna.service;

import static common.jdbc.JDBCConnectionPool.close;
import static common.jdbc.JDBCConnectionPool.commit;
import static common.jdbc.JDBCConnectionPool.getConnection;
import static common.jdbc.JDBCConnectionPool.rollback;

import java.sql.Connection;
import java.sql.SQLException;

import board.qna.dao.QlikeDao;
import board.qna.dao.RqlikeDao;

public class RqlikeService {
	public int insertLike(String id, int rqno) throws SQLException {
		Connection con = getConnection();
		int result = new RqlikeDao().insertLike(con, id, rqno);
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public int deleteLike(String id, int rqno) throws SQLException {
		Connection con = getConnection();
		int result = new RqlikeDao().deleteLike(con, id, rqno);
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public int isLike(String id, int rqno) throws SQLException {
		Connection con = getConnection();
		int result = new RqlikeDao().isLike(con, id, rqno);
		close(con);
		return result;
	}
}
