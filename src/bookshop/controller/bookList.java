package bookshop.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.qna.service.QnaService;
import board.qna.vo.Qna;
import bookshop.VO.ShopBookVo;
import bookshop.service.Bookservice;

/**
 * Servlet implementation class bookList
 */
@WebServlet("/booklist")
public class bookList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookList() {
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
			bookList = new Bookservice().getBooks(bkind);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(bkind);
		request.setAttribute("booklist", bookList);
		request.setAttribute("bkind", bkind);
		request.getRequestDispatcher("./shop/bookList.jsp"+bkind);
		
		
	}

}
