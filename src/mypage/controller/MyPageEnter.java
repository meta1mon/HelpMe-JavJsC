package mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.qna.service.QnaService;
import board.qna.service.RqnaService;
import board.qna.vo.Qna;
import board.review.service.ReviewService;
import board.review.service.RreviewService;
import board.review.vo.Review;
import board.study.service.RstudyService;
import board.study.service.StudyService;
import board.study.vo.Study;
import member.vo.Member;
import shop.VO.BuyVO;
import shop.service.Buyservice;

/**
 * Servlet implementation class MyPageEnter
 */
@WebServlet("/mypageenter")
public class MyPageEnter extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyPageEnter() {
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

		String password = request.getParameter("password");
		Member vo = (Member) request.getSession().getAttribute("loginMember");

		PrintWriter out = response.getWriter();

		if (vo.getPassword().equals(password)) {

			// 로그인한 사람의 닉네임을 기준으로 내가 쓴 글을 불러옴
			String search = vo.getNickname();

			// 글쓴이 기준으로 찾을 것이기 때문에 2로 고정
			int searchType = 2;

// QnaListCtrl.java 참고
			// 최근 3개의 글만 보여준다
			int startRnum = 1;
			int endRnum = 3;

			ArrayList<Qna> list1 = null;
			try {
				list1 = new QnaService().getQnaBoard(startRnum, endRnum, search, searchType);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			request.setAttribute("qlist", list1);

// 내가 댓글쓴 글 불러오기. MyRqlistCtrl.java 참고
			// 댓글쓴 글 3개
			String rqwriter = search;

			ArrayList<Integer> qnolist = null;
			ArrayList<Qna> list2 = new ArrayList<Qna>();

			int cnt1 = 3;
			try {
				qnolist = new RqnaService().myRqna(rqwriter);
				// 댓글 수 3개임
				if (qnolist.size() < cnt1) {
					cnt1 = qnolist.size();
				}
				for (int i = 0; i < cnt1; i++) {
					list2.add(new QnaService().QnaRead(qnolist.get(i)));
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

			request.setAttribute("rqlist", list2);

// StudyListCtrl.java 참고
			// 최근 3개의 글만 보여준다

			ArrayList<Study> list3 = null;
			try {
				list3 = new StudyService().getStudyBoard(startRnum, endRnum, search, searchType);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			request.setAttribute("slist", list3);

// 내가 댓글쓴 글 불러오기. MyRslistCtrl.java 참고
			// 댓글쓴 글 3개
			String rswriter = search;

			ArrayList<Integer> snolist = null;
			ArrayList<Study> list4 = new ArrayList<Study>();

			int cnt2 = 3;
			try {
				snolist = new RstudyService().myRstudy(rswriter);
				// 댓글 수 3개임
				if (snolist.size() < cnt2) {
					cnt2 = snolist.size();
				}
				for (int i = 0; i < cnt2; i++) {
					list4.add(new StudyService().studyRead(snolist.get(i)));
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}

			request.setAttribute("rslist", list4);

// ReviewListCtrl.java 참고
			// 최근 3개의 글만 보여준다

			ArrayList<Review> list5 = null;
			try {
				list5 = new ReviewService().getReviewBoard(startRnum, endRnum, search, searchType);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("rlist", list5);

// 내가 댓글쓴 글 불러오기. MyRrlistCtrl.java 참고
			// 댓글쓴 글 3개
			String rrwriter = search;

			ArrayList<Integer> rnolist = null;
			ArrayList<Review> list6 = new ArrayList<Review>();

			int cnt3 = 3;
			try {
				rnolist = new RreviewService().myRreview(rrwriter);
				// 댓글 수 3개임
				if (rnolist.size() < cnt3) {
					cnt3 = rnolist.size();
				}
				for (int i = 0; i < cnt3; i++) {
					list6.add(new ReviewService().reviewRead(rnolist.get(i)));
				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("rrlist", list6);
			
			
// 내 구매내역 불러오기
			// 책
			List<BuyVO> list7 = null;
			Boolean bigSize = false;
			String id = vo.getId();
			try {
				list7 = new Buyservice().getMyBook(id, bigSize);
				if (list7 == null) {
					System.out.println("책 구매내역 없음");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("myBook", list7);
			
			// 영상
			List<BuyVO> list8 = null;
			try {
				list8 = new Buyservice().getMyVideo(id, bigSize);
				if (list8 == null) {
					System.out.println("비디오 구매내역 없음");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("myVideo", list8);
			
			
			request.getRequestDispatcher("myPage/myPage.jsp").forward(request, response);
		} else {
			out.print("<script>alert('비밀번호가 일치하지 않습니다.');</script>");
			out.print("<script>location.href='javcsecond'</script>");
		}

		out.flush();
		out.close();

	}

}
