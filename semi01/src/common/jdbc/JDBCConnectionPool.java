package common.jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource; //javax가 관리하는 datasource

public class JDBCConnectionPool {

	public static Connection getConnection() {
		Connection conn = null;
		try {
			// 현재 환경의 naming context 획득
			Context i1 = new InitialContext(); // 클래스로 인스턴스 생성했기때문에 클래스로 new. List<String> l1 = new
												// ArrayList<String>();과 같은 느낌~
			Context i2 = (Context) i1.lookup("java:/comp/env"); // web.xml 찾아가는 부분 (암기필요) / 리턴값 object 형태 -> Context 형태로
																// 형변환
			// DataSource 찾기
			DataSource ds = (DataSource) i2.lookup("jdbc/semi01");
			
			// 커넥션 얻어오기
			conn = ds.getConnection();

			if (conn == null) {
				System.out.println("************ 연결 실패 *************");
			} else {
				System.out.println("!!!!!!!!!!!! 연결 성공 !!!!!!!!!!!!!");
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return conn;
	}

	public static void close(Connection conn) {
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		try {
			if (stmt != null) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void commit(Connection conn) {
		try {
			if (conn != null) {
				conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection conn) {
		try {
			if (conn != null) {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
