<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdn.ckeditor.com/4.16.0/full/ckeditor.js"></script>
</head>
<body>
	<form action="<%=request.getContextPath()%>/rqnaupdate" method="post">
		<table>
			<tr>
				<td><input type="hidden" name="rqno" value="${rqna.rqno }"></td>
			</tr>
			<tr>
				<td><textarea id="editor" name="rqcontent" maxlength="2048">${rqna.rqcontent }</textarea></td>
			</tr>
			<tr>
				<td><button type="submit">수정</button></td>
			</tr>
		</table>
	</form>

	<script>
		CKEDITOR.replace('editor');
	</script>

</body>
</html>