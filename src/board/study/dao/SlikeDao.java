package board.study.dao;

import static common.jdbc.JDBCConnectionPool.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SlikeDao {
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public int insertLike(Connection con, String id, int sno) throws SQLException {
		int result = 0;
		String sql = "insert into slike values(?, ?)";
		String sql2 = "update study set slikecnt = slikecnt +1 where sno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, sno);
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}

		int result2 = 0;
		if (result > 0) {
			try {
				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1, sno);
				result2 = pstmt.executeUpdate();

			} finally {
				close(pstmt);
			}
		}

		return result2;
	}

	public int deleteLike(Connection con, String id, int sno) throws SQLException {
		int result = 0;
		String sql = "delete from slike where id = ? and sno = ?";
		String sql2 = "update study set slikecnt = slikecnt - 1 where sno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, sno);
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}

		int result2 = 0;
		if (result > 0) {
			try {
				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1, sno);
				result2 = pstmt.executeUpdate();

			} finally {
				close(pstmt);
			}
		}

		return result2;
	}

	public int isLike(Connection con, String id, int sno) throws SQLException {
		int result = 0;
		String sql = "select count(*) from slike where id=? and sno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, sno);
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

	public int likeInt(Connection con, int sno) throws SQLException {
		int result = 0;
		String sql = "select count(*) from slike where sno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sno);
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
