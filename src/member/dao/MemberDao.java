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

// 아이디로 회원 검색 조회
	public Member selectSearch(Connection conn, String id) {
		Member vo = null;
		String sql = "select * from member where id like '%" + id + "%'";

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

		String sql = "insert into member values(?, ?, ?, ?, ?, to_char(sysdate, 'YYYY-MM-DD HH:MI:SS'), ?, ?, ?, ?, ?, ?)";
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
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

// 회원 정보 변경
//	public int update(String col, Member vo) {
//		Connection conn = getConnection();
//		int result = 0;
//		String sql = "update test_member set " + col + " = ?  where id = ?";
//
//		PreparedStatement pstmt = null;
//		try {
//			pstmt = conn.prepareStatement(sql);
//			switch (col) {
//			case "name":
//				pstmt.setString(1, vo.getName());
//				break;
//			case "passwd":
//				pstmt.setString(1, vo.getPasswd());
//				break;
//			case "email":
//				pstmt.setString(1, vo.getEmail());
//				break;
//			}
//			pstmt.setString(2, vo.getId());
//
//			result = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(pstmt);
//			close(conn);
//		}
//
//		return result;
//	}
//
//	// delete()
//	public int delete(Connection conn, String col, String str) {
//		int result = 0;
//
//		return result;
//	}
//

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
