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
import member.vo.Member;

/**
 * Servlet implementation class MyRqlistCtrl
 */
@WebServlet("/myrqlist")
public class MyRqlistCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyRqlistCtrl() {
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
		request.getRequestDispatcher("myPage/myRqnaPopup.jsp").forward(request, response);
	}
}
