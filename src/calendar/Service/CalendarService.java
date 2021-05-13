package calendar.Service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import calendar.DAO.CalendarDAO;
import calendar.VO.CalendarVO;
import static common.jdbc.JDBCConnectionPool.*;


public class CalendarService {
	
	
	// view
	public ArrayList<CalendarVO> viewSchedule(String id) throws SQLException {
		Connection conn = getConnection();
		ArrayList<CalendarVO> list = new CalendarDAO().viewSchedule(conn, id);
		close(conn);
		return list;
	}
	
	
	
	// insert
	public int insertSchedule(CalendarVO vo) throws SQLException {
		int result = 0;
		
		Connection conn = getConnection();
		CalendarDAO dao = new CalendarDAO();
		result = dao.insertSchedule(conn, vo);
		if (result != 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	//update
	public int updateSchedule(CalendarVO vo) throws SQLException {
		int result = 0;
		
		Connection conn = getConnection();
		CalendarDAO dao = new CalendarDAO();
		result = dao.insertSchedule(conn, vo);
		if (result != 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	//delete
		public int deleteSchedule(String scheName, String id) throws SQLException {
			int result = 0;
			
			Connection conn = getConnection();
			CalendarDAO dao = new CalendarDAO();
			result = dao.deleteSchedule(conn, scheName, id);
			if (result != 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			close(conn);
			return result;
		}
}
