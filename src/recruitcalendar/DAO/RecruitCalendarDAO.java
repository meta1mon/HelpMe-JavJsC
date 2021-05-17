package recruitcalendar.DAO;

import static common.jdbc.JDBCConnectionPool.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import calendar.VO.CalendarVO;
import member.vo.Member;
import recruitcalendar.VO.RecruitCalendarVO;

public class RecruitCalendarDAO {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 일정 조회
	public ArrayList<RecruitCalendarVO> viewSchedule(Connection conn) throws SQLException{
		ArrayList<RecruitCalendarVO> list = new ArrayList<RecruitCalendarVO>();
		
		String sql = "SELECT * FROM rcschedule";
		
		try {
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				list = new ArrayList<RecruitCalendarVO>();
				do {
					RecruitCalendarVO vo = new RecruitCalendarVO();
					vo.setRcScheName(rs.getString("rcschename"));
					vo.setRcScheStart(rs.getString("rcschestart"));
					vo.setRcScheEnd(rs.getString("rcscheend"));
					vo.setRcScheCode(rs.getInt("rcschecode"));
					vo.setRcScheContent(rs.getString("rcschecontent"));
					list.add(vo);
				} while (rs.next());
			}
			
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
		
	}
	
	// 일정 등록
		public int insertSchedule(Connection conn, RecruitCalendarVO vo) throws SQLException {
			int result = 0;
			
			String sql = "INSERT INTO rcschedule VALUES(rcschedule_seq.nextval, 'semi01', ?, ?, ?, ?, ?)";
			System.out.println("vo:"+vo.toString());
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getRcScheName());
				pstmt.setString(2, vo.getRcScheStart());
				pstmt.setString(3, vo.getRcScheEnd());
				pstmt.setInt(4, vo.getRcScheCode());
				pstmt.setString(5, vo.getRcScheContent());

				result = pstmt.executeUpdate();
				
			}finally {
				close(pstmt);
			}
			return result;
		}
		
		
		// 일정 삭제
		public int deleteSchedule(Connection conn, String rcscheName) throws SQLException {
			int result = 0;
			
			String sql = "DELETE FROM rcschedule WHERE rcschename = ?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, rcscheName);
				
				result = pstmt.executeUpdate();
			}finally {
				close(pstmt);
			}
			return result;
		}
	
}
