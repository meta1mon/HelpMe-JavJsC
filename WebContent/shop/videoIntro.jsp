<%@page import="shop.DAO.ShopvideoDAO"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="shop.DAO.ShopBookDAO"%>
<%@page import="shop.VO.ShopBookVo"%>
<%@page import="shop.VO.VideoVO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="../view/header.jsp"%>
<%
	int number= 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Video Shopping Mall</title>
<style>
	<%@include file="../style/shop.css" %>
</style>
</head>
<body class="content">
	<div>
		<!-- 자바의 스위치문과 비슷 -->
		<c:choose>
			<c:when test="${vkind == 100}">Java</c:when>
			<c:when test="${vkind == 200}">Jsp</c:when>
			<c:when test="${vkind == 300}">HTML</c:when>
		</c:choose>
	</div>
	<h3>
		<b>${v.vkind} 분류의 목록</b>
	</h3>
	<c:forEach items="${videolist }" var="v">
		<center>
			<div id="contents" class="seller_contents">
				<form name="smartForm" method="post">
					<ul class="list_type01" style="list-style: none;">
						<li>
							<div class="cover">
								<a
									href="<%=request.getContextPath() %>/videoContent?vid=${v.vid}&vkind=${v.vkind}">
									<strong class="rank"><%= ++number %></strong> <img
									src="imageFile/${v.vimage}" alt="video image" />

								</a>
								<div class="button">
									<a
										href="<%=request.getContextPath() %>/videoContent?vid=${v.vid}&vkind=${v.vkind}"
										class="btn_small btn_blue4"> 자세히보기<span
										class="glyphicon glyphicon-hand-up" aria-hidden="true"></span>
									</a>
								</div>
							</div>
							<div class="detail">
								<div class="title">
									<a
										href="<%=request.getContextPath() %>/videoContent?vid=${v.vid}&vkind=${v.vkind}">
										<strong>${v.vtitle}</strong>
									</a>
								</div>
								<div class="author">영상길이 | ${v.vsize}</div>

								<div class="info">
									<strike class="org_price">${v.vprice}원</strike> → <strong
										class="sell_price"> <fmt:parseNumber
											value="${v.vprice * (100- v.discountRate)/100}"
											integerOnly="true" type="number" />원
									</strong> <span class="dc_rate">[<strong>${v.discountRate}</strong>%↓]
									</span>
								</div>
								등록일 : ${v.regdate}
							</div>



						</li>
					</ul>
				</form>
			</div>
		</center>
	</c:forEach>
</body>
<%@include file="../../view/footer.jsp"%>
</html>