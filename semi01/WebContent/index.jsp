<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>제승하님이 만들어주시기 전까지 사용할 첫 화면 입니다</h1>
	<c:if test="${loginMember == null }">
		<button type="button" onclick="location.href='member/login.jsp'">로그인으로
			이동</button>
	</c:if>
	<button type="button" onclick="location.href='member/signup.jsp'">회원가입으로
		이동</button>
	<button type="button" onclick="location.href='secondPage.jsp'">로그인
		상태 확인 페이지로 이동</button>
</body>
</html>