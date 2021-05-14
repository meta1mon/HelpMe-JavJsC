package board.qna.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static common.jdbc.JDBCConnectionPool.*;
import board.qna.vo.Qna;

public class QnaDao {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public ArrayList<Qna> getQnaBoard(Connection con, int start, int end, String search, int searchType)
			throws SQLException {
		ArrayList<Qna> list = new ArrayList<Qna>();
		String sql = "select * from qna order by qno desc";
		if (search != null) {
			switch (searchType) {
			case 1:
				sql = "select * from qna where qsubject like '%" + search + "%' order by qno desc";
				break;
			case 2:
				sql = "select * from qna where qwriter like '%" + search + "%' order by qno desc";
				break;
			case 3:
				sql = "select * from qna where qcontent like '%" + search + "%' order by qno desc";
				break;
			default:
				System.out.println("dao 오류");
				break;
			}

		}
		
		String sql2 = "select rownum r, d.* from (" + sql + ") d";
		String sql3 = "select * from (" + sql2 + ") where r between ? and ?";

		try {
			pstmt = con.prepareStatement(sql3);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					Qna vo = new Qna();
					vo.setQno(rs.getInt("qno"));
					vo.setQsubject(rs.getString("qsubject"));
					vo.setQwriter(rs.getString("qwriter"));
					vo.setQcontent(rs.getString("qcontent"));
					vo.setQdate(rs.getString("qdate"));
					vo.setQfilepath(rs.getString("qfilepath"));
					vo.setQviewcnt(rs.getInt("qviewcnt"));
					vo.setQlikecnt(rs.getInt("qlikecnt"));
					vo.setQtag(rs.getInt("qtag"));
					vo.setRqnacnt(rs.getInt("rqnacnt"));
					list.add(vo);
				}
			}
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;

	}
	
	public ArrayList<Qna> getQnaBoard(Connection con, String search, int searchType)
			throws SQLException {
		ArrayList<Qna> list = new ArrayList<Qna>();
		String sql = "select * from qna order by qno desc";
		if (search != null) {
			switch (searchType) {
			case 1:
				sql = "select * from qna where qsubject like '%" + search + "%' order by qno desc";
				break;
			case 2:
				sql = "select * from qna where qwriter like '%" + search + "%' order by qno desc";
				break;
			case 3:
				sql = "select * from qna where qcontent like '%" + search + "%' order by qno desc";
				break;
			default:
				System.out.println("dao 오류");
				break;
			}

		}
		

		try {
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					Qna vo = new Qna();
					vo.setQno(rs.getInt("qno"));
					vo.setQsubject(rs.getString("qsubject"));
					vo.setQwriter(rs.getString("qwriter"));
					vo.setQcontent(rs.getString("qcontent"));
					vo.setQdate(rs.getString("qdate"));
					vo.setQfilepath(rs.getString("qfilepath"));
					vo.setQviewcnt(rs.getInt("qviewcnt"));
					vo.setQlikecnt(rs.getInt("qlikecnt"));
					vo.setQtag(rs.getInt("qtag"));
					vo.setRqnacnt(rs.getInt("rqnacnt"));
					list.add(vo);
				}
			}
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;

	}

	public int QnaCnt(Connection con, String search, int searchType) throws SQLException {
		int cnt = 0;
		String sql = "select count(*) from qna ";
		if (search != null) {
			switch (searchType) {
			case 1:
				sql += "where qsubject like '%" + search + "%'";
				break;
			case 2:
				sql += "where qwriter like '%" + search + "%'";
				break;
			case 3:
				sql += "where qcontent like '%" + search + "%'";
				break;
			default:
				System.out.println("dao 오류");
				break;
			}
		}

		try {
			pstmt = con.prepareStatement(sql);
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

	public Qna QnaRead(Connection con, int qno) throws SQLException {
		String sql = "select * from qna where qno = ?";
		Qna vo = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qno);
			rs = pstmt.executeQuery();
			if (rs != null) {
				if (rs.next()) {
					vo = new Qna();
					vo.setQno(rs.getInt("qno"));
					vo.setQsubject(rs.getString("qsubject"));
					vo.setQwriter(rs.getString("qwriter"));
					vo.setQcontent(rs.getString("qcontent"));
					vo.setQdate(rs.getString("qdate"));
					vo.setQfilepath(rs.getString("qfilepath"));
					vo.setQviewcnt(rs.getInt("qviewcnt"));
					vo.setQlikecnt(rs.getInt("qlikecnt"));
					vo.setQtag(rs.getInt("qtag"));
					vo.setRqnacnt(rs.getInt("rqnacnt"));
				}
			}
		} finally {
			close(rs);
			close(pstmt);
		}
		return vo;
	}

// 새 글 생성, 조회수, 추천수 0으로 고정
	public int QnaWrite(Connection con, Qna vo) throws SQLException {
		int result = 0;
		int max = 0;

		String maxSql = "select nvl(max(qno),0)+1 from qna";
		String sql = "insert into qna values(?,?,?,?,    to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS'),    ?, 0, 0, ?, 0)";

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
			pstmt.setString(2, vo.getQsubject());
			pstmt.setString(3, vo.getQwriter());
			pstmt.setString(4, vo.getQcontent());
			pstmt.setString(5, vo.getQfilepath());
			pstmt.setInt(6, vo.getQtag());
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);

		}

		return result;
	}

	public int Qnadelete(Connection con, int qno) throws SQLException {
		int result = 0;
		String sql = "delete from qna where qno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qno);
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}
		return result;

	}

	public int Qnaupdate(Connection con, Qna vo) throws SQLException {
		int result = 0;
// 지금은 제목이랑 내용만 바꿀 수 있게 한다
		String sql = "update qna set qsubject = ?, qcontent = ?, qfilepath = ? where qno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getQsubject());
			pstmt.setString(2, vo.getQcontent());
			pstmt.setString(3, vo.getQfilepath());
			pstmt.setInt(4, vo.getQno());
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}
		return result;

	}

	public int viewInt(Connection con, int qno) throws SQLException {
		int result = 0;
		String sql = "update qna set qviewcnt = qviewcnt+1 where qno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qno);
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
