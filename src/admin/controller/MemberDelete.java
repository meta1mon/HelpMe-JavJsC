package admin.controller;

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
@WebServlet("/memberdelete")
public class MemberDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberDelete() {
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
		System.out.println("메서드 넘어는 옴");
		String id = request.getParameter("id");
		int result = new MemberService().delete(id);
		System.out.println(result);
		
		PrintWriter out = response.getWriter();
		if (result > 0) {
			System.out.println("삭제 완료");
			out.print("<script>alert('성공적으로 회원이 제거되었습니다');</script>");
			out.print("<script>location.href='memberlist';</script>");
		} else {
			System.out.println("삭제 실패");
			out.print("<script>alert('회원 제거에 실패했습니다');</script>");
			out.print("<script>location.href='memberlist';</script>");
			
		}
	}

}
