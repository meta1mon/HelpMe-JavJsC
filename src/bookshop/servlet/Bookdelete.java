package bookshop.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookshop.DAO.ShopBookDAO;
import bookshop.VO.ShopBookVo;
import bookshop.service.Bookservice;

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
		request.setCharacterEncoding("utf-8");
		System.out.println("딜리트 들어옴");
		
		int bid = Integer.parseInt(request.getParameter("bid"));
		String bkind = request.getParameter("bkind");
			
		Bookservice sv = new Bookservice();
		try {
			sv.deleteBook(bid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("./shop/bookList.jsp?bkind="+bkind);
	
	}

}
