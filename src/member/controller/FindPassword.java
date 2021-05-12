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
 * Servlet implementation class FindPassword
 */
@WebServlet("/findpassword")
public class FindPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPassword() {
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
		// 아이디, 비밀번호 질문, 비밀번호 답변 넘어옴
		String id = request.getParameter("id");
		String passquestion = request.getParameter("passquestion");
		String passanswer = request.getParameter("passanswer");

// 아이디를 보내서 비밀번호를 찾아옴
		Member result = new MemberService().selectSearch(id, 1);
		
		PrintWriter out = response.getWriter();
		
		if(result == null) {
			out.println("<script>alert('존재하지 않는 아이디입니다');</script>");
			out.println("<script>location.href='member/passfind.jsp';</script>");
		} else {
			if(!result.getPassquestion().equals(passquestion)) {
				out.println("<script>alert('저장된 비밀번호 질문이 아닙니다');</script>");
				out.println("<script>location.href='member/passfind.jsp';</script>");
			} else if(!result.getPassanswer().equals(passanswer)) {
				out.println("<script>alert('저장된 비밀번호 답변이 아닙니다');</script>");
				out.println("<script>location.href='member/passfind.jsp';</script>");
			} else {
				request.setAttribute("idfind", result.getId());
				request.setAttribute("passfind", result.getPassword());
				request.getRequestDispatcher("member/passfind_good.jsp").forward(request, response);
			}
		}
		
		out.flush();
		out.close();
		
	}

}
