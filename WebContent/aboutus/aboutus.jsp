<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.img {
	position: relative;
	bottom: 80px;
	right: 20px;
	background-image:
		url(https://cdn.sstatic.net/Img/company/bg-header-mobile.png?v=41b67237cebd);
	height: 1100px;
	background-size: cover;
}

.img-cover {
	position: absolute;
	height: 100%;
	width: 100%;
	/*      background-color: rgba(0, 0, 0, 0.5);                                                                  */
	z-index: 1;
}

.img .content {
	position: absolute;
	top: 55%;
	left: 55%;
	transform: translate(-50%, -50%);
	font-size: 2rem;
	text-shadow: 2px 2px 5px #black;
	color: black;
	z-index: 2;
	text-align: center;
	color: #ffffff;
}

.logo {
	font-size: 40px;
	background:#eeeeee;
	padding:20px;
}

#subject {
	font-size: 25px;
	margin: 20px;
}

#table1 {
	margin: 0 auto;
	box-shadow: 0 12px 11px rgb(0 0 0/ 4%);
	line-height: 250%;
	width: 1000px;
	text-align:center;
	height:400px;
}

#table2 {
	margin: 50px auto;
	line-height: 250%;
	width: 800px;
	text-align:center;
	height:400px;
}

#table2 td {
	border:1px solid #eeeeee;
	border-radius: 30px;
	width:265px; 
	height:265px;
}

</style>
</head>
<%@include file="../view/header.jsp"%>
<body class="content">
	<div class="img">
		<div class="content">
			<h1>도와줘 잡스씨</h1>
		</div>
		<div class="img-cover"></div>
	</div>
	<div
		style="width: 1200px; margin: 0; color: black; background: #ffffff; border-radius: 4px; text-align: center; padding: 100px 0 100px 0; position: relative; bottom: 80px; height:2100px">

		<img src="<%=request.getContextPath()%>/images/logo.png"
				class="logo">
		<br>
		<div id="subject">
			<br>도와줘 잡스씨는 회원님께 <br>
			다양한 서비스와 편의를 제공하는 커뮤니티 플랫폼입니다.<br><br>
			 단순한 기술 커뮤니티를 넘어, SW개발자의 <br>
			 기술과 삶을 나누는 공간으로서의 역할을 담당하고 있습니다.
		</div>
		<br>
		<br>

		<table id="table1">
			<tr>
				<td><i class="fas fa-comments"
					style="font-size: 160px; color: #FED02F;"></i><br>
					<div
						style="font-size: 20px; text-align: center; padding: 30px 10px 0 10px;">게시판</div>
					 게시판에서는 개발자들간 자유롭게<br> 의견을 나눌 수 있습니다.</td>

				<td><i class="fas fa-shopping-cart"
					style="font-size: 160px; color: #9AD3FD;"></i><br>
					<div
						style="font-size: 20px; text-align: center; padding: 30px 10px 0 10px;">쇼핑몰</div>
					 도서와 온라인 인터넷 강의를<br> 구매, 수강할 수 있습니다.</td>

				<td><i class="fas fa-calendar-alt"
					style="font-size: 160px; color: #80FF00;"></i><br>
					<div
						style="font-size: 20px; text-align: center; padding: 30px 10px 0 10px;">캘린더</div>
					 실제 다이어리처럼 멋진 디자인과 <br>쉽고 빠른 완성을 추구하고 있습니다.</td>
			</tr>
		</table>
	<br><br><br>
	<i style="font-size:80px; color:#d5d5d5;" class="fas fa-users"></i><br>
	<div style="font-size:35px; padding:20px;">OUR AMAZING TEAM</div>
	<div style="font-size:25px;">일조맥직<br>一條驀直<br></div>하나의 길로만 부지런히 똑바로 가라는 뜻.<br>
	
<table id="table2">
			<tr>
				<td><img src="<%=request.getContextPath()%>/images/승연.png" style="width:200px;">
					<br>
					<div
						style="font-size: 20px; text-align: center; padding: 0 0 0 10px;">이승연</div>
					 Developer</td>

				<td rowspan="2"><img src="<%=request.getContextPath()%>/images/재훈.png" style="width:200px;">
					<br>
					<div
						style="font-size: 20px; text-align: center; padding: 0 0 0 10px;">정재훈</div>
					 Developer</td>

				<td><img src="<%=request.getContextPath()%>/images/연준.png" style="width:200px;">
				<br>
					<div
						style="font-size: 20px; text-align: center; padding: 0 0 0 10px;">김연준</div>
					 Developer</td>
			</tr>
			
			<tr>
				<td><img src="<%=request.getContextPath()%>/images/승하.png" style="width:200px;">
				<br>
					<div
						style="font-size: 20px; text-align: center; padding: 0 0 0 10px;">제승하</div>
					 Developer</td>

				<td><img src="<%=request.getContextPath()%>/images/도경.png" style="width:200px;">
				<br>
					<div
						style="font-size: 20px; text-align: center; padding: 0 0 0 10px;">하도경</div>
					 Developer</td>
			</tr>
		</table>
	</div>
</body>
<%@include file="../view/footer.jsp"%>