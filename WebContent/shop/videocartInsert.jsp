<%@page import="bookshop.VO.VideocartVO"%>
<%@page import="bookshop.DAO.VideocartDAO"%>
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
		VideocartVO videocart = new VideocartVO();

			videocart.setVid(vid);
			videocart.setBuycount(Integer.parseInt(buycount));
			videocart.setId(id);

			VideocartDAO videocartprocess = VideocartDAO.getInstance();
			videocartprocess.insertVideoCart(videocart);

			response.sendRedirect("cartList.jsp?vkind=" + vkind);
	%>
		
</body>
</html>