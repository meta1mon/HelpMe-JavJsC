package board.study.controller;

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

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.study.service.StudyService;
import board.study.vo.Study;
import member.vo.Member;

/**
 * Servlet implementation class QnaUpdateCtrl
 */
@WebServlet("/studyupdate")
public class StudyUpdateCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StudyUpdateCtrl() {
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


		Study vo = new Study();
		// 파일 첨부 기능
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		int maxSize = 10 * 1024 * 1024; // 파일 크기 10M 제한
		String encType = "UTF-8";
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		String saveDirectory = getServletContext().getRealPath("/study/files"); // 파일 저장 경로
		System.out.println(saveDirectory);

		if (!ServletFileUpload.isMultipartContent(request))
			response.sendRedirect("view/error/Error.jsp");

		File path = new File(saveDirectory);
		String root = getServletContext().getRealPath("/");
		if (!path.exists()) {
			path.mkdirs(); // 해당 경로에 파일을 저장하는 폴더가 없으면 생성해줌.
		}

		MultipartRequest mReq = new MultipartRequest(request, // request 객체
				saveDirectory, // 서버 상 업로드 될 디렉토리
				maxSize, // 업로드 파일 크기 제한
				encType, // 인코딩 방법
				new DefaultFileRenamePolicy() // 동일 이름 존재 시 새로운 이름 부여 방식
		);

		String fileName = "";
		Enumeration files = mReq.getFileNames(); // 업로드 된 파일 이름 얻어오기
		String fileNames = "";
		while (files.hasMoreElements()) {
			// 업로드된 파일 이름 얻어오기
			String file = (String) files.nextElement();
			fileName = mReq.getFilesystemName(file);

			File f1 = mReq.getFile(file);
			if (f1 == null) { // 업로드 실패 시
				System.out.println("파일 업로드 실패");
			} else { // 업로드 성공 시
				System.out.println("파일 업로드 성공");
			}
			fileNames += fileName + ",";// 다중 파일들을 db에 넣을 때 뒤에 쉼표를 찍어서 넣는다.
		}

		if (!fileNames.equals("")) {
			System.out.println("fileNames: " + fileNames);
			vo.setSfilepath(fileNames);
		} // 초기화
		if (fileNames.length() > 1800) {
			System.out.println("DBfilename 크기보다 큽니다.");
		}

		Member me = (Member) request.getSession().getAttribute("loginMember");
		String swriter = me.getNickname();

		String ssubject = mReq.getParameter("ssubject");
		String scontent = mReq.getParameter("scontent");
		int sno = Integer.parseInt(mReq.getParameter("sno"));

		vo.setSsubject(ssubject);
		vo.setScontent(scontent);
		vo.setSwriter(swriter);
		vo.setSno(sno);

		int result = 0;
		try {
			result = new StudyService().studyUpdate(vo);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.print("<script>alert('글 수정 성공!')</script>");
			out.print("<script>location.href = './studylist';</script>");
		} else {
			out.print("<script>alert('글 수정 실패...')</script>");
			out.print("<script>location.href = './studylist';</script>");

		}
	}
}