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

	public ArrayList<Qna> getQnaBoard(Connection con, int start, int end, String search) throws SQLException {
		ArrayList<Qna> list = new ArrayList<Qna>();
		String sql = "select * from qna order by qno desc";
		if (search != null) {
			sql = "select * from qna where (qsubject like '%" + search + "%' or qcontent like '%" + search
					+ "%') order by qno desc";
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
					vo.setQimage(rs.getString("qimage"));
					vo.setQfilepath(rs.getString("qfilepath"));
					vo.setQviewcnt(rs.getInt("qviewcnt"));
					vo.setQlikecnt(rs.getInt("qlikecnt"));
					list.add(vo);
				}
			}
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;

	}

	public int QnaCnt(Connection con, String search) throws SQLException {
		int cnt = 0;
		String sql = "select count(*) from qna";
		if (search != null) {
			sql += " where qsubject like '%" + search + "%' or qcontent like '%" + search + "%'";
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
					vo.setQimage(rs.getString("qimage"));
					vo.setQfilepath(rs.getString("qfilepath"));
					vo.setQviewcnt(rs.getInt("qviewcnt"));
					vo.setQlikecnt(rs.getInt("qlikecnt"));
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
		String sql = "insert into qna values(?,?,?,?,    to_char(sysdate, 'YYYY-MM-DD HH:MI:SS'),    ?, ?, 0, 0)";

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
			pstmt.setString(5, vo.getQimage());
			pstmt.setString(6, vo.getQfilepath());

			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);

		}

		return result;
	}
//
//	public int QnaDelete(Connection con, Qna vo) {
//		int result = 0;
//		String sql = "delete from board where bno = ? and bpwd = ?";
//		try {
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, vo.getBno());
//			pstmt.setString(2, vo.getBpwd());
//			result = pstmt.executeUpdate();
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		return result;
//
//	}
//
//	public int boardupdate(Connection con, Board vo) {
//		int result = 0;
//		String sql = "update board set bsubject = ?, bcontent = ?, bfilepath = ? where bno = ? and bpwd = ?";
//		try {
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, vo.getBsubject());
//			pstmt.setString(2, vo.getBcontent());
//			pstmt.setString(3, vo.getBfilepath());
//			pstmt.setInt(4, vo.getBno());
//			pstmt.setString(5, vo.getBpwd());
//			result = pstmt.executeUpdate();
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//		}
//		return result;
//
//	}
//
//	// 현재의 시간을 가져오는 함수
//	public String getDate() {
//		String SQL = "SELECT SYSDATE FROM DUAL";
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(SQL);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				return rs.getString(1);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "시간을 가져오지못했습니다."; // 데이터베이스 오류
//	}
//
//	// bbsID 게시글 번호 가져오는 함수
//	public int getNext() {
//		String SQL = "SELECT BNO FROM QNA ORDER BY BNO DESC";
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(SQL);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				return rs.getInt(1) + 1;
//			}
//			return 1;// 첫 번째 게시물인 경우
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return -1; // 데이터베이스 오류
//	}
//
//	// 실제로 글을 작성하는 함수
//	public int write(String bsubject, String bno, String bcontent) {
//		String SQL = "INSERT INTO QNA VALUES(?, ?, ?, ?, ?, ?)";
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(SQL);
//			pstmt.setInt(1, getNext());
//			pstmt.setString(2, bsubject);
//			pstmt.setString(3, bno);
//			pstmt.setString(4, getDate());
//			pstmt.setString(5, bcontent);
//			pstmt.setInt(6, 1); // available
//			return pstmt.executeUpdate();
//
//		} catch (Exception e) {
//			System.out.println("write메서드 catch문");
//			e.printStackTrace();
//		}
//		System.out.println("write메서드return문위");
//		return -1; // 데이터베이스 오류
//	}
//
//	// 글 목록
//	public ArrayList<Bbs> getList(int pageNumber) {
//		String SQL = "SELECT * FROM QNA WHERE BNO < ? and bavailable = 1 order by BNO desc";
//		ArrayList<Bbs> list = new ArrayList<Bbs>();
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(SQL);
//			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				Bbs bbs = new Bbs();
//				bbs.setBno(rs.getInt(1));
//				bbs.setBsubject(rs.getString(2));
//				bbs.setBwriter(rs.getString(3));
//				bbs.setBdate(rs.getString(4));
//				bbs.setBcontent(rs.getString(5));
//				bbs.setBavailable(rs.getInt(6));
//				list.add(bbs);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return list;
//	}
//
//	// 10 단위 페이징 처리를 위한 함수. 다음글이 없을때 next안뜨도록.
//	public boolean nextPage(int pageNumber) {
//		String SQL = "SELECT * FROM QNA WHERE BNO < ? and bavailable = 1 order by BNO desc";
//		ArrayList<Bbs> list = new ArrayList<Bbs>();
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(SQL);
//			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10); // 예를 들어 32면 30빼고 2만 보이게한다.
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				return true;
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return false;
//	}
//
//	// 글 제목클릭하여 하나의 게시물 보기
//	public Bbs getBbs(int bno) {
//		String SQL = "SELECT * FROM QNA WHERE BNO = ?";
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(SQL);
//			pstmt.setInt(1, bno);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				Bbs bbs = new Bbs();
//				bbs.setBno(rs.getInt(1));
//				bbs.setBsubject(rs.getString(2));
//				bbs.setBwriter(rs.getString(3));
//				bbs.setBdate(rs.getString(4));
//				bbs.setBcontent(rs.getString(5));
//				bbs.setBavailable(rs.getInt(6));
//				return bbs;
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return null;
//	}
//
//	// 수정 함수
//	public int update(int bno, String newbbsTitle, String newbbsContent) {
//		String SQL = "UPDATE QNA SET bsubject = ?, bcontent = ? WHERE BNO = ?";
//		try {
//			System.out.println("수정함수 들어옴");
//			PreparedStatement pstmt = conn.prepareStatement(SQL);
//			pstmt.setString(1, newbbsTitle);
//			pstmt.setString(2, newbbsContent);
//			pstmt.setInt(3, bno);
//			return pstmt.executeUpdate();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return -1; // 데이터베이스 오류
//	}
//
//	// 삭제 함수. available을 0으로 만든다.
//	public int delete(int bno) {
//		String SQL = "UPDATE QNA SET bavailable = 0 WHERE BNO = ?";
//		try {
//			PreparedStatement pstmt = conn.prepareStatement(SQL);
//			pstmt.setInt(1, bno);
//			return pstmt.executeUpdate();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return -1; // 데이터베이스 오류
//	}

}
