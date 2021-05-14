package bookshop.controller;

import java.io.IOException;

import java.sql.Date;
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

import bookshop.DAO.ShopBookDAO;
import bookshop.DAO.ShopvideoDAO;
import bookshop.VO.VideoVO;
import bookshop.service.Videoservice;

/**
 * Servlet implementation class videoUpdate
 */
@WebServlet("/videoUpdate")
public class VideoUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoUpdate() {
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
		request.setCharacterEncoding("utf-8");
		System.out.println("서블릿 들어옴");
		
		String realFolder = "";// 웹 어플리케이션 상의 절대 경로
		String filename = "";
		MultipartRequest imageUp = null;
		System.out.println("들어옴 2");
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
		
		VideoVO video = new VideoVO();
		
		String vid = imageUp.getParameter("vid");
		String vkind = imageUp.getParameter("vkind");
		String vtitle = imageUp.getParameter("vtitle");
		String vprice = imageUp.getParameter("vprice");
		String discountRate = imageUp.getParameter("discountRate");
		String vsize = imageUp.getParameter("vsize");
		String startDate = imageUp.getParameter("startDate");
		String endDate = imageUp.getParameter("endDate");
		
		video.getVid();
		video.setVkind(vkind);
		video.setVtitle(vtitle);
		video.setVprice(Integer.parseInt(vprice));
		video.setDiscountRate(Integer.parseInt(discountRate));
		video.setVsize(vsize);
		video.setStartDate(Date.valueOf(startDate));
		video.setEndDate(Date.valueOf(endDate));
		video.setRegdate(new Timestamp(System.currentTimeMillis()));
		
		Videoservice sv = new Videoservice();
	try {
		sv.updateVideo(video, vid);
	}catch (Exception e) {
		e.printStackTrace();
	}
	response.sendRedirect("./shop/videoList.jsp?vkind=" + vkind);
	}

}
