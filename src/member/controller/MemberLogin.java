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
import member.vo.Member;

/**
 * Servlet implementation class MemberLogin
 */
@WebServlet("/memberlogin")
public class MemberLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberLogin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		Member vo = new MemberService().login(id);

		PrintWriter out = response.getWriter();
		if (vo == null) {
			out.println("<script>alert('존재하지 않는 아이디입니다');</script>");
			out.println("<script>location.href='javclogin';</script>");
		} else {
			if (vo.getPassword().equals(password)) {

				// 관리자로 로그인 시
				if (vo.getId().equals("semi01")) {
					request.getSession().setAttribute("loginMember", vo);
					request.getSession().setAttribute("AdminNickname", "관리자");
					out.println("<script>alert('관리자 로그인 성공');</script>");
					out.println("<script>location.href='javcsecond';</script>");
				} else {
					// 일반 회원 로그인 시
					request.getSession().setAttribute("loginMember", vo);
					out.println("<script>location.href='javcsecond';</script>");
				}
			} else {
				out.println("<script>alert('비밀번호가 틀렸습니다');</script>");
				out.println("<script>location.href='javcsecond';</script>");
			}
		}
	}

}
