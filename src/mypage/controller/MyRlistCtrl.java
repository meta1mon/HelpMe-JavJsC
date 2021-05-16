package mypage.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.review.service.ReviewService;
import board.review.vo.Review;
import member.vo.Member;

/**
 * Servlet implementation class MySlistCtrl
 */
@WebServlet("/myrlist")
public class MyRlistCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyRlistCtrl() {
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
		ArrayList<Review> list = null;
		try {
			list = new ReviewService().getReviewBoard(search, searchType);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("rlist", list);
		request.setAttribute("search", search);
		request.setAttribute("searchType", searchType);
		request.getRequestDispatcher("myPage/myReviewPopup.jsp").forward(request, response);
	}
}
