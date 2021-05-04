<%@page import="bookshop.DAO.cartDAO"%>
<%@page import="bookshop.VO.cartVO"%>
<%@page import="member.vo.Member"%>
<%@page import="java.text.NumberFormat"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Member vo = (Member) request.getSession().getAttribute("loginMember");
String bkind = request.getParameter("bkind");
String vkind = request.getParameter("vkind");
String vsize = request.getParameter("vsize");
String buyer = vo.getId();

%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		List<cartVO> cartLists = null;
	cartVO cartList = null;
	int count = 0;
	int number = 0;
	int number2 = 0;
	int total = 0;
	int vtotal = 0;

	if (session.getAttribute("loginMember") == null) {
		response.sendRedirect("#");
	} else {
		cartDAO productprocess = cartDAO.getInstance();
		count = productprocess.getListCount(buyer);

		if (count == 0) {
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
	cartLists = productprocess.getCart(buyer);
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
				for (int i = 0; i < cartLists.size(); i++) {
				cartList = (cartVO) cartLists.get(i);

				if (cartList.getBtitle() != null) {
			%>
			<tr>
				<td width="50"><%=++number%></td>
				<td width="300" align="left"><img
					src="../imageFile/<%=cartList.getBimage()%>" border="0" width="30"
					height="50" align="middle"> <%=cartList.getBtitle()%></td>
				<td width="100"><%=NumberFormat.getInstance().format(cartList.getBuyPrice())%></td>
				
				<td width="150" align="center"><input type="text"
					name="buyCount" size="5" value="<%=cartList.getBuyCount()%>">
					 <%
                  String url = "../bookupdateCartForm?cid=" + cartList.getCid() + "&bkind=" + bkind + "&buyCount=" + cartList.getBuyCount();
                 	 %>
					<input type="button" value="수정"
					onclick="javascript:window.location='<%=url%>'"></td>
				
				<td align="center" width="150">
					<%
						total += cartList.getBuyCount() * cartList.getBuyPrice();
					%> <%=NumberFormat.getInstance().format(cartList.getBuyCount() * cartList.getBuyPrice())%>
					<input type="button" value="삭제"
					onclick="javascript:window.location='cartListDel?list=<%=cartList.getCid()%>
		&bkind=<%=bkind%>'">
				</td>
			</tr>
			<%
				}
			}
			%>
		</table>
		<form name="vcartform">
			
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
					for (int j = 0; j < cartLists.size(); j++) {
					cartList = (cartVO) cartLists.get(j);

					if (cartList.getVtitle() != null) {
				%>
				<tr>
					<td width="50"><%=++number2%></td>
					<td width="300" align="left"><img
						src="../imageFile/<%=cartList.getVimage()%>" border="0" width="30"
						height="50" align="middle"> <%=cartList.getVtitle()%></td>
					<td width="100"><%=NumberFormat.getInstance().format(cartList.getvBuyPrice())%></td>
					<td width="150"><%=cartList.getBuyCount() %></td>
					<td align="center" width="150">
						<%
							vtotal += cartList.getBuyCount() * cartList.getvBuyPrice();
						%> <%=NumberFormat.getInstance().format(cartList.getBuyCount() * cartList.getvBuyPrice())%>
						<input type="button" value="삭제"
						onclick="javascript:window.location='cartListDel?list=<%=cartList.getCid()%>
		&vkind=<%=vkind%>'">
					</td>
				</tr>
				<%
					}
				}
				%>
				<tr>
					<td colspan="5" align="right"><b>총 금액 :<%=NumberFormat.getInstance().format(total + vtotal)%></b></td>
				</tr>
				<tr>
					<td colspan="5"><input type="button" value="구매하기"
						onclick="javascript:window.location='butForm'"> <input
						type="button" value="쇼핑 계속하기"
						onclick="javascript:window.location='introList?bkind=<%=bkind%>'">
						<input type="button" value="장바구니 비우기"
						onclick="javascript:window.location='cartListDel?list=all&bkind=<%=bkind%>'">
					</td>
				</tr>
			</table>
		</form>
		<%
			}
		}
		%>
	
</body>
</html>