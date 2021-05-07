<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%=request.getContextPath() %>/rqnaupdate" method="post">
	<table>
		<tr>
			<td><input type="hidden" name="rqno" value="${rqna.rqno }"></td>
		</tr>
		<tr>
			<td><input type="text" name="rqcontent" value="${rqna.rqcontent }"></td>
		</tr>
		<tr>
			<td><button type="submit">수정</button></td>
		</tr>
	</table>
</form>
</body>
</html>