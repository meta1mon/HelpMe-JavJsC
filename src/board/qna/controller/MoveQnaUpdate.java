package board.qna.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.qna.service.QnaService;
import board.qna.vo.Qna;

/**
 * Servlet implementation class MoveQnaUpdate
 */
@WebServlet("/moveqnaupdate")
public class MoveQnaUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoveQnaUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request,response);
	}

	private void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qno = Integer.parseInt(request.getParameter("qno"));
		Qna qvo = null;
		try {
			qvo = new QnaService().QnaRead(qno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if (qvo != null) {
			request.setAttribute("qna", qvo);
			request.getRequestDispatcher("/board/qna/qupdate.jsp").forward(request, response);
		} else {
			System.out.println("해당 글을 불러오지 못했습니다.");
		}
	}
}
