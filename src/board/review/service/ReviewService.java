package board.review.service;

import static common.jdbc.JDBCConnectionPool.close;
import static common.jdbc.JDBCConnectionPool.commit;
import static common.jdbc.JDBCConnectionPool.getConnection;
import static common.jdbc.JDBCConnectionPool.rollback;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import board.review.dao.ReviewDao;
import board.review.vo.Review;


public class ReviewService {
	public ArrayList<Review> getReviewBoard(int start, int end, String search, int searchType) throws SQLException {
		Connection con = getConnection();
		ArrayList<Review> list = new ReviewDao().getReviewBoard(con, start, end, search, searchType);
		close(con);
		return list;
	}
	
// 게시글을 페이지 구분 없이 한 번에 전체 보이기 위해 사용함
	public ArrayList<Review> getReviewBoard(String search, int searchType) throws SQLException {
		Connection con = getConnection();
		ArrayList<Review> list = new ReviewDao().getReviewBoard(con, search, searchType);
		close(con);
		return list;
	}
	
	public int reviewCnt(String search, int searchType ) throws SQLException {
		Connection con = getConnection();
		int cnt = new ReviewDao().reviewCnt(con, search, searchType);
		close(con);
		return cnt;
	}
	
	public int reviewWrite(Review vo) throws SQLException {
		Connection con = getConnection();
		int result = new ReviewDao().reviewWrite(con, vo);
		if (result != 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public Review reviewRead(int rno) throws SQLException {
		Connection con = getConnection();
		Review vo = new ReviewDao().reviewRead(con, rno);
		close(con);
		return vo;
	}
	
	public int reviewDelete(int rno) throws SQLException {
		Connection con = getConnection();
		int result = new ReviewDao().reviewDelete(con, rno);
		if (result != 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public int reviewUpdate(Review vo) throws SQLException {
		Connection con = getConnection();
		int result = new ReviewDao().reviewUpdate(con, vo);
		if (result != 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	public int viewInt(int rno) throws SQLException {
		Connection con = getConnection();
		int result = new ReviewDao().viewInt(con, rno);
		if (result != 0) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}
}
