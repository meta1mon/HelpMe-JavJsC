package board.qna.service;

import static common.jdbc.JDBCConnectionPool.close;
import static common.jdbc.JDBCConnectionPool.commit;
import static common.jdbc.JDBCConnectionPool.getConnection;
import static common.jdbc.JDBCConnectionPool.rollback;

import java.sql.Connection;
import java.sql.SQLException;

import board.qna.dao.QlikeDao;

public class QlikeService {
	public int insertLike(String id, int qno) throws SQLException {
		Connection con = getConnection();
		int result = new QlikeDao().insertLike(con, id, qno);
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
		
	}
	
	public int deleteLike(String id, int qno) throws SQLException {
		Connection con = getConnection();
		int result = new QlikeDao().deleteLike(con, id, qno);
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public int isLike(String id, int qno) throws SQLException {
		Connection con = getConnection();
		int result = new QlikeDao().isLike(con, id, qno);
		close(con);
		return result;
	}
	
	public int likeInt(int qno) throws SQLException {
		Connection con = getConnection();
		int result = new QlikeDao().likeInt(con, qno);
		close(con);
		return result;
	}
}
