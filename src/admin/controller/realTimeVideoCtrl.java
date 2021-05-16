package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.service.BuyCountService;

/**
 * Servlet implementation class realTimeVideoCtrl
 */
@WebServlet("/realvideo")
public class realTimeVideoCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public realTimeVideoCtrl() {
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
	
	private void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

// 지금은 비디오가 9개 뿐이라 9로 설정함
		String pid = "v";
		String[] pidArr = new String[9];
		for (int i = 0; i < pidArr.length; i++) {
			if (i < 9) {
				pid += "0000" + (i + 1);
			} else if (i < 99) {
				pid += "000" + (i + 1);
			}
			pidArr[i] = pid;
			pid = "v";
		}

// 지금은 비디오가 9개 뿐이라 9로 설정함
		int[] vCntArr = new int[9];
		try {
			for (int i = 0; i < vCntArr.length; i++) {
				vCntArr[i] = new BuyCountService().getBuyVideoCount(pidArr[i]);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		for (int i = 0; i < vCntArr.length; i++) {
			System.out.println(vCntArr[i]);
		}
		request.setAttribute("pidArr", pidArr);
		request.setAttribute("vCnt", vCntArr);
		request.getRequestDispatcher("admin/realtimeVideo.jsp").forward(request, response);

	}

}
