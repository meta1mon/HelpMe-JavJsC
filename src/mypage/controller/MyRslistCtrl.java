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
import board.qna.service.RqnaService;
import board.qna.vo.Qna;
import board.study.service.RstudyService;
import board.study.service.StudyService;
import board.study.vo.Study;
import member.vo.Member;

/**
 * Servlet implementation class MyRslistCtrl
 */
@WebServlet("/myrslist")
public class MyRslistCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyRslistCtrl() {
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
		String rswriter = vo.getNickname();
		
		ArrayList<Integer> snolist = null;
		ArrayList<Study> list2 = new ArrayList<Study>();
		
		try {
			snolist = new RstudyService().myRstudy(rswriter);
			
			for (int sno : snolist) {
				list2.add(new StudyService().studyRead(sno));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("rslist", list2);
		request.getRequestDispatcher("myPage/myRstudyPopup.jsp").forward(request, response);
	}
}
