package board.review.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.review.service.RreviewService;
import board.review.vo.Rreview;
import member.vo.Member;

/**
 * Servlet implementation class RreviewWriteCtrl
 */
@WebServlet("/rreviewwrite")
public class RreviewWriteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RreviewWriteCtrl() {
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
		String rrwriter = me.getNickname();
		
		Rreview vo = new Rreview();
		int rno = Integer.parseInt(request.getParameter("rno"));
		String rrcontent = request.getParameter("rrcontent");
		
		vo.setRno(rno);
		vo.setRrcontent(rrcontent);
		vo.setRrwriter(rrwriter);
		
		int result = 0;
		try {
			result = new RreviewService().rreviewWrite(vo);	
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
