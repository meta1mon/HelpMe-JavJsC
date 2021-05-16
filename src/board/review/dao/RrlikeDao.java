package board.review.dao;

import static common.jdbc.JDBCConnectionPool.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RrlikeDao {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public int insertLike(Connection con, String id, int rrno) throws SQLException {
		int result = 0;
		String sql = "insert into rrlike values(?, ?)";
		String sql2 = "update rreview set rrlikecnt = rrlikecnt +1 where rrno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, rrno);
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}

		int result2 = 0;
		if (result > 0) {
			try {
				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1, rrno);
				result2 = pstmt.executeUpdate();

			} finally {
				close(pstmt);
			}
		}

		return result2;
	}
	
	public int deleteLike(Connection con, String id, int rrno) throws SQLException {
		int result = 0;
		String sql = "delete from rrlike where id = ? and rrno = ?";
		String sql2 = "update rreview set rrlikecnt = rrlikecnt - 1 where rrno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, rrno);
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}

		int result2 = 0;
		if (result > 0) {
			try {
				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1, rrno);
				result2 = pstmt.executeUpdate();

			} finally {
				close(pstmt);
			}
		}

		return result2;
	}
	
	public int isLike(Connection con, String id, int rrno) throws SQLException {
		int result = 0;
		String sql = "select count(*) from rrlike where id=? and rrno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, rrno);
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
