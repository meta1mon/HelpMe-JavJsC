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

/**
 * Servlet implementation class RqnaDeleteCtrl
 */
@WebServlet("/rqnadelete")
public class RqnaDeleteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RqnaDeleteCtrl() {
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

	private void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("들어는 옴");
		int rqno = Integer.parseInt(request.getParameter("rqno"));
		int result = 0;
		try {
			result = new RqnaService().Rqnadelete(rqno);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.print("<script>alert('댓글 삭제 성공!')</script>");
			out.print("<script>location.href='index.jsp'</script>");
		} else {
			out.print("<script>alert('댓글 삭제 실패...')</script>");
			out.print("<script>location.href='index.jsp'</script>");

		}
	}
}
