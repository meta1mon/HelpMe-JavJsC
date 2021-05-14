<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

	String bid =request.getParameter("bid");
	String bkind = request.getParameter("bkind");
%>
<html>
<head>
<meta charset="UTF-8">
<title>책 삭제</title>
</head>
<body>
	<p>책 삭제</p>
	<form action="<%=request.getContextPath()%>/bookdelete?bid=<%=bid %>&bkind=<%=bkind %>" method="post">
		<table>
		<tr>
		<td>
		<a href="bookList.jsp?bkind=<%=bkind %>">목록으로</a><br>
		</td>
		<tr>
		<td>글 번호<input type="hidden" value="<%= bid %>" name="bid" readonly> </td>
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
