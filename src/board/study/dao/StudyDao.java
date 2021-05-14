package board.study.dao;

import static common.jdbc.JDBCConnectionPool.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.qna.vo.Qna;
import board.study.vo.Study;

public class StudyDao {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public ArrayList<Study> getStudyBoard(Connection con, int start, int end, String search, int searchType)
			throws SQLException {
		ArrayList<Study> list = new ArrayList<Study>();
		String sql = "select * from study order by sno desc";
		if (search != null) {
			switch (searchType) {
			case 1:
				sql = "select * from study where ssubject like '%" + search + "%' order by sno desc";
				break;
			case 2:
				sql = "select * from study where swriter like '%" + search + "%' order by sno desc";
				break;
			case 3:
				sql = "select * from study where scontent like '%" + search + "%' order by sno desc";
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
					Study vo = new Study();
					vo.setSno(rs.getInt("sno"));
					vo.setSsubject(rs.getString("ssubject"));
					vo.setSwriter(rs.getString("swriter"));
					vo.setScontent(rs.getString("scontent"));
					vo.setSdate(rs.getString("sdate"));
					vo.setSfilepath(rs.getString("sfilepath"));
					vo.setSviewcnt(rs.getInt("sviewcnt"));
					vo.setSlikecnt(rs.getInt("slikecnt"));
					vo.setStag(rs.getInt("stag"));
					vo.setRstudycnt(rs.getInt("rstudycnt"));
					list.add(vo);
				}
			}
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;

	}
	
	public ArrayList<Study> getStudyBoard(Connection con, String search, int searchType)
			throws SQLException {
		ArrayList<Study> list = new ArrayList<Study>();
		String sql = "select * from study order by sno desc";
		if (search != null) {
			switch (searchType) {
			case 1:
				sql = "select * from study where ssubject like '%" + search + "%' order by sno desc";
				break;
			case 2:
				sql = "select * from study where swriter like '%" + search + "%' order by sno desc";
				break;
			case 3:
				sql = "select * from study where scontent like '%" + search + "%' order by sno desc";
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
					Study vo = new Study();
					vo.setSno(rs.getInt("sno"));
					vo.setSsubject(rs.getString("ssubject"));
					vo.setSwriter(rs.getString("swriter"));
					vo.setScontent(rs.getString("scontent"));
					vo.setSdate(rs.getString("sdate"));
					vo.setSfilepath(rs.getString("sfilepath"));
					vo.setSviewcnt(rs.getInt("sviewcnt"));
					vo.setSlikecnt(rs.getInt("slikecnt"));
					vo.setStag(rs.getInt("stag"));
					vo.setRstudycnt(rs.getInt("rstudycnt"));
					list.add(vo);
				}
			}
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;

	}
	
	public int studyCnt(Connection con, String search, int searchType) throws SQLException {
		int cnt = 0;
		String sql = "select count(*) from study ";
		if (search != null) {
			switch (searchType) {
			case 1:
				sql += "where ssubject like '%" + search + "%'";
				break;
			case 2:
				sql += "where swriter like '%" + search + "%'";
				break;
			case 3:
				sql += "where scontent like '%" + search + "%'";
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
	
	public Study studyRead(Connection con, int sno) throws SQLException {
		String sql = "select * from study where sno = ?";
		Study vo = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sno);
			rs = pstmt.executeQuery();
			if (rs != null) {
				if (rs.next()) {
					vo = new Study();
					vo.setSno(rs.getInt("sno"));
					vo.setSsubject(rs.getString("ssubject"));
					vo.setSwriter(rs.getString("swriter"));
					vo.setScontent(rs.getString("scontent"));
					vo.setSdate(rs.getString("sdate"));
					vo.setSfilepath(rs.getString("sfilepath"));
					vo.setSviewcnt(rs.getInt("sviewcnt"));
					vo.setSlikecnt(rs.getInt("slikecnt"));
					vo.setStag(rs.getInt("stag"));
					vo.setRstudycnt(rs.getInt("rstudycnt"));
				}
			}
		} finally {
			close(rs);
			close(pstmt);
		}
		return vo;
	}

// 새 글 생성, 조회수, 추천수 0으로 고정
	public int studyWrite(Connection con, Study vo) throws SQLException {
		int result = 0;
		int max = 0;

		String maxSql = "select nvl(max(sno),0)+1 from study";
		String sql = "insert into study values(?,?,?,?,    to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS'),    ?, 0, 0, ?, 0)";

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
			pstmt.setString(2, vo.getSsubject());
			pstmt.setString(3, vo.getSwriter());
			pstmt.setString(4, vo.getScontent());
			pstmt.setString(5, vo.getSfilepath());
			pstmt.setInt(6, vo.getStag());
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);

		}

		return result;
	}

	public int studyDelete(Connection con, int sno) throws SQLException {
		int result = 0;
		String sql = "delete from study where sno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sno);
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}
		return result;

	}

	public int studyUpdate(Connection con, Study vo) throws SQLException {
		int result = 0;
		String sql = "update study set ssubject = ?, scontent = ?, sfilepath = ? where sno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getSsubject());
			pstmt.setString(2, vo.getScontent());
			pstmt.setString(3, vo.getSfilepath());
			pstmt.setInt(4, vo.getSno());
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}
		return result;

	}

	public int viewInt(Connection con, int sno) throws SQLException {
		int result = 0;
		String sql = "update study set sviewcnt = sviewcnt+1 where sno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sno);
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
