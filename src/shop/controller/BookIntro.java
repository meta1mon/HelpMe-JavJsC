package shop.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.VO.ShopBookVo;
import shop.service.Bookservice;

/**
 * Servlet implementation class BookIntro
 */
@WebServlet("/bookIntro")
public class BookIntro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookIntro() {
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
		String bkind = request.getParameter("bkind");
		
		List<ShopBookVo> bookList = null;
		
		try {
			bookList = new Bookservice().getBooksList(bkind);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("booklist", bookList);
		request.setAttribute("bkind", bkind);
		request.getRequestDispatcher("./shop/introList.jsp").forward(request, response);
	}
}
