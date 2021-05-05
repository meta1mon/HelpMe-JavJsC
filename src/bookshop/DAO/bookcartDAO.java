package bookshop.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bookshop.VO.bookcartVO;
import common.jdbc.JDBCConnectionPool;

public class bookcartDAO {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	public static bookcartDAO instance = new bookcartDAO();
	
	public static bookcartDAO getInstance() {
		return instance;
	}
	
	private bookcartDAO() {}


public void insertBookCart(bookcartVO bookcart) throws Exception{
	Connection conn = JDBCConnectionPool.getConnection();
	rs = null; pstmt = null;
	String sql = "insert into bookcart (bcid, bid, buyer " +
				" ,btitle, buyCount, buyPrice, bimage) " +
				" values ( bookcart_seq.nextval, ?,?,?,?,?,?)";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bookcart.getBid());
		pstmt.setString(2, bookcart.getBuyer());;
		pstmt.setString(3, bookcart.getBtitle());
		pstmt.setInt(4, bookcart.getBuycount());
		pstmt.setInt(5, bookcart.getBuyprice());
		pstmt.setString(6, bookcart.getBimage());
		
		pstmt.executeUpdate();
	}catch (Exception e) {
		e.printStackTrace();
	}finally {
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}
}
	//id에 해당하는 레코드의 수를 얻어내는 메소드
	public int getBookListCount(String id) throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null; pstmt = null;
		int x = 0;
		String sql = "select count(*) from bookcart where buyer=?";
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
	public List<bookcartVO> getBookCart(String id) throws Exception{
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null; pstmt = null;
		bookcartVO  bookcart = null;
		String sql = "select * from bookcart where buyer=?";
		List<bookcartVO> booklists = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			booklists = new ArrayList<bookcartVO>();
			
			while(rs.next()) {
				bookcart = new bookcartVO();
				bookcart.setBcid(rs.getInt("bcid"));
				bookcart.setBid(rs.getString("bid"));
				bookcart.setBimage(rs.getString("bimage"));
				bookcart.setBtitle(rs.getString("btitle"));
				bookcart.setBuycount(rs.getInt("buycount"));
				bookcart.setBuyer(rs.getString("buyer"));
				bookcart.setBuyprice(rs.getInt("buyprice"));
				booklists.add(bookcart);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		return booklists;
	}
	
	//장바구니 수량 수정 
	public void updateBookCount(int bcid, int count) throws Exception{
		Connection conn = JDBCConnectionPool.getConnection();
		pstmt = null;
	
		String sql = "update bookcart set buyCount=? where bcid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setInt(2, bcid);
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
	public void deleteBookList(int bcid) throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null; pstmt = null;
		String sql = "delete from bookcart where bcid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bcid);
			
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) pstmt.close();
			if(conn != null) conn.close();
		}
	}
	
	//장바구니 모두 비우기 메소드
	public void deleteBookAll(String id)throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null;  pstmt = null;
		String sql = "delete from bookcart where buyer=?";
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

