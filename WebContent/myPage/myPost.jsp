<%@page import="member.vo.Member"%>
<%@page import="board.qna.dao.QnaDao"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JSP 게시판 웹 사이트</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

</head>
<%@include file="../../view/header.jsp"%>
<body class="content">
	<form action="<%=request.getContextPath() %>/mypost" method="get">
		<select name="searchType">
			<option value="2" selected>작성자</option>
		</select>
		<input type='search' name="search">
		<button type=submit>검색</button>
	</form>


	<table style="text-align: center; border: 1px solid #dddddd">
		<tr>
			<th style="background-color: #eeeeee; text-align: center;">번호</th>
			<th style="background-color: #eeeeee; text-align: center;">조회수</th>
			<th style="background-color: #eeeeee; text-align: center;">추천수</th>
			<th style="background-color: #eeeeee; text-align: center;">댓글 수</th>
			<th style="background-color: #eeeeee; text-align: center;">카테고리</th>
			<th style="background-color: #eeeeee; text-align: center;">제목</th>
			<th style="background-color: #eeeeee; text-align: center;">작성자</th>
			<th style="background-color: #eeeeee; text-align: center;">작성일</th>
		</tr>
		<c:forEach items="${qlist }" var='q'>
			<tr>
				<td>${q.qno }</td>
				<td>${q.qviewcnt }</td>
				<td>${q.qlikecnt }</td>
				<td>${q.rqnacnt }</td>
				<td>
				<c:choose>
					<c:when test="${q.qtag ==1}">Java</c:when>
					<c:when test="${q.qtag ==2}">C</c:when>
					<c:when test="${q.qtag ==3}">Python</c:when>
				</c:choose>
				</td>
				<td><a href="qnaread?qno=${q.qno}">${q.qsubject }</a></td>
				<td>${q.qwriter }</td>
				<td>${q.qdate }</td>
			</tr>
		</c:forEach>
		<tr>
		</tr>
	</table>
	<div id="page">
	<c:if test="${startPage !=1 }">
		<a href="qnalist?pageNum=${startPage -1 }&search=${loginMember.nickname }&searchType=2">&#60;&#60;</a>
	</c:if>

	<c:forEach begin="${startPage }" end="${endPage }" var="s" step="1">
		<a href="qnalist?pageNum=${s }&search=${loginMember.nickname }&searchType=2">${s }</a>
	</c:forEach>



	<c:if test="${endPage < pageBoxCnt }">
		<a href="qnalist?pageNum=${endPage +1 }&search=${loginMember.nickname }&searchType=2">&#62;&#62;</a>
	</c:if>
	</div>

</body>
<%@include file="../../view/footer.jsp"%>
</html>