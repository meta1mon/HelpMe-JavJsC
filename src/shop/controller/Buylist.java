package shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.vo.Member;
import shop.VO.BuyVO;
import shop.service.Buyservice;

/**
 * Servlet implementation class Buylist
 */
@WebServlet("/buylist")
public class Buylist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Buylist() {
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
	
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member vo = (Member) request.getSession().getAttribute("loginMember");
		String id = vo.getId();
		
		int count = 0;
		
		try {
			count = new Buyservice().getListCount(id);
			
			if(count>0) {
				System.out.println("구매목록 있음");
			}else {
				System.out.println("구매목록 없음");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List<BuyVO> buylist = null;
		
		try {
			buylist = new Buyservice().getBuyList_id(id);
	

			if(buylist != null) {
				System.out.println("구매목록있음");
			}else {
				System.out.println("구매목록 업승");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("buy", buylist);
		request.setAttribute("count", count);
		request.getRequestDispatcher("./shop/buyList.jsp").forward(request, response);
		
		
		
	
	}

}
