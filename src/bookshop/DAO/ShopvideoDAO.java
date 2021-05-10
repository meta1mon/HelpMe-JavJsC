package bookshop.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bookshop.VO.ShopBookVo;
import bookshop.VO.VideoVO;
import common.jdbc.JDBCConnectionPool;

public class ShopvideoDAO {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private void close() {
		try {
			if(pstmt != null)
				pstmt.close();
			if(rs != null)
				rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private static ShopvideoDAO instance = new ShopvideoDAO();
	
	public static ShopvideoDAO getinstance() {
		return instance;
	}
	public int managerCheck(String id, String passwd) throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select managerPasswd from manager where managerId = ? ";
		String dbpasswd = "";
		int x = -1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dbpasswd = rs.getString("managerPasswd");
				if(dbpasswd.equals(passwd)) 
					x =1; //비밀번호 일치
				else 
					x = 0; //비밀번호 틀림
				}else 
					x = -1; //해당 잉;ㄷ; 앖ㅇ,ㅁ 
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null ) pstmt.close();
			if(conn != null) conn.close();
		}
		return x;	
	}
	
	//비디오등록 
	public void insertVideo(VideoVO video)throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		PreparedStatement pstmt = null;
	
		
		String sql = "insert into video values (video_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		
		try {
			
			pstmt = conn.prepareStatement(sql);
//			.shopBookDAOpstmt.setInt(1, );
			pstmt.setString(1, video.getVkind());
			pstmt.setString(2, video.getVtitle());
			pstmt.setInt(3, video.getVprice());
			pstmt.setString(4, video.getVimage());
			pstmt.setInt(5, video.getDiscountRate());
			pstmt.setTimestamp(6, video.getRegdate());
			pstmt.setString(7, video.getVsize());
			pstmt.setDate(8, video.getStartDate());
			pstmt.setDate(9, video.getEndDate());
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	//전체등록된 영상 수 얻어내기
		public int getVideoCount() throws Exception {
			Connection conn = JDBCConnectionPool.getConnection();
			pstmt = null; rs = null;
			String sql = "select count(*) from video";
			int x = 0;
			
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					x = rs.getInt(1);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
				return x;	
		}

		//분류별 또는 전체 등록된 영상 정보 얻어냄
		public List<VideoVO> getVideos(String vkind) throws SQLException{
			Connection conn = JDBCConnectionPool.getConnection();
			pstmt = null; rs = null;
			List<VideoVO> vList = null;
			String sql1 = "select * from video";
			String sql2 =  " select * from video";
			sql2 += " where vkind = ? order by regdate desc";
			
			try {
			if(vkind.equals("all")) {
				pstmt = conn.prepareStatement(sql1);
			}else {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, vkind);
			}
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vList = new ArrayList<VideoVO>();
				do {
					VideoVO video = new VideoVO();
					video.setVid(rs.getInt("vid"));
					video.setVkind(rs.getString("vkind"));
					video.setVtitle(rs.getString("vtitle"));
					video.setVprice(rs.getInt("vprice"));
					video.setVsize(rs.getString("vsize"));
					video.setVimage(rs.getString("vimage"));
					video.setRegdate(rs.getTimestamp("regdate"));
					video.setDiscountRate(rs.getInt("discountRate"));
					video.setStartDate(rs.getDate("startDate"));
					video.setEndDate(rs.getDate("endDate"));
					
				vList.add(video);
				}while(rs.next());
			}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return vList;
		}
		//비디오 수장
		public void updateVideo(VideoVO video, int vid) throws Exception{
			Connection conn = JDBCConnectionPool.getConnection();
			pstmt = null; rs = null;
			String sql = " update video set vkind=?, vtitle=?, vprice=?";
			sql += " ,vimage=?, discountRate=?, vsize=?, startDate=?";
			sql += " ,endDate=? where vid=?";
			
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
				pstmt.setInt(9, video.getVid());
				
				
				pstmt.executeUpdate();
				System.out.println("업데이트 들어옴.다오");
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
					
		}
		//비디오 삭제
		public void deleteVideo(int vid) throws Exception {
			Connection conn = JDBCConnectionPool.getConnection();
			pstmt = null; rs = null;
			String sql = "delete from video where vid=? ";
	
			try {
				pstmt = conn.prepareStatement(sql);
				System.out.println("delete dao");
				pstmt.setInt(1, vid);
				pstmt.executeUpdate();
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
		}
		//수정폼으로 들이기 위한 메소드 
		public VideoVO getVideo(int vid) throws Exception {
			Connection conn = JDBCConnectionPool.getConnection();
			pstmt = null; rs = null;
			VideoVO video = null;
			String sql = "select * from video where vid = ? ";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, vid);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					video = new VideoVO();
					video.setVkind(rs.getString("vkind"));
					video.setVtitle(rs.getString("vtitle"));
					video.setVprice(rs.getInt("vprice"));
					video.setVimage(rs.getString("vimage"));
					video.setDiscountRate(rs.getInt("discountRate"));
					video.setStartDate(rs.getDate("startDate"));
					video.setEndDate(rs.getDate("endDate"));
					video.setVsize(rs.getString("vsize"));
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return video;
		}
}


