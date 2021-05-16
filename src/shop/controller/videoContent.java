package shop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.VO.VideoVO;
import shop.service.Videoservice;

/**
 * Servlet implementation class videoContent
 */
@WebServlet("/videoContent")
public class videoContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public videoContent() {
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
		String vid = request.getParameter("vid");
		String vkind = request.getParameter("vkind");
		
		VideoVO videoList = null;
		
		try {
			videoList = new Videoservice().getVideo(vid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("v", videoList);
		request.setAttribute("vkind", vkind);
		request.getRequestDispatcher("./shop/videoContent.jsp").forward(request, response);
	}
}
