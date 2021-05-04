package bookshop.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bookshop.VO.cartVO;
import common.jdbc.JDBCConnectionPool;

public class cartDAO {
	Connection conn = JDBCConnectionPool.getConnection();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private void close() {
		try {
			if(pstmt != null)
				pstmt.close();
			if(rs != null)
				rs.close();
			if(conn!=null)
				conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	public static cartDAO instance = new cartDAO();
	
	public static cartDAO getInstance() {
		return instance;
	}
	
	private cartDAO() {}
	
	public void insertCart(cartVO cart) throws Exception{
		Connection conn = JDBCConnectionPool.getConnection();
		rs = null; pstmt = null;
		String sql = "insert into cart (cid,bid, buyer " +
					" ,btitle, buyCount, buyPrice, vBuyPrice, bimage " +
					" ,vid, vtitle, vimage)" +
					" values ( cart_seq.nextval, ?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cart.getBid());;
			pstmt.setString(2, cart.getBuyer());
			pstmt.setString(3, cart.getBtitle());
			pstmt.setInt(4, cart.getBuyCount());
			pstmt.setInt(5, cart.getBuyPrice());
			pstmt.setInt(6, cart.getvBuyPrice());
			pstmt.setString(7, cart.getBimage());
			pstmt.setInt(8, cart.getVid());
			pstmt.setString(9, cart.getVtitle());
			pstmt.setString(10, cart.getVimage());
			
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
		//id에 해당하는 레코드의 수를 얻어내는 메소드
		public int getListCount(String id) throws Exception {
			Connection conn = JDBCConnectionPool.getConnection();
			rs = null; pstmt = null;
			int x = 0;
			String sql = "select count(*) from cart where buyer=?";
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
					close();
				}
			return x;
			}
			
		
		//id에 해당하는 레코드의 목록을 얻어내는 메소드
		public List<cartVO> getCart(String id) throws Exception{
			Connection conn = JDBCConnectionPool.getConnection();
			rs = null; pstmt = null;
			cartVO  cart = null;
			String sql = "select * from cart where buyer=?";
			List<cartVO> lists = null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				lists = new ArrayList<cartVO>();
				
				while(rs.next()) {
					cart = new cartVO();
					cart.setCid(rs.getInt("cid"));
					cart.setBid(rs.getInt("bid"));
					cart.setBtitle(rs.getString("btitle"));
					cart.setBimage(rs.getString("bimage"));
					cart.setBuyPrice(rs.getInt("buyPrice"));
					cart.setvBuyPrice(rs.getInt("vBuyPrice"));
					cart.setBuyCount(rs.getInt("buyCount"));
					cart.setVid(rs.getInt("vid"));
					cart.setVtitle(rs.getString("vtitle"));
					cart.setVimage(rs.getString("vimage"));
					
					lists.add(cart);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return lists;
		}
		
		//장바구니 수량 수정 
		public void updateCount(int cid, int count) throws Exception{
			Connection conn = JDBCConnectionPool.getConnection();
			pstmt = null;
		
			String sql = "update cart set buyCount=? where cid=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, count);
				pstmt.setInt(2, cid);
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
		public void deleteList(int cid) throws Exception {
			Connection conn = JDBCConnectionPool.getConnection();
			rs = null; pstmt = null;
			String sql = "delete from cart where cid=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, cid);
				
				pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
		}
		
		//장바구니 모두 비우기 메소드
		public void deleteAll(String id) {
			Connection conn = JDBCConnectionPool.getConnection();
			rs = null;  pstmt = null;
			String sql = "delete from cart where buyer=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
				pstmt.executeQuery();
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
		}
		
		}
	
