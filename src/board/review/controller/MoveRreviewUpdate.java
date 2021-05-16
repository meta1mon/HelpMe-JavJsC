package board.review.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.review.service.RreviewService;
import board.review.vo.Rreview;


/**
 * Servlet implementation class MoveRreviewUpdate
 */
@WebServlet("/moverreviewupdate")
public class MoveRreviewUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoveRreviewUpdate() {
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
		int rrno = Integer.parseInt(request.getParameter("rrno"));
		System.out.println(rrno);
		Rreview rrvo = null;
		try {
			rrvo = new RreviewService().rreviewRead(rrno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if (rrvo != null) {
			request.setAttribute("rreview", rrvo);
			request.getRequestDispatcher("/board/review/rreviewpopup.jsp").forward(request, response);
		} else {
			System.out.println("해당 댓글을 불러오지 못했습니다.");
		}
	}
}
