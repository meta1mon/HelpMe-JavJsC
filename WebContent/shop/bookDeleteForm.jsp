<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 삭제</title>
</head>
<body>
	<p>책 삭제</p>
	<form action="<%=request.getContextPath()%>/bookdelete" method="post">
		<table>
		<tr>
		<td>
		<a href="<%=request.getContextPath()%>/booklist">목록으로</a><br>
		</td>
		<tr>
		<td>글 번호<input type="hidden" value="${book.bid}" name="bid" readonly> </td>
		</tr>
		<tr>
		<td>
		<input type="submit" value="삭제">
		</td>
		</tr>
		</table>
	
	</form>
	
</body>
</html>
