<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="../view/header.jsp"%>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
<%@include file="../style/shop.css" %>

</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Book Shopping Mall</title>
</head>
<body class="content">
<%
int number=0;
%>
	<div>
	<!-- 자바의 스위치문과 비슷 -->
		<c:choose>
			<c:when test="${bkind == 100}">Java</c:when>
			<c:when test="${bkind == 200}">Jsp</c:when>
			<c:when test="${bkind == 300}">HTML</c:when>
		</c:choose>
	</div>
	<h3>
		<b>${b.bkind}</b>
	</h3>
	<c:forEach items="${booklist }" var="b">
	<center>
	<div id="contents" class="seller_contents">
		<form name="smartForm" method="post">
		<ul class="list_type01">
					<li>
						<!--스마트 상품 담을때 쓸 변수들 -->
                        <input type="hidden" name="ortxBrcd" value="9780689878572" />
    	                <input type="hidden" name="ortxDvcd" value="ENG" />
						<div class="cover">
                                <a href="<%=request.getContextPath() %>/bookcontent?bid=${b.bid}&bkind=${b.bkind}">
								<strong class="rank"><%= ++number %></strong>
                                        <img src="imageFile/${b.bimage}" alt="book image"/>
								
							</a>
							<div class="button">
		                        	<a href="<%=request.getContextPath() %>/bookcontent?bid=${b.bid}&bkind=${b.bkind}" class="btn_small btn_blue4">
									자세히보기<span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span>
		                        </a>
							</div>
						</div>
						<div class="detail">
							<div class="title">
                                    <a href="<%=request.getContextPath() %>/bookcontent?bid=${b.bid}&bkind=${b.bkind}">
                                        <strong>${b.btitle}</strong>                                            
                                    </a>
							</div>
	                            <div class="author">
	                             작가 | ${b.author}
	                            </div>

							<div class="info">
								<strike class="org_price">${b.bprice}
		
</strike> → 			
									<strong class="sell_price">
									<c:set var="price" value="10000" />
									<fmt:formatNumber value="${b.bprice * (100- b.discountRate)/100}" type="number" />
									원</strong>
									<span class="dc_rate">[<strong>${b.discountRate}</strong>%↓]</span>
							</div>
							
								등록일 : ${b.regdate}
							</div>
							
						
							<input type="hidden" name="bid" value="${b.bid}">
					</li>
					</ul>
					</c:forEach>
					</form>
					</div>
					</center>
	
	<br>

</body>
<%@include file="../view/footer.jsp"%>
</html>