package bookshop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bookshop.DAO.BookcartDAO;
import member.vo.Member;

/**
 * Servlet implementation class cartListDel
 */
@WebServlet("/bookcartListDel")
public class BookcartListDel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookcartListDel() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("책 딜리트 들어옴 ");
		Member vo = (Member) request.getSession().getAttribute("loginMember");
		HttpSession session = request.getSession();
		String list = request.getParameter("list");
		String bkind = request.getParameter("bkind");
		String buyer = vo.getId();
		System.out.println(bkind);
		if (session.getAttribute("loginMember") == null) {
			response.sendRedirect("#");
		} else {
			BookcartDAO bookprocess = BookcartDAO.getInstance();
			if (list.equals("all")) {
				try {
					bookprocess.deleteBookAll(buyer);
					response.sendRedirect("./shop/cartList.jsp?bkind=" + bkind);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (!bkind.equals("0")) {
				try {
					bookprocess.deleteBookList(Integer.parseInt(list));
					response.sendRedirect("./shop/cartList.jsp?bkind=" + bkind);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
