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

/**
 * Servlet implementation class QnaDeleteCtrl
 */
@WebServlet("/qnadelete")
public class QnaDeleteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QnaDeleteCtrl() {
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
		int qno = Integer.parseInt(request.getParameter("qno"));
		int result = 0;
		try {
			result = new QnaService().Qnadelete(qno);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.print("<script>alert('글 삭제 성공!')</script>");
			out.print("<script>location.href = './qnalist'</script>");
		} else {
			out.print("<script>alert('글 삭제 실패...')</script>");
			out.print("<script>location.href = './qnalist'</script>");

		}
	}

}
