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
<title>JSP 게시판 웹 사이트</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<style>
	<%@include file="../../style/common.css" %>
	<%@include file="../../style/header.css" %>
	<%@include file="../../style/footer.css"%>

	.qna {
	margin : 40px 0 20px 10px;
	text-align:left;
	font-size:17px;
	}
	#searchType {
	width:80px;
	height:65px;
	border: none;
	font-size:18px;
	color:#aca4ae;
	margin:0;
	padding:0;
	}
	#searchType:hover {
	color:black;
	transition: color 0.15s ease-in-out;
	}
	
	#search {
	width: 590px;
	height:65px;
	top: 0;
	background-color: #efeff3;
	border: none;  
	font-size:18px;
	margin:0;
	padding:0;
	}
	#search:hover {
	color: black;
	background-color: #ffffff;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	box-shadow: 10px 10px 10px #eeeeee;
	}
	
	#write {
	width:100px;
	height:65px;
	background-color:#1abc9c;
	border:none;
	color:#ffffff;
	border-radius: 4px;
	float:right;
	font-size:18px;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	margin-left:10px;
	padding:0;
	}
	#write:hover {
	color:#2c3e50;
	background-color: #ffffff;
	box-shadow: 10px 10px 10px #eeeeee;
	
	}
	
	#table {
	clear:both;
	width:800px;
	margin-right:auto;
	margin-left:auto;
	height:2000px;
	}
	
	table > tr > td:first-child                {width:5%;} /*No 열 크기*/
	table > tr > td:first-child +td				{width:5%;} /*No 열 크기*/
	table > tr > td:first-child +td+td         {width:5%;} /*No 열 크기*/
	table > tr > td:first-child +td+td+td      {width:65%;} /*제목 열 크기*/
	table > tr > td:first-child +td+td+td+td   {width:20%;} /*작성일 열 크기*/
	
	#subject {
	color:#0054FF; 
	font-size:18px; 
	text-decoration:none;
	}
	
	#subject:hover {
	color:#0100FF;
	}

	#page {
	padding: 6px 12px;
    margin-left: -1px;
    color: #337ab7;
    text-decoration: none;
	}
</style>

</head>
<%@include file="../../view/header.jsp"%>
<body class="content">
<div style="width: 800px; margin: 0 auto 0 auto; color:#aca4ae;">

	<div class="qna">Q&A 게시판</div>
	<form action="qnalist" method="get">
		<select id="searchType" name="searchType">
			<option value="1">글제목</option>
			<option value="2">작성자</option>
			<option value="3">글내용</option>
		</select>
		<input type='search' id="search" placeholder="&nbsp;&nbsp;질문을 검색하세요.">
	<input id="write" type="button" value="새 글 쓰기" onclick="location.href = 'board/qna/qwrite.jsp'">
	<button type=submit style="display:none;">검색</button>
	</form>
	<i class="bi bi-search"></i>
	
<!-- 미구현!!!!!
     로그인 안했으면 경고창 띄우기!
	로그인 했으면 글쓰기로 이동!
-->	


	<table id="table" style="border:1;">
		<c:forEach items="${qlist }" var='q'>
			<tr style="border-bottom: 1px solid #eeeeee;">
				<td style="width:50px; font-size:14px;"><a style="font-size:18px;">${q.qviewcnt }</a><br>조회</td>
				<td style="width:50px;"><a style="font-size:18px;">${q.qlikecnt }</a><br>좋아요</td>
				<td style="width:50px;"><a style="font-size:18px;">${q.rqnacnt }</a><br>답변</td>
				<td style="text-align: left; width:450px;">
					<a href="qnaread?qno=${q.qno}" id="subject">${q.qsubject }</a> 
						<br> 
								<c:choose>
									<c:when test="${q.qtag ==1}">Java</c:when>
									<c:when test="${q.qtag ==2}">C</c:when>
									<c:when test="${q.qtag ==3}">Python</c:when>
								</c:choose>
				</td>
				<td><a style="color:#0054FF; text-align: left;">${q.qwriter }</a> <br> <a style="font-size:13px;">${q.qdate }</a></td>
			</tr>
		</c:forEach>
	</table>
	<div id="page">
	<c:if test="${startPage !=1 }">
		<a href="qnalist?pageNum=${startPage -1 }&search=${search }&searchType=${searchType}">&#60;&#60;</a>
	</c:if>

	<c:forEach begin="${startPage }" end="${endPage }" var="s" step="1">
		<a href="qnalist?pageNum=${s }&search=${search }&searchType=${searchType}">${s }</a>
	</c:forEach>



	<c:if test="${endPage < pageBoxCnt }">
		<a href="qnalist?pageNum=${endPage +1 }&search=${search }&searchType=${searchType}">&#62;&#62;</a>
	</c:if>
	</div>
</div>
</body>
<%@include file="../../view/footer.jsp"%>
</html>