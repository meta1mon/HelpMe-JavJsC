package bookshop.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import bookshop.VO.BookcartVO;
import common.jdbc.JDBCConnectionPool;

public class BookcartDAO {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	public static BookcartDAO instance = new BookcartDAO();
	
	public static BookcartDAO getInstance() {
		return instance;
	}
	
	private BookcartDAO() {}


public void insertBookCart(BookcartVO bookcart) throws Exception{
	Connection conn = JDBCConnectionPool.getConnection();
	rs = null; pstmt = null;
	String sql = " insert into bookcart (bcid, bid, id, buycount)" +
				 " values(bcid_seq.nextval,?,?,?)";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, bookcart.getBid());
		pstmt.setString(2, bookcart.getId());
		pstmt.setInt(3, bookcart.getBuycount());
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
		String sql = "select count(*) from bookcart where id=?";
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
	public List<BookcartVO> getBookCart(String id) throws Exception{
		Connection conn = JDBCConnectionPool.getConnection();
		List<BookcartVO> list = null;
		String sql = " select bcid, bimage,btitle,bprice,buycount, bookcart.bid"+
					" from bookcart left join book" +
					" on bookcart.bid = book.bid";
		pstmt = null;
		rs = null;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			list = new ArrayList<BookcartVO>();
			
		while(rs.next()) {
					BookcartVO vo = new BookcartVO();
					vo.setBprice(rs.getInt("bprice"));
					vo.setBtitle(rs.getString("btitle"));
					vo.setBimage(rs.getString("bimage"));
					vo.setBuycount(rs.getInt("buycount"));
					vo.setBid(rs.getInt("bid"));
					vo.setBcid(rs.getInt("bcid"));
					
					list.add(vo);
					
				}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}

		return list;
	}
	
	//장바구니 수량 수정 
	public void updateBookCount(int bcid, int count) throws Exception{
		Connection conn = JDBCConnectionPool.getConnection();
		pstmt = null;
	
		String sql = "update bookcart set buycount=? where bcid=?";
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
		String sql = "delete from bookcart where id =?";
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

