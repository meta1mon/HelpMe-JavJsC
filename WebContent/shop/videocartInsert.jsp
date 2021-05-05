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
	<% request.setCharacterEncoding("utf-8"); %>
		
		<% 
		System.out.println("vcart 들어옴");
		Member vo = (Member) request.getSession().getAttribute("loginMember");
		String buyCount = request.getParameter("buyCount");
		String vBuyPrice = request.getParameter("vBuyPrice");
		String buyPrice = request.getParameter("buyPrice");
		String buyer = vo.getId();
		String vid = request.getParameter("vid");
		String vtitle = request.getParameter("vtitle");
		String vimage = request.getParameter("vimage");
		String vkind = request.getParameter("vkind");
		String bkind = request.getParameter("bkind");
		%>
	
		<% 
		cartVO cart = new cartVO();
		
		cart.setBuyCount(Integer.parseInt(buyCount));
		cart.setvBuyPrice(Integer.parseInt(vBuyPrice));
		cart.setBuyer(buyer);
		cart.setVid(Integer.parseInt(vid));
		cart.setVimage(vimage);
		cart.setVtitle(vtitle);
		cart.setBuyPrice(Integer.parseInt(buyPrice));
		
		
		

	
			cartDAO cartprocess = cartDAO.getInstance();
			cartprocess.insertCart(cart);
		
			
        response.sendRedirect("cartList.jsp?vkind="+vkind + "&bkind="+bkind);
		
		%>
		
</body>
</html>