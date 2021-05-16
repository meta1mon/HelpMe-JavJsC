package admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.BuyCountService;

/**
 * Servlet implementation class top5BookSellCtrl
 */
@WebServlet("/top5book")
public class top5BookSellCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public top5BookSellCtrl() {
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

		// 상위 다섯 개 책, 판매순으로 나옴
		String[][] arr = null;
		try {
			arr = new BuyCountService().getTop5Book();
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		request.setAttribute("blist", arr);
		request.getRequestDispatcher("admin/top5BookSell.jsp").forward(request, response);
	}
}
