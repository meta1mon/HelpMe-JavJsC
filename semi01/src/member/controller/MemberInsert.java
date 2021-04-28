package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.MemberDao;
import member.vo.Member;

/**
 * Servlet implementation class MemberInsert
 */
@WebServlet("/memberinsert")
public class MemberInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsert() {
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
		System.out.println("포스트로 제대로 전달받음!");
		String id = request.getParameter("id");
		String nickname = request.getParameter("nickname");
		String password1 = request.getParameter("password1");
		String passquestion = request.getParameter("passquestion");
		String passanswer = request.getParameter("passanswer");
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		
		Member vo = new Member(id, nickname, password1, passquestion, passanswer, null, address, tel, email);
		int result = new MemberDao().insert(vo);
		
		PrintWriter out = response.getWriter();
		if(result > 0) {
			out.println("<script>alert('회원가입에 성공하였습니다');</script>");
			out.println("<script>location.href='index.jsp';</script>");
		} else {
			out.println("<script>alert('회원가입에 실패하였습니다.. 관리자에게 문의 바랍니다');</script>");
			out.println("<script>location.href='index.jsp';</script>");
		}
		
		
		
	}

}
