<%@page import="java.util.ArrayList"%>
<%@page import="board.qna.vo.Qna"%>
<%@page import="member.vo.Member"%>
<%@page import="board.qna.dao.QnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../view/header.jsp"%>
<!-- tab 버튼 디자인 -->
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
	height: 30px;
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
	height: 30px;
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

<!-- qlist.jsp의 디자인 -->
<style>
	.qna {
	margin : 40px 0 20px 10px;
	text-align:left;
	font-size:17px;
	}
	#searchType {
	width:80px;
	height:65px;
	border: none;
	font-size:18px;
	color:#aca4ae;
	margin:0;
	padding:0;
	}
	#searchType:hover {
	color:black;
	transition: color 0.15s ease-in-out;
	}
	
	#search {
	width: 590px;
	height:65px;
	top: 0;
	background-color: #efeff3;
	border: none;  
	font-size:18px;
	margin:0;
	padding:0;
	}
	#search:hover {
	color: black;
	background-color: #ffffff;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	box-shadow: 10px 10px 10px #eeeeee;
	}
	
	#write {
	width:100px;
	height:65px;
	background-color:#1abc9c;
	border:none;
	color:#ffffff;
	border-radius: 4px;
	float:right;
	font-size:18px;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	margin-left:10px;
	padding:0;
	}
	#write:hover {
	color:#2c3e50;
	background-color: #ffffff;
	box-shadow: 10px 10px 10px #eeeeee;
	
	}
	
	#table {
	clear:both;
	width:800px;
	margin-right:auto;
	margin-left:auto;
<!-- height: 2000px;  이거 지움 -->
	}
	
	table > tr > td:first-child                {width:5%;} /*No 열 크기*/
	table > tr > td:first-child +td				{width:5%;} /*No 열 크기*/
	table > tr > td:first-child +td+td         {width:5%;} /*No 열 크기*/
	table > tr > td:first-child +td+td+td      {width:65%;} /*제목 열 크기*/
	table > tr > td:first-child +td+td+td+td   {width:20%;} /*작성일 열 크기*/
	
	#subject {
	color:#0054FF; 
	font-size:18px; 
	text-decoration:none;
	}
	
	#subject:hover {
	color:#0100FF;
	}

	#page {
	padding: 6px 12px;
    margin-left: -1px;
    color: #337ab7;
    text-decoration: none;
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
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
function showPopup(url, name) { 
	window.open(url, name, "width=1000px, height=500px resizable=no");
	
}
</script>
<script>
$(document).ready(function(){
    $("select option[value='${loginMember.passquestion}']").attr("selected", true);
});
</script>
<script>
$(document).ready(function () {


});
</script>
</head>
<body class="content">
	<div class="profile">
		<img alt="profilePic" src="http://ipsumimage.appspot.com/50x50?l=이미지">
		<span class="welcome">${loginMember.nickname}님</span>
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
				<table>
					<tr>
						<td>아이디<span class="required">(필수)</span></td>
						<td colspan="2"><input type="text" name="id" id="id" readonly
							value="${loginMember.id}"></td>
					</tr>
					<tr>
						<td>닉네임<span class="required">(필수)</span></td>
						<td><input type="text" name="nickname" id="nickname"
							value="${loginMember.nickname}"></td>
						<td><span class="desc"> 1~8자의 한글, 영문자, 숫자만 사용 가능합니다.</span></td>
					</tr>
					<tr>
						<td>비밀번호<span class="required">(필수)</span></td>
						<td><input type="password" name="password1" id="password1"
							value="${loginMember.password}"></td>
						<td><span class="desc"> 8~15자의 영문자, 숫자, 특수문자(!, @, #,
								$, %, ^, &, *)만 사용 가능합니다.</span></td>
					</tr>
					<tr>
						<td>비밀번호 확인<span class="required">(필수)</span></td>
						<td><input type="password" name="password2" id="password2"
							value="${loginMember.password}"></td>
						<td><span id="passcheck"></span></td>
					</tr>
					<tr>
						<td>비밀번호 질문<span class="required">(필수)</span></td>
						<td><select name="passquestion" id="passquestion">
								<option value="0">비밀번호 질문을 선택해주세요</option>
								<option value="1">첫 수학여행 장소는?</option>
								<option value="2">가장 친한 친구의 이름은?</option>
								<option value="3">첫 해외여행지는?</option>
								<option value="4">어린시절 자신의 별명은?</option>
						</select></td>
					</tr>
					<tr>
						<td>비밀번호 답변<span class="required">(필수)</span></td>
						<td><input type="text" name="passanswer" id="passanswer"
							value="${loginMember.passanswer}"></td>
						<td><span class="desc"> 1~20자의 한글, 영문자, 숫자만 사용 가능합니다.</span></td>
					</tr>
					<tr>
						<td>주소<span class="optional">(선택)</span></td>
						<td colspan="2"><input type="text" id="sample6_postcode"
							name="postcode" readonly style="margin-bottom: 5px"
							value="${loginMember.postcode}"><br> <input
							type="text" id="sample6_address" name="address1" readonly
							style="margin-bottom: 5px" value="${loginMember.address1}"><br>
							<input type="text" id="sample6_detailAddress" name="address2"
							style="margin-bottom: 5px" value="${loginMember.address2}"><br>
							<input type="text" id="sample6_extraAddress" name="address3"
							readonly style="margin-bottom: 5px"
							value="${loginMember.address3}"></td>
					</tr>
					<tr>
						<td>전화번호<span class="optional">(선택)</span></td>
						<td><input type="text" name="tel" id="tel"
							value="${loginMember.tel}"></td>
						<td><span class="desc"> 10~13자의 숫자만 사용 가능합니다.</span></td>
					</tr>
					<tr>
						<td>이메일<span class="optional">(선택)</span></td>
						<td><input type="text" name="email" id="email"
							value="${loginMember.email}"></td>
						<td><span class="desc"> 8~15자의 영문자, 숫자, 특수문자(@)만 사용
								가능합니다.</span></td>
					</tr>
					<tr>
						<td colspan="3"><label><input type="checkbox"
								name="agree" value="2"> 도와줘~ 잡스!의 다양한 소식을 받아보겠습니다(선택)</label></td>
					</tr>
					<tr>
						<td colspan="3"><input type="button" value="수정"
							onclick="showPopup('<%=request.getContextPath()%>/myPage/myPageProfileUpdate.jsp', 'popup');"></td>
					</tr>
				</table>
			</div>

			<!-- //탭2 -->
			<div class="cont">
				<p>캘린더 넣기</p>
			</div>

			<!-- //탭3 -->
			<div class="cont">
				<div class="onoff tab-sub">
					<ul class="tab">
						<li>
							<button type="button" class="title" id="myPost">나의 게시글</button>
						</li>
						<li><button type="button" class="title" id="myReply">댓글 단 글</button></li>
					</ul>
					<div class="tab-cont">
						<!-- //탭3-1 -->
						<div class="cont">
							<!-- 내 글 목록 -->
							<div style="width: 800px; margin: 0 auto 0 auto; color: #aca4ae;">
								<div class="qna">
									Q&A 게시판 <a onclick="myqlist();">더보기</a>
								</div>
								<table id="table" style="border: 1;">
									<c:forEach items="${qlist }" var='q'>
										<tr style="border-bottom: 1px solid #eeeeee;">
											<td style="width: 50px; font-size: 14px;"><a
												style="font-size: 18px;">${q.qviewcnt }</a><br>조회</td>
											<td style="width: 50px;"><a style="font-size: 18px;">${q.qlikecnt }</a><br>좋아요</td>
											<td style="width: 50px;"><a style="font-size: 18px;">${q.rqnacnt }</a><br>답변</td>
											<td style="text-align: left; width: 450px;"><a
												href="qnaread?qno=${q.qno}" id="subject">${q.qsubject }</a>
												<br> <c:choose>
													<c:when test="${q.qtag ==1}">Java</c:when>
													<c:when test="${q.qtag ==2}">C</c:when>
													<c:when test="${q.qtag ==3}">Python</c:when>
												</c:choose></td>
											<td><a style="color: #0054FF; text-align: left;">${q.qwriter }</a>
												<br> <a style="font-size: 13px;">${q.qdate }</a></td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
<<<<<<< HEAD
						<!-- //탭3-2 -->
						<div class="cont">
							<!-- 내 댓글 목록 -->
=======
							<!-- //탭3-2 -->
							<div class="cont">
								<!-- 댓글단 글 목록 -->
								<div
									style="width: 800px; margin: 0 auto 0 auto; color: #aca4ae;">
									<div class="qna">
										Q&A 게시판 <a onclick="myrqlist();">더보기</a>
									</div>
									<table id="table" style="border: 1;">
										<c:forEach items="${rqlist }" var='r'>
											<tr style="border-bottom: 1px solid #eeeeee;">
												<td style="width: 50px; font-size: 14px;"><a
													style="font-size: 18px;">${r.qviewcnt }</a><br>조회</td>
												<td style="width: 50px;"><a style="font-size: 18px;">${r.qlikecnt }</a><br>좋아요</td>
												<td style="width: 50px;"><a style="font-size: 18px;">${r.rqnacnt }</a><br>답변</td>
												<td style="text-align: left; width: 450px;"><a
													href="qnaread?qno=${r.qno}" id="subject">${r.qsubject }</a>
													<br> <c:choose>
														<c:when test="${r.qtag ==1}">Java</c:when>
														<c:when test="${r.qtag ==2}">C</c:when>
														<c:when test="${r.qtag ==3}">Python</c:when>
													</c:choose></td>
												<td><a style="color: #0054FF; text-align: left;">${r.qwriter }</a>
													<br> <a style="font-size: 13px;">${r.qdate }</a></td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 탭4// -->
				<div class="cont">
					<%@include file="myVideo.jsp"%>
				</div>
		</div>
	</div>
		<script>
=======
			<div class="cont">
				<%@include file="myVideo.jsp"%>
			</div>
		</div>
	</div>
	<script>
>>>>>>> f29b2ff031b17c0d665d89ff2a3eed70b89635e8
			function myqlist() {
				window.open("<%=request.getContextPath()%>/myqlist", "myQna", "width=1000px, height=500px, resizable = no, left= 100, top=100");
				
			};
			
			function myrqlist() {
				window.open("<%=request.getContextPath()%>/myrqlist", "myRqna",	"width=1000px, height=500px, resizable = no, left= 100, top=100");

			};
		</script>
</body>
</html>
<%@include file="../view/footer.jsp"%>