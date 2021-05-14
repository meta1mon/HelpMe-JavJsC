package bookshop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bookshop.DAO.BookcartDAO;
import bookshop.DAO.VideocartDAO;
import bookshop.service.Cartservice;
import member.vo.Member;

/**
 * Servlet implementation class videocartListDel
 */
@WebServlet("/videocartListDel")
public class VideocartListDel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VideocartListDel() {
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("영상 딜리트 들어옴 ");
		Member vo = (Member) request.getSession().getAttribute("loginMember");
		HttpSession session = request.getSession();
		String list = request.getParameter("list");
		String vkind = request.getParameter("vkind");
		String buyer = vo.getId();
		Cartservice sv = new Cartservice();
		if (session.getAttribute("loginMember") == null) {
			response.sendRedirect("#");
		} else {
			VideocartDAO videoprocess = VideocartDAO.getInstance();
			if (list.equals("all")) {
				try {
					sv.deleteVideoAll(buyer);
					response.sendRedirect("./shop/cartList.jsp?vkind=" + vkind);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if (!vkind.equals("0")) {
				try {
					sv.deleteVideoList(Integer.parseInt(list));
					response.sendRedirect("./shop/cartList.jsp?vkind=" + vkind);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
