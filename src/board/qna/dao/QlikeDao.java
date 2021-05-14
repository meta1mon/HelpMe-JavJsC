package board.qna.dao;

import static common.jdbc.JDBCConnectionPool.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import static common.jdbc.JDBCConnectionPool.*;

public class QlikeDao {
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public int insertLike(Connection con, String id, int qno) throws SQLException {
		int result = 0;
		String sql = "insert into qlike values(?, ?)";
		String sql2 = "update qna set qlikecnt = qlikecnt +1 where qno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, qno);
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}

		int result2 = 0;
		if (result > 0) {
			try {
				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1, qno);
				result2 = pstmt.executeUpdate();

			} finally {
				close(pstmt);
			}
		}

		return result2;
	}

	public int deleteLike(Connection con, String id, int qno) throws SQLException {
		int result = 0;
		String sql = "delete from qlike where id = ? and qno = ?";
		String sql2 = "update qna set qlikecnt = qlikecnt - 1 where qno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, qno);
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}

		int result2 = 0;
		if (result > 0) {
			try {
				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1, qno);
				result2 = pstmt.executeUpdate();

			} finally {
				close(pstmt);
			}
		}

		return result2;
	}

	public int isLike(Connection con, String id, int qno) throws SQLException {
		int result = 0;
		String sql = "select count(*) from qlike where id=? and qno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, qno);
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

	public int likeInt(Connection con, int qno) throws SQLException {
		int result = 0;
		String sql = "select count(*) from qlike where qno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qno);
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
