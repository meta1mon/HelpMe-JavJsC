<%@page import="bookshop.DAO.BookcartDAO"%>
<%@page import="bookshop.VO.BookcartVO"%>
<%@page import="member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		System.out.println("bookcart 들어옴");
			Member vo = (Member) request.getSession().getAttribute("loginMember");
			String bkind = request.getParameter("bkind");
			String bid = request.getParameter("bid");
			String buycount = request.getParameter("buycount");
			String id = vo.getId();
			String bprice = request.getParameter("bprice");
	%>

	<%
		BookcartVO bookcart = new BookcartVO();

			bookcart.setBid(bid);
			bookcart.setBuycount(Integer.parseInt(buycount));
			bookcart.setId(id);

			BookcartDAO bookcartprocess = BookcartDAO.getInstance();
			bookcartprocess.insertBookCart(bookcart);

			response.sendRedirect("cartList.jsp?bkind=" + bkind);
	%>
</body>
</html>