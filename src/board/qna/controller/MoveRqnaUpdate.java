package board.qna.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.qna.service.RqnaService;
import board.qna.vo.Rqna;

/**
 * Servlet implementation class MoveRqnaUpdate
 */
@WebServlet("/moverqnaupdate")
public class MoveRqnaUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoveRqnaUpdate() {
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
		int rqno = Integer.parseInt(request.getParameter("rqno"));
		Rqna rqvo = null;
		try {
			rqvo = new RqnaService().RqnaRead(rqno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if (rqvo != null) {
			request.setAttribute("rqna", rqvo);
			request.getRequestDispatcher("/board/qna/rqnapopup.jsp").forward(request, response);
		} else {
			System.out.println("해당 댓글을 불러오지 못했습니다.");
		}
	}
}
