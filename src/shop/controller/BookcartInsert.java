package shop.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.vo.Member;
import shop.VO.BookcartVO;
import shop.service.Cartservice;

/**
 * Servlet implementation class bookcartInsert
 */
@WebServlet("/bookcartInsert")
public class BookcartInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookcartInsert() {
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
	private void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member vo = (Member) request.getSession().getAttribute("loginMember");
		String bkind = request.getParameter("bkind");
		String bid = request.getParameter("bid");
		String buycount = request.getParameter("buycount");
		String buyprice = request.getParameter("buyprice");
		String id = vo.getId();
		
		BookcartVO bookcart = new BookcartVO();

		bookcart.setBid(bid);
		bookcart.setBuycount(Integer.parseInt(buycount));
		bookcart.setId(id);
		
		int result = 0;
		
		try {
			result = new Cartservice().insertBookCart(bookcart);
			
			if(result > 0) {
				System.out.println("장바구니 담김");
			}else{
			System.out.println("장바구니 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("book", result);
		request.setAttribute("bkind", bkind);
		request.getRequestDispatcher("cartlist").forward(request, response);

	}
}
