package board.study.service;

import static common.jdbc.JDBCConnectionPool.close;
import static common.jdbc.JDBCConnectionPool.commit;
import static common.jdbc.JDBCConnectionPool.getConnection;
import static common.jdbc.JDBCConnectionPool.rollback;

import java.sql.Connection;
import java.sql.SQLException;

import board.study.dao.RslikeDao;

public class RslikeService {
	public int insertLike(String id, int rsno) throws SQLException {
		Connection con = getConnection();
		int result = new RslikeDao().insertLike(con, id, rsno);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int deleteLike(String id, int rsno) throws SQLException {
		Connection con = getConnection();
		int result = new RslikeDao().deleteLike(con, id, rsno);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int isLike(String id, int rsno) throws SQLException {
		Connection con = getConnection();
		int result = new RslikeDao().isLike(con, id, rsno);
		close(con);
		return result;
	}
}
