<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@page import="bookshop.DAO.ShopvideoDAO"%>
<%@page import="bookshop.VO.VideoVO"%>
<%@page import="member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="../view/header.jsp"%>
<%
	String vid = (String)request.getParameter("vid");
	String vkind = request.getParameter("vkind");
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
	<%
		List<VideoVO> vLists = null;
			VideoVO vList = null;
			String video_kindName = "";

			ShopvideoDAO vprocess = ShopvideoDAO.getinstance();
			vList = vprocess.getVideo(vid);

			vLists = vprocess.getVideos(vkind);
			if (vkind.equals("100")) {
		video_kindName = "JAVA";
			} else if (vkind.equals("200")) {
		video_kindName = "JSP";
			} else if (vkind.equals("300")) {
		video_kindName = "HTML";
			} else if (vkind.equals("all")) {
		video_kindName = "전체";
			}
	%>

</body>
<center>
<form name="inform" action="<%=request.getContextPath() %>/shop/videocartInsert.jsp" method="post">
		<div class="product_detail">
	<div class="detail_product">
		<div class="detail_content type_2">
			<!-- <div class="detail_content"> -->
			<div class="inner">
				<!-- product_image -->
				<div class="product_image">
					<div class="photo">
						<div>
							<img src="../imageFile/<%=vList.getVimage()%>" alt="videoimage"
								class="photo" />
						</div>
					</div>
				</div>
				<div class="product_detail_info">
					<div class="subject">
						<span class="title"><%=vList.getVtitle()%></span>
					</div>
					<div class="issue">
						영상길이 :
						<%=vList.getVsize()%> 분 
						| 유효기간 :
						<%=vList.getStartDate()%> ~ <%=vList.getEndDate() %>
					</div>

					<dl class="basic">
						<dt class="fixed_price">정가</dt>
						<dd class="fixed_price">
							<del><%=NumberFormat.getInstance().format(vList.getVprice())%>원
							</del>
						</dd>
						<%
							buyprice = (int) (vList.getVprice() * ((double) (100 - vList.getDiscountRate()) / 100));
						%>
						<dt class="sales_price">판매가</dt>
						<dd class="sales_price">
							<strong class="price"><%=NumberFormat.getInstance().format((int) (buyprice))%>원</strong>
							<span>[<strong><%=vList.getDiscountRate()%></strong>%↓,
								할인]
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
					<font color="red">로그인 후 구매 가능합니다.</font>
					<%
						} else {
					%>
					<input type="hidden" name="vid" value="<%=vid%>">
					 <input type="hidden" name="vimage" value="<%=vList.getVimage()%>">
					<input type="hidden" name="vtitle" value="<%=vList.getVtitle()%>"> 
					<input type="hidden" name="buyprice" value="<%=buyprice%>"> 
					<input type="hidden" name="vkind" value="<%=vkind%>"> 
					<input	type="submit" value="장바구니 담기" id="cartbtn">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
  <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
</svg>

					<%
						}
					%>
					<input type="button" value="목록으로" id="backbtn"
						onclick="javascript:window.location='videoIntroList.jsp?vkind=<%=vkind%>'">
					<input type="button" value="메인으로" id="mainbtn"
						onclick="javascript:window.location='shopMain.jsp'">

</div>
</div>
</div>
</div>
</div>
	
</form>
</center>
</html>
<%@include file="../view/footer.jsp"%>