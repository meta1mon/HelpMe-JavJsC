<%@page import="member.vo.Member"%>
<%@page import="bookshop.VO.cartVO"%>
<%@page import="bookshop.DAO.cartDAO"%>
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
		System.out.println("cart 들어옴");
	Member vo = (Member) request.getSession().getAttribute("loginMember");
	String bkind = request.getParameter("bkind");
	String bid = request.getParameter("bid");
	String btitle = request.getParameter("btitle");
	String bimage = request.getParameter("bimage");
	String buyCount = request.getParameter("buyCount");
	String buyPrice = request.getParameter("buyPrice");
	String vkind = request.getParameter("vkind");
	String vBuyPrice = request.getParameter("vBuyPrice");
	String buyer = vo.getId();
	%>

	<%
		cartVO cart = new cartVO();

	cart.setBid(Integer.parseInt(bid));
	cart.setBimage(bimage);
	cart.setBtitle(btitle);
	cart.setBuyCount(Integer.parseInt(buyCount));
	cart.setBuyPrice(Integer.parseInt(buyPrice));
	cart.setvBuyPrice(Integer.parseInt(vBuyPrice));
	cart.setBuyer(buyer);

	cartDAO cartprocess = cartDAO.getInstance();
	cartprocess.insertCart(cart);

	response.sendRedirect("cartList.jsp?bkind=" + bkind +"&vkind="+vkind);
	%>

</body>
</html>