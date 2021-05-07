package board.qna.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.qna.service.QnaService;
import board.qna.service.RqnaService;
import board.qna.vo.Qna;
import board.qna.vo.Rqna;

/**
 * Servlet implementation class RqnaUpdateCtrl
 */
@WebServlet("/rqnaupdate")
public class RqnaUpdateCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RqnaUpdateCtrl() {
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
	
	private void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
// 닉네임 불러와야되는데 아직 설정 안함

//		Member me = (Member) request.getSession().getAttribute("loginMember");
//		String qwriter = me.getNickname();

		Rqna vo = new Rqna();
		String rqcontent = request.getParameter("rqcontent");
		int rqno = Integer.parseInt(request.getParameter("rqno"));
		
		vo.setRqcontent(rqcontent);
		vo.setRqno(rqno);
		
		int result = 0;
		try {
			result = new RqnaService().Rqnaupdate(vo);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.print("<script>alert('댓글 수정 성공!')</script>");
			out.print("<script>opner.close</script>");
		} else {
			out.print("<script>alert('댓글 수정 실패...')</script>");
			out.print("<script>window.close</script>");
			
		}
		
		out.print("location.href='qread.jsp'");
	}
}
