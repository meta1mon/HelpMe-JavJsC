package board.qna.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import board.qna.dao.QlikeDao;
import board.qna.service.QlikeService;

/**
 * Servlet implementation class QlikeCtrl
 */
@WebServlet("/qlike")
public class QlikeCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QlikeCtrl() {
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
		String id = request.getParameter("id");
		int qno = Integer.parseInt(request.getParameter("qno"));

		// 이미 추천했는지 판단
		int isLike = 0;

		// 추천 메서드 실행 결과
		int result = 0;
		String like = null;
		try {
			isLike = new QlikeService().isLike(id, qno);
			if (isLike == 1) { // 이미 추천했음 => 추천 취소
				result = new QlikeService().deleteLike(id, qno);
				if (result > 0) {
					like = "안좋아졌어요";
				}
			} else if (isLike == 0) { // 추천 안했음 => 추천 실행
				result = new QlikeService().insertLike(id, qno);
				if (result > 0) {
					like = "좋아요";
				}

			} else {
				System.out.println("isLike 메서드에 문제 발생");
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		PrintWriter out = response.getWriter();
		if(!like.equals(null)) {
			out.print(like);
		} else {
			System.out.println("좋아요 기능에서 문제 발생");
		}
		out.flush();
		out.close();

	}
}
