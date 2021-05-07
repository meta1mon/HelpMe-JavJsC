package board.qna.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.qna.dao.QnaDao;
import board.qna.service.QnaService;
import board.qna.vo.Qna;
import member.vo.Member;

/**
 * Servlet implementation class BoardWriteCtrl
 */
@WebServlet("/qnawrite")
public class QnaWriteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QnaWriteCtrl() {
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
// 닉네임 불러와야되는데 아직 설정 안함

//		Member me = (Member) request.getSession().getAttribute("loginMember");
//		String qwriter = me.getNickname();
		String qwriter = "eeee";

		Qna vo = new Qna();
		String qsubject = request.getParameter("qsubject");
		String qcontent = request.getParameter("qcontent");
		
		vo.setQsubject(qsubject);
		vo.setQcontent(qcontent);
		vo.setQwriter(qwriter);
		
		int result = 0;
		try {
			result = new QnaService().QnaWrite(vo);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.print("<script>alert('글 작성 성공!')</script>");
			out.print("<script>location.href='index.jsp'</script>");
		} else {
			out.print("<script>alert('글 작성 실패...')</script>");
			out.print("<script>location.href='index.jsp'</script>");
			
		}
		
	}
}
