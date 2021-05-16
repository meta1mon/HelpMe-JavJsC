package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.BuyCountService;

/**
 * Servlet implementation class realTimeBookCtrl
 */
@WebServlet("/realbook")
public class realTimeBookCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public realTimeBookCtrl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
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

// 지금은 책이 15개 뿐이라 15로 설정함
		String pid = "b";
		String[] pidArr = new String[15];
		for (int i = 0; i < pidArr.length; i++) {
			if (i < 9) {
				pid += "0000" + (i + 1);
			} else if (i < 99) {
				pid += "000" + (i + 1);
			}
			pidArr[i] = pid;
			pid = "b";
		}

// 지금은 책이 15개 뿐이라 15로 설정함
		int[] bCntArr = new int[15];
		try {
			for (int i = 0; i < bCntArr.length; i++) {
				bCntArr[i] = new BuyCountService().getBuyBookCount(pidArr[i]);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("pidArr", pidArr);
		request.setAttribute("bCnt", bCntArr);
		request.getRequestDispatcher("admin/realtimeBook.jsp").forward(request, response);

	}
}
