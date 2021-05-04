package bookshop.servlet;

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

import bookshop.DAO.shopBookDAO;
import bookshop.DAO.shopvideoDAO;
import bookshop.VO.videoVO;
import sun.awt.image.IntegerComponentRaster;

/**
 * Servlet implementation class videoUpdate
 */
@WebServlet("/videoUpdate")
public class videoUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public videoUpdate() {
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
		System.out.println("�꽌釉붾┸ �뱾�뼱�샂");
		
		String realFolder = "";// �쎒 �뼱�뵆由ъ��씠�뀡 �긽�쓽 �젅�� 寃쎈줈
		String filename = "";
		MultipartRequest imageUp = null;
		System.out.println("�뱾�뼱�샂 2");
		String saveFolder = "/imageFile";// �뙆�씪 �뾽濡쒕뱶 �릺�뒗 �뤃�뜑
		String encType = "utf-8"; //�뿏肄붾뵫���엯
		int maxSize = 2*1024*1024; // 理쒕� �뾽濡쒕뱶�맆 �뙆�씪�겕湲� 5mb
		//�쁽�옱 jsp �럹�씠吏��쓽 �쎒 �뼱�뵆由ъ��씠�뀡 �긽�쓽 �젅�� 寃쎈줈 援ы븿
		ServletContext context = getServletContext();
		realFolder = context.getRealPath(saveFolder);
		
		try {
			//�쟾�넚�쓣 �떞�떦�븷 肄ㅽ룷�꼳�듃瑜� �깮�꽦 �썑 �뙆�씪 �쟾�넚
			//�쟾�넚�븷 �뙆�씪紐낆쓣 媛�吏�怨� �엳�뒗 媛앹껜, �꽌踰꾩긽�쓽 �젅��寃쎈줈, 理쒕� �뾽濡쒕뱶 �맆 �뙆�씪�겕湲�, 臾몄옄肄붾뱶, 湲곕낯蹂댁븞 �쟻�슜
			imageUp = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
			
			//�쟾�넚�븷 �뙆�씪 �젙蹂� 媛��졇�� 異쒕젰
			Enumeration<?> files = imageUp.getFileNames();
			
			//�뙆�씪 �젙蹂닿� �엳�떎硫�
			while(files.hasMoreElements()) {
				//input �깭洹몄쓽 �냽�꽦�씠 file�씤 �깭洹몄쓽 name �냽�꽦媛� 媛��졇�삤湲�
				String name = (String) files.nextElement();
				
				//�꽌踰꾩뿉 ���옣�맂 �뙆�씪 �씠由�
				filename = imageUp.getFilesystemName(name);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		videoVO video = new videoVO();
		
		int vid =  Integer.parseInt(imageUp.getParameter("vid"));
		String vkind = imageUp.getParameter("vkind");
		String vtitle = imageUp.getParameter("vtitle");
		String vprice = imageUp.getParameter("vprice");
		String discountRate = imageUp.getParameter("discountRate");
		String vsize = imageUp.getParameter("vsize");
		String startDate = imageUp.getParameter("startDate");
		String endDate = imageUp.getParameter("endDate");
		
		video.setVid(vid);
		video.setVkind(vkind);
		video.setVtitle(vtitle);
		video.setVprice(Integer.parseInt(vprice));
		video.setDiscountRate(Integer.parseInt(discountRate));
		video.setVsize(vsize);
		video.setStartDate(Date.valueOf(startDate));
		video.setEndDate(Date.valueOf(endDate));
		video.setRegdate(new Timestamp(System.currentTimeMillis()));
		
		
	try {
		shopvideoDAO vprocess = shopvideoDAO.getinstance();
		vprocess.updateVideo(video, vid);
	}catch (Exception e) {
		e.printStackTrace();
	}
	response.sendRedirect("./shop/videoList.jsp?vkind=" + vkind);
	}

}
