package shop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import shop.DAO.ShopBookDAO;
import shop.VO.ShopBookVo;
import shop.service.Bookservice;

/**
 * Servlet implementation class bookRegister
 */
@WebServlet("/bookregister")
public class BookRegisterCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookRegisterCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String realFolder = "";// 웹 어플리케이션 상의 절대 경로
		String filename = "";
		MultipartRequest imageUp = null;
		
		String saveFolder = "/imageFile";// 파일 업로드 되는 폴더
		String encType = "utf-8"; //엔코딩타입
		int maxSize = 2*1024*1024; // 최대 업로드될 파일크기 5mb
		//현재 jsp 페이지의 웹 어플리케이션 상의 절대 경로 구함
		ServletContext context = getServletContext();
		realFolder = context.getRealPath(saveFolder);
		
		try {
			//전송을 담당할 콤포넌트를 생성 후 파일 전송
			//전송할 파일명을 가지고 있는 객체, 서버상의 절대경로, 최대 업로드 될 파일크기, 문자코드, 기본보안 적용
			imageUp = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
			
			//전송할 파일 정보 가져와 출력
			Enumeration<?> files = imageUp.getFileNames();
			
			//파일 정보가 있다면
			while(files.hasMoreElements()) {
				//input 태그의 속성이 file인 태그의 name 속성값 가져오기
				String name = (String) files.nextElement();
				
				//서버에 저장된 파일 이름
				filename = imageUp.getFilesystemName(name);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		ShopBookVo book = new ShopBookVo();
		
		String bid = imageUp.getParameter("bid");
		String bkind = imageUp.getParameter("bkind");
		String btitle = imageUp.getParameter("btitle");
		String bprice = imageUp.getParameter("bprice");
		String bcount = imageUp.getParameter("bcount");
		String author = imageUp.getParameter("author");
		String publishing_com = imageUp.getParameter("publishing_com");
		String discountRate = imageUp.getParameter("discountRate");
		
		book.setBid(bid);
		book.setBkind(bkind);
		book.setBtitle(btitle);
		book.setBprice(Integer.parseInt(bprice));
		book.setBcount(Integer.parseInt(bcount));
		book.setAuthor(author);
		book.setPublishing_com(publishing_com);
		book.setBimage(filename);
		book.setDiscountRate(Integer.parseInt(discountRate));
		book.setRegdate(new Timestamp(System.currentTimeMillis()));
		
		PrintWriter out = response.getWriter();
		int result = 0;
		try {
			result = new Bookservice().insertBook(book);
			if(result > 0) {
				System.out.println("책 등록 성공");
			} else {
				System.out.println("책 등록 실패");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
// 등록하고 어디로 넘어갈지는 추후 선택
		request.setAttribute("bkind", bkind);
		request.getRequestDispatcher("booklist").forward(request, response);
		
		
		
		
		
	}

}
