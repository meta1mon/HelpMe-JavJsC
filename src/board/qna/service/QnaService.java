package board.qna.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import static common.jdbc.JDBCConnectionPool.*;

import board.qna.dao.QnaDao;
import board.qna.vo.Qna;

public class QnaService {
	public ArrayList<Qna> getQnaBoard(int start, int end, String search, int searchType) throws SQLException {
		Connection con = getConnection();
		ArrayList<Qna> list = new QnaDao().getQnaBoard(con, start, end, search, searchType);
		close(con);
		return list;
	}
	
// 게시글을 페이지 구분 없이 한 번에 전체 보이기 위해 사용함
	public ArrayList<Qna> getQnaBoard(String search, int searchType) throws SQLException {
		Connection con = getConnection();
		ArrayList<Qna> list = new QnaDao().getQnaBoard(con, search, searchType);
		close(con);
		return list;
	}
	
	public int QnaCnt(String search, int searchType ) throws SQLException {
		Connection con = getConnection();
		int cnt = new QnaDao().QnaCnt(con, search, searchType);
		close(con);
		return cnt;
	}
	
	public int QnaWrite(Qna vo) throws SQLException {
		Connection con = getConnection();
		int result = new QnaDao().QnaWrite(con, vo);
		if (result != 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public Qna QnaRead(int qno) throws SQLException {
		Connection con = getConnection();
		Qna vo = new QnaDao().QnaRead(con, qno);
		close(con);
		return vo;
	}
	
	public int Qnadelete(int qno) throws SQLException {
		Connection con = getConnection();
		int result = new QnaDao().Qnadelete(con, qno);
		if (result != 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public int Qnaupdate(Qna vo) throws SQLException {
		Connection con = getConnection();
		int result = new QnaDao().Qnaupdate(con, vo);
		if (result != 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public int viewInt(int qno) throws SQLException {
		Connection con = getConnection();
		int result = new QnaDao().viewInt(con, qno);
		if (result != 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

}
