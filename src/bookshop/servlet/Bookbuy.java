package bookshop.servlet;

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
import bookshop.DAO.cartDAO;
import bookshop.DAO.VideocartDAO;
import bookshop.VO.BookcartVO;
import bookshop.VO.BuyVO;
import bookshop.VO.VideocartVO;
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
		String buyprice = request.getParameter("buyprice");
		String vid = request.getParameter("vid");
		String bid = request.getParameter("bid");
		String account = request.getParameter("account");
		String deliveryname = request.getParameter("deliveryname");
		String deliverytel = request.getParameter("deliverytel");
		String deliveryadd1 = request.getParameter("deliveryadd1");
		String deliveryadd2 = request.getParameter("deliveryadd2");
		String buycount = request.getParameter("buycount");
		String id = vo.getId();
				
		BuyVO buy = new BuyVO();
		
		
		buy.setId(id);
		buy.setBid(Integer.parseInt(bid));
		buy.setVid(Integer.parseInt(vid));
		buy.setAccount(account);
		buy.setDeliveryname(deliveryname);
		buy.setDeliverytel(deliverytel);
		buy.setDeliveryadd1(deliveryadd1);
		buy.setDeliveryadd2(deliveryadd2);
		buy.setBuyprice(Integer.parseInt(buyprice));
		buy.setBuycount(Integer.parseInt(buycount));
		System.out.println(buycount);
		
		BuyDAO buyprocess = BuyDAO.getinstance();
		try {
			buyprocess.insertBuy(Integer.parseInt(vid), Integer.parseInt(bid), id, account, deliveryname, deliverytel, deliveryadd1, deliveryadd2,
					Integer.parseInt(buyprice),Integer.parseInt(buycount));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		System.out.println();
		response.sendRedirect("./shop/buyList.jsp");
	}

}
