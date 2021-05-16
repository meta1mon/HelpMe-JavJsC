package shop.service;

import static common.jdbc.JDBCConnectionPool.*;


import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import shop.DAO.BuyDAO;
import shop.VO.BookcartVO;
import shop.VO.BuyVO;
import shop.VO.VideocartVO;
import member.vo.Member;

public class Buyservice {

	public List<String> getAccount() throws Exception {
		Connection conn = getConnection();
		BuyDAO buy = new BuyDAO();
		List<String> list = buy.getAccount(conn);
		close(conn);
		return list;
	}

	public int insertBuy1(List<BookcartVO> lists, String id, String account, String deliveryname, String deliverytel,
			String deliveryadd1, String deliveryadd2) throws Exception {
		Connection conn = getConnection();
		int result = 0;
		BuyDAO buy = new BuyDAO();
		result = buy.insertBuy1(conn, lists, id, account, deliveryname, deliverytel, deliveryadd1, deliveryadd2);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int insertBuy2(List<VideocartVO> vlists, String id, String account, String deliveryname, String deliverytel,
			String deliveryadd1, String deliveryadd2) throws Exception {
		Connection conn = getConnection();
		int result = 0;
		BuyDAO buy = new BuyDAO();
		result = buy.insertBuy2(conn, vlists, id, account, deliveryname, deliverytel, deliveryadd1, deliveryadd2);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int getListCount(String id) throws Exception {
		Connection conn = getConnection();
		BuyDAO buy = new BuyDAO();
		int result = buy.getListCount(conn, id);
		close(conn);
		return result;
	}
	
	public int getListBCount() throws Exception {
		Connection conn = getConnection();
		BuyDAO buy = new BuyDAO();
		int result = buy.getListBCount(conn);
		close(conn);
		return result;
	}
	
	public List<BuyVO> getBuyBookList() throws Exception {
		Connection conn = getConnection();
		BuyDAO buy = new BuyDAO();
		List<BuyVO> list = buy.getBuyBookList(conn);
		close(conn);
		return list;
	}
	
	public List<BuyVO> getBuyList_id(String id) throws Exception {
		Connection conn = getConnection();
		BuyDAO buy = new BuyDAO();
		List<BuyVO> list = buy.getBuyList_id(conn, id);
		close(conn);
		return list;
	}
	
	public List<BuyVO> getMyBook(String id, boolean bigSize) throws Exception {
		Connection conn = getConnection();
		BuyDAO buy = new BuyDAO();
		List<BuyVO> list = buy.getMyBook(conn, id, bigSize);
		close(conn);
		return list;
	}
	
	public List<BuyVO> getMyVideo(String id, boolean bigSize) throws Exception {
		Connection conn = getConnection();
		BuyDAO buy = new BuyDAO();
		List<BuyVO> list = buy.getMyVideo(conn, id, bigSize);
		close(conn);
		return list;
	}
}
