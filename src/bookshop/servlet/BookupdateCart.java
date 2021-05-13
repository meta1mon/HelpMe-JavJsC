package bookshop.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bookshop.DAO.BookcartDAO;
import bookshop.VO.ShopBookVo;
import bookshop.service.Cartservice;
import member.vo.Member;

/**
 * Servlet implementation class bookupdateCart
 */
@WebServlet("/bookupdateCart")
public class BookupdateCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookupdateCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("카트 책 수정 들어옴");
		String bcid = request.getParameter("bcid");
		String buycount = request.getParameter("buycount");
		String bkind = request.getParameter("bkind");

		ShopBookVo book = new ShopBookVo();
		book.setBkind(bkind);
		
		
		
		HttpSession session = request.getSession();
		Member vo = (Member) request.getSession().getAttribute("loginMember");	
		if(session.getAttribute("loginMember")==null) {
			response.sendRedirect("#");
			System.out.println("널 ");
		}else {
			try {
				int result =  new Cartservice().updateBookCount(Integer.parseInt(bcid), Integer.parseInt(buycount));
			} catch (NumberFormatException e1) {
				e1.printStackTrace();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		
				response.sendRedirect("./shop/cartList.jsp?bkind="+bkind);
				System.out.println(bkind);
				System.out.println(vo.getId());
				System.out.println(bcid);
	}

			}
}

