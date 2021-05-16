package board.review.dao;

import static common.jdbc.JDBCConnectionPool.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.review.vo.Review;


public class ReviewDao {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public ArrayList<Review> getReviewBoard(Connection con, int start, int end, String search, int searchType)
			throws SQLException {
		ArrayList<Review> list = new ArrayList<Review>();
		String sql = "select * from review order by rno desc";
		if (search != null) {
			switch (searchType) {
			case 1:
				sql = "select * from review where rsubject like '%" + search + "%' order by rno desc";
				break;
			case 2:
				sql = "select * from review where rwriter like '%" + search + "%' order by rno desc";
				break;
			case 3:
				sql = "select * from review where rcontent like '%" + search + "%' order by rno desc";
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
					Review vo = new Review();
					vo.setRno(rs.getInt("rno"));
					vo.setRsubject(rs.getString("rsubject"));
					vo.setRwriter(rs.getString("rwriter"));
					vo.setRcontent(rs.getString("rcontent"));
					vo.setRdate(rs.getString("rdate"));
					vo.setRfilepath(rs.getString("rfilepath"));
					vo.setRviewcnt(rs.getInt("rviewcnt"));
					vo.setRlikecnt(rs.getInt("rlikecnt"));
					vo.setRtag(rs.getInt("rtag"));
					vo.setRreviewcnt(rs.getInt("rreviewcnt"));
					list.add(vo);
				}
			}
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;

	}
	
	public ArrayList<Review> getReviewBoard(Connection con, String search, int searchType)
			throws SQLException {
		ArrayList<Review> list = new ArrayList<Review>();
		String sql = "select * from Review order by rno desc";
		if (search != null) {
			switch (searchType) {
			case 1:
				sql = "select * from Review where rsubject like '%" + search + "%' order by rno desc";
				break;
			case 2:
				sql = "select * from Review where rwriter like '%" + search + "%' order by rno desc";
				break;
			case 3:
				sql = "select * from Review where rcontent like '%" + search + "%' order by rno desc";
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
					Review vo = new Review();
					vo.setRno(rs.getInt("rno"));
					vo.setRsubject(rs.getString("rsubject"));
					vo.setRwriter(rs.getString("rwriter"));
					vo.setRcontent(rs.getString("rcontent"));
					vo.setRdate(rs.getString("rdate"));
					vo.setRfilepath(rs.getString("rfilepath"));
					vo.setRviewcnt(rs.getInt("rviewcnt"));
					vo.setRlikecnt(rs.getInt("rlikecnt"));
					vo.setRtag(rs.getInt("rtag"));
					vo.setRreviewcnt(rs.getInt("rreviewcnt"));
					list.add(vo);
				}
			}
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;

	}

	public int reviewCnt(Connection con, String search, int searchType) throws SQLException {
		int cnt = 0;
		String sql = "select count(*) from review ";
		if (search != null) {
			switch (searchType) {
			case 1:
				sql += "where rsubject like '%" + search + "%'";
				break;
			case 2:
				sql += "where rwriter like '%" + search + "%'";
				break;
			case 3:
				sql += "where rcontent like '%" + search + "%'";
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

	public Review reviewRead(Connection con, int rno) throws SQLException {
		String sql = "select * from review where rno = ?";
		Review vo = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rno);
			rs = pstmt.executeQuery();
			if (rs != null) {
				if (rs.next()) {
					vo = new Review();
					vo.setRno(rs.getInt("rno"));
					vo.setRsubject(rs.getString("rsubject"));
					vo.setRwriter(rs.getString("rwriter"));
					vo.setRcontent(rs.getString("rcontent"));
					vo.setRdate(rs.getString("rdate"));
					vo.setRfilepath(rs.getString("rfilepath"));
					vo.setRviewcnt(rs.getInt("rviewcnt"));
					vo.setRlikecnt(rs.getInt("rlikecnt"));
					vo.setRtag(rs.getInt("rtag"));
					vo.setRreviewcnt(rs.getInt("rreviewcnt"));
				}
			}
		} finally {
			close(rs);
			close(pstmt);
		}
		return vo;
	}

// 새 글 생성, 조회수, 추천수 0으로 고정
	public int reviewWrite(Connection con, Review vo) throws SQLException {
		int result = 0;
		int max = 0;

		String maxSql = "select nvl(max(rno),0)+1 from Review";
		String sql = "insert into Review values(?,?,?,?,    to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS'),    ?, 0, 0, ?, 0)";

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
			pstmt.setString(2, vo.getRsubject());
			pstmt.setString(3, vo.getRwriter());
			pstmt.setString(4, vo.getRcontent());
			pstmt.setString(5, vo.getRfilepath());
			pstmt.setInt(6, vo.getRtag());
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);

		}

		return result;
	}

	public int reviewDelete(Connection con, int rno) throws SQLException {
		int result = 0;
		String sql = "delete from Review where rno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rno);
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}
		return result;

	}

	public int reviewUpdate(Connection con, Review vo) throws SQLException {
		int result = 0;
// 지금은 제목이랑 내용만 바꿀 수 있게 한다
		String sql = "update Review set rsubject = ?, rcontent = ?, rfilepath = ? where rno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getRsubject());
			pstmt.setString(2, vo.getRcontent());
			pstmt.setString(3, vo.getRfilepath());
			pstmt.setInt(4, vo.getRno());
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}
		return result;

	}

	public int viewInt(Connection con, int rno) throws SQLException {
		int result = 0;
		String sql = "update Review set rviewcnt = rviewcnt+1 where rno = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rno);
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
