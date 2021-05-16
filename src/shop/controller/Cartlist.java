package shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.vo.Member;
import shop.VO.BookcartVO;
import shop.VO.VideocartVO;
import shop.service.Cartservice;

/**
 * Servlet implementation class cartlist
 */
@WebServlet("/cartlist")
public class Cartlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cartlist() {
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
		String bkind = request.getParameter("bkind");
		String vkind = request.getParameter("vkind");
		String id = vo.getId();
		
		List<BookcartVO> list = null;
		List<VideocartVO> vlist = null;
		
		int result = 0;
		int result1 = 0;
		
		try {
			list = new Cartservice().getBookCart(id);
			result = new Cartservice().getBookListCount(id);
			
			if(list != null) {
				System.out.println("카트리스트 있음");
			}else {
				System.out.println("없음");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		try {
			vlist = new Cartservice().getVideoCart(id);
			result1 = new Cartservice().getVideoListCount(id);
			if(vlist != null) {
				System.out.println("비디오카트리스트 있음");
			}else {
				System.out.println("없음");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("bookcart", list);
		request.setAttribute("id", id);
		request.setAttribute("count", result);
		
		request.setAttribute("videocart", vlist);
		request.setAttribute("count", result1);
		
		request.getRequestDispatcher("./shop/cartList.jsp").forward(request, response);
	
	
	}
		

}
