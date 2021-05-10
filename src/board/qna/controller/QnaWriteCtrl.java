package board.qna.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import board.qna.service.QnaService;
import board.qna.vo.Qna;
import member.vo.Member;

@MultipartConfig(
		fileSizeThreshold=1024*1024*10,	//10 MB / 업로드한 파일의 크기가 태그 값보다 크면 디렉토리에 임시 저장, 작다면 메모리에 파일 저장.
		maxFileSize=1024*1024*10,		//10 MB / 파일 1개당 최대 파일 크기
		maxRequestSize=1024*1024*50		//50 MB / 전체 요청의 크기
		)
@WebServlet("/qnawrite")
public class QnaWriteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public QnaWriteCtrl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	private void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
// 파일 첨부 기능
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		Collection<Part> parts = request.getParts();
		StringBuilder builder = new StringBuilder();
		System.out.println("parts:" + parts);
		for(Part p : parts) {
			if(!p.getName().equals("file")) continue;
			System.out.println("p.getName():" + p.getName());
			
			Part filePart = p;
			String fileName = filePart.getSubmittedFileName();
			System.out.println("fileName:"+ fileName);
			if(fileName==null || fileName.equals("")) 
				continue;
		
			builder.append(fileName);
			builder.append(",");		//다중 파일들을 db에 넣을 때 뒤에 쉼표를 찍어서 넣는다.
			
			InputStream fis = filePart.getInputStream();
			
			String saveDirectory = getServletContext().getRealPath("/board/files"); // 파일 저장 경로
			System.out.println(saveDirectory);
			
			File path = new File(saveDirectory);
			String root = getServletContext().getRealPath("/");
			if(!path.exists()) {
				path.mkdirs();
			}
			
			String filePath = saveDirectory + File.separator+ fileName;
			FileOutputStream fos = new FileOutputStream(filePath);
			
			byte[] buf = new byte[1024];
			int size = 0;
			while((size=fis.read(buf)) != -1)
				fos.write(buf,0,size);
				
			fos.close();   
			fis.close();
		}
		System.out.println("builder.length():" + builder.length());
		if(builder.length() > 0) {
			builder.delete(builder.length()-1,builder.length()); 
		}
		if(builder.length()> 1800) {
			System.out.println("DBfilename 크기보다 큽니다.");
		}
			
		Member me = (Member) request.getSession().getAttribute("loginMember");
		String qwriter = me.getNickname();

		Qna vo = new Qna();
		String qtag = request.getParameter("qtag");
		System.out.println(qtag + ": 태그 밸류");
		
		vo.setQsubject(request.getParameter("qsubject"));
		vo.setQcontent(request.getParameter("qcontent"));
		vo.setQtag(Integer.parseInt(qtag));
		vo.setQwriter(qwriter);
		vo.setQfilepath(builder.toString()); //build가 갖고있는 문자열을 세팅
		
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
