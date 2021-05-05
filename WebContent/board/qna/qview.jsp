<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.qna.dao.QnaDao" %> <!-- write.jsp 일부 수정해 만듦 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 반응형 웹으로 설정 -->
<!-- CSS(부트스트랩 사용) -->
<title>JSP 게시판 웹 사이트</title>
	<!-- CSS(부트스트랩 사용) -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/27.1.0/classic/ckeditor.js"></script>
	<style>
	<%@include file="../../style/common.css" %>
	<%@include file="../../style/header.css" %>
	<%@include file="../../style/footer.css"%>
</style>
</head>
<%@include file="../../view/header.jsp"%>
<body class="content">
	<table style="text-align: center; border: 1px solid #dddddd">
			<tr>
				<td colspan="2"
					style="background-color: #eeeeee; text-align: center;">글 제목</td>
			</tr>
			<tr>
				<td>조회수<br>태그</td>
				<td><button type="button">버튼1</button><button type="button">버튼1</button></td>
			</tr>
			<tr>
				<td>조회수<br>태그</td>
				<td><button type="button">버튼1</button><button type="button">버튼1</button></td>
			</tr>
			<tr>
				<td>조회수<br>태그</td>
				<td><button type="button">버튼1</button><button type="button">버튼1</button></td>
			</tr>

	</table>
	<a href="bbs.jsp">목록</a>
</body>
<%@include file="../../view/footer.jsp"%>
</html>