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
import board.review.service.RreviewService;
import board.review.vo.Review;
import member.vo.Member;

/**
 * Servlet implementation class MyRslistCtrl
 */
@WebServlet("/myrrlist")
public class MyRrlistCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyRrlistCtrl() {
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
		String rrwriter = vo.getNickname();
		
		ArrayList<Integer> rnolist = null;
		ArrayList<Review> list2 = new ArrayList<Review>();
		
		try {
			rnolist = new RreviewService().myRreview(rrwriter);
			
			for (int rno : rnolist) {
				list2.add(new ReviewService().reviewRead(rno));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("rrlist", list2);
		request.getRequestDispatcher("myPage/myRreviewPopup.jsp").forward(request, response);
	}
}
