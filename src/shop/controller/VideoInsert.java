package shop.controller;

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

import shop.DAO.ShopBookDAO;
import shop.DAO.ShopvideoDAO;
import shop.VO.ShopBookVo;
import shop.VO.VideoVO;
import shop.service.Videoservice;

/**
 * Servlet implementation class VideoInsert
 */
@WebServlet("/VideoInsert")
public class VideoInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoInsert() {
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
		
		VideoVO video = new VideoVO();
		String vid = imageUp.getParameter("vid");
		String vkind = imageUp.getParameter("vkind");
		String vtitle = imageUp.getParameter("vtitle");
		String vprice = imageUp.getParameter("vprice");
		String discountRate = imageUp.getParameter("discountRate");
		String startDate = imageUp.getParameter("startDate");
		String endDate = imageUp.getParameter("endDate");
		String vsize = imageUp.getParameter("vsize");
		System.out.println(startDate);
		System.out.println(endDate);
		
		video.setVid(vid);
		video.setVkind(vkind);
		video.setVtitle(vtitle);
		video.setVprice(Integer.parseInt(vprice));
		video.setDiscountRate(Integer.parseInt(discountRate));
		video.setStartDate(Date.valueOf(startDate));
		video.setEndDate(Date.valueOf(endDate));
		video.setVimage(filename);
		video.setVsize(vsize);
		video.setRegdate(new Timestamp(System.currentTimeMillis()));
				
		Videoservice sv = new Videoservice();
		try {
			sv.insertVideo(video);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("완료");
		response.sendRedirect("./shop/videoList.jsp?vkind=" + vkind);
		
		
		
		
		
		
	}
	
	}

