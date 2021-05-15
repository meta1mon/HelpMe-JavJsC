package recruitcalendar.DAO;

import static common.jdbc.JDBCConnectionPool.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import calendar.VO.CalendarVO;
import recruitcalendar.VO.RecruitCalendarVO;

public class RecruitCalendarDAO {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 개인 일정 조회
	
	public ArrayList<RecruitCalendarVO> viewSchedule(Connection conn) throws SQLException{
		ArrayList<RecruitCalendarVO> list = new ArrayList<RecruitCalendarVO>();
		
		String sql = "SELECT * FROM rcschedule";
		
		try {
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs != null) {
				while(rs.next()) {
					RecruitCalendarVO vo = new RecruitCalendarVO();
					vo.setRcScheName(rs.getString("schename"));
					vo.setRcScheStart(rs.getString("schestart"));
					vo.setRcScheEnd(rs.getString("scheend"));
					vo.setRcScheCode(rs.getInt("schecode"));
					vo.setRcScheContent(rs.getString("schecontent"));
					list.add(vo);
				}
			}
			
		} finally {
			close(pstmt);
			close(rs);
		}

		return list;
		
	}
}
