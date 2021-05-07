<%@page import="member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../view/header.jsp"%>
<%
	Member vo = (Member) request.getSession().getAttribute("loginMember");
%>
<style>
/*profile*/
.profile{
	width: 1240px;
	height: 60px;
	text-align: left;
	float: left;
	line-height: 1em;
}

/* tab */
ul, li {
	margin: 0;
	padding: 0;
	list-style: none;
}

a {
	text-decoration: none;
}

.tab-main {
	display: block;
	clear: both;
	margin-top: 20px;
}

.tab-main:after {
	display: block;
	height: 0;
	content: ".";
	font-size: 0;
	visibility: hidden;
	clear: both
}

.tab-main>.tab>li {
	float: left;
	margin-right: 7px;
	text-align: center;
	border-radius: 7px;
	border: none;
}

.tab-main>.tab .title {
	display: block;
	padding: 10px;
	color: #fff;
	border-radius: 7px;
	background-color: #2c3e50;
	cursor: pointer;
}

.tab-main>.tab .on {
	position: relative;
}

.tab-main>.tab .on .title {
	color: #00e1d3;
}

.tab-main>.tab-cont {
	float: left;
	width: 1000px;
	clear: both;
	margin-top: 10px;
	border-radius: 7px;
	color: black;
}

.tab-main>.tab-cont>.cont {
	padding: 20px;
	background-color: white;
	border-top: 1px solid black;
	box-sizing: border-box;
	width: 1240px;
}

.tab-main .comm_refer {
	margin: 5px 0 18px 15px
}

.tab-sub {
	display: block;
	clear: both;
}

.tab-sub:after {
	display: block;
	height: 0;
	content: ".";
	font-size: 0;
	visibility: hidden;
	clear: both
}

.tab-sub>.tab {
	float: left;
}

.tab-sub>.tab>li {
	float: left;
	text-align: center;
	font-size: 13px;
	white-space: nowrap;
	margin-left: 4px;
}

.tab-sub>.tab .title {
	display: block;
	height: 20px;
	padding: 5px 20px;
	font-weight: bold;
	color: white;
	border-top-left-radius: 7px;
	border-top-right-radius: 7px;
	border: none;
	background-color: #2c3e50;
	cursor: pointer;
}

.tab-sub>.tab .on {
	position: relative;
}

.tab-sub>.tab .on .title {
	height: 20px;
	background-color: #2c3e50;
	color: #1abc9c;
}

.tab-sub>.tab-cont {
	float: left;
	width: 960px;
	clear: both;
}

.tab-sub>.tab-cont .cont {
	padding: 25px;
	color: black;
	background-color: white;
	box-sizing: border-box;
	width: 1200px;
	border: 1px solid black;
}

.tab-sub>.tab-cont>.cont:last-child {
	border-top-right-radius: 0
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						//탭(ul) onoff
						$('.onoff>.tab-cont').children().css('display', 'none');
						$('.onoff>.tab-cont div:first-child').css('display',
								'block');
						$('.onoff>.tab li:first-child').addClass('on');
						$('.onoff')
								.delegate(
										'.tab>li',
										'click',
										function() {
											var index = $(this).parent()
													.children().index(this);
											$(this).siblings().removeClass();
											$(this).addClass('on');
											$(this).parent().next('.tab-cont')
													.children().hide()
													.eq(index).show();
										});
					});
</script>
</head>
<body class="content">
	<div class="profile">
		<img alt="profilePic" src="http://ipsumimage.appspot.com/50x50?l=이미지">
		<span class="welcome"><%=vo.getNickname()%>님</span>
	</div>
	<div class="onoff tab-main">
		<ul class="tab">
			<li><a href="#" class="title">나의 프로필</a></li>
			<li><a href="#" class="title">일정관리</a></li>
			<li><a href="#" class="title">내가쓴글</a></li>
			<li><a href="#" class="title">내영상보기</a></li>
		</ul>
		<div class="tab-cont">
			<!-- //탭1 -->
			<div class="cont">
				<p>테이블 만들기 닉네임/비밀번호/비밀번호질문/답변/주소/이메일/가입날짜</p>
			</div>

			<!-- //탭2 -->
			<div class="cont">
				<p>캘린더 넣기</p>
			</div>

			<!-- //탭3 -->
			<div class="cont">
				<div class="onoff tab-sub">
					<ul class="tab">
						<li><a href="#" class="title">나의 게시글</a></li>
						<li><a href="#" class="title">나의 답글</a></li>
					</ul>
					<div class="tab-cont">
						<!-- //탭3-1 -->
						<div class="cont">
							<p>글 목록</p>
						</div>

						<!-- //탭3-2 -->
						<div class="cont">
							<p>댓글 목록</p>
						</div>
					</div>
				</div>
			</div>

			<!-- 탭4// -->
			<div class="cont">
				<p>구매한 영상 목록</p>
			</div>
		</div>
	</div>
</body>
</html>
<%@include file="../view/footer.jsp"%>