package bookshop.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookshop.DAO.cartDAO;
import bookshop.VO.cartVO;

/**
 * Servlet implementation class cartInsert
 */
@WebServlet("/cartInsert")
public class cartInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("cart 들어옴");
	}

	/**
	 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response, ServletRequest session) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("cart 들어옴");
		
		String bkind = request.getParameter("bkind");
		String bid = request.getParameter("bid");
		String btitle = request.getParameter("btitle");
		String bimage = request.getParameter("bimage");	
//		String vkind =request.getParameter("vkind");
//		String vid = request.getParameter("vid");
//		String vtitle = request.getParameter("vtitle");
//		String vimage = request.getParameter("vimage");
		String buyCount = request.getParameter("buyCount");
		String buyPrice = request.getParameter("buyPrice");
		String buyer = (String)session.getAttribute("id");
		
		cartVO cart = new cartVO();
		cart.setBid(Integer.parseInt(bid));
		cart.setBimage(bimage);
		cart.setBtitle(btitle);
		cart.setBuyCount(Integer.parseInt(buyCount));
		cart.setBuyPrice(Integer.parseInt(buyPrice));
		cart.setBuyer(buyer);
		
		try {
			cartDAO cartprocess = cartDAO.getInstance();
			cartprocess.insertCart(cart);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("dd");
        response.sendRedirect("./shop/cartList.jsp?bkind="+bkind);
		
		
	}
	}
		
