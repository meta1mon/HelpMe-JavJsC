package board.qna.dao;

import static common.jdbc.JDBCConnectionPool.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.qna.vo.Qna;
import board.qna.vo.Rqna;

public class RqnaDao {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

// 새 댓글 생성, 추천수 0으로 고정
	public int RqnaWrite(Connection con, Rqna vo) throws SQLException {
		int result = 0;
		int max = 0;
		int result2 = 0;

		String maxSql = "select nvl(max(rqno),0)+1 from rqna";
		String sql = "insert into rqna values(?,?,?,?,    to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS'),  0)";
		String replycnt = "update qna set rqnacnt = rqnacnt+1 where qno = ?";

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
			pstmt.setInt(2, vo.getQno());
			pstmt.setString(3, vo.getRqwriter());
			pstmt.setString(4, vo.getRqcontent());

			result = pstmt.executeUpdate();

			pstmt = con.prepareStatement(replycnt);
			pstmt.setInt(1, vo.getQno());
			result2 = pstmt.executeUpdate();

		} finally {
			close(pstmt);

		}

		return result2;
	}

	public int RqnaCnt(Connection con, int qno) throws SQLException {
		int cnt = 0;
		String sql = "select count(*) from rqna where qno=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qno);
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

	public ArrayList<Rqna> getRqna(Connection con, int qno) throws SQLException {
		ArrayList<Rqna> list = new ArrayList<Rqna>();
		String sql = "select * from rqna where qno = " + qno + " order by rqno";

		try {
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					Rqna vo = new Rqna();
					vo.setRqno(rs.getInt("rqno"));
					vo.setQno(rs.getInt("qno"));
					vo.setRqwriter(rs.getString("rqwriter"));
					vo.setRqcontent(rs.getString("rqcontent"));
					vo.setRqdate(rs.getString("rqdate"));
					vo.setRqlikecnt(rs.getInt("rqlikecnt"));
					list.add(vo);
				}
			}
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;

	}

	public int Rqnadelete(Connection con, int rqno, int qno) throws SQLException {
		int result = 0;
		int result2 = 0;
		String sql = "delete from rqna where rqno = ?";
		String replycnt = "update qna set rqnacnt = rqnacnt-1 where qno = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rqno);
			result = pstmt.executeUpdate();
			close(pstmt);

			pstmt = con.prepareStatement(replycnt);
			pstmt.setInt(1, qno);
			result2 = pstmt.executeUpdate();

		} finally {
			close(pstmt);
		}
		return result2;

	}

	public Rqna RqnaRead(Connection con, int rqno) throws SQLException {
		String sql = "select * from rqna where rqno = ?";
		Rqna vo = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rqno);
			rs = pstmt.executeQuery();
			if (rs != null) {
				if (rs.next()) {
					vo = new Rqna();
					vo.setRqno(rs.getInt("rqno"));
					vo.setQno(rs.getInt("qno"));
					vo.setRqwriter(rs.getString("rqwriter"));
					vo.setRqcontent(rs.getString("rqcontent"));
					vo.setRqdate(rs.getString("rqdate"));
					vo.setRqlikecnt(rs.getInt("rqlikecnt"));
				}
			}
		} finally {
			close(rs);
			close(pstmt);
		}
		return vo;
	}

	public int Rqnaupdate(Connection con, Rqna vo) throws SQLException {
		int result = 0;
// 지금은 내용만 바꿀 수 있게 한다
		String sql = "update rqna set rqcontent = ? where rqno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getRqcontent());
			pstmt.setInt(2, vo.getRqno());
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}
		return result;

	}

	public ArrayList<Integer> myRqna(Connection con, String rqwriter) throws SQLException {
		String sql = "select qno from rqna where rqwriter = ? order by rqno desc";
		ArrayList<Integer> list = new ArrayList<Integer>();

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rqwriter);
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
