<%@page import="member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 장바구니 수정</title>
</head>
<body>
	<%
		Member vo = (Member) request.getSession().getAttribute("loginMember");
		String bcid = request.getParameter("bcid");
		String buycount = request.getParameter("buycount");
		String bkind = request.getParameter("bkind");
	
		if (session.getAttribute("loginMember") == null) {
			response.sendRedirect("#");
		} else {	
	%>
	 <form method="post" action="<%=request.getContextPath() %>/bookupdateCart">
	 	변경할 수량 : 
	 	<input type="text" name="buycount" size="5" value="<%=buycount %>">
	 	<input type="hidden" name="bcid" value="<%=bcid %>">
	 	<input type="hidden" name="bkind" value="<%=bkind %>">
	 	<input type="submit" value="변경하기">
	 </form>
	
<%@include file="../view/footer.jsp" %></section>
</html>
<%
		}
%>