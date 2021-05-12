<%@page import="java.util.ArrayList"%>
<%@page import="board.qna.vo.Qna"%>
<%@page import="member.vo.Member"%>
<%@page import="board.qna.dao.QnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../view/header.jsp"%>

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
function test(){
	
}
</script>
</head>
<section class="content">
	<div class="profile">
		<img alt="profilePic" src="http://ipsumimage.appspot.com/50x50?l=이미지">
		<span class="welcome">${loginMember.nickname}님</span>
	</div>
	<div class="onoff tab-main">
		<ul class="tab">
			<li><a href="#" class="title">나의 프로필</a></li>
			<li><a href="#" class="title">일정관리</a></li>
			<li><button type="button" class="title" onclick="test();">내가쓴글</button></li>
			<li><a href="#" class="title">내영상보기</a></li>
		</ul>
		<div class="tab-cont">
			<!-- //탭1 -->
			<div class="cont">
			<table>
				<tr>
					<td>아이디<span class="required">(필수)</span></td>
					<td colspan="2"><input type="text" name="id" id="id" readonly value="${loginMember.id}"></td>
				</tr>
				<tr>
					<td>닉네임<span class="required">(필수)</span></td>
					<td><input type="text" name="nickname" id="nickname" value="${loginMember.nickname}"></td>
					<td><span class="desc"> 1~8자의 한글, 영문자, 숫자만 사용
							가능합니다.</span></td>
				</tr>
				<tr>
					<td>비밀번호<span class="required">(필수)</span></td>
					<td><input type="password" name="password1" id="password1" value="${loginMember.password}"></td>
					<td><span class="desc"> 8~15자의 영문자, 숫자,
							특수문자(!, @, #, $, %, ^, &, *)만 사용 가능합니다.</span></td>
				</tr>
				<tr>
					<td>비밀번호 확인<span class="required">(필수)</span></td>
					<td><input type="password" name="password2" id="password2" value="${loginMember.password}"></td>
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
					<td><input type="text" name="passanswer" id="passanswer" value="${loginMember.passanswer}"></td>
					<td><span class="desc"> 1~20자의 한글, 영문자, 숫자만
							사용 가능합니다.</span></td>
				</tr>
				<tr>
					<td>주소<span class="optional">(선택)</span></td>
					<td colspan="2"><input type="text" id="sample6_postcode" name="postcode" readonly style="margin-bottom:5px" value="${loginMember.postcode}"><br>
						<input type="text" id="sample6_address" name="address1" readonly  style="margin-bottom:5px" value="${loginMember.address1}"><br>
						<input type="text" id="sample6_detailAddress" name="address2" style="margin-bottom:5px" value="${loginMember.address2}"><br>
						<input type="text" id="sample6_extraAddress" name="address3" readonly style="margin-bottom:5px" value="${loginMember.address3}"></td>
				</tr>
				<tr>
					<td>전화번호<span class="optional">(선택)</span></td>
					<td><input type="text" name="tel" id="tel"  value="${loginMember.tel}"></td>
					<td><span class="desc"> 10~13자의 숫자만 사용 가능합니다.</span></td>
				</tr>
				<tr>
					<td>이메일<span class="optional">(선택)</span></td>
					<td><input type="text" name="email" id="email" value="${loginMember.email}"></td>
					<td><span class="desc"> 8~15자의 영문자, 숫자,
							특수문자(@)만 사용 가능합니다.</span></td>
				</tr>
				<tr>
					<td colspan="3"><label><input type="checkbox"
							name="agree" value="2"> 도와줘~ 잡스!의 다양한 소식을 받아보겠습니다(선택)</label></td>
				</tr>
				<tr>
					<td colspan="3"><input type="button" value="수정"
						onclick="showPopup('myPageProfileUpdate.jsp', 'popup');"></td>
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
						<button type="button" class="title" id="myPost">나의 게시글</button></li>
						<li><button type="button" class="title" id="myReply">나의 답글</button></li>
					</ul>
					<div class="tab-cont">
						<!-- //탭3-1 -->
						<div class="cont">
							<!-- 내 글 목록 -->
							<table style="text-align: center; border: 1px solid #dddddd">
								<tr>
									<th style="background-color: #eeeeee; text-align: center;">번호</th>
									<th style="background-color: #eeeeee; text-align: center;">조회수</th>
									<th style="background-color: #eeeeee; text-align: center;">추천수</th>
									<th style="background-color: #eeeeee; text-align: center;">댓글
										수</th>
									<th style="background-color: #eeeeee; text-align: center;">카테고리</th>
									<th style="background-color: #eeeeee; text-align: center;">제목</th>
									<th style="background-color: #eeeeee; text-align: center;">작성자</th>
									<th style="background-color: #eeeeee; text-align: center;">작성일</th>
								</tr>
								<c:forEach items="${qlist }" var='q'>
									<tr>
										<td>${q.qno }</td>
										<td>${q.qviewcnt }</td>
										<td>${q.qlikecnt }</td>
										<td>${q.rqnacnt }</td>
										<td><c:choose>
												<c:when test="${q.qtag ==1}">Java</c:when>
												<c:when test="${q.qtag ==2}">C</c:when>
												<c:when test="${q.qtag ==3}">Python</c:when>
											</c:choose></td>
										<td><a href="qnaread?qno=${q.qno}">${q.qsubject }</a></td>
										<td>${q.qwriter }</td>
										<td>${q.qdate }</td>
									</tr>
								</c:forEach>
								<tr>
								</tr>
							</table>
							<div id="page">
								<c:if test="${startPage !=1 }">
									<a
										href="qnalist?pageNum=${startPage -1 }&search=${search }&searchType=${searchType}">&#60;&#60;</a>
								</c:if>

								<c:forEach begin="${startPage }" end="${endPage }" var="s"
									step="1">
									<a
										href="qnalist?pageNum=${s }&search=${search }&searchType=${searchType}">${s }</a>
								</c:forEach>



								<c:if test="${endPage < pageBoxCnt }">
									<a
										href="qnalist?pageNum=${endPage +1 }&search=${search }&searchType=${searchType}">&#62;&#62;</a>
								</c:if>
								</div>

							</div>

							<!-- //탭3-2 -->
						<div class="cont">
							<!-- 내 댓글 목록 -->
						</div>
					</div>
				</div>
			</div>

			<!-- 탭4// -->
			<div class="cont">
				<%@include file="myVideo.jsp" %>
			</div>
		</div>
	</div>
<%@include file="../view/footer.jsp"%>
</section>
</html>