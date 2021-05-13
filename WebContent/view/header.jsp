<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
<%@include file="../style/common.css" %>
<%@include file="../style/header.css" %>
</style>
<title>
	도와줘 잡스씨
</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
window.onload = function () {
	document.getElementById("show").addEventListener("click", showHide);
	function showHide() {
	    if (document.getElementById("show").value == "SHOW") {
	        this.value = "HIDE";
	        document.getElementById("dropdown-content").style.display = "block";
	        document.getElementById("show").src = "<%=request.getContextPath()%>/images/userhover.png";
	        document.getElementById("picBtn").style.border = "1px solid #1abc9c";
	
	    } else {
	        this.value = "SHOW";
	        document.getElementById("dropdown-content").style.display = "none";
	        document.getElementById("show").src = "<%=request.getContextPath()%>/images/user.png";
	        document.getElementById("picBtn").style.border = "1px solid white";
	    }
	}
}
</script>
<header>
<div class="header">
	<div class="header-content">
		<a href="<%=request.getContextPath()%>/index.jsp"> 
		<img alt="logo" src="<%=request.getContextPath() %>/images/logo.png" width="128" height="80" id="logo">
		</a>
		<div class="nav">
			<a href="<%=request.getContextPath()%>/qnalist">질문방</a> 
			<a href="" id="studyBtn">스터디방</a> 
			<a href="" id="reviewBtn">리뷰방</a> 
			 <a href="<%=request.getContextPath()%>/shop/shopIntro.jsp" id="shopBtn">쇼핑방</a> 
			<a href="<%=request.getContextPath()%>/calendar/main.jsp" id="recruitBtn">공채캘린더</a>
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
						<div class="picBtn" id="picBtn">
								<input type="image" src="<%=request.getContextPath() %>/images/user.png" class="pic" width="50" height="50" style="background-color: white" id="show" onclick="showHide();">
							</div>
						<div class="dropdown-content" style="border: 1px solid #1abc9c; display:none" id="dropdown-content">
							<a href="<%=request.getContextPath()%>/myPage/myPageEnter.jsp">마이페이지</a>
							<a href="<%=request.getContextPath()%>/memberlogout">로그아웃</a> 
						</div>
					</div>
				</div>
			</c:when>
		</c:choose>
	</div>
</div>
</header>
