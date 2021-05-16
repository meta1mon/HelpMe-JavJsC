<%@page import="member.vo.Member"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="shop.DAO.ShopBookDAO"%>
<%@page import="shop.VO.ShopBookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../view/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
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

<style>
<%@ include file="../style/shop2.css"%>
</style>

</head>
<body class="content">
	<div style="width: 800px; margin: 0 auto 0 auto;">

	


<form action="<%=request.getContextPath()%>/bookcartInsert"
	method="post" name="inform">
	<div class="product_detail">
	<div class="detail_product">
		<div class="detail_content type_2">
			<!-- <div class="detail_content"> -->
			<div class="inner">
				<!-- product_image -->
				<div class="product_image">
					<div class="photo">
						<div>
							<img src="imageFile/${b.bimage}" alt="bookimage"
								class="photo" />
						</div>
					</div>
				</div>
				<div class="product_detail_info">
					<div class="subject">
						<span class="title">${b.btitle}</span>
					</div>
					<div class="issue">
						저자 :
						${b.author}
						| 출판사 :
						${b.publishing_com}
					</div>

					<dl class="basic">
						<dt class="fixed_price">정가</dt>
						<dd class="fixed_price">
							<del>${b.bprice}원 </del>
						</dd>
			
						<dt class="sales_price">판매가</dt>
						<dd class="sales_price">
						
						<strong class="price">
						
							<fmt:formatNumber value="${b.bprice * (100- b.discountRate)/100}" type="number" />원</strong>
							<span>[<strong>${b.discountRate}</strong>%↓, 								할인]
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
					
				<c:if test="${b.bcount == 0}">
					<font color="red">등록된 책 없음</font>
				</c:if>
					<c:set var="vprice" value="$"/>
					<input type="hidden" name="bid" value="${b.bid}"> <input
						type="hidden" name="bimage" value="${b.bimage}">
					<input type="hidden" name="btitle"
						value="${b.btitle}">
						 <input type="submit" value="장바구니 담기" id="cartbtn">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
  <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
</svg>
					<input type="button" value="목록으로" id="backbtn"
						onclick="javascript:window.location='<%=request.getContextPath()%>/booklist';">
					<input type="button" value="메인으로" id="mainbtn"
						onclick="javascript:window.location='<%=request.getContextPath()%>/shopmain'">

</div>
</div>
</div>
</div>
</div>

</form>

</div>
</body>
<%@include file="../view/footer.jsp"%>
</html>