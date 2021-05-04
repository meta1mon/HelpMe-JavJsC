package board.qna.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import board.qna.vo.Bbs;

public class BbsDAO {

		private Connection conn; // connection:db에접근하게 해주는 객체
		//private PreparedStatement pstmt;
		private ResultSet rs;
		
		//현재의 시간을 가져오는 함수
		public String getDate() { 
			String SQL = "SELECT SYSDATE FROM DUAL";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					return rs.getString(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "시간을 가져오지못했습니다."; //데이터베이스 오류
		}
		
		//bbsID 게시글 번호 가져오는 함수
			public int getNext() { 
				String SQL = "SELECT BNO FROM QNA ORDER BY BNO DESC";
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					rs = pstmt.executeQuery();
					if(rs.next()) {
						return rs.getInt(1) + 1;
					}
					return 1;//첫 번째 게시물인 경우
				} catch (Exception e) {
					e.printStackTrace();
				}
				return -1; //데이터베이스 오류
			}
			

			//실제로 글을 작성하는 함수
			public int write(String bsubject, String bno, String bcontent) { 
				String SQL = "INSERT INTO QNA VALUES(?, ?, ?, ?, ?, ?)";
				try {					
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setInt(1, getNext());
					pstmt.setString(2, bsubject);
					pstmt.setString(3, bno);
					pstmt.setString(4, getDate());
					pstmt.setString(5, bcontent);
					pstmt.setInt(6,1);	//available
					return pstmt.executeUpdate();
					
				} catch (Exception e) {
					System.out.println("write메서드 catch문");
					e.printStackTrace();
				}
				System.out.println("write메서드return문위");
				return -1; //데이터베이스 오류
			}
			
			//글 목록
			public ArrayList<Bbs> getList(int pageNumber){ 
				String SQL = "SELECT * FROM QNA WHERE BNO < ? and bavailable = 1 order by BNO desc";
				ArrayList<Bbs> list = new ArrayList<Bbs>();
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
					rs = pstmt.executeQuery();
					while (rs.next()) {
						Bbs bbs = new Bbs();
						bbs.setBno(rs.getInt(1));
						bbs.setBsubject(rs.getString(2));
						bbs.setBwriter(rs.getString(3));
						bbs.setBdate(rs.getString(4));
						bbs.setBcontent(rs.getString(5));
						bbs.setBavailable(rs.getInt(6));
						list.add(bbs);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return list; 
			}
			
			
			//10 단위 페이징 처리를 위한 함수. 다음글이 없을때 next안뜨도록.
			public boolean nextPage (int pageNumber) {
				String SQL = "SELECT * FROM QNA WHERE BNO < ? and bavailable = 1 order by BNO desc";
				ArrayList<Bbs> list = new ArrayList<Bbs>();
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setInt(1, getNext() - (pageNumber -1) * 10);	//예를 들어 32면 30빼고 2만 보이게한다.
					rs = pstmt.executeQuery();
					if (rs.next()) {
						return true;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return false; 		
			}

			
			//글 제목클릭하여 하나의 게시물 보기
			public Bbs getBbs(int bno) {
				String SQL = "SELECT * FROM QNA WHERE BNO = ?";
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);
					pstmt.setInt(1, bno);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						Bbs bbs = new Bbs();
						bbs.setBno(rs.getInt(1));
						bbs.setBsubject(rs.getString(2));
						bbs.setBwriter(rs.getString(3));
						bbs.setBdate(rs.getString(4));
						bbs.setBcontent(rs.getString(5));
						bbs.setBavailable(rs.getInt(6));
						return bbs;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return null;
			}
			
			
			//수정 함수
			public int update(int bno, String newbbsTitle, String newbbsContent) {
					String SQL = "UPDATE QNA SET bsubject = ?, bcontent = ? WHERE BNO = ?";
					try {
						System.out.println("수정함수 들어옴");
						PreparedStatement pstmt = conn.prepareStatement(SQL);
						pstmt.setString(1, newbbsTitle);
						pstmt.setString(2, newbbsContent);
						pstmt.setInt(3, bno);
						return pstmt.executeUpdate();

					} catch (Exception e) {
						e.printStackTrace();
					}
					return -1; // 데이터베이스 오류
			}
			
			
			//삭제 함수. available을 0으로 만든다.
			public int delete(int bno) {
				String SQL = "UPDATE QNA SET bavailable = 0 WHERE BNO = ?";
				try {
					PreparedStatement pstmt = conn.prepareStatement(SQL);   
					pstmt.setInt(1, bno);
					return pstmt.executeUpdate();

				} catch (Exception e) {
					e.printStackTrace();
				}
			return -1; // 데이터베이스 오류
			}


	}
