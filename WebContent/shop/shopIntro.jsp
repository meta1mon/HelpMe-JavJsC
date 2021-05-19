<%@page import="shop.DAO.ShopvideoDAO"%>
<%@page import="shop.VO.VideoVO"%>
<%@page import="shop.DAO.BookcartDAO"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="shop.DAO.ShopBookDAO"%>
<%@page import="shop.VO.ShopBookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<%@include file="../view/header.jsp"%>
<head>
<meta charset="UTF-8">
<title>shopping mall</title>
<style>
<%@include file="../style/shop3.css"%>
</style>
</head>
<body class="content" style="height:1183">
	<div style="width: 800px; margin: 0 auto 0 auto;">
<c:if test="${loginMember != null }">
      <button type="button" id="shopbtn" onclick="location.href='<%=request.getContextPath()%>/cartlist'">내 장바구니 바로가기</button>
   </c:if>
		<h1>오늘의 책</h1>

		<div class="button-1"
			style="background-image: url('imageFile/java3.jpg');">
			<div class="eff-1"></div>
				<a href="<%=request.getContextPath()%>/bookIntro?bkind=${bkind1}">
					#JAVA 분류 책 바로가기 <br>
				</a>
		</div>
		<div class="button-1"
			style="background-image: url('imageFile/jsp4.jpg');">
			<div class="eff-1"></div>
			<a href="<%=request.getContextPath()%>/bookIntro?bkind=${bkind2}">
				#JSP 분류 책 바로가기 <br>
			</a>
		</div>
		<div class="button-1"
			style="background-image: url('imageFile/html2.jpg');">
			<div class="eff-1"></div>
			<a href="<%=request.getContextPath()%>/bookIntro?bkind=${bkind3}">
				#HTML분류 책 바로가기 <br>
			</a>
		</div>
		<h1>오늘의 영상</h1>
		<div class="button-1"
			style="background-image: url('imageFile/v00001.JPG');">
			<div class="eff-1"></div>
			<a href="<%=request.getContextPath()%>/videoIntro?vkind=${vkind1}">
				#JAVA 수강하러 가기 <br>
			</a>
		</div>
		<div class="button-1"
			style="background-image: url('imageFile/v000022.JPG');">
			<div class="eff-1"></div>
			<a href="<%=request.getContextPath()%>/videoIntro?vkind=${vkind2}">
				#JSP 수강하러 가기 <br>
			</a>
		</div>
		<div class="button-1"
			style="background-image: url('imageFile/v00004.JPG');">
			<div class="eff-1"></div>
			<a href="<%=request.getContextPath()%>/videoIntro?vkind=${vkind3}">
				#HTML 수강하러 가기 <br>
			</a>
		</div>
	</div>
</body>
<%@include file="../view/footer.jsp"%>
</html>
