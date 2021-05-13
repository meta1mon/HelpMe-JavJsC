package bookshop.service;

import static common.jdbc.JDBCConnectionPool.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import bookshop.DAO.BuyDAO;
import bookshop.VO.BookcartVO;
import bookshop.VO.BuyVO;
import bookshop.VO.VideocartVO;
import member.vo.Member;

public class Buyservice {
	
	public int insertBuy1( List<BookcartVO>lists,String id, String account, String deliveryname, String deliverytel,
			String deliveryadd1, String deliveryadd2) throws Exception{
		Connection conn = getConnection();
		int result = 0;
		BuyDAO buy = new BuyDAO();
		result = buy.insertBuy1(conn, lists, id, account, deliveryname, deliverytel, deliveryadd1, deliveryadd2);
		close(conn);
		return result;
	}
	public int insertBuy2(List<VideocartVO> vlists,String id, String account, String deliveryname, String deliverytel,
			String deliveryadd1, String deliveryadd2) throws Exception {
		Connection conn = getConnection();
		int result1 = 0;
		BuyDAO buy = new BuyDAO();
		result1 =  buy.insertBuy2(conn, vlists, id, account, deliveryname, deliverytel, deliveryadd1, deliveryadd2);
		if(result1 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1;
		
	}
}

