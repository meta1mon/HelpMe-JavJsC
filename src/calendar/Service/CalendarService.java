package calendar.Service;

import java.sql.Connection;
import java.sql.SQLException;

import calendar.DAO.CalendarDAO;
import calendar.VO.CalendarVO;
import common.jdbc.JDBCConnectionPool;

public class CalendarService {
	
	// insert
	
	public int insertSchedule(CalendarVO vo) throws SQLException {
		int result = 0;
		
		Connection conn = JDBCConnectionPool.getConnection();
		CalendarDAO dao = new CalendarDAO();
		result = dao.insertSchedule(conn, vo);
		
		return result;
	}
	
	//update
	public int updateSchedule(CalendarVO vo) throws SQLException {
		int result = 0;
		
		Connection conn = JDBCConnectionPool.getConnection();
		CalendarDAO dao = new CalendarDAO();
		result = dao.insertSchedule(conn, vo);
		
		return result;
	}
	
	//delete
		public int deleteSchedule(String scheName) throws SQLException {
			int result = 0;
			
			Connection conn = JDBCConnectionPool.getConnection();
			CalendarDAO dao = new CalendarDAO();
			result = dao.deleteSchedule(conn, scheName);
			
			return result;
		}
}
