package shop.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.qna.service.QnaService;
import board.qna.vo.Qna;
import shop.DAO.ShopvideoDAO;
import shop.VO.ShopBookVo;
import shop.VO.VideoVO;
import shop.service.Bookservice;
import shop.service.Videoservice;

/**
 * Servlet implementation class bookList
 */
@WebServlet("/videolist")
public class VideoList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoList() {
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

// 어딘지 모를 이전 페이지에서, 특정 버튼을 누르면 bkind를 받아온다 - 미구현
		String vkind = (String)request.getAttribute("vkind");
		if(vkind == null) {
			vkind = "100";
		}
		
		List<VideoVO> videoList = null;
		try {
			videoList = new Videoservice().getVideoList(vkind);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("videolist", videoList);
		request.setAttribute("vkind", vkind);
		request.getRequestDispatcher("./shop/videoList.jsp").forward(request, response);
		
		
	}

}
