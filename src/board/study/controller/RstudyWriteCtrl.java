package board.study.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.study.service.RstudyService;
import board.study.vo.Rstudy;
import member.vo.Member;

/**
 * Servlet implementation class RqnaWriteCtrl
 */
@WebServlet("/rstudywrite")
public class RstudyWriteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RstudyWriteCtrl() {
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
		String rswriter = me.getNickname();
		
		Rstudy vo = new Rstudy();
		int sno = Integer.parseInt(request.getParameter("sno"));
		String rscontent = request.getParameter("rscontent");

		vo.setSno(sno);
		vo.setRscontent(rscontent);
		vo.setRswriter(rswriter);
		
		int result = 0;
		try {
			result = new RstudyService().rstudyWrite(vo);	
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
