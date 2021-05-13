package board.study.dao;

import static common.jdbc.JDBCConnectionPool.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class RslikeDao {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public int insertLike(Connection con, String id, int rsno) throws SQLException {
		int result = 0;
		String sql = "insert into rslike values(?, ?)";
		String sql2 = "update rstudy set rslikecnt = rslikecnt +1 where rsno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, rsno);
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}

		int result2 = 0;
		if (result > 0) {
			try {
				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1, rsno);
				result2 = pstmt.executeUpdate();

			} finally {
				close(pstmt);
			}
		}

		return result2;
	}
	
	public int deleteLike(Connection con, String id, int rsno) throws SQLException {
		int result = 0;
		String sql = "delete from rslike where id = ? and rsno = ?";
		String sql2 = "update rstudy set rslikecnt = rslikecnt - 1 where rsno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, rsno);
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}

		int result2 = 0;
		if (result > 0) {
			try {
				pstmt = con.prepareStatement(sql2);
				pstmt.setInt(1, rsno);
				result2 = pstmt.executeUpdate();

			} finally {
				close(pstmt);
			}
		}

		return result2;
	}
	
	public int isLike(Connection con, String id, int rsno) throws SQLException {
		int result = 0;
		String sql = "select count(*) from rslike where id=? and rsno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, rsno);
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
