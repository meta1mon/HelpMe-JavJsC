package board.study.dao;

import static common.jdbc.JDBCConnectionPool.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.qna.vo.Rqna;
import board.study.vo.Rstudy;

public class RstudyDao {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

// 새 댓글 생성, 추천수 0으로 고정
	public int rstudyWrite(Connection con, Rstudy vo) throws SQLException {
		int result = 0;
		int max = 0;
		int result2 = 0;

		String maxSql = "select nvl(max(rsno),0)+1 from rstudy";
		String sql = "insert into rstudy values(?,?,?,?,    to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS'),  0)";
		String replycnt = "update study set rstudycnt = rstudycnt+1 where sno = ?";

		try {
			pstmt = con.prepareStatement(maxSql);
			rs = pstmt.executeQuery();
			if (rs != null) {
				if (rs.next()) {
					max = rs.getInt(1);
				}
			}
			close(rs);
			close(pstmt);

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, max);
			pstmt.setInt(2, vo.getSno());
			pstmt.setString(3, vo.getRswriter());
			pstmt.setString(4, vo.getRscontent());

			result = pstmt.executeUpdate();

			pstmt = con.prepareStatement(replycnt);
			pstmt.setInt(1, vo.getSno());
			result2 = pstmt.executeUpdate();

		} finally {
			close(pstmt);

		}

		return result2;
	}

	public int rstudyCnt(Connection con, int sno) throws SQLException {
		int cnt = 0;
		String sql = "select count(*) from rstudy where sno=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sno);
			rs = pstmt.executeQuery();
			if (rs != null) {
				if (rs.next())
					cnt = rs.getInt(1);
			}
		} finally {
			close(rs);
			close(pstmt);
		}
		return cnt;
	}

	public ArrayList<Rstudy> getRstudy(Connection con, int sno) throws SQLException {
		ArrayList<Rstudy> list = new ArrayList<Rstudy>();
		String sql = "select * from rstudy where sno = " + sno + " order by rsno";

		try {
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					Rstudy vo = new Rstudy();
					vo.setRsno(rs.getInt("rsno"));
					vo.setSno(rs.getInt("sno"));
					vo.setRswriter(rs.getString("rswriter"));
					vo.setRscontent(rs.getString("rscontent"));
					vo.setRsdate(rs.getString("rsdate"));
					vo.setRslikecnt(rs.getInt("rslikecnt"));
					list.add(vo);
				}
			}
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;

	}

	public int rstudyDelete(Connection con, int rsno, int sno) throws SQLException {
		int result = 0;
		int result2 = 0;
		String sql = "delete from rstudy where rsno = ?";
		String replycnt = "update study set rstudycnt = rstudycnt-1 where sno = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rsno);
			result = pstmt.executeUpdate();
			close(pstmt);

			pstmt = con.prepareStatement(replycnt);
			pstmt.setInt(1, sno);
			result2 = pstmt.executeUpdate();

		} finally {
			close(pstmt);
		}
		return result2;

	}

	public Rstudy rstudyRead(Connection con, int rsno) throws SQLException {
		String sql = "select * from rstudy where rsno = ?";
		Rstudy vo = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rsno);
			rs = pstmt.executeQuery();
			if (rs != null) {
				if (rs.next()) {
					vo = new Rstudy();
					vo.setRsno(rs.getInt("rsno"));
					vo.setSno(rs.getInt("sno"));
					vo.setRswriter(rs.getString("rswriter"));
					vo.setRscontent(rs.getString("rscontent"));
					vo.setRsdate(rs.getString("rsdate"));
					vo.setRslikecnt(rs.getInt("rslikecnt"));
				}
			}
		} finally {
			close(rs);
			close(pstmt);
		}
		return vo;
	}

	public int rstudyUpdate(Connection con, Rstudy vo) throws SQLException {
		int result = 0;
// 지금은 내용만 바꿀 수 있게 한다
		String sql = "update rstudy set rscontent = ? where rsno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getRscontent());
			pstmt.setInt(2, vo.getRsno());
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}
		return result;

	}

	public ArrayList<Integer> myRstudy(Connection con, String rswriter) throws SQLException {
		String sql = "select sno from rstudy where rswriter = ? order by rsno desc";
		ArrayList<Integer> list = new ArrayList<Integer>();

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rswriter);
			rs = pstmt.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					list.add(rs.getInt(1));
				}
			}
		} finally {
			close(pstmt);
		}
		return list;
	}
}
