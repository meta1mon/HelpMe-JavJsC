package mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import member.vo.Member;

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
			String rqwriter = vo.getNickname();
			
			ArrayList<Integer> qnolist = null;
			ArrayList<Qna> list2 = new ArrayList<Qna>();
			
			try {
				qnolist = new RqnaService().myRqna(rqwriter);
				
				for (int qno : qnolist) {
					list2.add(new QnaService().QnaRead(qno));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("rqlist", list2);
			
			
			request.getRequestDispatcher("myPage/myPage.jsp").forward(request, response);
		} else {
			out.print("<script>alert('비밀번호가 일치하지 않습니다.');</script>");
			out.print("<script>location.href='secondPage.jsp'</script>");
		}

		out.flush();
		out.close();

	}

}
