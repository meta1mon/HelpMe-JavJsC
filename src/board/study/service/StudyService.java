package board.study.service;

import static common.jdbc.JDBCConnectionPool.close;
import static common.jdbc.JDBCConnectionPool.commit;
import static common.jdbc.JDBCConnectionPool.getConnection;
import static common.jdbc.JDBCConnectionPool.rollback;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import board.study.dao.StudyDao;
import board.study.vo.Study;

public class StudyService {
	public ArrayList<Study> getStudyBoard(int start, int end, String search, int searchType) throws SQLException {
		Connection con = getConnection();
		ArrayList<Study> list = new StudyDao().getStudyBoard(con, start, end, search, searchType);
		close(con);
		return list;
	}

// 마이페이지에서 게시글 볼 때, 페이지 구분 없게 볼 수 있도록 함
	public ArrayList<Study> getStudyBoard(String search, int searchType) throws SQLException {
		Connection con = getConnection();
		ArrayList<Study> list = new StudyDao().getStudyBoard(con, search, searchType);
		close(con);
		return list;
	}
	
	public int studyCnt(String search, int searchType ) throws SQLException {
		Connection con = getConnection();
		int cnt = new StudyDao().studyCnt(con, search, searchType);
		close(con);
		return cnt;
	}
	
	public int studyWrite(Study vo) throws SQLException {
		Connection con = getConnection();
		int result = new StudyDao().studyWrite(con, vo);
		if (result != 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public Study studyRead(int sno) throws SQLException {
		Connection con = getConnection();
		Study vo = new StudyDao().studyRead(con, sno);
		close(con);
		return vo;
	}
	
	public int studyDelete(int sno) throws SQLException {
		Connection con = getConnection();
		int result = new StudyDao().studyDelete(con, sno);
		if (result != 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public int studyUpdate(Study vo) throws SQLException {
		Connection con = getConnection();
		int result = new StudyDao().studyUpdate(con, vo);
		if (result != 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public int viewInt(int sno) throws SQLException {
		Connection con = getConnection();
		int result = new StudyDao().viewInt(con, sno);
		if (result != 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
}
