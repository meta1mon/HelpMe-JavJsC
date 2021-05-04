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
 * Servlet implementation class BoardDeleteCtrl
 */
@WebServlet("/BoardDeleteCtrl")
public class BoardDeleteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardDeleteCtrl() {
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
		if (request.getAttribute("loginMember") != null) {
			bwriter = (String) request.getAttribute("loginMember");
		}
		if (bwriter == null) { // 로그아웃 -> 로그인 페이지로 이동
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('게시글을 수정하려면 로그인이 필요합니다.')");
			script.println("location.href = 'member/login.jsp'");
			script.println("</script>");
		}
		int bno = 0; // 존재하는 글
		if (request.getParameter("bno") != null) {
			bno = Integer.parseInt(request.getParameter("bno"));
		}
		if (bno == 0) { // 존재하지 않는 글
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 글입니다.')"); // 경고창 띄우고
			script.println("location.href = 'board/qna/bbs.jsp'"); // 게시판 페이지로 보냄
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bno);
		if (!bwriter.equals(bbs.getBwriter())) { // 접속자와 작성자가 다르면
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')"); // 글 삭제 권한 없음
			script.println("location.href = 'board/qna/bbs.jsp'"); // 게시판 페이지로 보냄
			script.println("</script>");
		} else {
			BbsDAO bbsDAO = new BbsDAO(); // 공란 없음 -> 게시글 수정
			int result = bbsDAO.delete(bno);
			if (result == -1) { // 데이터베이스 오류
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('게시글 삭제에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else { // 게시글 삭제 성공
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('게시글이 삭제되었습니다.')");
				script.println("location.href = 'board/qna/bbs.jsp'"); // 게시글을 삭제했으므로 게시판 페이지로 이동
				script.println("</script>");
			}
		}

	}
}
