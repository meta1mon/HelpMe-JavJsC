package board.review.service;

import static common.jdbc.JDBCConnectionPool.close;
import static common.jdbc.JDBCConnectionPool.commit;
import static common.jdbc.JDBCConnectionPool.getConnection;
import static common.jdbc.JDBCConnectionPool.rollback;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import board.review.dao.RreviewDao;
import board.review.vo.Rreview;


public class RreviewService {
	
	public int rreviewWrite(Rreview vo) throws SQLException {
		Connection con = getConnection();
		int result = new RreviewDao().rreviewWrite(con, vo);
		if (result != 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<Rreview> getRreview(int rno) throws SQLException {
		Connection con = getConnection();
		ArrayList<Rreview> list = new RreviewDao().getRreview(con, rno);
		close(con);
		return list;
	}

	public int rreviewCnt(int rno) throws SQLException {
		Connection con = getConnection();
		int result = new RreviewDao().rreviewCnt(con, rno);
		close(con);
		return result;
	}

	public int rreviewDelete(int rrno, int rno) throws SQLException {
		Connection con = getConnection();
		int result = new RreviewDao().rreviewDelete(con, rrno, rno);
		if (result != 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public Rreview rreviewRead(int rrno) throws SQLException {
		Connection con = getConnection();
		Rreview vo = new RreviewDao().rreviewRead(con, rrno);
		close(con);
		return vo;
	}

	public int rreviewUpdate(Rreview vo) throws SQLException {
		Connection con = getConnection();
		int result = new RreviewDao().rreviewUpdate(con, vo);
		if (result != 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public ArrayList<Integer> myRreview(String rrwriter) throws SQLException {
		Connection con = getConnection();
		ArrayList<Integer> list = new RreviewDao().myRreview(con, rrwriter);
		close(con);
		return list;
	}
}
