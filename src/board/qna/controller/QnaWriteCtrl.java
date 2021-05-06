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
 * Servlet implementation class BoardWriteCtrl
 */
@WebServlet("/qnawrite")
public class QnaWriteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QnaWriteCtrl() {
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
		
// 파일 첨부 기능
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		String saveDirectory = getServletContext().getRealPath("/board/files"); // 파일 저장 경로
			String encType = "UTF-8";
			int maxSize = 5*1024*1024; // 파일 크기 10M 제한
			
			File path = new File(saveDirectory);
			String root = getServletContext().getRealPath("/");
			if(!path.exists()) {
				path.mkdirs();
			}
			
			MultipartRequest mReq = new MultipartRequest(request, saveDirectory, maxSize, encType,  new DefaultFileRenamePolicy()); //file 저장 완료
			// (request, 저장될 폴더경로, 최대크기, utf-8, new DefaultRenamePolicy());
			String fileName = "";
			Enumeration files = mReq.getFileNames();
			while(files.hasMoreElements()) {
				// 업로드된 파일 이름 얻어오기
				String name = (String) files.nextElement();
				fileName = mReq.getFilesystemName(name); // 서버에 저장된 이름이 다르기 때문에 그이름을 알아와 DB에 저장함.
				File f1 = mReq.getFile(name);
				if(f1 == null) {
					System.out.println("파일 업로드 실패");
				} else {
					System.out.println("파일 업로드 성공");
				}
			}
			
// 닉네임 불러와야되는데 아직 설정 안함

//		Member me = (Member) request.getSession().getAttribute("loginMember");
//		String qwriter = me.getNickname();
		String qwriter = "eeee";

		Qna vo = new Qna();
//		String bsubject = request.getParameter("bsubject");
//		String bcontent = request.getParameter("bcontent");
		
		vo.setQsubject(mReq.getParameter("bsubject"));
		vo.setQcontent(mReq.getParameter("bcontent"));
		vo.setQwriter(qwriter);
		vo.setQfilepath(fileName);
		
		int result = 0;
		try {
			result = new QnaService().QnaWrite(vo);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.print("<script>alert('글 작성 성공!')</script>");
			out.print("<script>location.href = './qnalist'</script>");
		} else {
			out.print("<script>alert('글 작성 실패...')</script>");
			out.print("<script>location.href = './qnalist'</script>");
			
		}
		
	}
}
