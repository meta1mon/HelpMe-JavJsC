package board.study.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.study.service.RstudyService;
import board.study.service.StudyService;
import board.study.vo.Rstudy;
import board.study.vo.Study;

/**
 * Servlet implementation class QnaReadCtrl
 */
@WebServlet("/studyread")
public class StudyReadCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StudyReadCtrl() {
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
// 글 목록에서 들어갈 때,
		int sno = Integer.parseInt(request.getParameter("sno"));

		// 조회수 증가
		try {
			int viewcnt = new StudyService().viewInt(sno);
			if (viewcnt > 0) {
				System.out.println("조회수 증가");
			} else {
				System.out.println("문제 생김");
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

// 글 가져오기
		Study svo = null;
		try {
			svo = new StudyService().studyRead(sno);
		} catch (SQLException e) {
			e.printStackTrace();
		}

// 댓글 가져오기
		ArrayList<Rstudy> list = null;
		try {
			list = new RstudyService().getRstudy(sno);
		} catch (SQLException e) {
			e.printStackTrace();
		}

// 읽어온 글이 있다면! 실행할 부분
		if (svo != null) {
			request.setAttribute("study", svo);
			if (list != null) {
				request.setAttribute("reply", list);
			}
			request.getRequestDispatcher("/board/study/sread.jsp").forward(request, response);
		} else {
			System.out.println("해당 글을 불러오지 못했습니다.");
		}
	}

}
