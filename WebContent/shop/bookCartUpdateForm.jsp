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
		String cid = request.getParameter("cid");
		String buyCount = request.getParameter("buyCount");
		String bkind = request.getParameter("bkind");
	
		Member vo = (Member) request.getSession().getAttribute("loginMember");
		if (session.getAttribute("loginMember") == null) {
			response.sendRedirect("#");
		} else {	
	%>
	 <form method="post" action="<%=request.getContextPath() %>/bookupdateCart">
	 	변경할 수량 : 
	 	<input type="text" name="buyCount" size="5" value="<%=buyCount %>">
	 	<input type="hidden" name="cid" value="<%=cid %>">
	 	<input type="hidden" name="bkind" value="<%=bkind %>">
	 	<input type="hidden" name="vkind" value="0">
	 	<input type="submit" value="변경하기">
	 </form>
	
</body>
</html>
<%
		}
%>