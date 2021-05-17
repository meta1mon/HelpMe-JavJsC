package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.MemberDao;
import member.service.MemberService;

/**
 * Servlet implementation class MemberDelete
 */
@WebServlet("/memberwithdraw")
public class MemberWithdraw extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberWithdraw() {
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
		String id = request.getParameter("id");
		int result = new MemberService().delete(id);
		
		PrintWriter out = response.getWriter();
		if (result > 0) {
			System.out.println("삭제 완료");
			request.getSession().removeAttribute("loginMember");
			out.print("<script>alert('회원 탈퇴 완료. 다시 돌아올거죠..?');</script>");
			out.print("<script>location.href='secondPage.jsp';</script>");
		} else {
			System.out.println("삭제 실패");
			out.print("<script>alert('회원 탈퇴 실패. 관리자에게 문의하세요');</script>");
			out.print("<script>location.href='secondPage.jsp';</script>");
			
		}
	}

}
