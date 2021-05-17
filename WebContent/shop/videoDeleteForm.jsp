<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>영상 삭제</title>
</head>
<body>
	<p>영상 삭제</p>
	<form action="<%=request.getContextPath()%>/videodelete?vid=${video.vid}" method="post">
		<table>
		<tr>
		<td>
		<a href="<%=request.getContextPath() %>/videolist">목록으로</a><br>
		</td>
		<tr>
		<td>영상 번호<input type="hidden" value="${video.vid}" name="vid" readonly> </td>
		<td>영상 번호<input type="hidden" value="${video.vkind}" name="vkind"> </td>
		</tr>
		<tr>
		<td>
		<input type="submit" value="영상 삭제">
		</td>
		</tr>
		</table>
	
	</form>
	
</body>
</html>