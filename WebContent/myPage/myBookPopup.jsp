<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<style>
<%@include file="../../style/common.css"%>
<%@include file="../../style/header.css"%>
</style>
<title>도와줘 잡스씨</title>
</head>
<body>
	<table id="table" style="border: 1; text-align: center;">
		<c:if test="${myBook.size() == 0 }">
			<tr>
				<td>구매한 책이 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${myBook.size() != 0 }">
			<tr>
				<td>책이름</td>
				<td>판매가격</td>
				<td>수량</td>
				<td>총 금액</td>
				<td>구매 날짜</td>
				<td>배송 상태</td>
			</tr>
			<c:forEach items="${myBook }" var='b'>
				<tr>
					<td align="left" width="300"><img src="imageFile/${b.bimage}"
						width="30" height="50" align="middle"> ${b.btitle}</td>
					<td>\ ${b.bprice}</td>
					<td>${b.buycount}</td>
					<td><c:set var="bprice"
							value="${bprice+ (b.buycount * b.buyprice)}"></c:set>
						${(b.buycount * b.buyprice)}</td>
					<td>${b.buydate }</td>
					<td>${b.saction }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>