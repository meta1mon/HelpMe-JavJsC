package bookshop.controller;

import java.io.IOException;



import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bookshop.DAO.BookcartDAO;
import bookshop.DAO.BuyDAO;
import bookshop.DAO.VideocartDAO;
import bookshop.VO.BookcartVO;
import bookshop.VO.BuyVO;
import bookshop.VO.VideocartVO;
import bookshop.service.Buyservice;
import bookshop.service.Cartservice;
import member.vo.Member;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("구매서블렛 들어옴");
		
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
			
			if(book.getBookCart(id) == null) {
				System.out.println("책 구매 안함");

			} else {
				lists = book.getBookCart(id);
				result = sv.insertBuy1(lists,id, account, deliveryname, deliverytel, deliveryadd1, deliveryadd2);
				if(result > 0) {
				} else {
				System.out.println("책카트 처리중 오류 발생");
				}
			}
			
			
			if(video.getVideoCart(id) == null) {
				System.out.println("비디오 구매 안함");
			} else {
				vlists = video.getVideoCart(id);
				result1 = sv.insertBuy2(vlists, id, account, deliveryname, deliverytel, deliveryadd1, deliveryadd2);	
				if(result1 > 0) {
					
				} else {
					System.out.println("비디오카트 처리중 오류 발생");
				}
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println();
		response.sendRedirect("./shop/buyList.jsp");
	}

}
