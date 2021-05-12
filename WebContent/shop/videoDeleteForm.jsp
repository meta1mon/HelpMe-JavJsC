<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

	int vid = Integer.parseInt(request.getParameter("vid"));
	String vkind = request.getParameter("vkind");
%>

<html>
<head>
<meta charset="UTF-8">
<title>영상 삭제</title>
</head>
<body>
	<p>영상 삭제</p>
	<form action="<%=request.getContextPath()%>/videodelete?vid=<%=vid %>&vkind=<%=vkind %>" method="post">
		<table>
		<tr>
		<td>
		<a href="<%=request.getContextPath() %>/shop/videoList.jsp?vkind=<%=vkind %>">목록으로</a><br>
		</td>
		<tr>
		<td>영상 번호<input type="hidden" value="<%= vid %>" name="vid" readonly> </td>
		</tr>
		<tr>
		<td>
		<input type="submit" value="영상 삭제">
		</td>
		</tr>
		</table>
	
	</form>
	
<%@include file="../view/footer.jsp" %></section>
</html>