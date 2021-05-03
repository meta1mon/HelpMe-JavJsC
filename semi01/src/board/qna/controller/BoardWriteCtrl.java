package board.qna.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.qna.dao.BbsDAO;
import board.qna.vo.Bbs;

/**
 * Servlet implementation class BoardWriteCtrl
 */
@WebServlet("/BoardWriteCtrl")
public class BoardWriteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardWriteCtrl() {
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
		String bwriter = null;
		Bbs bbs = new Bbs();
		if (request.getAttribute("loginMember") != null) {
			bwriter = (String) request.getAttribute("loginMember");
		} 
		if (bwriter == null) { // 로그아웃 -> 로그인 페이지로 이동
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('게시글을 작성하려면 로그인이 필요합니다.')");
			script.println("location.href = 'member/login.jsp'");
			script.println("</script>");
		} else {
			if (bbs.getBsubject() == null || bbs.getBcontent() == null) { // 공란 있음
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')"); // 경고창 띄움
				script.println("history.back()"); // 이전 페이지로 돌려보냄
				script.println("</script>");
			} else {
				BbsDAO bbsDAO = new BbsDAO(); // 공란 없음 -> 게시글 작성
				int result = bbsDAO.write(bbs.getBsubject(), bwriter, bbs.getBcontent());
				if (result == -1) { // 데이터베이스 오류
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('게시글 작성에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else { // 게시글 작성 성공
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('게시글이 등록되었습니다.')");
					script.println("location.href = 'board/qna/bbs.jsp'"); // 게시글을 등록했으므로 게시판 페이지로 이동
					script.println("</script>");
				}
			}
		}
	}
}
