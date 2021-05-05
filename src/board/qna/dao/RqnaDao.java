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

		String maxSql = "select nvl(max(rqno),0)+1 from rqna";
		String sql = "insert into rqna values(?,?,?,?,    to_char(sysdate, 'YYYY-MM-DD HH:MI:SS'),    ?, ?, 0)";

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
			pstmt.setString(5, vo.getRqimage());
			pstmt.setString(6, vo.getRqfilepath());

			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);

		}

		return result;
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

	public ArrayList<Rqna> getRqna(Connection con, int start, int end, int qno) throws SQLException {
		ArrayList<Rqna> list = new ArrayList<Rqna>();
		String sql = "select * from rqna where qno = " + qno + " order by rqno";
		String sql2 = "select rownum r, d.* from (" + sql + ") d";
		String sql3 = "select * from (" + sql2 + ") where r between ? and ?";

		try {
			pstmt = con.prepareStatement(sql3);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					Rqna vo = new Rqna();
					vo.setRqno(rs.getInt("rqno"));
					vo.setQno(rs.getInt("qno"));
					vo.setRqwriter(rs.getString("rqwriter"));
					vo.setRqcontent(rs.getString("rqcontent"));
					vo.setRqdate(rs.getString("rqdate"));
					vo.setRqimage(rs.getString("rqimage"));
					vo.setRqfilepath(rs.getString("rqfilepath"));
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
}
