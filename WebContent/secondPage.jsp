<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
.ink {
	box-sizing:border-box;	
	border-radius: 5px;
	width: 250;
	height: 240;
	background-color: black;
	color: white;
	text-align: center;
}
.banner {
	box-sizing:border-box;	
	border-radius: 5px;
	width: 800;
	height: 500;
	background-color: black;
	color: white;
	text-align: center;
}

a{
	text-decoration: none;
	color:white;
}

a:visited {
	color:white;
}

</style>
</head>
<%@include file="../view/header.jsp"%>
<body class="content">
	<div
		style="width: 800px; text-align: center; margin-left: auto; margin-right: auto;">
		<table>
			<tr>
				<td colspan="3" class="banner">배너이미지</td>
			</tr>
			<tr>
				<td class="ink"><a href="<%=request.getContextPath()%>/qnalist">질문방</a></td>
				<td class="ink"><a href="#">스터디방</a></td>
				<td class="ink"><a href="#">리뷰방</a></td>
			</tr>
			<tr>
				<td class="ink"><a href="#">쇼핑</a></td>
				<td class="ink"><a href="<%=request.getContextPath()%>/calendar/main.jsp">공채캘린더</a></td>
				<td class="ink"><a href="#">About us</a></td>
			</tr>
		</table>
	</div>
</body>
<%@include file="../view/footer.jsp"%>