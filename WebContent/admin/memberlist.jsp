<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../admin/adminAside.jsp" %>
<html>
<head>
<link href="<%=request.getContextPath()%>/style/admin.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/style/admin2.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/style/admin3.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/style/admin4.css" rel="stylesheet">

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<meta charset="UTF-8">
</head>
<main>
<div>
	<form action="<%=request.getContextPath()%>/memberlist" method="post">
			<input type='search' name="search">
			<button type=submit>검색</button>
		</form>
		<span style="float:left; margin:5px;"> 전체 회원 수 : ${membercnt }</span>

		<c:if test="${empty list }">
		올바른 접근이 아닙니다.
		관리자 계정으로 로그인해주세요.
		</c:if>
		<c:if test="${not empty list }">
			<table>
				<tr>
				<th>아이디</th>
					<th	>닉네임</th>
					<th	>비밀번호 찾기 질문</th>
					<th	>비밀번호 답변</th>
					<th	>가입일자</th>
					<th >우편번호</th>
					<th colspan="3">주소</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>탈퇴 처리</th>
				</tr>
				<c:forEach items="${list }" var='v'>
					<tr>
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
						<td style="text-align: center !important"><a
							href="<%=request.getContextPath()%>/memberdelete?id=${v.id}">
								<i class="fas fa-times-circle" id="full"></i>
						</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
			<div>
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
			<button type="button" onclick="location.href='admin/adminMain.jsp'"
				style="float: right;">관리자 페이지로 이동</button>
</div>
</main>
</html>