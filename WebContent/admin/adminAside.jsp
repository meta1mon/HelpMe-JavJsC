<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>도와줘 잡스씨 관리자</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- Font Awesome 4-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
</head>
<style>
<%@include file="../style/common.css"%>
</style>
<style>
li a {
font-size: 15px;
}

html{
margin: 0;
padding: 0;
height: 100vh;
}

body{
margin: 0 auto;
padding: 0;
}

a {
 text-decoration: none;
}

i .fa { float: right; }
i .fas { float: right; }

.menu {
margin: 0;
padding: 0;
}

#index{
	background: #3d5a73;
}
.contenedor-menu {
	width: 200px;
	display:block;
	line-height: 18px;
}
.contenedor-menu .menu { width: 100%; }
.contenedor-menu ul { list-style: none; }
.contenedor-menu .menu li a {
	color: white;
	display: block;
	padding: 15px 20px;
	background: #809bbf;
}
.contenedor-menu .menu li a:hover { background: #3d5a73; color: #fff; } 
.contenedor-menu .menu i.fa { 
	font-size: 12px; 
	line-height: 18px; 
	float: right; 
}

.contenedor-menu .menu ul {
	padding: 0; 
	display: none; 
}
.contenedor-menu .menu ul li a {
	background: #424242;
	color: #e9e9e9;
}

.contenedor-menu .menu .activado > a {
	background: #3d5a73;
	color: #fff;
}

</style>
<script>
$(document).ready(function() {
	$('.menu li:has(ul)').click(function(e) {
		e.preventDefault();

		if($(this).hasClass('activado')) {
			$(this).removeClass('activado');
			$(this).children('ul').slideUp();
		} else {
			$('.menu li ul').slideUp();
			$('.menu li').removeClass('activado');
			$(this).addClass('activado');
			$(this).children('ul').slideDown();
		}

		$('.menu li ul li a').click(function() {
			window.location.href = $(this).attr('href');
		})
	});
});
</script>
<aside style="height:100vh; width: 200px; background-color:#809bbf; float: left;">
<div class="contenedor-menu">
		<ul class="menu">
			<li id="index"><a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/images/logoA.png" width="160" height="100"></a></li>
			<li id="home"><a href="<%=request.getContextPath()%>/admin/adminMain.jsp">HOME<i class="fa fa-home"></i></a></li>
			<li id="buychart"><a href="#">BUY CHARTS<i class="fa fa-chevron-down"></i></a>
				<ul>
					<li><a href="<%=request.getContextPath()%>/realbook">책 실시간 구매 현황</a></li>
					<li><a href="<%=request.getContextPath()%>/top5book">책 판매량 Top 5</a></li>
					<li><a href="<%=request.getContextPath()%>/realvideo">비디오 실시간 구매 현황</a></li>
					<li><a href="<%=request.getContextPath()%>/top5video">비디오 판매량 Top 5</a></li>
				</ul>
			</li>
			<li id="adminshop"><a href="#">상품 관리<i class="fa fa-chevron-down"></i></a>
				<ul>
					<li ><a href="<%=request.getContextPath()%>/bookinsert">판매 도서 등록</a></li>
					<li><a href="<%=request.getContextPath()%>/booklist">판매 도서 리스트</a></li>
					<li><a href="<%=request.getContextPath()%>/videoinsert">판매 영상 등록</a></li>
					<li><a href="<%=request.getContextPath()%>/videolist">판매 영상 리스트</a></li>
				</ul>
			</li>
			<li id="adminmember"><a href="#">회원 관리<i class="fa fa-chevron-down"></i></a>
				<ul>
					<li><a href="<%=request.getContextPath()%>/memberlist">회원 리스트</a></li>
				</ul>
			</li>
		</ul>
	</div>
</aside>
</html>
