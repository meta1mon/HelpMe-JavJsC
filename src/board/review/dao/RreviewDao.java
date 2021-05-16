package board.review.dao;

import static common.jdbc.JDBCConnectionPool.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.review.vo.Rreview;


public class RreviewDao {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

// 새 댓글 생성, 추천수 0으로 고정
	public int rreviewWrite(Connection con, Rreview vo) throws SQLException {
		int result = 0;
		int max = 0;
		int result2 = 0;

		String maxSql = "select nvl(max(rrno),0)+1 from rreview";
		String sql = "insert into rreview values(?,?,?,?,    to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS'),  0)";
		String replycnt = "update review set rreviewcnt = rreviewcnt+1 where rno = ?";

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
			pstmt.setInt(2, vo.getRno());
			pstmt.setString(3, vo.getRrwriter());
			pstmt.setString(4, vo.getRrcontent());

			result = pstmt.executeUpdate();

			pstmt = con.prepareStatement(replycnt);
			pstmt.setInt(1, vo.getRno());
			result2 = pstmt.executeUpdate();

		} finally {
			close(pstmt);

		}

		return result2;
	}

	public int rreviewCnt(Connection con, int rno) throws SQLException {
		int cnt = 0;
		String sql = "select count(*) from rreview where rno=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rno);
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

	public ArrayList<Rreview> getRreview(Connection con, int rno) throws SQLException {
		ArrayList<Rreview> list = new ArrayList<Rreview>();
		String sql = "select * from rreview where rno = " + rno + " order by rrno";

		try {
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					Rreview vo = new Rreview();
					vo.setRrno(rs.getInt("rrno"));
					vo.setRno(rs.getInt("rno"));
					vo.setRrwriter(rs.getString("rrwriter"));
					vo.setRrcontent(rs.getString("rrcontent"));
					vo.setRrdate(rs.getString("rrdate"));
					vo.setRrlikecnt(rs.getInt("rrlikecnt"));
					list.add(vo);
				}
			}
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;

	}

	public int rreviewDelete(Connection con, int rrno, int rno) throws SQLException {
		int result = 0;
		int result2 = 0;
		String sql = "delete from rreview where rrno = ?";
		String replycnt = "update review set rreviewcnt = rreviewcnt-1 where rno = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rrno);
			result = pstmt.executeUpdate();
			close(pstmt);

			pstmt = con.prepareStatement(replycnt);
			pstmt.setInt(1, rno);
			result2 = pstmt.executeUpdate();

		} finally {
			close(pstmt);
		}
		return result2;

	}

	public Rreview rreviewRead(Connection con, int rrno) throws SQLException {
		String sql = "select * from rreview where rrno = ?";
		Rreview vo = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rrno);
			rs = pstmt.executeQuery();
			if (rs != null) {
				if (rs.next()) {
					vo = new Rreview();
					vo.setRrno(rs.getInt("rrno"));
					vo.setRno(rs.getInt("rno"));
					vo.setRrwriter(rs.getString("rrwriter"));
					vo.setRrcontent(rs.getString("rrcontent"));
					vo.setRrdate(rs.getString("rrdate"));
					vo.setRrlikecnt(rs.getInt("rrlikecnt"));
				}
			}
		} finally {
			close(rs);
			close(pstmt);
		}
		return vo;
	}

	public int rreviewUpdate(Connection con, Rreview vo) throws SQLException {
		int result = 0;
// 지금은 내용만 바꿀 수 있게 한다
		String sql = "update rreview set rrcontent = ? where rrno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getRrcontent());
			pstmt.setInt(2, vo.getRrno());
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}
		return result;

	}

	public ArrayList<Integer> myRreview(Connection con, String rrwriter) throws SQLException {
		String sql = "select rno from rreview where rrwriter = ? order by rrno desc";
		ArrayList<Integer> list = new ArrayList<Integer>();

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rrwriter);
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
