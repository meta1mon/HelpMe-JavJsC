package shop.controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.vo.Member;
import shop.DAO.BookcartDAO;
import shop.DAO.BuyDAO;
import shop.DAO.VideocartDAO;
import shop.VO.BookcartVO;
import shop.VO.BuyVO;
import shop.VO.VideocartVO;
import shop.service.Buyservice;
import shop.service.Cartservice;

/**
 * Servlet implementation class bookbuy
 */
@WebServlet("/bookbuy")
public class Bookbuy extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Bookbuy() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		Member vo = (Member) request.getSession().getAttribute("loginMember");
		String id = vo.getId();
		String account = request.getParameter("account");
		String deliveryname = request.getParameter("deliveryname");
		String deliverytel = request.getParameter("deliverytel");
		String deliveryadd1 = request.getParameter("deliveryadd1");
		String deliveryadd2 = request.getParameter("deliveryadd2");

		BookcartDAO book = BookcartDAO.getInstance();

		VideocartDAO video = VideocartDAO.getInstance();

		BuyVO buy = new BuyVO();

		buy.setAccount(account);
		buy.setDeliveryname(deliveryname);
		buy.setDeliverytel(deliverytel);
		buy.setDeliveryadd1(deliveryadd1);
		buy.setDeliveryadd2(deliveryadd2);
		Buyservice sv = new Buyservice();

		List<BookcartVO> lists = null;
		int result = 0;
		List<VideocartVO> vlists = null;
		int result1 = 0;

		try {
			lists = new Cartservice().getBookCart(id);
			vlists = new Cartservice().getVideoCart(id);
			if (lists == null) {

			} else {
				result = sv.insertBuy1(lists, id, account, deliveryname, deliverytel, deliveryadd1, deliveryadd2);
				if (result > 0) {
				} else {
					System.out.println("책카트 처리중 오류 발생");
				}
			}

			if (vlists == null) {
				System.out.println("비디오 구매 안함");
			} else {
				result1 = sv.insertBuy2(vlists, id, account, deliveryname, deliverytel, deliveryadd1, deliveryadd2);
				if (result1 > 0) {

				} else {
					System.out.println("비디오카트 처리중 오류 발생");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		request.getRequestDispatcher("buylist").forward(request, response);
	}

}
