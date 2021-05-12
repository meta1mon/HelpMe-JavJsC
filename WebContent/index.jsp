<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
<%@include file="style/index.css" %>
</style>
<meta charset="UTF-8">
</head>
<%@include file="../view/header.jsp"%>
<body class="content">
	<div class="index-content">
		<img alt="메인 이미지 입니다."
			src="http://ipsumimage.appspot.com/500x500?l=멋진 이미지" id="mainImg"><br>
		<button onclick="location.href='secondPage.jsp'" class="start">코딩공부
			시작하기</button>
	</div>
</body>
<%@include file="../view/footer.jsp"%>

</html>
