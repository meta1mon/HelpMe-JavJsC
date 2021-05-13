package board.study.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.study.service.RstudyService;
import board.study.vo.Rstudy;

/**
 * Servlet implementation class MoveRqnaUpdate
 */
@WebServlet("/moverstudyupdate")
public class MoveRstudyUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoveRstudyUpdate() {
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
		int rsno = Integer.parseInt(request.getParameter("rsno"));
		Rstudy rsvo = null;
		try {
			rsvo = new RstudyService().rstudyRead(rsno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if (rsvo != null) {
			request.setAttribute("rstudy", rsvo);
			request.getRequestDispatcher("/board/study/rstudypopup.jsp").forward(request, response);
		} else {
			System.out.println("해당 댓글을 불러오지 못했습니다.");
		}
	}
}
