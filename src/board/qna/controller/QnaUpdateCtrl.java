package board.qna.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.qna.service.QnaService;
import board.qna.vo.Qna;

/**
 * Servlet implementation class QnaUpdateCtrl
 */
@WebServlet("/qnaupdate")
public class QnaUpdateCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaUpdateCtrl() {
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

		Qna vo = new Qna();
		String bsubject = request.getParameter("bsubject");
		String bcontent = request.getParameter("bcontent");
		int qno = Integer.parseInt(request.getParameter("qno"));
		String bfilepath = request.getParameter("bfilepath");
		
		vo.setQsubject(bsubject);
		vo.setQcontent(bcontent);
		vo.setQno(qno);
		vo.setQfilepath(bfilepath);
		
		int result = 0;
		try {
			result = new QnaService().Qnaupdate(vo);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.print("<script>alert('글 수정 성공!')</script>");
			out.print("<script>location.href = './qnalist';</script>");
		} else {
			out.print("<script>alert('글 수정 실패...')</script>");
			out.print("<script>location.href = './qnalist';</script>");
			
		}
	}
}
