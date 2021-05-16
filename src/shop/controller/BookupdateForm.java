package shop.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.VO.ShopBookVo;
import shop.service.Bookservice;

/**
 * Servlet implementation class bookupdateForm
 */
@WebServlet("/bookupdateForm")
public class BookupdateForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookupdateForm() {
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
		ShopBookVo vo = null;
		try {
			vo = new Bookservice().getBook(bid);
			
			if(vo != null) {
				System.out.println("수정할 책을 불러왔습니다.");
			} else {
				System.out.println("존재하지 않는 책입니다");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("book", vo);
		request.setAttribute("bkind", bkind);
		String url = "./shop/bookUpdateForm.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
