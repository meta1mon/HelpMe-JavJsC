package bookshop.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bookshop.VO.ShopBookVo;
import common.jdbc.JDBCConnectionPool;

public class ShopBookDAO {
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private void close() {
		try {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	private static ShopBookDAO instance = new ShopBookDAO();
	
	public static ShopBookDAO getinstance() {
		return instance;
	}
	
	//책 등록 
	public void insertBook(Connection conn,ShopBookVo book)throws Exception {
		PreparedStatement pstmt = null;
	
		
		String sql = "insert into book values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		
			
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, book.getBid());
			pstmt.setString(2, book.getBkind());
			pstmt.setString(3, book.getBtitle());
			pstmt.setInt(4, book.getBprice());
			pstmt.setInt(5, book.getBcount());
			pstmt.setString(6, book.getAuthor());
			pstmt.setString(7, book.getPublishing_com());
			pstmt.setString(8, book.getBimage());
			pstmt.setInt(9, book.getDiscountRate());
			pstmt.setTimestamp(10, book.getRegdate());
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			pstmt.close();
		}
	}
	
	//전체등록된 책의 수 얻어내기
	public int getBookCount() throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		pstmt = null; rs = null;
		String sql = "select count(*) from book";
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
	//분류별 또는 전체 등록된 책의 정보를 얻어냄 
	public List<ShopBookVo> getBooks(Connection conn,String bkind) throws SQLException{
		pstmt = null; rs = null;
		List<ShopBookVo> bookList = null;
		String sql1 = "select * from book";
		String sql2 =  " select * from book";
		sql2 += " where bkind = ? order by regdate desc";
		
		try {
		if(bkind.equals("all")) {
			pstmt = conn.prepareStatement(sql1);
		}else {
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, bkind);
		}
		rs = pstmt.executeQuery();
		if(rs.next()) {
			bookList = new ArrayList<ShopBookVo>();
			do {
				ShopBookVo book = new ShopBookVo();
				book.setBid(rs.getString("bid"));
				book.setBkind(rs.getString("bkind"));
				book.setBtitle(rs.getString("btitle"));
				book.setBprice(rs.getInt("bprice"));
				book.setBcount(rs.getInt("bcount"));
				book.setAuthor(rs.getString("author"));
				book.setPublishing_com(rs.getString("publishing_com"));
				book.setBimage(rs.getString("bimage"));
				book.setDiscountRate(rs.getInt("discountRate"));
				book.setRegdate(rs.getTimestamp("regdate"));
				
				bookList.add(book);
			}while(rs.next());
		}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return bookList;
	}
	//bid에 해당하는 책의 정보를 얻어내는 메소드로 
	//등록된 책을 수정하기 위해 수정폼으로 읽어들이기 위한 메소드 
	public ShopBookVo getBook(String bid) throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		pstmt = null; rs = null;
		ShopBookVo book = null;
		String sql = "select * from book where bid = ? ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				book = new ShopBookVo();
				book.setBid(rs.getString("bid"));
				book.setBkind(rs.getString("bkind"));
				book.setBtitle(rs.getString("btitle"));
				book.setBprice(rs.getInt("bprice"));
				book.setBcount(rs.getInt("bcount"));
				book.setAuthor(rs.getString("author"));
				book.setPublishing_com(rs.getString("publishing_com"));
				book.setBimage(rs.getString("bimage"));
				book.setDiscountRate(rs.getInt("discountRate"));						
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return book;
	}
	//책 정보 수정 
	public void updateBook(Connection conn,ShopBookVo book, String bid) throws Exception{
		pstmt = null; rs = null;
		String sql = " update book set bkind=?, btitle=?, bprice=?";
		sql += " ,bcount=?, author=?, publishing_com=? ";
		sql += " ,bimage=?, discountRate=?";
		sql += " where bid=?";
		
		try {
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book.getBkind());
			pstmt.setString(2, book.getBtitle());
			pstmt.setInt(3, book.getBprice());
			pstmt.setInt(4, book.getBcount());
			pstmt.setString(5, book.getAuthor());
			pstmt.setString(6, book.getPublishing_com());
			pstmt.setString(7, book.getBimage());
			pstmt.setInt(8, book.getDiscountRate());
			pstmt.setString(9, book.getBid());
			
			pstmt.executeUpdate();
			System.out.println("업데이트 들어옴.다오");
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
				
	}
	//책 삭제
	public void deleteBook(Connection conn, String bid) throws Exception {
		pstmt = null; rs = null;
		String sql = "delete from book where bid=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bid);
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	//shop main에 신간책 목록 얻어내기 위한 메소드
	//아직 기능구현 안됨 ㅜ 
	public ShopBookVo[] getBooks(String bkind,int count) throws SQLException {
		Connection conn = JDBCConnectionPool.getConnection();
		pstmt = null; rs = null;
		ShopBookVo bookList[] = null;
		String sql = " select * from (" ;
			   sql += " select * from book where bkind=?";
			   sql += " order by regdate desc) where rownum < ?";
		int i =0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bkind);
			pstmt.setInt(2, count);
			System.out.println("????");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bookList = new ShopBookVo[count];
				do {
					ShopBookVo book = new ShopBookVo();
					book.setBid(rs.getString("bid"));
					book.setBkind(rs.getString("bkind"));
					book.setBtitle(rs.getString("btitle"));
					book.setBprice(rs.getInt("bprice"));
					book.setBcount(rs.getInt("bcount"));
					book.setAuthor(rs.getString("author"));
					book.setPublishing_com(rs.getString("publishing_com"));
					book.setBimage(rs.getString("bimage"));
					book.setDiscountRate(rs.getInt("discountRate"));
					book.setRegdate(rs.getTimestamp("regdate"));
					
					bookList[i]=book;
					i++;
				}while(rs.next());
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null)
				try {rs.close();} catch (SQLException e) {
					e.printStackTrace();
				}
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		return bookList;
	}
}

	
