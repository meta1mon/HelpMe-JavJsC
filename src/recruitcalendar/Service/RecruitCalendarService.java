package recruitcalendar.Service;

import static common.jdbc.JDBCConnectionPool.close;
import static common.jdbc.JDBCConnectionPool.commit;
import static common.jdbc.JDBCConnectionPool.getConnection;
import static common.jdbc.JDBCConnectionPool.rollback;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

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
	
	
	
}
