package bookshop.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bookshop.VO.shopBookVo;
import common.jdbc.JDBCConnectionPool;

public class shopBookDAO {
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
	private static shopBookDAO instance = new shopBookDAO();
	
	public static shopBookDAO getinstance() {
		return instance;
	}
	//관리자 인증 
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
	
	//책 등록 
	public void insertBook(shopBookVo book)throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		PreparedStatement pstmt = null;
	
		
		String sql = "insert into book values (book_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		
			
		try {
			
			pstmt = conn.prepareStatement(sql);
//			.shopBookDAOpstmt.setInt(1, );
			pstmt.setString(1, book.getBkind());
			pstmt.setString(2, book.getBtitle());
			pstmt.setInt(3, book.getBprice());
			pstmt.setInt(4, book.getBcount());
			pstmt.setString(5, book.getAuthor());
			pstmt.setString(6, book.getPublishing_com());
			pstmt.setString(7, book.getBimage());
			pstmt.setInt(8, book.getDiscountRate());
			pstmt.setTimestamp(9, book.getRegdate());
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
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
	public List<shopBookVo> getBooks(String bkind) throws SQLException{
		Connection conn = JDBCConnectionPool.getConnection();
		pstmt = null; rs = null;
		List<shopBookVo> bookList = null;
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
			bookList = new ArrayList<shopBookVo>();
			do {
				shopBookVo book = new shopBookVo();
				book.setBid(rs.getInt("bid"));
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
	public shopBookVo getBook(int bid) throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		pstmt = null; rs = null;
		shopBookVo book = null;
		String sql = "select * from book where bid = ? ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				book = new shopBookVo();
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
	public void updateBook(shopBookVo book, int bid) throws Exception{
		Connection conn = JDBCConnectionPool.getConnection();
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
			pstmt.setInt(9, book.getBid());
			
			pstmt.executeUpdate();
			System.out.println("업데이트 들어옴.다오");
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
				
	}
	//책 삭제
	public void deleteBook(int bid) throws Exception {
		Connection conn = JDBCConnectionPool.getConnection();
		pstmt = null; rs = null;
		String sql = "delete from book where bid=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
}
	
