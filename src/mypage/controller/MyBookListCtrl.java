package mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.vo.Member;
import shop.VO.BuyVO;
import shop.service.Buyservice;

/**
 * Servlet implementation class MyBookListCtrl
 */
@WebServlet("/mybooklist")
public class MyBookListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyBookListCtrl() {
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

	private void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<BuyVO> list = null;
		Boolean bigSize = true;
		Member vo = (Member) request.getSession().getAttribute("loginMember");
		String id = vo.getId();
		try {
			list = new Buyservice().getMyBook(id, bigSize);
			if (list == null) {
				System.out.println("책 구매내역 없음");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("myBook", list);
		request.getRequestDispatcher("myPage/myBookPopup.jsp").forward(request, response);
	}

}
