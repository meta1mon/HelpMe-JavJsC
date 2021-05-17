<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@include file="../admin/adminAside.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 삭제</title>
<style>

.delete{
	border : 1px solid black;
	width :  1000px;	
	
}


</style>
</head>
<body>

	<center>
		<div class="delete">
			<p>책 삭제</p>
			<form action="<%=request.getContextPath()%>/bookdelete" method="post"
				id="deletet">
				<table>
					<tr>
						<td><input type="hidden" value="${book.bid}" name="bid"
							readonly>
						</td>
						<td><input type="hidden" value="${book.bkind}"
							name="bkind" readonly>
						</td>
					</tr>
					<tr>
						<td style="text-align:center;"><input type="submit" value="삭제"></td>
					</tr>
					<tr>
						<td><a href="<%=request.getContextPath()%>/booklist">목록으로</a><br>
						</td>
					</tr>
				</table>

			</form>
		</div>
	</center>

</body>
</html>
