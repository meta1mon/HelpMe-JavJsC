package shop.controller;

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
import shop.VO.ShopBookVo;
import shop.service.Bookservice;

/**
 * Servlet implementation class bookList
 */
@WebServlet("/booklist")
public class BookList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookList() {
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

// 어딘지 모를 이전 페이지에서, 특정 버튼을 누르면 bkind를 받아온다 - 미구현
		String bkind = (String)request.getAttribute("bkind");
//		String bkind = "100";
		if(bkind == null) {
			bkind = "100";
		}
		
		
		List<ShopBookVo> bookList = null;
		try {
			bookList = new Bookservice().getBooksList(bkind);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(bkind);
		request.setAttribute("booklist", bookList);
		request.setAttribute("bkind", bkind);
		request.getRequestDispatcher("./shop/bookList.jsp").forward(request, response);
		
		
	}

}
