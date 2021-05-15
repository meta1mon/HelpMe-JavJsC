<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../admin/adminNav.jsp"%>

<html>
<head>
<meta charset="UTF-8">
<title>회원리스트(관리자가 읽음)</title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/memberlist" method="post">
		<input type='search' name="search">
		<button type=submit>검색</button>
	</form>

	<c:if test="${empty list }">
		올바른 접근이 아닙니다.
		관리자 계정으로 로그인해주세요.
	</c:if>
	<c:if test="${not empty list }">
		<table border='1'>
			<tr>
				<th>아이디</th>
				<th>닉네임</th>
				<th>비밀번호 확인 질문</th>
				<th>비밀번호 확인 답변</th>
				<th>회원가입 일자</th>
				<th>우편번호</th>
				<th>회원 주소1</th>
				<th>회원 주소2</th>
				<th>회원 주소3</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>회원 탈퇴 처리</th>
			</tr>
			<c:forEach items="${list }" var='v'>
				<tr>
					<td>${v.id }</td>
					<td>${v.nickname }</td>
					<td>${v.passquestion }</td>
					<td>${v.passanswer }</td>
					<td>${v.regdate }</td>
					<td>${v.postcode }</td>
					<td>${v.address1 }</td>
					<td>${v.address2 }</td>
					<td>${v.address3 }</td>
					<td>${v.tel }</td>
					<td>${v.email }</td>
					<td><a href="<%=request.getContextPath()%>/memberdelete?id=${v.id}">회원 탈퇴</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>


	<c:if test="${startPage !=1 }">
		<a href="memberlist?pageNum=${startPage -1 }&search=${search }">&#60;&#60;</a>
	</c:if>

	<c:forEach begin="${startPage }" end="${endPage }" var="s" step="1">
		<a href="memberlist?pageNum=${s }&search=${search }">${s }</a>
	</c:forEach>



	<c:if test="${endPage < pageBoxCnt }">
		<a href="memberlist?pageNum=${endPage +1 }&search=${search }">&#62;&#62;</a>
	</c:if>
	<br>
전체 회원 수 : ${membercnt }
	<br>
	<button type="button" onclick="location.href='admin/admin_index.jsp'">관리자 페이지로 이동</button>
</body>
</html>