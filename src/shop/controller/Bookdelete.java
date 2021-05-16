package shop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.DAO.ShopBookDAO;
import shop.VO.ShopBookVo;
import shop.service.Bookservice;

/**
 * Servlet implementation class bookdelete
 */
@WebServlet("/bookdelete")
public class Bookdelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Bookdelete() {
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
		System.out.println("딜리트 들어옴");
		
		String bid = request.getParameter("bid");
		String bkind = request.getParameter("bkind");
		
		int result  = 0;
		try {
			result = new Bookservice().deleteBook(bid);
			
			if( result > 0) {
				System.out.println("삭제완료");
			}else {
				System.out.println("삭제실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("bkind", bkind);
		request.getRequestDispatcher("booklist").forward(request, response);
	}

}
