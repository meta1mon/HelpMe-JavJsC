package board.qna.dao;

import static common.jdbc.JDBCConnectionPool.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RqlikeDao {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public int insertLike(Connection con, String id, int rqno) throws SQLException {
		int result = 0;
		String sql = "insert into rqlike values(?, ?)";
		String sql2 = "update rqna set rqlikecnt = rqlikecnt +1 where rqno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, rqno);
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}

		int result2 = 0;
		if (result > 0) {
			try {
				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1, rqno);
				result2 = pstmt.executeUpdate();

			} finally {
				close(pstmt);
			}
		}

		return result2;
	}
	
	public int deleteLike(Connection con, String id, int rqno) throws SQLException {
		int result = 0;
		String sql = "delete from rqlike where id = ? and rqno = ?";
		String sql2 = "update rqna set rqlikecnt = rqlikecnt - 1 where rqno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, rqno);
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}

		int result2 = 0;
		if (result > 0) {
			try {
				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1, rqno);
				result2 = pstmt.executeUpdate();

			} finally {
				close(pstmt);
			}
		}

		return result2;
	}
	
	public int isLike(Connection con, String id, int rqno) throws SQLException {
		int result = 0;
		String sql = "select count(*) from rqlike where id=? and rqno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, rqno);
			rs = pstmt.executeQuery();
			if (rs != null) {
				if (rs.next()) {
					result = rs.getInt(1);
				}
			}
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
}
