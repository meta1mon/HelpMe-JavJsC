package board.review.controller;

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
import board.review.vo.Rreview;


/**
 * Servlet implementation class ReviewReadCtrl
 */
@WebServlet("/reviewread")
public class ReviewReadCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewReadCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
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
		int rno = Integer.parseInt(request.getParameter("rno"));

		// 조회수 증가
		try {
			int viewcnt = new ReviewService().viewInt(rno);
			if (viewcnt > 0) {
				System.out.println("조회수 증가");
			} else {
				System.out.println("문제 생김");
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

// 글 가져오기
		Review rvo = null;
		try {
			rvo = new ReviewService().reviewRead(rno);
		} catch (SQLException e) {
			e.printStackTrace();
		}

// 댓글 가져오기
		ArrayList<Rreview> list = null;
		try {
			list = new RreviewService().getRreview(rno);
		} catch (SQLException e) {
			e.printStackTrace();
		}

// 읽어온 글이 있다면! 실행할 부분
		if (rvo != null) {
			request.setAttribute("review", rvo);
			if (list != null) {
				request.setAttribute("reply", list);
			}
			request.getRequestDispatcher("/board/review/rread.jsp").forward(request, response);
		} else {
			System.out.println("해당 글을 불러오지 못했습니다.");
		}
	}
}
