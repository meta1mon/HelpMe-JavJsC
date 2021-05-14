<%@page import="bookshop.DAO.ShopBookDAO"%>
<%@page import="bookshop.VO.ShopBookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String bid =(String) request.getParameter("bid");
	String bkind = request.getParameter("bkind");
	try {
	ShopBookDAO bookProcess = ShopBookDAO.getinstance();
	ShopBookVo book = bookProcess.getBook(bid);
%>
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
						<option value="100" <%if (book.getBkind().equals("100")) {%>
							selected <%}%>>JAVA</option>
						<option value="200" <%if (book.getBkind().equals("200")) {%>
							selected <%}%>>JSP</option>
						<option value="300" <%if (book.getBkind().equals("300")) {%>
							selected <%}%>>HTML</option>
				</select></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="btitle"
					value="<%=book.getBtitle()%>"> 
					<input type="hidden" name="bid" value="<%=bid%>"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="bprice"
					value="<%=book.getBprice()%>">원</td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input type="text" name="bcount"
					value="<%=book.getBcount()%>">권</td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" name="author"
					value="<%=book.getAuthor()%>">원</td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" name="publishing_com"
					value="<%=book.getPublishing_com()%>"></td>
			</tr>
			<tr>
				<td>이미지</td>
				<td><input type="file" name="bimage" value="<%=book.getBimage()%>"></td>
			</tr>
			<tr>
				<td>할인율</td>
				<td><input type="text" name="discountRate"
					value="<%=book.getDiscountRate()%>"></td>
			</tr>
			<tr>
				<td colspan=2 align="center"><input type="submit" value="수정하기">
					<input type="submit" value="다시작성"></td>
			</tr>

		</table>
	</form>
	<%
		} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</body>
</html>
</form>
