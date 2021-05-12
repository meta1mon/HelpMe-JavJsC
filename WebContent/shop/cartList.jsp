<%@page import="bookshop.VO.VideocartVO"%>
<%@page import="bookshop.DAO.VideocartDAO"%>
<%@page import="bookshop.VO.BookcartVO"%>
<%@page import="bookshop.DAO.BookcartDAO"%>
<%@page import="member.vo.Member"%>
<%@page import="java.text.NumberFormat"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Member vo = (Member) request.getSession().getAttribute("loginMember");
String bkind = request.getParameter("bkind");
String vkind = request.getParameter("vkind");
String id = vo.getId();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		List<BookcartVO> bookcartLists = null;
			BookcartVO bookcartList = null;

			List<VideocartVO> videocartLists = null;
			VideocartVO videocartList = null;

			
			int count = 0;
			int count2 = 0;
			int number = 0;
			int number2 = 0;
			int total = 0;
			int vtotal = 0;

			if (session.getAttribute("loginMember") == null) {
		response.sendRedirect("#");
			} else {
		BookcartDAO bookprocess = BookcartDAO.getInstance();
		count = bookprocess.getBookListCount(id);
		
		VideocartDAO videoprocess = VideocartDAO.getInstance();
		count2 = videoprocess.getVideoListCount(id);
		
		if (count == 0 && count2 ==0) {
	%>
	<h3>장바구니</h3>
	<table>
		<tr>
			<td>장바구니에 담긴 물품이 없습니다.</td>
		</tr>
	</table>
	<input type="button" value="책쇼핑 계속"
		onclick="javascript:window.location='introList.jsp?bkind=<%=bkind%>'">
	<input type="button" value="영상쇼핑 계속"
		onclick="javascript:window.location='videoIntroList.jsp?vkind=<%=vkind%>'">

	<%
		} else {
			bookcartLists = bookprocess.getBookCart(id);
			videocartLists = videoprocess.getVideoCart(id);
		System.out.println("리스트로 다시들어옴22");
	%>
	<h3>장바구니</h3>
	<form name="cartform">
		<p>책 장바구니 목록</p>
		<table border="1px">
			<tr>
				<td width="50">번호</td>
				<td width="300">책이름</td>
				<td width="100">판매가격</td>
				<td width="150">수량</td>
				<td width="150">금액</td>
			</tr>
			<%
				for (int i = 0; i < bookcartLists.size(); i++) {
						bookcartList = (BookcartVO) bookcartLists.get(i);
			%>
			<tr>
				<td width="50"><%=++number%></td>
				<td width="300" align="left"><img
					src="../imageFile/<%=bookcartList.getBimage()%>" border="0" width="30"
					height="50" align="middle"> <%=bookcartList.getBtitle()%></td>
				<td width="100"><%=NumberFormat.getInstance().format(bookcartList.getBprice())%></td>

				<td width="150" align="center"><input type="text"
					name="buycount" size="5" value="<%=bookcartList.getBuycount()%>">
					<%
						String url = "../bookupdateCartForm?bcid=" + bookcartList.getBcid() + "&bkind=" + bkind + "&buycount="
										+ bookcartList.getBuycount();
					%> <input type="button" value="수정"
					onclick="javascript:window.location='<%=url%>'"></td>

				<td align="center" width="150">
					<%
						total += bookcartList.getBuycount() * bookcartList.getBprice();
					%> <%=NumberFormat.getInstance().format(bookcartList.getBuycount() * bookcartList.getBprice())%>
					<%
						String url2 = "../bookcartListDel?list=" + bookcartList.getBcid() + "&bkind=" + bkind;
					%> <input type="button" value="삭제"
					onclick="javascript:window.location='<%=url2%>'">
				</td>
			</tr>
		
			<%
						}
					%>
			</table>
			</form>
				
			<div>
			<%
				String url3 = "../bookcartListDel?list=all&bkind=" + bkind;
			%> <input type="button" value="책 모두 비우기"
						onclick="javascript:window.location='<%=url3%>'">
		</div>			
		<form name="cartform2">
		<p>영상 장바구니 목록</p>
		<table border="1px">
			<tr>
				<td width="50">번호</td>
				<td width="300">영상이름</td>
				<td width="100">판매가격</td>
				<td width="150">수량</td>
				<td width="150">금액</td>
			</tr>

			<%
				for (int i = 0; i < videocartLists.size(); i++) {
					videocartList = (VideocartVO) videocartLists.get(i);
			%>
			<tr>
				<td width="50"><%=++number2%></td>
				<td width="300" align="left"><img
					src="../imageFile/<%=videocartList.getVimage()%>" border="0" width="30"
					height="50" align="middle"> <%=videocartList.getVtitle()%></td>
				<td width="100"><%=NumberFormat.getInstance().format(videocartList.getVprice())%></td>

				<td width="150" align="center"><input type="text"
					name="buycount" size="5" value="1">

				<td align="center" width="150">
					<%
						vtotal += videocartList.getBuycount() * videocartList.getVprice();
					%> <%=NumberFormat.getInstance().format(videocartList.getBuycount() * videocartList.getVprice())%>
					<%
						String url2 = "../videocartListDel?list=" + videocartList.getVcid() + "&vkind=" + vkind;
					%> <input type="button" value="삭제"
					onclick="javascript:window.location='<%=url2%>'">
				</td>
			</tr>
			<%	
			}
			%>
			</table>
			</form>
			<div>
			<%
							String url4 = "../videocartListDel?list=all&vkind=" + vkind;
			%> <input type="button" value="영상 모두 비우기"
						onclick="javascript:window.location='<%=url4%>'">
						</div>
			
			<tr>
					<td colspan="5" align="right"><b>총 금액 :<%=NumberFormat.getInstance().format(total + vtotal)%></b></td>
				</tr>
				<tr>
				<%
							String url5 = "../buyForm";
				%>
					<td colspan="5"><input type="button" value="구매하기"
						onclick="javascript:window.location='<%=url5%>'"> <input
						type="button" value="쇼핑 계속하기"
						onclick="javascript:window.location='introList.jsp?bkind=<%=bkind%>'"></td>
						
										</tr>
		
		<%
			}
		}
		%>
	
<%@include file="../view/footer.jsp" %></section>
</html>