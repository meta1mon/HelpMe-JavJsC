package shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.VO.ShopBookVo;
import shop.VO.VideoVO;
import shop.service.Bookservice;

/**
 * Servlet implementation class ShopIntro
 */
@WebServlet("/shopmain")
public class ShopMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopMain() {
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
		String bkind1 = "100";
		String bkind2 = "200";
		String bkind3 = "300";
		
		String vkind1 =	"100";
		String vkind2 =	"200";
		String vkind3 = "300";
					
		request.setAttribute("bkind1", bkind1);
		request.setAttribute("bkind2", bkind2);
		request.setAttribute("bkind3", bkind3);
		request.setAttribute("vkind1", vkind1);
		request.setAttribute("vkind2", vkind2);
		request.setAttribute("vkind3", vkind3);
		
		request.getRequestDispatcher("./shop/shopIntro.jsp").forward(request, response);
}
}