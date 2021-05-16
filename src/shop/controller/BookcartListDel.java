package shop.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.vo.Member;
import shop.DAO.BookcartDAO;
import shop.service.Cartservice;

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

		int result=0;
		if (session.getAttribute("loginMember") == null) {
			response.sendRedirect("#");
		} else {
			if (list.equals("all")) {
				try {
					result = new Cartservice().deleteBookAll(buyer);
					request.getRequestDispatcher("cartlist").forward(request, response);
					
					if(result > 0) {
						System.out.println("삭제 성공");
					}else {
						System.out.println("삭제 실패");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (!bkind.equals("0")) {
				try {
					result = new Cartservice().deleteBookList(Integer.parseInt(list));
					request.getRequestDispatcher("cartlist").forward(request, response);
					
					if(result > 0) {
						System.out.println("삭제 성공");
					}else {
						System.out.println("삭제 실패");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
