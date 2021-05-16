<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>책 수정하기</title>
</head>
<body>
	<p>책 수정</p>
	<form action="<%=request.getContextPath()%>/bookupdate" method="post"
		name="writeform" enctype="multipart/form-data">
		<table>
			<tr>
				<td>분류 선택</td>
				<td><select name="bkind">
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
				<td>책번호</td>
				<td><input type="text" name="bid" value="${book.bid }" readonly></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="btitle" value="${book.btitle }">
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="bprice" value="${book.bprice }">원</td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input type="text" name="bcount" value="${book.bcount }">권</td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" name="author" value="${book.author }">원</td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" name="publishing_com"
					value="${book.publishing_com }"></td>
			</tr>
			<tr>
				<td>이미지</td>
				<td><input type="file" name="bimage" value="${book.bimage }"></td>
			</tr>
			<tr>
				<td>할인율</td>
				<td><input type="text" name="discountRate"
					value="${book.discountRate}"></td>
			</tr>
			<tr>
				<td colspan=2 align="center"><input type="submit" value="수정하기">
					<input type="reset" value="다시작성"></td>
			</tr>

		</table>
	</form>
</body>
</html>
