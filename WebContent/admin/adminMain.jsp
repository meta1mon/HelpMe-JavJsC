<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도와줘 잡스씨 관리자</title>
<%@include file="../admin/adminAside.jsp" %>
<script>
$(document).ready(function(){
	$("#home").addClass('activado');
})
</script>
<style>
td {
	height: 200px;
}

td {
	border: 1px solid #3d5a73;
	background-color: #3d5a73;
	border-radius: 5px;
	padding: 10px;
	border-spacing: 50px;
	color: white;
	text-align:center;
}
</style>
<script>
$(function(){
	$("#purchase").click(function(){
		$("#buychart").addClass('activado');
		$("#buychart").children('ul').slideDown();
		$(".menu li").not("#buychart").removeClass('activado')
		$(".menu li ul").not($("#buychart").children("ul")).slideUp();
	});
	$("#shop").click(function(){
		$("#adminshop").addClass('activado');		
		$("#adminshop").children('ul').slideDown();
		$(".menu li").not("#adminshop").removeClass('activado')
		$(".menu li ul").not($("#adminshop").children("ul")).slideUp();
	});
	$("#manage").click(function(){
		$("#adminmember").addClass('activado');		
		$("#adminmember").children('ul').slideDown();
		$(".menu li").not("#adminmember").removeClass('activado')
		$(".menu li ul").not($("#adminmember").children("ul")).slideUp();
	});
})
</script>
</head>
<main>
<div style="padding: 50px; margin-left: 200px;">
<h1>환영합니다, <span style="color:#3d5a73">${loginMember.nickname}</span>님! <i class="fas fa-user-cog"></i></h1>
<hr style="margin-bottom:20px">
 <table style="width:100%;">
<tr>
<td id="purchase">구매 현황&nbsp;<i class="fas fa-chart-line"></i></td>
<td id="shop">상품 관리&nbsp;<i class="fas fa-barcode"></i></td>
<td id="manage">회원 관리&nbsp;<i class="fas fa-users"></i></td>
</tr> 
 </table>
</div>
</main>
</html>