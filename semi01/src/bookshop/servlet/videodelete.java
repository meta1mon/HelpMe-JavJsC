package bookshop.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bookshop.DAO.shopvideoDAO;


/**
 * Servlet implementation class videodelete
 */
@WebServlet("/videodelete")
public class videodelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public videodelete() {
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
		System.out.println("영상 딜리트 들어옴");
		
		int vid = Integer.parseInt(request.getParameter("vid"));
		String vkind = request.getParameter("vkind");
		System.out.println(vid);
		System.out.println(vkind);
			
		
		try {
			shopvideoDAO video = shopvideoDAO.getinstance();
			video.deleteVideo(vid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("./shop/videoList.jsp?vkind="+vkind);
	
	}
		
	}

