package shop.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.VO.VideoVO;

import static common.jdbc.JDBCConnectionPool.*;

public class ShopvideoDAO {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private static ShopvideoDAO instance = new ShopvideoDAO();

	public static ShopvideoDAO getinstance() {
		return instance;
	}

	// 비디오등록
	public int insertVideo(Connection conn, VideoVO video) throws Exception {
		int result = 0;
		String sql = "insert into video values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, video.getVid());
			pstmt.setString(2, video.getVkind());
			pstmt.setString(3, video.getVtitle());
			pstmt.setInt(4, video.getVprice());
			pstmt.setString(5, video.getVimage());
			pstmt.setInt(6, video.getDiscountRate());
			pstmt.setTimestamp(7, video.getRegdate());
			pstmt.setString(8, video.getVsize());
			pstmt.setDate(9, video.getStartDate());
			pstmt.setDate(10, video.getEndDate());
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 전체등록된 영상 수 얻어내기
	public int getVideoCount(Connection conn) throws Exception {
		String sql = "select count(*) from video";
		int x = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return x;
	}

	// 분류별 또는 전체 등록된 영상 정보 얻어냄
	public List<VideoVO> getVideoList(Connection conn, String vkind) throws SQLException {
		List<VideoVO> videoList = null;
		String sql = " select * from video where vkind = ? order by regdate desc";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vkind);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				videoList = new ArrayList<VideoVO>();
				do {
					VideoVO video = new VideoVO();
					video.setVid(rs.getString("vid"));
					video.setVkind(rs.getString("vkind"));
					video.setVtitle(rs.getString("vtitle"));
					video.setVprice(rs.getInt("vprice"));
					video.setVsize(rs.getString("vsize"));
					video.setVimage(rs.getString("vimage"));
					video.setRegdate(rs.getTimestamp("regdate"));
					video.setDiscountRate(rs.getInt("discountRate"));
					video.setStartDate(rs.getDate("startDate"));
					video.setEndDate(rs.getDate("endDate"));
					video.setVkind(rs.getString("vkind"));

					videoList.add(video);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
		}
		return videoList;
	}

	// 비디오 수장
	public int updateVideo(Connection conn, VideoVO video, String vid) throws Exception {
		String sql = " update video set vkind=?, vtitle=?, vprice=?";
		sql += " ,vimage=?, discountRate=?, vsize=?, startDate=?";
		sql += " ,endDate=? where vid=?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, video.getVkind());
			pstmt.setString(2, video.getVtitle());
			pstmt.setInt(3, video.getVprice());
			pstmt.setString(4, video.getVimage());
			pstmt.setInt(5, video.getDiscountRate());
			pstmt.setString(6, video.getVsize());
			pstmt.setDate(7, video.getStartDate());
			pstmt.setDate(8, video.getEndDate());
			pstmt.setString(9, video.getVid());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	// 비디오 삭제
	public int deleteVideo(Connection conn, String vid) throws Exception {
		int result = 0;
		String sql = "delete from video where vid=? ";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vid);
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 수정폼으로 들이기 위한 메소드
	public VideoVO getVideo(Connection conn, String vid) throws Exception {
		VideoVO video = null;
		String sql = "select * from video where vid = ? ";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				video = new VideoVO();
				video.setVid(rs.getString("vid"));
				video.setVkind(rs.getString("vkind"));
				video.setVtitle(rs.getString("vtitle"));
				video.setVprice(rs.getInt("vprice"));
				video.setVimage(rs.getString("vimage"));
				video.setDiscountRate(rs.getInt("discountRate"));
				video.setStartDate(rs.getDate("startDate"));
				video.setEndDate(rs.getDate("endDate"));
				video.setVsize(rs.getString("vsize"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return video;
	}

	// 신간
	public VideoVO[] getVideos(Connection conn, String vkind, int count) throws SQLException {
		VideoVO videoList[] = null;
		String sql = " select * from (";
		sql += " select * from video where vkind=?";
		sql += " order by regdate desc) where rownum < ?";
		int i = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vkind);
			pstmt.setInt(2, count);
			System.out.println("????");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				videoList = new VideoVO[count];
				do {
					VideoVO video = new VideoVO();
					video.setVid(rs.getString("vid"));
					video.setVkind(rs.getString("vkind"));
					video.setVtitle(rs.getString("vtitle"));
					video.setVprice(rs.getInt("vprice"));
					video.setVimage(rs.getString("vimage"));
					video.setDiscountRate(rs.getInt("discountRate"));
					video.setStartDate(rs.getDate("startDate"));
					video.setEndDate(rs.getDate("endDate"));
					video.setVsize(rs.getString("vsize"));

					videoList[i] = video;
					i++;
				} while (rs.next());

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (pstmt != null)
				pstmt.close();
		}
		return videoList;
	}

}
