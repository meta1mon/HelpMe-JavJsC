<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두번째 페이지(배너 있는 부분)</title>
</head>
<body>
	첫화면에서 코딩공부 시작하기 버튼을 누르면 이동하는 두번째 페이지이자, 메인 화면입니다. 로그인 성공 시, 이 페이지로 이동할
	예정입니다. 디자인 막 바꾸셔도 됩니당
	<hr>
	<c:if test="${loginMember != null }">
		<p style="font-size: 20px; color: brown">로그인 상태입니다. 아이디 :
			${loginMember.id }</p>
		<button type="button" onclick="location.href='<%=request.getContextPath()%>/memberlogout'">로그아웃 버튼</button>
		<button type="button" onclick="location.href='index.jsp'">첫 페이지로 이동</button>
	</c:if>
	<c:if test="${loginMember == null }">
		<p style="font-size: 20px; color: pink">로그아웃 상태입니다.<p>
		<button type="button" onclick="location.href='member/login.jsp'">로그인으로 이동</button>
	</c:if>

</body>
</html>