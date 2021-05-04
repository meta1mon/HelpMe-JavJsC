<%@page import="java.text.NumberFormat"%>
<%@page import="bookshop.DAO.shopBookDAO"%>
<%@page import="bookshop.VO.shopBookVo"%>
<%@page import="bookshop.VO.videoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String bkind = request.getParameter("bkind");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Shopping Mall</title>
</head>
<body>
	<%
		List<shopBookVo> bookLists = null;
	shopBookVo bookList = null;
	String book_kindName = "";

	shopBookDAO bookprocess = shopBookDAO.getinstance();

	bookLists = bookprocess.getBooks(bkind);
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
	<h3>
		<b><%=book_kindName%>분류의 목록</b>
	</h3>
	<%
		for (int i = 0; i < bookLists.size(); i++) {
		bookList = (shopBookVo) bookLists.get(i);
	%>
	<table border="1px solid white">
		<tr height="40">
			<td rowspan="4" width="100"><a href="bookContent.jsp?bid=<%=bookList.getBid()%>&bkind=<%=bookList.getBkind()%>">
					<img src="../imageFile/<%=bookList.getBimage()%>" border="0" width="100" height="120">
			</a></td>
			<td width="350"><font size="+1">
			<b>
			<a href="bookContent.jsp?bid=<%=bookList.getBid()%>%bkind=<%=bookList.getBkind()%>>">
			<%=bookList.getBtitle() %></a></b></font></td>
			<td rowspan="4" width="50" align="center" valign="middle">
			<%
			if(bookList.getBcount() ==0){
			%>
			<font color="red"><b>일시품절</b></font>
			<%}else{%>
				&nbsp;
			<%} %>
			</td>
			</tr>
			<tr height="30">
			<td width="350"> 출판사 : <%=bookList.getPublishing_com() %></td>
			</tr>
			<tr height="30">
			<td width="350"> 저자 : <%=bookList.getAuthor() %></td>
			</tr>
			<tr height = "30">
			<td width="350"> 정가 <%=NumberFormat.getInstance().format(bookList.getBprice()) %><br>
			판매가 : <b><font color="red">
			<%=NumberFormat.getInstance().format(bookList.getBprice()*(double)(100-bookList.getDiscountRate()/100)) %>
			</font></b> 
			</td>
			</tr>
	</table>
	<br>
<%
}
%>
</body>
</html>