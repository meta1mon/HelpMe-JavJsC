package mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.MemberService;
import member.vo.Member;

/**
 * Servlet implementation class MyProfileUpdate
 */
@WebServlet("/myprofileupdate")
public class MyPageProfileUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPageProfileUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		Member vo = (Member) request.getSession().getAttribute("loginMember");
		
		String id = request.getParameter("id");
		String nickname = request.getParameter("nickname");
		String password1 = request.getParameter("password1");
		String passquestion = request.getParameter("passquestion");
		String passanswer = request.getParameter("passanswer");
		String postcode = request.getParameter("postcode");
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String address3 = request.getParameter("address3");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		
		vo = new Member(id, nickname, password1, passquestion, passanswer, null, postcode, address1, address2, address3, tel, email);
		int result = new MemberService().update(vo);
		
		PrintWriter out = response.getWriter();
		if(result > 0) {
			out.println("<script>alert('수정 완료!');</script>");
			request.getSession().setAttribute("loginMember", vo);
		} else {
			out.println("<script>alert('수정 실패!')</script>");
		}
		out.print("<script>window.opener.parent.location.reload();</script>");
		out.print("<script>window.close();</script>");
		
		out.flush();
		out.close();
	}

}
