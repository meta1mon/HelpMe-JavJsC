package shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.MemberService;
import member.vo.Member;
import shop.VO.BookcartVO;
import shop.VO.VideocartVO;
import shop.service.Buyservice;
import shop.service.Cartservice;

/**
 * Servlet implementation class buyForm
 */
@WebServlet("/buyForm")
public class BuyForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyForm() {
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
		System.out.println("구매 폼 들어옴");
		Member vo = (Member) request.getSession().getAttribute("loginMember");
		String id = vo.getId();
		//은행 
		List<String> list = null;
		
		try {
			list = new Buyservice().getAccount();
			if(list != null) {
				System.out.println("은행계좌 있음");
			}else {
				System.out.println("은행계좌없음");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//책 장바구니
	   List<BookcartVO> booklist = null;
	   
	   try {
		booklist = new Cartservice().getBookCart(id);
		
		if(booklist != null) {
			System.out.println("책 장바구니 있음");
		}else {
			System.out.println("없음");
		}
	   
	   } catch (Exception e) {
		e.printStackTrace();
	}
	   
	   // 영상 장바구니 
	   
	   List<VideocartVO> vlist = null;
	   
	   try {
		vlist = new Cartservice().getVideoCart(id);
		
		if(vlist != null) {
			System.out.println("영상 카트 있음");
		}else {
			System.out.println("영상 카트 없음");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	   
	 //회원 정보 
	  Member member = null;
	  
	  
	  try {
	  member = new MemberService().login(id);
	  
	  if(member != null ) {
		  System.out.println("회원 있음");
	  }else {
		  System.out.println("회원 없음 ");
	  }
	  
	  }catch (Exception e) {
	} 
	   
		
		request.setAttribute("account", list);
		request.setAttribute("book", booklist);
		request.setAttribute("video", vlist);
		request.setAttribute("member", member);
		String url = "./shop/buyForm.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
