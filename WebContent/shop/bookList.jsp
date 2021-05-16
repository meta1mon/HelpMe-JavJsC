<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%!SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>
<%@include file="../admin/adminAside.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>등록된 책 목록</title>
</head>
<main>
	<div style="padding: 50px; margin-left: 200px;">
	<div>
	<!-- 자바의 스위치문과 비슷 -->
		<c:choose>
			<c:when test="${bkind == 100}">Java</c:when>
			<c:when test="${bkind == 200}">Jsp</c:when>
			<c:when test="${bkind == 300}">HTML</c:when>
		</c:choose>
	</div>
	<table border="1" style="border-collapse: collapse">
		<tr>
			<td>번호</td>
			<td>책분류</td>
			<td>책 제목</td>
			<td>가격</td>
			<td>수량</td>
			<td>저자</td>
			<td>출판사</td>
			<td>책이미지</td>
			<td>할인율</td>
			<td>등록일</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
	<!-- el태그는 if문은 else 안된다-->
		<c:if test="${booklist.size() == 0 }">
			등록된 책 없음
		</c:if>
		<c:if test="${booklist.size() != 0 }">
	<!-- foreach문에서 list는 items를 사용, var도 사용 -->
			<c:forEach items="${booklist }" var="b"   >
				<tr>
					<td>번호 ${b.bid }</td>
					<td>책분류${b.bkind }</td>
					<td>책 제목${b.btitle }</td>
					<td>가격${b.bprice }</td>
					<td>수량${b.bcount }</td>
					<td>저자${b.author }</td>
					<td>출판사${b.publishing_com }</td>
					<td>책이미지${b.bimage }</td>
					<td>할인율${b.discountRate }</td>
					<td>등록일${b.regdate }</td>
					<td width="50" style="text-decoration: underline;"><a
						href="<%=request.getContextPath()%>/bookupdateForm?bid=${b.bid}">수정</a></td>
					<td width="50" style="text-decoration: underline;"><a
						href="<%=request.getContextPath()%>/bookdeleteForm?bid=${b.bid}">삭제</a></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	</div>>
</main>
</html>