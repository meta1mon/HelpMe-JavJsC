package bookshop.service;

import static common.jdbc.JDBCConnectionPool.getConnection;

import java.sql.Connection;

import bookshop.DAO.ShopvideoDAO;
import bookshop.VO.VideoVO;

public class Videoservice {
	public void insertVideo(VideoVO video)throws Exception {
		Connection conn = getConnection();
		ShopvideoDAO dao = ShopvideoDAO.getinstance();
		dao.insertVideo(conn, video);
	}
	
	public void updateVideo(VideoVO video, String vid) throws Exception{
		Connection conn = getConnection();
		ShopvideoDAO dao = ShopvideoDAO.getinstance();
		dao.updateVideo(conn, video, vid);
	}
	
	public void deleteVideo( int vid) throws Exception {
		Connection conn = getConnection();
		ShopvideoDAO dao = ShopvideoDAO.getinstance();
		dao.deleteVideo(conn, vid);
	}
}
