package shop.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.vo.Member;
import shop.DAO.BookcartDAO;
import shop.VO.ShopBookVo;
import shop.service.Cartservice;

/**
 * Servlet implementation class bookupdateCart
 */
@WebServlet("/bookupdateCart")
public class BookupdateCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookupdateCart() {
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
		System.out.println("카트 책 수정 들어옴");
		String bcid = request.getParameter("bcid");
		String buycount = request.getParameter("buycount");
		String bkind = request.getParameter("bkind");
		
		
		int result = 0;
			
			try {
				result =  new Cartservice().updateBookCount(Integer.parseInt(bcid), Integer.parseInt(buycount));
				if(result > 0) {
					System.out.println("수정됨");
				}else {
					System.out.println("수정 안됨");
				}
			} catch (NumberFormatException e1) {
				e1.printStackTrace();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			request.getRequestDispatcher("cartlist").forward(request, response);
	}
//		request.setAttribute("bkind", bkind);

			}


