<%@page import="member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@include file="../view/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 장바구니 수정</title>
</head>
<body class="content">
	<%
		Member vo = (Member) request.getSession().getAttribute("loginMember");
	
		if (session.getAttribute("loginMember") == null) {
			response.sendRedirect("#");
		} else {	
	%>
	 <form method="post" action="<%=request.getContextPath() %>/bookupdateCart">
	 	변경할 수량 : 
	 	<input type="text" name="buycount" size="5" value="${buycount }" placeholder="${buycount}">
	 	<input type="hidden" name="bcid" value="${bcid }">
	 	<input type="hidden" name="bkind" value="${bkind }">
	 	
	 	<input type="submit" value="변경하기">
	 </form>
	
</body>
</html>
<%
		}
%>
<%@include file="../view/footer.jsp"%>