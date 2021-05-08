package bookshop.DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import bookshop.VO.videocartVO;
import common.jdbc.JDBCConnectionPool;

public class videocartDAO {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	public static videocartDAO instance = new videocartDAO();
	
	public static videocartDAO getInstance() {
		return instance;
	}
	
	private videocartDAO() {}


public void insertVideoCart(videocartVO videocart) throws Exception{
	Connection conn = JDBCConnectionPool.getConnection();
	rs = null; pstmt = null;
	String sql = "insert into videocart (vcid, vid, id,buycount) " +
				" values ( videocart_seq.nextval, ?,?,?)";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, videocart.getVid());
		pstmt.setString(2, videocart.getId());
		pstmt.setInt(3, videocart.getBuycount());
		
		pstmt.executeUpdate();
	}catch (Exception e) {
		e.printStackTrace();
	}finally {
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
}
	//id에 해당하는 레코드의 수를 얻어내는 메소드
	public int getVideoListCount(String id) throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null; pstmt = null;
		int x = 0;
		String sql = "select count(*) from videocart where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1);
			}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		return x;
		}
		
	
	//id에 해당하는 레코드의 목록을 얻어내는 메소드
	public List<videocartVO> getVideoCart(String id) throws Exception{
		Connection conn = JDBCConnectionPool.getConnection();
		List<videocartVO> videolists = null;
		rs = null; pstmt = null;
		videocartVO  videocart = null;
		String sql = "select vcid, vimage, vtitle,vprice,buycount, videocart.vid" +
					 " from videocart left join video" +
				     " on videocart.vid = video.vid";
				
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			videolists = new ArrayList<videocartVO>();
			
			while(rs.next()) {
				videocart = new videocartVO();
				videocart.setVcid(rs.getInt("Vcid"));
				videocart.setVid(rs.getString("Vid"));
				videocart.setVimage(rs.getString("vimage"));
				videocart.setVtitle(rs.getString("vtitle"));
				videocart.setBuycount(rs.getInt("buycount"));
				videocart.setVprice(rs.getInt("vprice"));
				videolists.add(videocart);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		return videolists;
	}
	
	//장바구니 수량 수정 
	public void updateVideoCount(int vcid, int count) throws Exception{
		Connection conn = JDBCConnectionPool.getConnection();
		pstmt = null;
	
		String sql = "update videocart set buycount=? where vcid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, vcid);
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) pstmt.close();
			if(conn != null) conn.close();
			//close 안해주면 sendredirect 무한로딩 
		}
		
	}
	
	//장바구니에서 cart_id에 대한 레코드 삭제하는 메소드
	public void deleteVideoList(int vcid) throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null; pstmt = null;
		String sql = "delete from videocart where vcid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vcid);
			
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	//장바구니 모두 비우기 메소드
	public void deleteVideoAll(String id)throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null;  pstmt = null;
		String sql = "delete from videocart where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeQuery();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	}

