package member.service;

import static common.jdbc.JDBCConnectionPool.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import member.dao.MemberDao;
import member.vo.Member;

public class MemberService {
	public ArrayList<Member> getMember(int start, int end, String search) {
		Connection conn = getConnection();
		ArrayList<Member> list = new MemberDao().getMember(conn, start, end, search);
		close(conn);
		return list;
	}

	public Member selectSearch(String str, int tag) {
		Connection conn = getConnection();
		Member vo = new MemberDao().selectSearch(conn, str, tag);
		close(conn);
		return vo;
	}

	public int insert(Member vo) {
		Connection conn = getConnection();
		int result = new MemberDao().insert(conn, vo);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int update(String originNick, Member vo) throws SQLException {
		Connection conn = getConnection();
		int result = new MemberDao().update(conn, originNick, vo);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int delete(String id) {
		Connection conn = getConnection();
		int result = new MemberDao().delete(conn, id);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public Member login(String id) {
		Connection conn = getConnection();
		Member vo = new MemberDao().login(conn, id);
		close(conn);
		return vo;
	}
	
	public int memberCnt(String search) {
		Connection conn = getConnection();
		int result = new MemberDao().memberCnt(conn, search);
		close(conn);
		return result;
	}
	
	
}
