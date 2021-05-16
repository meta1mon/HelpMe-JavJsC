<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>도와줘 잡스씨</title>

<style>
	<%@include file="../../style/common.css" %>
	<%@include file="../../style/header.css" %>

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
<body>
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
</body>
</html>