package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
		} catch (Exception e) {
			e.printStackTrace();
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
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
		}
		return tot;
	}
}
