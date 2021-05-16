<%@page import="member.vo.Member"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 반응형 웹으로 설정 -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

</head>
<body class="content">
<div style="width: 800px; margin: 0 auto 0 auto; color:#aca4ae;">

	<div class="study">Study 게시판</div>
	<input id="write" type="button" value="새 글 쓰기" onclick="location.href = 'board/study/swrite.jsp'">
	
	<form action="studylist" method="get">
		<select id="searchType" name="searchType">
			<option value="1">글제목</option>
			<option value="2">작성자</option>
			<option value="3">글내용</option>
		</select>
		<input type='search' id="search" name="search" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp질문을 검색하세요.">
	<button type=submit id="btnsearch">검색</button>
	</form>
	
	<table id="table">
		<c:forEach items="${slist }" var='s'>
			<tr style="border-bottom: 1px solid #eeeeee;">
				<td style="width:50px; font-size:14px;"><a style="font-size:18px;">${s.sviewcnt }</a><br>조회</td>
				<td style="width:50px; font-size:14px;"><a style="font-size:18px;">${s.slikecnt }</a><br>좋아요</td>
				<td style="width:50px; font-size:14px;"><a style="font-size:18px;">${s.rstudycnt }</a><br>답변</td>
				<td style="text-align: left; width:500px;">
					<a href="studyread?sno=${s.sno}" id="subject">${s.ssubject }</a> 
						<br> 
								<c:choose>
									<c:when test="${s.stag ==1}">Java</c:when>
									<c:when test="${s.stag ==2}">C</c:when>
									<c:when test="${s.stag ==3}">Python</c:when>
								</c:choose>
				</td>
				<td style="text-align: left;"><a style="color:#0054FF;">${s.swriter }</a> <br> <a style="font-size:13px;">${s.sdate }</a></td>
			</tr>
		</c:forEach>
	</table>
	<div id="page">
	<c:if test="${startPage !=1 }">
		<a href="studylist?pageNum=${startPage -1 }&search=${search }&searchType=${searchType}">&#60;&#60;</a>
	</c:if>

	<c:forEach begin="${startPage }" end="${endPage }" var="p" step="1">
		<a href="studylist?pageNum=${s }&search=${search }&searchType=${searchType}">${p }</a>
	</c:forEach>



	<c:if test="${endPage < pageBoxCnt }">
		<a href="studylist?pageNum=${endPage +1 }&search=${search }&searchType=${searchType}">&#62;&#62;</a>
	</c:if>
	</div>
</div>
</body>
</html>