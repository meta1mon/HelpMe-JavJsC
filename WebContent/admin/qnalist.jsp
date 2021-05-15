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
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 반응형 웹으로 설정 -->
<title>qna 리스트</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>


</head>
<body class="content">
<div style="width: 800px; margin: 0 auto 0 auto; color:#99ADB6;">

	<div class="qna">Q&A 게시판</div>	
	<form action="qnalist" method="get">
		<select id="searchType" name="searchType">
			<option value="1">글제목</option>
			<option value="2">작성자</option>
			<option value="3">글내용</option>
		</select>
		<input type='search' id="search" name="search" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp질문을 검색하세요.">
	<button type=submit id="btnsearch">검색</button>
	</form>
	
	<table id="table">
		<c:forEach items="${qlist }" var='q'>
			<tr>
				<td style="width:50px; font-size:14px;"><a style="font-size:18px;">${q.qviewcnt }</a><br>조회</td>
				<td style="width:50px; font-size:14px;"><a style="font-size:18px;">${q.qlikecnt }</a><br>좋아요</td>
				<td style="width:50px; font-size:14px;"><a style="font-size:18px;">${q.rqnacnt }</a><br>답변</td>
				<td style="text-align: left; width:500px;">
					<a href="qnaread?qno=${q.qno}" id="subject">${q.qsubject }</a> 
						<br> <div id="tag">
								<c:choose>
									<c:when test="${q.qtag ==1}">Java</c:when>
									<c:when test="${q.qtag ==2}">C</c:when>
									<c:when test="${q.qtag ==3}">Python</c:when>
								</c:choose>
								</div>
				</td>
				<td style="text-align: left;"><a style="color:#0054FF;">${q.qwriter }</a> <br> <a style="font-size:13px;">${q.qdate }</a></td>
			</tr>
		</c:forEach>
	</table>
	<div id="page">
	<c:if test="${startPage !=1 }">
		<a href="qnalist?pageNum=${startPage -1 }&search=${search }&searchType=${searchType}" style="text-decoration: none; color: #0054FF; margin: 5px;">&#60;&#60;</a>
	</c:if>

	<c:forEach begin="${startPage }" end="${endPage }" var="s" step="1">
		<a href="qnalist?pageNum=${s }&search=${search }&searchType=${searchType}" style="font-size:18px; text-decoration: none; color: #0054FF; margin: 5px;">${s }</a>
	</c:forEach>



	<c:if test="${endPage < pageBoxCnt }">
		<a href="qnalist?pageNum=${endPage +1 }&search=${search }&searchType=${searchType}" style="text-decoration: none; color: #99ADB6; margin: 5px;">&#62;&#62;</a>
	</c:if>
	</div>
</div>
</body>
</html>