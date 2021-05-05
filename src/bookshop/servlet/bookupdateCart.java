package bookshop.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bookshop.DAO.cartDAO;
import bookshop.VO.cartVO;
import bookshop.VO.shopBookVo;
import member.vo.Member;

/**
 * Servlet implementation class bookupdateCart
 */
@WebServlet("/bookupdateCart")
public class bookupdateCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookupdateCart() {
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
		String cid = request.getParameter("cid");
		String buyCount = request.getParameter("buyCount");
		String bkind = request.getParameter("bkind");
		String vkind = request.getParameter("vkind");

		shopBookVo book = new shopBookVo();
		book.setBkind(bkind);
		
		
		HttpSession session = request.getSession();
		Member vo = (Member) request.getSession().getAttribute("loginMember");	
		if(session.getAttribute("loginMember")==null) {
			response.sendRedirect("#");
			System.out.println("널 ");
		}else {
		
			cartDAO bookprocess = cartDAO.getInstance();
				try {
					bookprocess.updateCount(Integer.parseInt(cid), Integer.parseInt(buyCount));
				} catch (Exception e) {
					e.printStackTrace();
				}
				response.sendRedirect("./shop/cartList.jsp?bkind="+bkind+"&vkind="+vkind);
				System.out.println(bkind);
				System.out.println(vkind);
				System.out.println(vo.getId());
	}

			}
}

