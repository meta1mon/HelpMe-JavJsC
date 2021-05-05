<%@page import="bookshop.DAO.videocartDAO"%>
<%@page import="bookshop.DAO.videocartVO"%>
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
		System.out.println("bookcart 들어옴");
	Member vo = (Member) request.getSession().getAttribute("loginMember");
	String vkind = request.getParameter("vkind");
	String	vid = request.getParameter("vid");
	String vtitle = request.getParameter("vtitle");
	String vimage = request.getParameter("vimage");
	String buycount = request.getParameter("buycount");
	String buyprice = request.getParameter("buyprice");
	String buyer = vo.getId();
	%>

	<%
		videocartVO videocart = new videocartVO();

	videocart.setVid(vid);
	videocart.setVimage(vimage);
	videocart.setVtitle(vtitle);
	videocart.setBuycount(Integer.parseInt(buycount));
	videocart.setBuyprice(Integer.parseInt(buyprice));
	videocart.setBuyer(buyer);

	videocartDAO videocartprocess = videocartDAO.getInstance();
	videocartprocess.insertVideoCart(videocart);

	response.sendRedirect("cartList.jsp?vkind=" + vkind);
	%>
		
</body>
</html>