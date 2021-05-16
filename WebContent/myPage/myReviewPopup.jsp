<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
	<%@include file="../../style/common.css" %>
	
.review {
	margin: 0 0 20px 10px;
	text-align: left;
	font-size: 17px;
	color: black;
	float: left;
}

#table {
	background:#F7F8FA;
	float:left;
	width: 800px;
	margin: 0 auto 100px auto;
	border-collapse: collapse;
	border:1px solid black;
}

#table tr {
	border-bottom: 1px solid #eeeeee;
	height: 80px;
}

#tag {
	border: 1px solid #eeeeee;
	border-radius: 4px;
	display: inline;
	font-size: 15px;
	padding: 0 2px 0 2px;
	position:relative;
	top:3px;
}

#subject {
	color: #0054FF;
	font-size: 18px;
	text-decoration: none;
	padding: 0 2px 0 2px;
	position:relative;
	bottom:3px;
}

#subject:hover, #subject:active {
	color: #0100FF;
}

</style>

</head>

<body class="content" style="padding:0 30px 30px 30px; width:900px;">
	<div style="color: #99ADB6; padding:20px;">
	
<div class="review">나의 게시글</div>
		<table id="table">
			<c:forEach items="${rlist }" var='r'>
				<tr>
					<td style="width: 50px; font-size: 14px;"><a
						style="font-size: 18px;">${r.rviewcnt }</a><br>조회</td>
					<td style="width: 50px; font-size: 14px;"><a
						style="font-size: 18px;">${r.rlikecnt }</a><br>좋아요</td>
					<td style="width: 50px; font-size: 14px;"><a
						style="font-size: 18px;">${r.rstudycnt }</a><br>답변</td>
					<td style="text-align: left; width: 500px;"><a
						href="studyread?sno=${r.rno}" id="subject">${r.rsubject }</a> <br>
						<div id="tag">
							<c:choose>
								<c:when test="${r.rtag ==1}">Java</c:when>
								<c:when test="${r.rtag ==2}">C</c:when>
								<c:when test="${r.rtag ==3}">Python</c:when>
							</c:choose>
						</div></td>
					<td style="text-align: left;"><a style="color: #0054FF;">${r.rwriter }</a>
						<br> <a style="font-size: 13px;">${r.rdate }</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>