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
	.qna {
	margin : 40px 0 20px 10px;
	text-align:left;
	font-size:17px;
	color:black;
	float:left;
	}
	
	#write {
	margin : 20px 0 0 0;
	width:100px;
	height:65px;
	padding:0;
	border:none;
	border-radius: 4px;
	text-align: center;
	color:#ffffff;
	background-color:#1abc9c;
	float: right; 
	font-size:18px;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	}
	#write:hover{
	color:#2c3e50;
	background-color: #ffffff;
	box-shadow: 10px 10px 10px #eeeeee;
	}
	
	#searchType {
	width:80px;
	height:65px;
	border: none;
	font-size:18px;
	color:#99ADB6;
	margin-top:20px;
	padding:0;
	float: left; 
	text-align: left;
	clear:both;
	}
	#searchType:hover, #searchType:focus {
	color:black;
	transition: color 0.15s ease-in-out;
	}
	
	#search {
	width: 650px;
	height:65px;
	top: 0;
	background-color: #efeff3;
	border: none;  
	font-size:18px;
	margin-top:20px;
	padding:0;
	float: left; 
	}
	#search:hover, #search:focus {
	color: black;
	background-color: #ffffff;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	box-shadow: 10px 10px 20px 5px #eeeeee;
	}
	#search::-webkit-input-placeholder{
	background-image: url(https://cdn1.iconfinder.com/data/icons/hawcons/32/698627-icon-111-search-256.png) ;
	background-size: contain;
	background-position: 10px center;
	background-repeat: no-repeat;
	text-indent: 0;
	}
	
	#btnsearch{
	width:70px;
	height:65px;
	padding:0;
	border-style: hidden hidden hidden solid;
	border-color:#E6E6E6;
	font-size:18px;
	color:#99ADB6;
	background-color:#efeff3;
	margin-top:20px;
	float:left;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	}
	#btnsearch:hover, #btnsearch:focus {
	color: black;
	background-color: #ffffff;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	box-shadow: 10px 10px 20px 5px #eeeeee;
	}

	
	#table {
	clear:both;
	width:800px;
	margin-right:auto;
	margin-left:auto;
	border-collapse:collapse;
	}
	#table tr {
	border-bottom: 1px solid #eeeeee;
	height:100px;
	}
	#table tr td {
	height:
	}
	table > tr > td:first-child                {width:5%;} /*No 열 크기*/
	table > tr > td:first-child +td				{width:5%;} /*No 열 크기*/
	table > tr > td:first-child +td+td         {width:5%;} /*No 열 크기*/
	table > tr > td:first-child +td+td+td      {width:65%;} /*제목 열 크기*/
	table > tr > td:first-child +td+td+td+td   {width:20%;} /*작성일 열 크기*/
	#tag {
	border: 1px solid #eeeeee;
	border-radius: 4px;
	display:inline;
	font-size:15px; 
	padding:0 2px 0 2px;
	}
	
	#subject {
	color:#0054FF; 
	font-size:18px; 
	text-decoration:none;
	padding:1px 2px 1px 2px;
	}
	
	#subject:hover, #subject:active {
	color:#0100FF;
	}

	#page {
	line-height:200px;
	}
	
</style>

</head>
<%@include file="../../view/header.jsp"%>
<body class="content">
<div style="width: 800px; margin: 0 auto 0 auto; color:#99ADB6;">

	<div class="qna">Q&A 게시판</div>
	<input id="write" type="button" value="새 글 쓰기" onclick="location.href = 'board/qna/qwrite.jsp'">
	
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
<%@include file="../../view/footer.jsp"%>
</html>