package calendar.DAO;

import static common.jdbc.JDBCConnectionPool.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import calendar.VO.CalendarVO;

public class CalendarDAO {
	
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 개인 일정 조회
	
	public ArrayList<CalendarVO> viewSchedule(Connection conn, String id) throws SQLException{
		ArrayList<CalendarVO> list = new ArrayList<CalendarVO>();
		
		String sql = "SELECT schename, schestart, scheend, schecode, schecontent FROM schedule WHERE id = ? ";
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs != null) {
				while(rs.next()) {
					CalendarVO vo = new CalendarVO();
					vo.setScheName(rs.getString("scheName"));
					vo.setScheStart(rs.getString("schestart"));
					vo.setScheEnd(rs.getString("scheend"));
					vo.setScheCode(rs.getInt("schecode"));
					vo.setScheContent(rs.getString("schecontent"));
					list.add(vo);
				}
			}
			
		} finally {
			close(pstmt);
			close(rs);
		}

		return list;
		
	}
	
	
	// 일정 등록
	public int insertSchedule(Connection conn, CalendarVO vo) throws SQLException {
		int result = 0;
		
		String sql = "INSERT INTO schedule VALUES(SCHEDULE_SEQ.nextval, ?, ?, ?, ?, ?, ?)";
		System.out.println("vo:"+vo.toString());
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getScheName());
			pstmt.setString(3, vo.getScheStart()); // 날짜 스트링으로...
			pstmt.setString(4, vo.getScheEnd());
			pstmt.setInt(5, vo.getScheCode());
			pstmt.setString(6, vo.getScheContent());

			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	// 일정 수정 - resize -> end 날짜만 바뀌게  / drop start, end 날짜 둘 다 바껴야함
	public int updateSchedule(Connection conn, CalendarVO vo) throws SQLException {
		int result = 0;
		String sql = "UPDATE schedule SET schestart = ?, scheend = ?, schecode = ?, schecont = ? where schename = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getScheStart());
			pstmt.setString(2, vo.getScheEnd());
			pstmt.setInt(3, vo.getScheCode());
			pstmt.setString(4, vo.getScheContent());
			pstmt.setString(5, vo.getScheName());
			result = pstmt.executeUpdate();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	// 일정 삭제
	public int deleteSchedule(Connection conn, String scheName, String id) throws SQLException {
		int result = 0;
		
		String sql = "DELETE FROM schedule WHERE schename = ? and id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, scheName);
			pstmt.setString(2, id);
			
			result = pstmt.executeUpdate();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
}
