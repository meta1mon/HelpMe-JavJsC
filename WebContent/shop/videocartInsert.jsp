<%@page import="bookshop.VO.videocartVO"%>
<%@page import="bookshop.DAO.videocartDAO"%>
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
	String vkind = request.getParameter("vkind");
	String	vid = request.getParameter("vid");
	String buycount = request.getParameter("buycount");
	String id = vo.getId();
	%>

	<%
		videocartVO videocart = new videocartVO();

	videocart.setVid(vid);
	videocart.setBuycount(Integer.parseInt(buycount));
	videocart.setId(id);

	videocartDAO videocartprocess = videocartDAO.getInstance();
	videocartprocess.insertVideoCart(videocart);

	response.sendRedirect("cartList.jsp?vkind=" + vkind);
	%>
		
</body>
</html>