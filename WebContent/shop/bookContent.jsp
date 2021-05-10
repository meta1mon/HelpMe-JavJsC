<%@page import="member.vo.Member"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="bookshop.DAO.ShopBookDAO"%>
<%@page import="bookshop.VO.ShopBookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String bid = request.getParameter("bid");
	String bkind = request.getParameter("bkind");
	String id = "";
	Member vo = (Member) request.getSession().getAttribute("loginMember");
int buyprice = 0;
try {
	if (session.getAttribute("loginMember") == null){
		id = "not";	
	}else{
		id = vo.getId();
		System.out.println(id);
	}
} catch (Exception e){}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>책 상세 페이지</title>

<script>

	function check(){
		 var m = bcount - parseInt(document.inform.buycount.value);
		if(m < 0){
			alert("주문하실 책 수량이 재고 수량보다 많습니다");
			document.inform.buycount.focus();
			return false;
		}else{
			document.inform.submit();
		}
	}
</script>
</head>
<body>
	<%
		ShopBookVo bookList = null;
			String book_kindName = "";

			ShopBookDAO bookprocess = ShopBookDAO.getinstance();
			bookList = bookprocess.getBook(Integer.parseInt(bid));

			if (bkind.equals("100")) {
		book_kindName = "JAVA";
			} else if (bkind.equals("200")) {
		book_kindName = "JSP";
			} else if (bkind.equals("300")) {
		book_kindName = "HTML";
			}
	%>

</body>
<form action="<%=request.getContextPath() %>/shop/bookcartInsert.jsp" method="post" name="inform">
	<table border="1">
		<tr>
			<td rowspan="6" width="150"><img src="../imageFile/<%=bookList.getBimage()%>" border="0" width="150"
				height="200"></td>
		</tr>
		<tr>
			<td width="500"><font size="+1"> <b><%=bookList.getBtitle()%></b>
			</font></td>
		</tr>
		<tr>
			<td width="500">저자: <%=bookList.getAuthor()%></td>
		</tr>
		<tr>
			<td width="500">출판사: <%=bookList.getPublishing_com()%></td>
		</tr>
		<tr>
			<td width="500">정가 <%=NumberFormat.getInstance().format(bookList.getBprice())%>원<br>
				<%
				buyprice = (int) (bookList.getBprice() * ((double) (100 - bookList.getDiscountRate()) / 100));
				%> 판매가: <b><font color="red"> <%=NumberFormat.getInstance().format((int) (buyprice))%>원
				</font></b></td>
		<tr>
			<td width="500">수량  : <input type="text" size="5" name="buycount" value="1">개
			<%
			if(id.equals("not")){
			%>
				<font color="red">일시품절</font>
			<%
				}else if(bookList.getBcount() ==0){		
			%>
			<b>일시품절</b>
			<%
				}else{
			%>
			<input type="hidden" name="bid" value="<%= bid %>">
			<input type="hidden" name="bimage" value="<%=bookList.getBimage() %>">
			<input type="hidden" name="btitle" value="<%=bookList.getBtitle() %>">
			<input type="hidden" name="buyprice" value="<%= buyprice %>">
			<input type="hidden" name="bkind" value="<%=bkind %>">

			
			
			<input type="submit" value="장바구니 담기" onclick="function check()">	
	
			<%
				}
		%>
			<input type="button" value="목록으로" onclick="javascript:window.location='bookList.jsp?bkind=<%=bkind %>>'">
			<input type="button" value="메인으로" onclick="javascript:window.location='#'">
			
			</td>
		</tr>
		
		


	</table>
</form>
</html>