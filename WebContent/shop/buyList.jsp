<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="shop.DAO.BuyDAO"%>
<%@page import="shop.VO.BuyVO"%>
<%@page import="java.util.List"%>
<%@page import="member.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="../view/header.jsp"%>
<%
	Member vo = (Member) request.getSession().getAttribute("loginMember");
String id = vo.getId();
Timestamp currentTime = null;
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
currentTime = new Timestamp(System.currentTimeMillis());
%>

<html>
<head>
<meta charset="UTF-8">
<title>구매완료페이지</title>
<style>
<%@include file="../style/shop3.css"%>
</style>
</head>
<body class="content">
<div style="width: 800px; margin: 0 auto 0 auto;" class="buywrap">
	<%
			int count = 0;
			int number = 0;
			int number2 = 0;
			int total = 0;
	%>
	<c:if test="${count == 0}">
	<h3>구매목록</h3>
	<table>
		<tr>
			<td>구매 목록이 없습니다.</td>
		</tr>
	</table>
	</c:if>
	<h4>
		<b>결제가 완료되었습니다 ♥</b>
	</h4>
	<h3>
		<h1>구매목록</h1>
	</h3>
		<table id="bcart">
		<p>책 구매목록</p>
					<tr>
						<td width="150">번호</td>
						<td width="300">책 이름</td>
						<td width="100">판매가격</td>
						<td width="50">수량</td>
						<td width="150">금액</td>
					</tr>
			<td>
				
				
				<c:forEach items="${buy }" var="b" >
				<c:if test="${b.vid == null}">
					<tr>
						<td align="center" width="150">${b.bid}</td>
					</tr>
					<tr>
						<td width="300" align="left"><img
							src="imageFile/${b.bimage}" width="30"
							height="50" align="middle"> ${b.btitle}</td>
						<td width="300" align="left">
						<td width="100">\
						<fmt:formatNumber value="${b.bprice}" type="number" />
						</td>
						<td width="50">
						${b.buycount}</td>
						<td width="150">
							<c:set var="bprice" value="${bprice+ (b.buycount * b.buyprice)}"></c:set>
							${(b.buycount * b.buyprice)}
						</td>
					
					</tr>
					</c:if>
					</c:forEach>
				</table>
					<table id="vcart">
				<p>영상 구매목록</p>
					<tr>
						<td width="150">번호</td>
						<td width="300">책 이름</td>
						<td width="100">판매가격</td>
						<td width="50">수량</td>
						<td width="150">금액</td>
					</tr>
			
			<c:forEach items="${buy }" var="v"   >
				<c:if test="${v.bid == null}">
				
					<tr>
						<td align="center" width="150">${v.vid}</td>
					</tr>
					<tr>
						<td width="300" align="left"><img
							src="imageFile/${v.vimage}" width="30"
							height="50" align="middle"> ${v.vtitle}</td>
						<td width="300" align="left">
						<td width="100">\<fmt:formatNumber value="${v.vprice}" type="number" />
						</td>
						<td width="50">1</td>
						<td width="150">
							${v.buyprice}
						<c:set var="vprice" value="${vprice + v.vprice}"></c:set>
						</td>
					</tr>
					
					</c:if>
					</c:forEach>	
			
				</table>
					<tr>
						<td colspan="5" align="right">
						<h2>총 구매 금액: \
						<fmt:formatNumber value="${bprice+vprice}" type="number" /> 
						</h2>
						</td>
					</tr>
					
			</td>
		</tr>
	</table>
	<br>
	
	<button type="submit" id ="shopbtn">
			<a href="<%=request.getContextPath()%>/shopmain">
			쇼핑 계속 하러가기 </a>
			</button>
	
</div>
</body>
</html>
<%@include file="../view/footer.jsp"%>