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
#table{
	color:black;
	}
	
	div{
		background:#fff;
		border:1px solid black;
	}
</style>
<title>도와줘 잡스씨</title>

</head>
<body>
<div style="width: 800px; margin: 0 auto 0 auto; color: #aca4ae;">
	<table id="table" style="border: 1; text-align: center;">
		<c:if test="${myVideo.size() == 0 }">
			<tr>
				<td>구매한 영상이 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${myVideo.size() != 0 }">
			<tr>
				<td><b>영상 이름</b></td>
				<td><b>판매가격</b></td>
				<td><b>수량</b></td>
				<td><b>총 금액</b></td>
				<td><b>구매 날짜</b></td>
				<td><b>배송 상태</b></td>
			</tr>
			<c:forEach items="${myVideo }" var='v'>
				<c:if test="${v.vid != null}">
					<tr>
						<td align="left" width="300"><img src="imageFile/${v.vimage}"
							width="30" height="50" align="middle"> ${v.vtitle}</td>
						<td>\ ${v.vprice}</td>
						<td>${v.buycount}</td>
						<td><c:set var="vprice"
								value="${vprice+ (v.buycount * v.buyprice)}"></c:set>
							${(v.buycount * v.buyprice)}</td>
						<td>${v.buydate }</td>
						<td>${v.saction }</td>
					</tr>
				</c:if>
			</c:forEach>
		</c:if>
	</table>
	</div>
</body>
</html>