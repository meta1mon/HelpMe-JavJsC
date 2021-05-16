package shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.DAO.ShopvideoDAO;
import shop.service.Videoservice;


/**
 * Servlet implementation class videodelete
 */
@WebServlet("/videodelete")
public class Videodelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Videodelete() {
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
		System.out.println("영상 딜리트 들어옴");
		String vid = request.getParameter("vid");
		String vkind = request.getParameter("vkind");
		System.out.println(vkind);
			
		int result = 0;
		try {
			result = new Videoservice().deleteVideo(vid);
			
			if(result > 0) {
				System.out.println("삭제완료");
			}else {
				System.out.println("삭제실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		request.setAttribute("vkind", vkind);
		request.getRequestDispatcher("videolist").forward(request, response);
	
	}
		
	}


