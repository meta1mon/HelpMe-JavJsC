package board.qna.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.qna.service.QnaService;
import board.qna.service.RqnaService;
import board.qna.vo.Qna;
import board.qna.vo.Rqna;
import member.vo.Member;

/**
 * Servlet implementation class RqnaWriteCtrl
 */
@WebServlet("/rqnawrite")
public class RqnaWriteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RqnaWriteCtrl() {
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

	private void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Member me = (Member) request.getSession().getAttribute("loginMember");
		String rqwriter = me.getNickname();
		
		Rqna vo = new Rqna();
		String a = request.getParameter("qno");
		int qno = Integer.parseInt(request.getParameter("qno"));
		String rqcontent = request.getParameter("rqcontent");
		
		vo.setQno(qno);
		vo.setRqcontent(rqcontent);
		vo.setRqwriter(rqwriter);
		
		int result = 0;
		try {
			result = new RqnaService().RqnaWrite(vo);	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.print("<script>alert('댓글 작성 성공!')</script>");
		} else {
			out.print("<script>alert('댓글 작성 실패...')</script>");
		}
		out.print("<script>location.href = document.referrer;</script>");
		
		out.flush();
		out.close();
	}
}
