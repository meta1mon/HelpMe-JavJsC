package board.study.service;

import static common.jdbc.JDBCConnectionPool.close;
import static common.jdbc.JDBCConnectionPool.commit;
import static common.jdbc.JDBCConnectionPool.getConnection;
import static common.jdbc.JDBCConnectionPool.rollback;

import java.sql.Connection;
import java.sql.SQLException;

import board.study.dao.SlikeDao;

public class SlikeService {
	public int insertLike(String id, int sno) throws SQLException {
		Connection con = getConnection();
		int result = new SlikeDao().insertLike(con, id, sno);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;

	}

	public int deleteLike(String id, int sno) throws SQLException {
		Connection con = getConnection();
		int result = new SlikeDao().deleteLike(con, id, sno);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int isLike(String id, int sno) throws SQLException {
		Connection con = getConnection();
		int result = new SlikeDao().isLike(con, id, sno);
		close(con);
		return result;
	}

	public int likeInt(int sno) throws SQLException {
		Connection con = getConnection();
		int result = new SlikeDao().likeInt(con, sno);
		close(con);
		return result;
	}
}
