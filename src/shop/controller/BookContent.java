package shop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.VO.ShopBookVo;
import shop.service.Bookservice;

/**
 * Servlet implementation class bookContent
 */
@WebServlet("/bookcontent")
public class BookContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookContent() {
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
		String bid = request.getParameter("bid");
		String bkind = request.getParameter("bkind");
		
		ShopBookVo bookList = null;
		
		try {
			bookList = new Bookservice().getBook(bid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("b", bookList);
		request.setAttribute("bkind", bkind);
		request.getRequestDispatcher("./shop/bookContent.jsp").forward(request, response);
		
	}

}
