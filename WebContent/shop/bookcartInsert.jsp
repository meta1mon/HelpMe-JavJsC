<%@page import="bookshop.DAO.bookcartDAO"%>
<%@page import="bookshop.VO.bookcartVO"%>
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
		request.setCharacterEncoding("utf-8");
	%>

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
		bookcartVO bookcart = new bookcartVO();

	bookcart.setBid(Integer.parseInt(bid));
	bookcart.setBuycount(Integer.parseInt(buycount));
	bookcart.setId(id);

	bookcartDAO bookcartprocess = bookcartDAO.getInstance();
	bookcartprocess.insertBookCart(bookcart);

	response.sendRedirect("cartList.jsp?bkind=" + bkind);
	%>
</body>
</html>