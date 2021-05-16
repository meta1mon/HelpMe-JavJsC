<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
<%@include file="../style/common2.css" %>
<%@include file="../style/header.css" %>
</style>
<body>
<div class="header">
	<div class="header-content">
		<a href="<%=request.getContextPath()%>/index.jsp"> 
		<img alt="logo" src="http://ipsumimage.appspot.com/80x80?l=로고" id="logo">
		</a>
		<div class="nav">
			<a href="<%=request.getContextPath()%>/qnalist" id="qnaBtn">질문방</a> 
			<a href="" id="studyBtn">스터디방</a> 
			<a href="" id="reviewBtn">리뷰방</a> 
			<a href="<%=request.getContextPath()%>/shop/shopIntro.jsp" id="shopBtn">쇼핑방</a> 
			<a href="<%=request.getContextPath()%>/calendar/start.jsp" id="recruitBtn">공채캘린더</a>
			<a href="" id="aboutusBtn">자사소개</a>
		</div>

		<c:choose>
			<c:when test="${loginMember == null }">
				<div class="beforeLogin">
					<button type="button" id="btnLogin" onclick="location.href='<%=request.getContextPath()%>/member/login.jsp'">로그인</button>
					<button type="button" id="btnEnroll" onclick="location.href='<%=request.getContextPath()%>/member/signup.jsp'">회원가입</button>
				</div>
			</c:when>
			<c:when test="${loginMember != null }">
				<div class="afterLogin">
					<div class="dropdown">
						<div class="picBtn">
							<img alt="profilePic"
								src="http://ipsumimage.appspot.com/50x50?l=이미지" class="pic">
						</div>
						<div class="dropdown-content">
							<a href="<%=request.getContextPath()%>/myPage/myPageEnter.jsp">마이페이지</a>
							<a href="<%=request.getContextPath()%>/memberlogout">로그아웃</a> 
						</div>
					</div>
				</div>
			</c:when>
		</c:choose>
	</div>
</div>
</body>
