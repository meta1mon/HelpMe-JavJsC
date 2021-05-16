package board.review.dao;

import static common.jdbc.JDBCConnectionPool.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RlikeDao {
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public int insertLike(Connection con, String id, int rno) throws SQLException {
		int result = 0;
		String sql = "insert into rlike values(?, ?)";
		String sql2 = "update review set rlikecnt = rlikecnt +1 where rno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, rno);
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}

		int result2 = 0;
		if (result > 0) {
			try {
				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1, rno);
				result2 = pstmt.executeUpdate();

			} finally {
				close(pstmt);
			}
		}

		return result2;
	}

	public int deleteLike(Connection con, String id, int rno) throws SQLException {
		int result = 0;
		String sql = "delete from rlike where id = ? and rno = ?";
		String sql2 = "update review set rlikecnt = rlikecnt - 1 where rno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, rno);
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}

		int result2 = 0;
		if (result > 0) {
			try {
				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1, rno);
				result2 = pstmt.executeUpdate();

			} finally {
				close(pstmt);
			}
		}

		return result2;
	}

	public int isLike(Connection con, String id, int rno) throws SQLException {
		int result = 0;
		String sql = "select count(*) from rlike where id=? and rno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, rno);
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

	public int likeInt(Connection con, int rno) throws SQLException {
		int result = 0;
		String sql = "select count(*) from rlike where rno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rno);
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
