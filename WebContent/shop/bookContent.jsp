<%@page import="member.vo.Member"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="bookshop.DAO.ShopBookDAO"%>
<%@page import="bookshop.VO.ShopBookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="../view/header.jsp"%>
	
<%
	String bid = (String)request.getParameter("bid");
	String bkind = request.getParameter("bkind");
String id = "";
Member vo = (Member) request.getSession().getAttribute("loginMember");
int buyprice = 0;
try {
	if (session.getAttribute("loginMember") == null) {
		id = "not";
	} else {
		id = vo.getId();
		System.out.println(id);
	}
} catch (Exception e) {
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>책 상세 페이지</title>
<style>
<%@ include file="../style/shop2.css"%>
</style>


<script>
	function check() {
		var m = bcount - parseInt(document.inform.buycount.value);
		if (m < 0) {
			alert("주문하실 책 수량이 재고 수량보다 많습니다");
			document.inform.buycount.focus();
			return false;
		} else {
			document.inform.submit();
		}
	}
</script>
</head>
<body class="content">
	<%
		ShopBookVo bookList = null;
	String book_kindName = "";

	ShopBookDAO bookprocess = ShopBookDAO.getinstance();
	bookList = bookprocess.getBook(bid);

	if (bkind.equals("100")) {
		book_kindName = "JAVA";
	} else if (bkind.equals("200")) {
		book_kindName = "JSP";
	} else if (bkind.equals("300")) {
		book_kindName = "HTML";
	}
	%>


<form action="<%=request.getContextPath()%>/shop/bookcartInsert.jsp"
	method="post" name="inform">
	<div style="width: 800px; margin: 0 auto 0 auto;">
	<div class="product_detail">
	<div class="detail_product">
		<div class="detail_content type_2">
			<!-- <div class="detail_content"> -->
			<div class="inner">
				<!-- product_image -->
				<div class="product_image">
					<div class="photo">
						<div>
							<img src="../imageFile/<%=bookList.getBimage()%>" alt="bookimage"
								class="photo" />
						</div>
					</div>
				</div>
				<div class="product_detail_info">
					<div class="subject">
						<span class="title"><%=bookList.getBtitle()%></span>
					</div>
					<div class="issue">
						저자 :
						<%=bookList.getAuthor()%>
						| 출판사 :
						<%=bookList.getPublishing_com()%>
					</div>

					<dl class="basic">
						<dt class="fixed_price">정가</dt>
						<dd class="fixed_price">
							<del><%=NumberFormat.getInstance().format(bookList.getBprice())%>원
							</del>
						</dd>
						<%
							buyprice = (int) (bookList.getBprice() * ((double) (100 - bookList.getDiscountRate()) / 100));
						%>
						<dt class="sales_price">판매가</dt>
						<dd class="sales_price">
							<strong class="price"><%=NumberFormat.getInstance().format((int) (buyprice))%>원</strong>
							<span>[<strong><%=bookList.getDiscountRate()%></strong>%↓,
								할인]
							</span>
						</dd>
					</dl>

					<dl class="delivery_gift">
						<dt class="delivery-price">배송비</dt>
						<dd class="delivery-price">
							<strong>무료배송</strong>원<br />
						</dd>
					</dl>
					<dl class="delivery_gift">
						<dt class="delivery-price">배송일정</dt>
						<dd class="delivery-price">
							<span class="delivery"> 지금 주문하면 <span class="delivery-day">
									2일 이내 </span> 출고 예정 <br />
							</span>
						</dd>
					</dl>
					<div class="order_quantity">
						<label for="order-quantity">주문수량</label> <input type="number"
							id="order-quantity" value="1" maxlength="3" name="buycount" />
					</div>

					<%
						if (id.equals("not")) {
					%>
					<font color="red">일시품절</font>
					<%
						} else if (bookList.getBcount() == 0) {
					%>
					<b>일시품절</b>
					<%
						} else {
					%>
					<input type="hidden" name="bid" value="<%=bid%>"> <input
						type="hidden" name="bimage" value="<%=bookList.getBimage()%>">
					<input type="hidden" name="btitle"
						value="<%=bookList.getBtitle()%>"> <input type="hidden"
						name="buyprice" value="<%=buyprice%>"> <input
						type="hidden" name="bkind" value="<%=bkind%>"> <input
						type="submit" value="장바구니 담기" id="cartbtn" onclick="function check()">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
  <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
</svg>

					<%
						}
					%>
					<input type="button" value="목록으로" id="backbtn"
						onclick="javascript:window.location='introList.jsp?bkind=<%=bkind%>'">
					<input type="button" value="메인으로" id="mainbtn"
						onclick="javascript:window.location='shopMain.jsp'">

</div>
</div>
</div>
</div>
</div>


</div>

</form>
</body>
</html>