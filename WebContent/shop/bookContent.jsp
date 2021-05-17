<%@page import="member.vo.Member"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="shop.DAO.ShopBookDAO"%>
<%@page import="shop.VO.ShopBookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
		 integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
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

<title>책 상세 페이지</title>
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
					  <div class="num">
                            <div class="updown">
                            <label for="order-quantity">주문수량
                                <input type="text" name="buycount" id="p_num2" size="2" maxlength="4" class="p_num" value="1" onkeyup="javascript:basket.changePNum(2);">
                                <span onclick="javascript:basket.changePNum(2);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                                <span onclick="javascript:basket.changePNum(2);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                            </div>
                        </div>
					
					</div>
					
				<c:if test="${b.bcount == 0}">
					<font color="red">등록된 책 없음</font>
				</c:if>
					<c:set var="vprice" value="$"/>
										<%
						if (id.equals("not")) {
					%>
					<font color="red">로그인 후 구매 가능합니다.</font>
					<%
						} else {
					%>
					<input type="hidden" name="bid" value="${b.bid}"> <input
						type="hidden" name="bimage" value="${b.bimage}">
					<input type="hidden" name="btitle"
						value="${b.btitle}">
						 <input type="submit" value="장바구니 담기" id="cartbtn">
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

</div>
<%
						}
%>
<script>
let basket = {
	    totalCount: 0, 
	    totalPrice: 0,
	 
	    //개별 수량 변경
	    changePNum: function (pos) {
	        var item = document.querySelector('input[name=buycount]');
	        var p_num = parseInt(item.getAttribute('value'));
	        var newval = event.target.classList.contains('up') ? p_num+1 : event.target.classList.contains('down') ? p_num-1 : event.target.value;
	        
	        if (parseInt(newval) < 1 || parseInt(newval) > 99) { return false; }

	        item.setAttribute('value', newval);
	        item.value = newval;

	        var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
	        item.parentElement.parentElement.nextElementSibling.textContent = (newval * price).formatNumber()+"원";
	        //AJAX 업데이트 전송

	        //전송 처리 결과가 성공이면    
	        this.reCalc();
	        this.updateUI();
	    },
	    delItem: function () {
	        event.target.parentElement.parentElement.parentElement.remove();
	    }
	}

	// 숫자 3자리 콤마찍기
	Number.prototype.formatNumber = function(){
	    if(this==0) return 0;
	    let regex = /(^[+-]?\d+)(\d{3})/;
	    let nstr = (this + '');
	    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
	    return nstr;
	};

</script>
</body>
<%@include file="../view/footer.jsp"%>
</html>