<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style></style>
<%@include file="../view/header.jsp"%>
<body class="content">
	<div>
		<form action="<%=request.getContextPath() %>/mypageenter" method="post">
			<h1>비밀번호 확인</h1>
			<input type="password" placeholder="비밀번호를 입력해주세요" id="password" name="password"><br>
			<button type="submit">비밀번호 확인하기</button>
		</form>
	</div>
</body>
<%@include file="../view/footer.jsp"%>