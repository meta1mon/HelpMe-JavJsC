package shop.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.vo.Member;
import shop.DAO.ShopvideoDAO;
import shop.VO.VideocartVO;
import shop.service.Cartservice;

/**
 * Servlet implementation class videocartInsert
 */
@WebServlet("/videocartInsert")
public class videocartInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public videocartInsert() {
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
		Member vo = (Member) request.getSession().getAttribute("loginMember");
		String vkind = request.getParameter("vkind");
		String	vid = request.getParameter("vid");
		String buycount = request.getParameter("buycount");
		String id = vo.getId();
		
		VideocartVO videocart = new VideocartVO();

		videocart.setVid(vid);
		videocart.setBuycount(Integer.parseInt(buycount));
		videocart.setId(id);
		
		int result1 = 0;
		
		try {
			result1 = new Cartservice().insertVideoCart(videocart);
			
			if(result1 > 0) {
				System.out.println("장바구니 담김");
			}else{
			System.out.println("장바구니 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("video", result1);
		request.setAttribute("vkind", vkind);
		request.getRequestDispatcher("cartlist").forward(request, response);
		
	}

}
