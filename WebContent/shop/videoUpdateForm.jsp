<%@page import="shop.DAO.ShopvideoDAO"%>
<%@page import="shop.VO.VideoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../admin/adminAside.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<meta charset="UTF-8">
<title>책 수정하기</title>
<script>
	$.datepicker.setDefaults({
		dateFormat : 'yy-mm-dd',
		prevText : '이전 달',
		nextText : '다음 달',
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
				'10월', '11월', '12월' ],
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
				'9월', '10월', '11월', '12월' ],
		dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		showMonthAfterYear : true,
		yearSuffix : '년'

	});

	$(function() {
		$("#startDate, #endDate").datepicker();
	});
</script>
<style>
#update{
	border:1px solid black;
	width: 1000px;
	display:flex;
	justify-content:center;
}
</style>
</head>
<body>
<center>
	<p>영상 수정하기</p>
	<form action="<%=request.getContextPath()%>/videoUpdate" method="post"
		enctype="multipart/form-data" id="update">
		<table>
			<tr>
				<td>분류 선택</td>
				<td><select name="vkind">
						<c:choose>
							<c:when test="${book.bkind == 100 }">
								<option value="100" selected>JAVA</option>
							</c:when>

							<c:when test="${book.bkind != 100 }">
								<option value="100">JAVA</option>
							</c:when>

							<c:when test="${book.bkind == 200 }">
								<option value="200" selected>JSP</option>
							</c:when>

							<c:when test="${book.bkind != 200 }">
								<option value="200">JSP</option>
							</c:when>

							<c:when test="${book.bkind == 300 }">
								<option value="300" selected>HTML</option>
							</c:when>

							<c:when test="${book.bkind != 300 }">
								<option value="300">HTML</option>
							</c:when>
						</c:choose>
				</select></td>
			</tr>
			<tr>
				<td>영상 번호</td>
				<td><input type="text" name="vid" value="${video.vid}" readonly></td>
			</tr>
			<tr>
				<td>영상 제목</td>
				<td><input type="text" name="vtitle" value="${video.vtitle}">
			</tr>
			<tr>
				<td>영상 가격</td>
				<td><input type="text" name="vprice" value="${video.vprice}">원</td>
			</tr>
			<tr>
				<td>이미지</td>
				<td><input type="file" name="vimage" value="${video.vimage}"></td>
			</tr>
			<tr>
				<td>할인율</td>
				<td><input type="text" name="discountRate"
					value="${video.discountRate}"></td>
			</tr>
			<tr>
				<td>영상유효기간</td>
				<td><label>시작일<input type="text" id="startDate"
						name=startDate value="${video.startDate}"></label> <img
					src="<%=request.getContextPath() %>/images/calendar.gif"> <label>종료일<input
						type="text" id="endDate" name="endDate" value="${video.endDate}"></label>
					<img src="<%=request.getContextPath() %>/images/calendar.gif"></td>
			</tr>
			<tr>
				<td>영상길이</td>
				<td><input type="text" name="vsize" value="${video.vsize}"></td>
			</tr>

			<tr>
				<td colspan=2 align="center"><input type="submit" value="수정하기">
					<input type="submit" value="다시작성"></td>
			</tr>
		</table>
	</form>
	</center>
</body>

</html>