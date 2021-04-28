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
	public ArrayList<Member> selectAll() {
		Connection conn = getConnection();
		ArrayList<Member> list = null;
		String sql = "select * from member";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<Member>();
				do {
					Member vo = new Member();
					vo.setId(rs.getString("id"));
					vo.setNickname(rs.getString("nickname"));
					vo.setPassword(rs.getString("password"));
					vo.setPassquestion(rs.getString("passqeustion"));
					vo.setPassanswer(rs.getString("passanswer"));
					vo.setRegdate(rs.getString("regdate"));
					vo.setAddress(rs.getString("address"));
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
			close(conn);
		}
		
		return list;
	}

// 아이디로 회원 검색 조회
	public Member selectSearch(String id) {
		Connection conn = getConnection();
		Member vo = null;
		String sql = "select * from member where id = ?";

		try {
			pstmt = conn.prepareStatement(sql); // sql2
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs != null) { // 결과가 1개이상 있다면
				while (rs.next()) {
					vo = new Member();
					vo.setId(rs.getString("id"));
					vo.setNickname(rs.getString("nickname"));
					vo.setPassword(rs.getString("password"));
					vo.setPassquestion(rs.getString("passqeustion"));
					vo.setPassanswer(rs.getString("passanswer"));
					vo.setRegdate(rs.getString("regdate"));
					vo.setAddress(rs.getString("address"));
					vo.setTel(rs.getString("tel"));
					vo.setEmail(rs.getString("email"));	
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
		}
		return vo;
	}


	public int insert(Member vo) {
		Connection conn = getConnection();
		int result = 0;

		String sql = "insert into member values(?, ?, ?, ?, ?, to_char(sysdate, 'YYYY-MM-DD HH:MM:SS'), ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getNickname());
			pstmt.setString(3, vo.getPassword());
			pstmt.setString(4, vo.getPassquestion());
			pstmt.setString(5, vo.getPassanswer());
			pstmt.setString(6, vo.getAddress());
			pstmt.setString(7, vo.getTel());
			pstmt.setString(8, vo.getEmail());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(conn);
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
//	// login()
//	public Member login(Connection conn, Member vo) {
//		String id = vo.getId();
//		String passwd = vo.getPasswd();
//
//		String sql = "select * from test_member where id=?";
//
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		Member resultVO = null;
//
//		try {
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, id);
//			rs = pstmt.executeQuery();
//
//			if (rs.next()) {
//				resultVO = new Member();
//				resultVO.setId(rs.getString("id"));
//				resultVO.setName(rs.getString("name"));
//				resultVO.setPasswd(rs.getString("passwd"));
//				resultVO.setEmail(rs.getString("email"));
//				resultVO.setGrade(rs.getString("grade"));
//				resultVO.setGender(rs.getString("gender").charAt(0));
//				resultVO.setRegdate(rs.getDate("regdate"));
//			}
//
//			// 로그인에 대한 결과를 확인하는 방식
////			if(rs != null) {  // id 가 존재함.
////				rs.next();
////				String dbPasswd = rs.getString("passwd");
////				if(dbPasswd.equals(passwd)) {
////					// 아이디와 pass 동일
////					return 0;
////				} else {
////					//password 틀림
////					return -1;
////				}
////			} else {  // id 존재하지 않음
////				return -2;
////			}
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			JDBCTemplate.close(rs);
//			JDBCTemplate.close(pstmt);
//		}
//
//		return resultVO;
//	}

}
