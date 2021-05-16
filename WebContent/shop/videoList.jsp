<%@page import="shop.DAO.ShopvideoDAO"%>
<%@page import="shop.VO.VideoVO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%!SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>

<html>
<head>
<meta charset="UTF-8">
<title>등록된 영상 목록</title>
</head>
<body>
	
	<div>
	<!-- 자바의 스위치문과 비슷 -->
		<c:choose>
			<c:when test="${bkind == 100}">Java</c:when>
			<c:when test="${bkind == 200}">Jsp</c:when>
			<c:when test="${bkind == 300}">HTML</c:when>
		</c:choose>
	</div>
	<table border="2">
		<tr>
			<td>번호</td>
			<td>영상분류</td>
			<td>영상 제목</td>
			<td>가격</td>
			<td>영상 썸네일</td>
			<td>할인율</td>
			<td>등록일</td>
			<td>시청 가능 시작일</td>
			<td>시청 종료일</td>
			<td>영상길이</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
			<c:forEach items="${videolist }" var="v" >
			<tr height="30">
			<td>번호 ${v.vid} </td>
			<td>영상분류${v.vkind} </td>
			<td>영상제목 ${v.vtitle}</td>
			<td>영상 가격 ${v.vprice}</td>
			<td>영상 이미지 ${v.vimage}</td>
			
			<td>할인율 ${v.discountRate}</td>
			<td>등록일 ${v.regdate}</td>
			<td>시청 가능 시작일 ${v.startDate}</td>
			<td>시청 종료일 ${v.endDate}</td>
			<td>영상길이 ${v.vsize} </td>
			<td width="50" style="text-decoration: underline;">
			<a href="<%=request.getContextPath() %>/videoupdateForm?vid=${v.vid}">수정</a></td>
			<td width="50" style="text-decoration: underline;">
			<a href="<%=request.getContextPath() %>/videodeleteForm?vid=${v.vid}">삭제</a></td>
			</tr>
			</c:forEach>
		
	</table>

</body>
<%@include file="../../view/footer.jsp"%>
</html>