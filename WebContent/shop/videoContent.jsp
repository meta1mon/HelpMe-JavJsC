<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@page import="shop.DAO.ShopvideoDAO"%>
<%@page import="shop.VO.VideoVO"%>
<%@page import="member.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../view/header.jsp"%>
<%
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
<style>
<%@include file="../style/shop2.css"%>

</style>

<title>영상 상세 페이지</title>
</head>
<body class="content">
<center>
<form name="inform" action="<%=request.getContextPath() %>/videocartInsert" method="post">
		<div class="product_detail">
	<div class="detail_product">
		<div class="detail_content type_2">
			<!-- <div class="detail_content"> -->
			<div class="inner">
				<!-- product_image -->
				<div class="product_image">
					<div class="photo">
						<div>
							<img src="imageFile/${v.vimage}" alt="videoimage"
								class="photo" />
						</div>
					</div>
				</div>
				<div class="product_detail_info">
					<div class="subject">
						<span class="title">${v.vtitle}</span>
					</div>
					<div class="issue">
						영상길이 :
						${v.vsize} 분 
						| 유효기간 :
						${v.startDate} ~ ${v.endDate}
					</div>

					<dl class="basic">
						<dt class="fixed_price">정가</dt>
						<dd class="fixed_price">
							<del>${v.vprice}원
							</del>
						</dd>
						
						<dt class="sales_price">판매가</dt>
						<dd class="sales_price">
							<strong class="price">
							<fmt:formatNumber value="${v.vprice * (100- v.discountRate)/100}" type="number" />원</strong>
							원</strong>
							<span>[<strong>${v.discountRate}</strong>%↓,
								할인]
							</span>
						</dd>
					</dl>
					<div class="order_quantity">
						<label for="order-quantity">주문수량</label> <input type="text"
							id="order-quantity" value="1" maxlength="3" name="buycount" readonly/>
					</div>

					<%
						if (id.equals("not")) {
					%>
					<font color="red">로그인 후 구매 가능합니다.</font>
					<%
						} else {
					%>
					<input type="hidden" name="vid" value="${v.vid}">
					 <input type="hidden" name="vimage" value="${v.vimage}">
					<input type="hidden" name="vtitle" value="${v.vtitle}"> 
					<input type="hidden" name="buyprice" value="${v.vprice * (100- v.discountRate)/100}"> 
					<input type="hidden" name="vkind" value="${v.vkind}>"> 
					<input	type="submit" value="장바구니 담기" id="cartbtn">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
  <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
</svg>

					
					<input type="button" value="목록으로" id="backbtn"
                  onclick="location.href='javascript:history.back()';">
					<input type="button" value="메인으로" id="mainbtn"
						onclick="javascript:window.location='<%=request.getContextPath()%>/shopmain'">

</div>
</div>
</div>
</div>
</div>
	
</form>
</center>
<%
						}
%>
</html>
<%@include file="../view/footer.jsp"%>