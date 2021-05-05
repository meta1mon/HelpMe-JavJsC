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
// 글 목록에서 넘겨 받은 것
		int qno = Integer.parseInt(request.getParameter("qno"));
		
// 글 가져오기
		Qna qvo = null;
		try {
			qvo = new QnaService().QnaRead(qno);
		} catch (SQLException e) {
			e.printStackTrace();
		}

// 댓글 세팅
		final int PAGE_SIZE = 3;
		final int PAGE_BOX = 3;


		int allPages = 0;
		try {
			allPages = new RqnaService().RqnaCnt(qno);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		int pageBoxCnt = 0; // 하단의 총 페이지 전환 버튼 수
		if (allPages % PAGE_SIZE == 0) {
			pageBoxCnt = allPages / PAGE_SIZE;
		} else {
			pageBoxCnt = allPages / PAGE_SIZE + 1;
		}

		// 현재 페이지, 기본값 1
		int currentPage = 1;
		// 리스트에서 누른 번호로 현재 페이지를 넘김
		String pageNum = request.getParameter("pageNum");
		if (pageNum != null) {   // 이거 안해주면, 제일 처음 리스트 보려고 할 때 에러 걸림, 페이지 클릭이 없기 때문
			currentPage = Integer.parseInt(pageNum);
		}
		// 현재 페이지를 기준으로 글 몇 번부터 몇 번까지 보여줄지 결정
		int startRnum = PAGE_SIZE * (currentPage - 1) + 1;
		int endRnum = startRnum + PAGE_SIZE - 1;
		// 현재 페이지를 기준으로 페이지 전환 수 보이기
		int startPage = 1;
		int endPage = 1;
		// 가장 왼쪽 페이지 전환 숫자
		if (currentPage % PAGE_BOX == 0) {
			startPage = ((currentPage / PAGE_BOX) - 1) * PAGE_BOX + 1;
		} else {
			startPage = (currentPage / PAGE_BOX) * PAGE_BOX + 1;
		}
		// 가장 오른쪽 페이지 전환 숫자
		endPage = startPage + PAGE_BOX - 1;
		if (endPage > pageBoxCnt) {
			endPage = pageBoxCnt;
		}
		
// 댓글 가져오기
		ArrayList<Rqna> list = null;
		try {
			list = new RqnaService().getRqna(startRnum, endRnum, qno);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
// 읽어온 글이 있다면! 실행할 부분
		if (qvo != null) {
			request.setAttribute("qna", qvo);
			if(list != null) {
				request.setAttribute("reply", list);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("currentPage", currentPage);
				request.setAttribute("pageBoxCnt", pageBoxCnt);
			}
			request.getRequestDispatcher("/board/qna/qread.jsp").forward(request, response);
		} else {
			System.out.println("해당 글을 불러오지 못했습니다.");
		}
		
//// 읽어온 댓글이 있다면! 실행할 부분
//		request.setAttribute("reply", list);
//		request.setAttribute("startPage", startPage);
//		request.setAttribute("endPage", endPage);
//		request.setAttribute("currentPage", currentPage);
//		request.setAttribute("pageBoxCnt", pageBoxCnt);
//		request.getRequestDispatcher("board/qna/qlist.jsp").forward(request, response);

	}

}
