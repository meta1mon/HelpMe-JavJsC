package board.study.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.study.service.StudyService;
import board.study.vo.Study;


/**
 * Servlet implementation class QnaListCtrl
 */
@WebServlet("/studylist")
public class StudyListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudyListCtrl() {
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
		final int PAGE_SIZE = 20;
		final int PAGE_BOX = 3;

		// 검색 시의 컨트롤 처리
		int searchType = 0; 
		String search = request.getParameter("search");
		if (search != null && !search.equals("")) {
			searchType = Integer.parseInt(request.getParameter("searchType"));
			// 즉 검색 내용이 있다면
		} else {
			// 검색 내용이 없다면
			search = null;
		}

		// search가 있든 없든 갖고 들어가서 전체 글 개수를 반환함
		int allPages = 0;
		try {
			allPages = new StudyService().studyCnt(search, searchType);
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

		// 리스트 가져오기
		ArrayList<Study> list = null;
		try {
			list = new StudyService().getStudyBoard(startRnum, endRnum, search, searchType);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("slist", list);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageBoxCnt", pageBoxCnt);
		request.setAttribute("search", search);
		request.setAttribute("searchType", searchType);
		request.getRequestDispatcher("board/study/slist.jsp").forward(request, response);

	}

}
