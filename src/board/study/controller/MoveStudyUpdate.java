package board.study.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.study.service.StudyService;
import board.study.vo.Study;

/**
 * Servlet implementation class MoveQnaUpdate
 */
@WebServlet("/movestudyupdate")
public class MoveStudyUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoveStudyUpdate() {
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
		int sno = Integer.parseInt(request.getParameter("sno"));
		Study svo = null;
		try {
			svo = new StudyService().studyRead(sno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if (svo != null) {
			request.setAttribute("study", svo);
			request.getRequestDispatcher("/board/study/supdate.jsp").forward(request, response);
		} else {
			System.out.println("해당 글을 불러오지 못했습니다.");
		}
	}
}
