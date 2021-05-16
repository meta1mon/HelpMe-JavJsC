package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BuyCountDao {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	// 책 id에 해당하는 전체수량 가져오기 (통계 시 사용)
	public int getBuyBookCount(Connection conn, String pid) throws Exception {
		int tot = 0;

		String sql = "select buycount from buy where pid = ?";// id직접 써줘야함
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				tot += rs.getInt("buycount");
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
		}
		return tot;
	}

	// 영상 통계
	public int getBuyVideoCount(Connection conn, String pid) throws Exception {
		int tot = 0;

		String sql = "select buycount from buy where pid = ?";//
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				tot += rs.getInt("buycount");
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
		}
		return tot;
	}

	public String[][] getTop5Book(Connection conn) throws Exception {
		String[][] arr = null;
		int i = 0;
		String sql = "select rownum, e.* from (select pid, sum(buycount) from buy group by pid having pid like 'b%' order by 2 desc) e where rownum <= 5";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs != null) {
				arr = new String[5][2];
				while (rs.next()) {
					arr[i][0] = rs.getString(2);
					arr[i][1] = rs.getString(3);
					i++;
				}
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
		}
		return arr;

	}
	
	public String[][] getTop5Video(Connection conn) throws Exception {
		String[][] arr = null;
		int i = 0;
		String sql = "select rownum, e.* from (select pid, sum(buycount) from buy group by pid having pid like 'v%' order by 2 desc) e where rownum <= 5";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs != null) {
				arr = new String[5][2];
				while (rs.next()) {
					arr[i][0] = rs.getString(2);
					arr[i][1] = rs.getString(3);
					i++;
				}
			}
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
		}
		return arr;

	}
}
