package shop.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.VO.VideoVO;
import shop.service.Videoservice;

/**
 * Servlet implementation class videoIntro
 */
@WebServlet("/videoIntro")
public class VideoIntro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoIntro() {
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
		String vkind = request.getParameter("vkind");
		
		List<VideoVO> videoList = null;
		
		try {
			videoList = new Videoservice().getVideoList(vkind);
			
			if(videoList != null) {
				System.out.println("리스트 있음");
			}else {
				System.out.println("리스트 없음");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("videolist", videoList);
		request.setAttribute("vkind", vkind);
		request.getRequestDispatcher("./shop/videoIntro.jsp").forward(request, response);;
		
	}

}
