<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../admin/adminAside.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<html>
<head>

<meta charset="UTF-8">
<style>
<%@include file="../style/common.css" %>
</style>
<style>
.page-header {
	font-weight: bold;
	margin: 0 20px 20px 40px;
}

.table {
	border-collapse: collapse;
	border: 1px solid #ddd;
	width: 1500px;
	margin: 20px;
	
}

.table tr:nth-child(odd){background-color: #f2f2f2;}


.table th{
	border: 1px solid #ddd;
}

.table td{
	font-size: 12px;
	padding: 8px;
	line-height: 1.42857143;
	border-bottom: 1px solid #ddd;
	border-right: 1px solid #ddd;
	vertical-align: middle;
	
} 

input[type=search] {
	padding: 8px;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}


.btn {
	color: #809bbf;
	background-color: #eef0f5;
	border-color: #809bbf;
	border: 2px solid;
	border-radius: 4px;
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 0;
	font-size: 14px;
	line-height: 1.42857143;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	cursor: pointer;
	font-family: 'GmarketSansLight';
	font-weight: bold;
}


.btn:hover, .btn:active {
	color: #fff;
	background-color: #809bbf;
	border-color: #809bbf;
}

#page {
	line-height: 120px;
	text-align: center;
}

a, a:visited, a:active {
	color: #424242;
}

a:hover {
	color: #809bbf; 
}

.fas.fa-times-circle {
	color: red;
}

</style>
</head>
<main>
	<div style="padding: 50px; margin-left: 200px;">
		<h1 class="page-header">회원 리스트</h1>
		<form action="<%=request.getContextPath()%>/memberlist" method="post">
			<div style="float: right;">
			<input type='search' name="search">
			<button class="btn" type=submit>검색</button>
			</div>
		</form>
			<span style="float:left; margin:40px;"> 전체 회원 수 : ${membercnt }</span>
			<br><br>
			<c:if test="${empty list }">
			올바른 접근이 아닙니다.
			관리자 계정으로 로그인해주세요.
			</c:if>
			<c:if test="${not empty list }">
				<table class="table">
					<tr style="background-color: #add9d4;">
						<th style="width:120px;">아이디</th>
						<th style="width:100px;">닉네임</th>
						<th style="width:180px;">비밀번호 찾기 질문</th>
						<th style="width:120px;">비밀번호 답변</th>
						<th style="width:180px">가입일자</th>
						<th style="width:80px">우편번호</th>
						<th colspan="3" style="width:360px">주소</th>
						<th style="width:120px;">전화번호</th>
						<th style="width:200px;">이메일</th>
						<th style="width:40px;">탈퇴</th>
					</tr>
					<c:forEach items="${list }" var='v'>
						<tr style="border-botton: none;">
							<td>${v.id }</td>
							<td>${v.nickname }</td>
							<c:choose>
								<c:when test="${v.passquestion == 1}">
									<td>첫 수학여행 장소는?</td>
								</c:when>
								<c:when test="${v.passquestion == 2}">
									<td>가장 친한 친구의 이름은?</td>
								</c:when>
								<c:when test="${v.passquestion == 3}">
									<td>첫 해외여행지는?</td>
								</c:when>
								<c:when test="${v.passquestion == 4}">
									<td>어린시절 자신의 별명은?</td>
								</c:when>
							</c:choose>
							<td>${v.passanswer }</td>
							<td>${v.regdate }</td>
							<td>${v.postcode }</td>
							<td colspan="3">${v.address1 }${v.address2 }${v.address3 }</td>
							<td>${v.tel }</td>
							<td>${v.email }</td>
							<td style="text-align: center !important" ><a
								href="<%=request.getContextPath()%>/memberdelete?id=${v.id}">
									<i class="fas fa-times-circle" id="full"></i>
							</a></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
				<div id="page">
					<c:if test="${startPage !=1 }">
						<a href="memberlist?pageNum=${startPage -1 }&search=${search }">&#60;&#60;</a>
					</c:if>
	
					<c:forEach begin="${startPage }" end="${endPage }" var="s" step="1">
						<a href="memberlist?pageNum=${s }&search=${search }">${s }</a>
					</c:forEach>
	
					<c:if test="${endPage < pageBoxCnt }">
						<a href="memberlist?pageNum=${endPage +1 }&search=${search }">&#62;&#62;</a>
					</c:if>
				</div>
				<button class="btn" type="button" onclick="location.href='admin/adminMain.jsp'"
					style="float: right;">관리자 페이지로 이동</button>
	</div>
	</main>
</html>