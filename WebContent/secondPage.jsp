<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/style/carousel.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>

<style>
.flip-box {
	background-color: transparent;
	height: 200px;
	perspective: 1000px;
}

.flip-box-inner {
	position: relative;
	width: 100%;
	height: 100%;
	text-align: center;
	transition: transform 0.5s;
	transform-style: preserve-3d;
}

.flip-box:hover .flip-box-inner {
	transform: rotateY(180deg);
}

.flip-box-front, .flip-box-back {
	position: absolute;
	width: 100%;
	height: 100%;
	-webkit-backface-visibility: hidden;
	backface-visibility: hidden;
}

.flip-box-front {
	background-color: #2c3e50;
	color: white;
	border-radius: 5px;
}

h2 {
	margin-top: 84px;
}

.flip-box-back {
	background-color: #1abc9c;
	color: white;
	transform: rotateY(180deg);
	border-radius: 5px;
}

a {
	text-decoration: none;
	color: white;
}

a:visited {
	color: white;
}
</style>
</head>
<%@include file="../view/header.jsp"%>
<body class="content">
	<div
		style="width: 800px; text-align: center; margin-left: auto; margin-right: auto;">
		<br>
		<!-- 게시판 바로가기 -->
		<table style="margin-left: auto; margin-right: auto;">
			<tr>
				<!-- 배너 부분 carousel -->
				<td colspan="3">
					<div class="slider">
						<div id="myCarousel" class="carousel slide" data-ride="carousel">
							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<div class="item active">
									<img src="http://ipsumimage.appspot.com/750x500?l=예시1"
										style="width: 100%;">
								</div>

								<div class="item">
									<img src="http://ipsumimage.appspot.com/750x500?l=예시2"
										style="width: 100%;">
								</div>

								<div class="item">
									<img src="http://ipsumimage.appspot.com/750x500?l=예시3"
										style="width: 100%;">
								</div>
							</div>

							<!-- Left and right controls -->
							<a class="left carousel-control" href="#myCarousel"
								data-slide="prev"> <span
								class="glyphicon fas fa-chevron-left"></span> <span
								class="sr-only">Previous</span>
							</a> <a class="right carousel-control" href="#myCarousel"
								data-slide="next"> <span
								class="glyphicon fas fa-chevron-right"></span> <span
								class="sr-only">Next</span>
							</a>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td class="ink"><a href="<%=request.getContextPath()%>/qnalist"><div
							class="flip-box">
							<div class="flip-box-inner">
								<div class="flip-box-front">
									<h2>Q&A</h2>
								</div>
								<div class="flip-box-back">
									<P>자유롭게 묻고 답하세요!</P>
								</div>
							</div>
						</div></a></td>
				<td class="ink"><a href="#"><div class="flip-box">
							<div class="flip-box-inner">
								<div class="flip-box-front">
									<h2>STUDY</h2>
								</div>
								<div class="flip-box-back">
									<p>스터디를 구하고 참여해보세요!</p>
								</div>
							</div>
						</div></td>
				<td class="ink"><a href="#"><div class="flip-box">
							<div class="flip-box-inner">
								<div class="flip-box-front">
									<h2>REVIEW</h2>
								</div>
								<div class="flip-box-back">
									<p>자유롭게 후기를 남겨주세요!</p>
								</div>
							</div>
						</div></a></td>
			</tr>
			<tr>
				<td class="ink"><a href="#"><div class="flip-box">
							<div class="flip-box-inner">
								<div class="flip-box-front">
									<h2>SHOP</h2>
								</div>
								<div class="flip-box-back">
									<p>관련 영상과 서적을 구매해보세요!</p>
								</div>
							</div>
						</div></a></td>
				<td class="ink"><a href="#"><div class="flip-box">
							<div class="flip-box-inner">
								<div class="flip-box-front">
									<h2 style="margin-top: 68px !important;">RECRUIT<BR>CALENDAR</h2>
								</div>
								<div class="flip-box-back">
									<p>공채 캘린더를 확인해보세요!</p>
								</div>
							</div>
						</div></a></td>
				<td class="ink"><a
					href="<%=request.getContextPath()%>/calendar/main.jsp"><div
							class="flip-box">
							<div class="flip-box-inner">
								<div class="flip-box-front">
									<h2>ABOUT US</h2>
								</div>
								<div class="flip-box-back">
									<p>저희가 궁금하시다면!</p>
								</div>
							</div>
						</div></a></td>
			</tr>
		</table>
	</div>
</body>
<%@include file="../view/footer.jsp"%>