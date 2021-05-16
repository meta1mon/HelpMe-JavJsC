package shop.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.VO.VideoVO;
import shop.service.Videoservice;

/**
 * Servlet implementation class videodeleteForm
 */
@WebServlet("/videodeleteForm")
public class VideodeleteForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideodeleteForm() {
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
		VideoVO vo = null;
		
		try {
			vo = new Videoservice().getVideo(vid);
			
			if( vo != null) {
				System.out.println("삭제할 영상 불러옴");
			}else {
				System.out.println("해당없음");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		request.setAttribute("video", vo);
		request.setAttribute("vkind", vkind);
		String url = "./shop/videoDeleteForm.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
