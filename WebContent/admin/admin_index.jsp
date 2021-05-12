<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 첫 페이지</title>
</head>
<body>
	<h1>관리자 페이지입니다</h1>
	<c:if test="${loginMember != null }">
		<p style="font-size: 20px; color: brown">관리자님이 로그인 상태입니다. 아이디 :
			${loginMember.id }</p>
		<button type="button"
			onclick="location.href='<%=request.getContextPath()%>/memberlogout'">로그아웃</button>
		<button type="button" onclick="location.href='<%=request.getContextPath()%>/memberlist'">회원
			리스트로 이동</button>
	</c:if>
<%@include file="../view/footer.jsp" %></section>
</html>