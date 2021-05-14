package board.study.service;

import static common.jdbc.JDBCConnectionPool.close;
import static common.jdbc.JDBCConnectionPool.commit;
import static common.jdbc.JDBCConnectionPool.getConnection;
import static common.jdbc.JDBCConnectionPool.rollback;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import board.study.dao.RstudyDao;
import board.study.vo.Rstudy;

public class RstudyService {
	public int rstudyWrite(Rstudy vo) throws SQLException {
		Connection con = getConnection();
		int result = new RstudyDao().rstudyWrite(con, vo);
		if (result != 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<Rstudy> getRstudy(int sno) throws SQLException {
		Connection con = getConnection();
		ArrayList<Rstudy> list = new RstudyDao().getRstudy(con, sno);
		close(con);
		return list;
	}

	public int rstudyCnt(int sno) throws SQLException {
		Connection con = getConnection();
		int result = new RstudyDao().rstudyCnt(con, sno);
		close(con);
		return result;
	}

	public int rstudyDelete(int rsno, int sno) throws SQLException {
		Connection con = getConnection();
		int result = new RstudyDao().rstudyDelete(con, rsno, sno);
		if (result != 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public Rstudy rstudyRead(int rsno) throws SQLException {
		Connection con = getConnection();
		Rstudy vo = new RstudyDao().rstudyRead(con, rsno);
		close(con);
		return vo;
	}

	public int rstudyUpdate(Rstudy vo) throws SQLException {
		Connection con = getConnection();
		int result = new RstudyDao().rstudyUpdate(con, vo);
		if (result != 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<Integer> myRstudy(String rswriter) throws SQLException {
		Connection con = getConnection();
		ArrayList<Integer> list = new RstudyDao().myRstudy(con, rswriter);
		close(con);
		return list;
	}
}
