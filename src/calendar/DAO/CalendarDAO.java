package calendar.DAO;

import static common.jdbc.JDBCConnectionPool.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import calendar.VO.CalendarVO;

public class CalendarDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	// 달력에 일정 표시

	
	
	// 일정 등록
	public int insertSchedule(Connection conn, CalendarVO vo) throws SQLException {
		int result = 0;
		
		String sql = "INSERT INTO schedule VALUES(SCHEDULE_SEQ.nextval, ?, ?, ?, ?, ?)";
		System.out.println("vo:"+vo.toString());
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getScheName());
			pstmt.setString(2, vo.getScheStart()); // 날짜 스트링으로...
			pstmt.setString(3, vo.getScheEnd());
			pstmt.setInt(4, vo.getScheCode());
			pstmt.setString(5, vo.getScheContent());

			result = pstmt.executeUpdate();
			
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}
}
