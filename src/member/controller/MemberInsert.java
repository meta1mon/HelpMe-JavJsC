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
		String rcvmail = null;
		if(request.getParameter("rcvmail") == null) { // 이메일 수신 체크를 안했다면
			rcvmail = "0";
		} else { // 이메일 수신 체크를 했다면
			rcvmail = request.getParameter("rcvmail");
		}
		Member vo = new Member(id, nickname, password1, passquestion, passanswer, null, postcode, address1, address2, address3, tel, email, rcvmail);
		int result = new MemberService().insert(vo);
		PrintWriter out = response.getWriter();
		if(result > 0) {
			out.println("<script>alert('회원가입에 성공하였습니다');</script>");
			out.println("<script>location.href='index.jsp';</script>");
		} else {
			out.println("<script>alert('회원가입에 실패하였습니다. 관리자에게 문의하세요');</script>");
			out.println("<script>location.href='index.jsp';</script>");
		}
		
		out.flush();
		out.close();
		
		
		
	}

}
