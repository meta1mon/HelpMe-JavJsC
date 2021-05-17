package recruitcalendar.Service;

import static common.jdbc.JDBCConnectionPool.close;
import static common.jdbc.JDBCConnectionPool.commit;
import static common.jdbc.JDBCConnectionPool.getConnection;
import static common.jdbc.JDBCConnectionPool.rollback;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import calendar.DAO.CalendarDAO;
import calendar.VO.CalendarVO;
import recruitcalendar.DAO.RecruitCalendarDAO;
import recruitcalendar.VO.RecruitCalendarVO;

public class RecruitCalendarService {

	// view
	public ArrayList<RecruitCalendarVO> viewSchedule() throws SQLException {
		Connection conn = getConnection();
		ArrayList<RecruitCalendarVO> list = new RecruitCalendarDAO().viewSchedule(conn);
		close(conn);
		return list;
	}

	// insert
	public int insertSchedule(RecruitCalendarVO vo) throws SQLException {
		int result = 0;

		Connection conn = getConnection();
		RecruitCalendarDAO dao = new RecruitCalendarDAO();
		result = dao.insertSchedule(conn, vo);
		if (result != 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// delete
	public int deleteSchedule(String scheName) throws SQLException {
		int result = 0;

		Connection conn = getConnection();
		RecruitCalendarDAO dao = new RecruitCalendarDAO();
		result = dao.deleteSchedule(conn, scheName);
		if (result != 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
