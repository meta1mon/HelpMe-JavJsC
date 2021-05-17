package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static common.jdbc.JDBCConnectionPool.*;
import member.vo.Member;

public class MemberDao {
	PreparedStatement pstmt = null;
	ResultSet rs = null;

// 회원 전체 불러오기
	public ArrayList<Member> getMember(Connection conn, int start, int end, String search) {

		ArrayList<Member> list = null;
		// 최신 회원 가입 순으로 정렬
		String sql = "select * from member order by regdate desc";
		if (search != null) {
			sql = "select * from member where id like '%" + search + "%' or nickname like '%" + search
					+ "%' order by regdate desc";
		}
		String sql2 = "select rownum r, d.* from (" + sql + ") d";
		String sql3 = "select * from (" + sql2 + ") where r between ? and ?";

		try {
			pstmt = conn.prepareStatement(sql3);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<Member>();
				do {
					Member vo = new Member();
					vo.setId(rs.getString("id"));
					vo.setNickname(rs.getString("nickname"));
					vo.setPassword(rs.getString("password"));
					vo.setPassquestion(rs.getString("passquestion"));
					vo.setPassanswer(rs.getString("passanswer"));
					vo.setRegdate(rs.getString("regdate"));
					vo.setPostcode(rs.getString("postcode"));
					vo.setAddress1(rs.getString("address1"));
					vo.setAddress2(rs.getString("address2"));
					vo.setAddress3(rs.getString("address3"));
					vo.setTel(rs.getString("tel"));
					vo.setEmail(rs.getString("email"));
					vo.setRcvmail(rs.getString("rcvmail"));
					list.add(vo);
				} while (rs.next());
				return list;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;
	}

// 아이디나 닉네임으로 회원 검색 조회
	public Member selectSearch(Connection conn, String str, int tag) {
		Member vo = null;
		String sql = "";
		if (tag == 1) { // 회원 검색 기준이 아이디
			sql = "select * from member where id like '%" + str + "%'";
		} else if (tag == 2) { // 회원 검색 기준이 닉네임
			sql = "select * from member where nickname like '%" + str + "%'";
		} else {
			System.out.println("회원 검색 시, 문제 발생함");
		}

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs != null) {
				if (rs.next()) {
					vo = new Member();
					vo.setId(rs.getString("id"));
					vo.setNickname(rs.getString("nickname"));
					vo.setPassword(rs.getString("password"));
					vo.setPassquestion(rs.getString("passquestion"));
					vo.setPassanswer(rs.getString("passanswer"));
					vo.setRegdate(rs.getString("regdate"));
					vo.setPostcode(rs.getString("postcode"));
					vo.setAddress1(rs.getString("address1"));
					vo.setAddress2(rs.getString("address2"));
					vo.setAddress3(rs.getString("address3"));
					vo.setTel(rs.getString("tel"));
					vo.setEmail(rs.getString("email"));
					vo.setRcvmail(rs.getString("rcvmail"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return vo;
	}

// 회원가입
	public int insert(Connection conn, Member vo) {
		int result = 0;

		String sql = "insert into member values(?, ?, ?, ?, ?, to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS'), ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getNickname());
			pstmt.setString(3, vo.getPassword());
			pstmt.setString(4, vo.getPassquestion());
			pstmt.setString(5, vo.getPassanswer());
			pstmt.setString(6, vo.getPostcode());
			pstmt.setString(7, vo.getAddress1());
			pstmt.setString(8, vo.getAddress2());
			pstmt.setString(9, vo.getAddress3());
			pstmt.setString(10, vo.getTel());
			pstmt.setString(11, vo.getEmail());
			pstmt.setString(12, vo.getRcvmail());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 회원 정보 변경
	public int update(Connection conn, String originNick, Member vo) throws SQLException {
		int result = 0;
// 닉네임 바뀌면 자기가 썼던 게시글과 댓글의 작성자도 바뀌게 하기
		String sql1 = "update qna set qwriter = ? where qwriter = ?";
		String sql2 = "update rqna set rqwriter = ? where rqwriter = ?";
		String sql3 = "update study set swriter = ? where swriter = ?";
		String sql4 = "update rstudy set rswriter = ? where rswriter = ?";
		String sql5 = "update review set rwriter = ? where rwriter = ?";
		String sql6 = "update rreview set rrwriter = ? where rrwriter = ?";

		String sql = "update member set nickname = ? , password = ? , passquestion = ? , passanswer = ? , postcode = ? , address1 = ? , address2 = ? , address3 = ? , tel = ? , email = ?, rcvmail = ? where id = ?";

		try {
			if (!originNick.equals(vo.getNickname())) {

				pstmt = conn.prepareStatement(sql1);
				pstmt.setString(1, vo.getNickname());
				pstmt.setString(2, originNick);
				result = pstmt.executeUpdate();
				if (result > 0) {
					System.out.println("qna 글 작성자 변경 완료");
				} else {
					System.out.println("qna에 작성된 글이 없음 ");
				}
				close(pstmt);

				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, vo.getNickname());
				pstmt.setString(2, originNick);
				result = pstmt.executeUpdate();
				if (result > 0) {
					System.out.println("qna 댓글 작성자 변경 완료");
				} else {
					System.out.println("qna에 작성된 댓글이 없음 ");
				}
				close(pstmt);

				pstmt = conn.prepareStatement(sql3);
				pstmt.setString(1, vo.getNickname());
				pstmt.setString(2, originNick);
				result = pstmt.executeUpdate();
				if (result > 0) {
					System.out.println("study 글 작성자 변경 완료");
				} else {
					System.out.println("study에 작성된 글이 없음 ");
				}
				close(pstmt);

				pstmt = conn.prepareStatement(sql4);
				pstmt.setString(1, vo.getNickname());
				pstmt.setString(2, originNick);
				result = pstmt.executeUpdate();
				if (result > 0) {
					System.out.println("study 댓글 작성자 변경 완료");
				} else {
					System.out.println("study에 작성된 댓글이 없음 ");
				}
				close(pstmt);

				pstmt = conn.prepareStatement(sql5);
				pstmt.setString(1, vo.getNickname());
				pstmt.setString(2, originNick);
				result = pstmt.executeUpdate();
				if (result > 0) {
					System.out.println("review 글 작성자 변경 완료");
				} else {
					System.out.println("review에 작성된 글이 없음 ");
				}
				close(pstmt);

				pstmt = conn.prepareStatement(sql6);
				pstmt.setString(1, vo.getNickname());
				pstmt.setString(2, originNick);
				result = pstmt.executeUpdate();
				if (result > 0) {
					System.out.println("review 댓글 작성자 변경 완료");
				} else {
					System.out.println("review에 작성된 댓글이 없음 ");
				}
				close(pstmt);

			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickname());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getPassquestion());
			pstmt.setString(4, vo.getPassanswer());
			pstmt.setString(5, vo.getPostcode());
			pstmt.setString(6, vo.getAddress1());
			pstmt.setString(7, vo.getAddress2());
			pstmt.setString(8, vo.getAddress3());
			pstmt.setString(9, vo.getTel());
			pstmt.setString(10, vo.getEmail());
			pstmt.setString(11, vo.getRcvmail());
			pstmt.setString(12, vo.getId());
			result = pstmt.executeUpdate();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int delete(Connection conn, String id) {
		int result = 0;

		String sql = "delete from member where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

// 로그인
	public Member login(Connection conn, String id) {

		Member vo = null;

		String sql = "select * from member where id=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs != null) {
				if (rs.next()) {
					vo = new Member();
					vo.setId(rs.getString("id"));
					vo.setNickname(rs.getString("nickname"));
					vo.setPassword(rs.getString("password"));
					vo.setPassquestion(rs.getString("passquestion"));
					vo.setPassanswer(rs.getString("passanswer"));
					vo.setRegdate(rs.getString("regdate"));
					vo.setPostcode(rs.getString("postcode"));
					vo.setAddress1(rs.getString("address1"));
					vo.setAddress2(rs.getString("address2"));
					vo.setAddress3(rs.getString("address3"));
					vo.setTel(rs.getString("tel"));
					vo.setEmail(rs.getString("email"));
					vo.setRcvmail(rs.getString("rcvmail"));
				}

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return vo;
	}

// 닉네임이나 아이디로 검색
	public int memberCnt(Connection conn, String search) {

		int cnt = 0;
		String sql = "select count(*) from member";
		if (search != null) {
			sql += " where id like '%" + search + "%' or nickname like '%" + search + "%'";
		}

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs != null) {
				if (rs.next())
					cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return cnt;
	}
}
