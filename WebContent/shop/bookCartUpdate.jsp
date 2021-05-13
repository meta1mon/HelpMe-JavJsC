<%@page import="bookshop.service.Cartservice"%>
<%@page import="bookshop.DAO.BookcartDAO"%>
<%@page import="member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
		System.out.println("카트 책 수정 들어옴");
		String cid = request.getParameter("cid");
		String buyCount = request.getParameter("buyCount");
		String bkind = request.getParameter("bkind");
		String vkind = request.getParameter("vkind");
		System.out.println(vkind);
		System.out.println(bkind);
			
		Cartservice sv = new Cartservice();
		sv.updateBookCount(Integer.parseInt(cid), Integer.parseInt(buyCount));
		System.out.println(cid);
		System.out.println(buyCount);
		response.sendRedirect("cartList.jsp?bkind="+bkind+"&vkind="+vkind);
		System.out.println("ddd");
	%>
</body>
</html>