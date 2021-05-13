package board.qna.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.qna.service.QnaService;
import board.qna.service.RqnaService;
import board.qna.vo.Qna;
import board.qna.vo.Rqna;

/**
 * Servlet implementation class QnaReadCtrl
 */
@WebServlet("/qnaread")
public class QnaReadCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QnaReadCtrl() {
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
		int qno = Integer.parseInt(request.getParameter("qno"));

		// 조회수 증가
		try {
			int viewcnt = new QnaService().viewInt(qno);
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
		Qna qvo = null;
		try {
			qvo = new QnaService().QnaRead(qno);
		} catch (SQLException e) {
			e.printStackTrace();
		}

// 댓글 가져오기
		ArrayList<Rqna> list = null;
		try {
			list = new RqnaService().getRqna(qno);
		} catch (SQLException e) {
			e.printStackTrace();
		}

// 읽어온 글이 있다면! 실행할 부분
		if (qvo != null) {
			request.setAttribute("qna", qvo);
			if (list != null) {
				request.setAttribute("reply", list);
			}
			request.getRequestDispatcher("/board/qna/qread.jsp").forward(request, response);
		} else {
			System.out.println("해당 글을 불러오지 못했습니다.");
		}
	}

}
