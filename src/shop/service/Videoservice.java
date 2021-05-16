package shop.service;

import static common.jdbc.JDBCConnectionPool.*;


import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import shop.DAO.ShopvideoDAO;
import shop.VO.VideoVO;

public class Videoservice {


	public int insertVideo(VideoVO video) throws Exception {
		Connection conn = getConnection();
		ShopvideoDAO dao = ShopvideoDAO.getinstance();
		int result = dao.insertVideo(conn, video);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int getVideoCount() throws Exception {
		Connection conn = getConnection();
		ShopvideoDAO dao = ShopvideoDAO.getinstance();
		int result = dao.getVideoCount(conn);
		close(conn);
		return result;
	}

	public List<VideoVO> getVideoList(String vkind) throws SQLException {
		Connection conn = getConnection();
		ShopvideoDAO dao = ShopvideoDAO.getinstance();
		List<VideoVO> list = dao.getVideoList(conn, vkind);
		close(conn);
		return list;
	}

	public int updateVideo(VideoVO video, String vid) throws Exception {
		Connection conn = getConnection();
		ShopvideoDAO dao = ShopvideoDAO.getinstance();
		int result = dao.updateVideo(conn, video, vid);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteVideo(String vid) throws Exception {
		Connection conn = getConnection();
		ShopvideoDAO dao = ShopvideoDAO.getinstance();
		int result = dao.deleteVideo(conn, vid);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public VideoVO getVideo(String vid) throws Exception {
		Connection conn = getConnection();
		ShopvideoDAO dao = ShopvideoDAO.getinstance();
		VideoVO vo = dao.getVideo(conn, vid);
		close(conn);
		return vo;
	}
	
	public VideoVO[] getVideos(String vkind, int count) throws SQLException {
		Connection conn = getConnection();
		ShopvideoDAO dao = ShopvideoDAO.getinstance();
		VideoVO[] arr = dao.getVideos(conn, vkind, count);
		close(conn);
		return arr;
	}
}
