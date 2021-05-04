package mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.vo.Member;

/**
 * Servlet implementation class MyPageEnter
 */
@WebServlet("/mypageenter")
public class MyPageEnter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageEnter() {
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
		String password = request.getParameter("password");
		Member vo = (Member) request.getSession().getAttribute("loginMember");

		PrintWriter out = response.getWriter();
		if (vo.getPassword().equals(password)) {
			out.print("<script>alert('비밀번호가 일치합니다. 마이페이지로 이동합니다');</script>");
			out.print("<script>location.href='myPage/myPage.jsp'</script>");
		} else {
			out.print("<script>alert('비밀번호가 일치하지 않습니다.');</script>");
			out.print("<script>location.href='myPage/myPage.jsp'</script>");
		}
		
		out.flush();
		out.close();

	
	
	}

}
