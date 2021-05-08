package bookshop.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bookshop.DAO.bookcartDAO;
import bookshop.DAO.buyDAO;
import bookshop.DAO.videocartDAO;
import bookshop.DAO.videocartVO;
import bookshop.VO.bookcartVO;
import member.vo.Member;

/**
 * Servlet implementation class bookbuy
 */
@WebServlet("/bookbuy")
public class bookbuy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookbuy() {
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
		String account = request.getParameter("account");
		String deliveryname = request.getParameter("deliveryname");
		String deliverytel = request.getParameter("deliverytel");
		String deliveryadd1 = request.getParameter("deliveryadd1");
		String deliveryadd2 = request.getParameter("deliveryadd2");
		String buyer = vo.getId();
		
		bookcartDAO cartprocess = bookcartDAO.getInstance();
		List<bookcartVO> cartLists =null;
		
		videocartDAO videoprocess = videocartDAO.getInstance();
		List<videocartVO> videocartLists = null;
		try {
			cartLists = cartprocess.getBookCart(buyer);
			videocartLists = videoprocess.getVideoCart(buyer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		buyDAO buyprocess = buyDAO.getinstance();
		try {
			buyprocess.insertBuy(cartLists, videocartLists, buyer, account, deliveryname, deliverytel, deliveryadd1, deliveryadd2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println();
		response.sendRedirect("./shop/buyList.jsp");
	}

}
