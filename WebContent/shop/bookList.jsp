<%@page import="bookshop.DAO.ShopBookDAO"%>
<%@page import="bookshop.VO.ShopBookVo"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>
<%
	List<ShopBookVo> bookList = null;
int number = 0;
String bkind = "";

bkind = request.getParameter("bkind");

ShopBookDAO bookProcess = ShopBookDAO.getinstance();
int count = bookProcess.getBookCount();

if (count > 0) {
	bookList = bookProcess.getBooks(bkind);
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>등록된 책 목록</title>
</head>
<body>
	<%
		String book_kindName = "";
		if (bkind.equals("100")) {
			book_kindName = "JAVA";
		} else if (bkind.equals("200")) {
			book_kindName = "JSP";
		} else if (bkind.equals("300")) {
			book_kindName = "HTML";
		} else if (bkind.equals("all")) {
			book_kindName = "전체";
		}
	%>

	<p><%=book_kindName%>
		분류의 목록:
		<%
		if (bkind.equals("all")) {
	%>
		<%=count%>개
		<%
			} else {
		%>
		<%=bookList.size()%>개
		<%
			}
		%>
	</p>
	<table>
		<tr>
		<td><a href="./bookRegisterForm.jsp">책 등록</a></td>		
		</tr>
	</table>
	<%
		if (count == 0) {
	%>
	<table>
		<tr>
			<td>등록된 책 없음</td>
		</tr>
	</table>
	<%
		} else {
	%>
	<table border="1">
		<tr hegiht="30">
			<td>번호</td>
			<td>책분류</td>
			<td>책 제목</td>
			<td>가격</td>
			<td>수량</td>
			<td>저자</td>
			<td>출판사</td>
			<td>책이미지</td>
			<td>할인율</td>
			<td>등록일</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
			<%
				for (int i = 0; i < bookList.size(); i++) {
					ShopBookVo book = (ShopBookVo) bookList.get(i);
			%>
			<tr height="30">
			<td><%=book.getBid()%></td>
			<td><%=book.getBkind()%></td>
			<td><%=book.getBtitle()%></td>
			<td><%=book.getBprice()%></td>

			<td>
				<%
					if (book.getBcount() == 0) {
				%> <font color="red"><%="일시품절"%></font> 
				<%
 					} else {
 				%> <%=book.getBcount()%>
				<%
					}
				%>
			</td>
			<td><%=book.getAuthor()%></td>
			<td><%=book.getPublishing_com()%></td>
			<td><img src="../imageFile/<%=book.getBimage()%>? width="120" height="150"></td>
			<td><%=book.getDiscountRate()%></td>
			<td><%=sdf.format(book.getRegdate())%></td>
			<td width="50" style="text-decoration: underline;">
			<a href="<%=request.getContextPath() %>/bookupdateForm?bid=<%=book.getBid()%>&bkind=<%=book.getBkind()%>">수정</a></td>
			<td width="50" style="text-decoration: underline;">
			<a href="<%=request.getContextPath() %>/bookdeleteForm?bid=<%=book.getBid()%>&bkind=<%=book.getBkind()%>">삭제</a></td>
			</tr>
			<%
				}
			%>
		
	</table>
	<%
		}
	%>
</body>
</html>