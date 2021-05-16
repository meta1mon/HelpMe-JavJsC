package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.BuyCountService;

/**
 * Servlet implementation class top5VideoSellCtrl
 */
@WebServlet("/top5video")
public class top5VideoSellCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public top5VideoSellCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	private void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 상위 다섯 개 영상, 판매순으로 나옴
		String[][] arr = null;
		try {
			arr = new BuyCountService().getTop5Video();
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		request.setAttribute("vlist", arr);
		request.getRequestDispatcher("admin/top5VideoSell.jsp").forward(request, response);
	}
}
