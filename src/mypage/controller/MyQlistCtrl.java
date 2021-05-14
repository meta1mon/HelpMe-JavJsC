package mypage.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.qna.service.QnaService;
import board.qna.vo.Qna;
import member.vo.Member;

/**
 * Servlet implementation class MyQlistCtrl
 */
@WebServlet("/myqlist")
public class MyQlistCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyQlistCtrl() {
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
		Member vo = (Member) request.getSession().getAttribute("loginMember");
		String search = vo.getNickname();

		// 글쓴이 기준으로 찾을 것이기 때문에 2로 고정
		int searchType = 2;
		
		// 리스트 가져오기
		ArrayList<Qna> list = null;
		try {
			list = new QnaService().getQnaBoard(search, searchType);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("qlist", list);
		request.setAttribute("search", search);
		request.setAttribute("searchType", searchType);
		request.getRequestDispatcher("myPage/myQnaPopup.jsp").forward(request, response);
	}

}
