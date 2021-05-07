package board.qna.service;

import static common.jdbc.JDBCConnectionPool.close;
import static common.jdbc.JDBCConnectionPool.commit;
import static common.jdbc.JDBCConnectionPool.getConnection;
import static common.jdbc.JDBCConnectionPool.rollback;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import board.qna.dao.QnaDao;
import board.qna.dao.RqnaDao;
import board.qna.vo.Qna;
import board.qna.vo.Rqna;

public class RqnaService {
	public int RqnaWrite(Rqna vo) throws SQLException {
		Connection con = getConnection();
		int result = new RqnaDao().RqnaWrite(con, vo);
		if (result != 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public ArrayList<Rqna> getRqna(int start, int end, int qno) throws SQLException {
		Connection con = getConnection();
		ArrayList<Rqna> list = new RqnaDao().getRqna(con, start, end, qno);
		close(con);
		return list;
	}
	
	public int RqnaCnt(int qno) throws SQLException {
		Connection con = getConnection();
		int result = new RqnaDao().RqnaCnt(con, qno);
		close(con);
		return result;
	}
	
	public int Rqnadelete(int rqno) throws SQLException {
		Connection con = getConnection();
		int result = new RqnaDao().Rqnadelete(con, rqno);
		if (result != 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public Rqna RqnaRead(int rqno) throws SQLException {
		Connection con = getConnection();
		Rqna vo = new RqnaDao().RqnaRead(con, rqno);
		close(con);
		return vo;
	}
	
	public int Rqnaupdate(Rqna vo) throws SQLException {
		Connection con = getConnection();
		int result = new RqnaDao().Rqnaupdate(con, vo);
		if (result != 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
}
