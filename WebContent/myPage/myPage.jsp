<%@page import="member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../view/header.jsp"%>
<%
	Member vo = (Member) request.getSession().getAttribute("loginMember");
%>
<style>
/* Style the tab */
.tab {
  overflow: hidden;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: #2c3e50;
  color: white;
  float: left;
  min-width: 100px;
  border: 1px solid #2c3e50;
  border-radius: 10px;
  outline: none;
  cursor: pointer;
  margin-right:10px;
  padding: 14px 16px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  color :#1abc9c;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #2c3e50;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: none;
  border-top: none;
}

.profile{
	width: 1240px;
	height: 60px;
	text-align: left;
	float: left;
	line-height: 1em;
}

.welcome{
	width: 100px;
	height: 50px;
	display: inline-block;
}

.tab{
	clear: both;
}
 hr {
 	margin: 10px 0;
 }

</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <script>
 function openTab(evt, tabName) {
	  var i, tabcontent, tablinks;
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }
	  tablinks = document.getElementsByClassName("tablinks");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace(" active", "");
	  }
	  document.getElementById(tabName).style.display = "block";
	  evt.currentTarget.className += " active";
	}
    </script>
<body class="content">
<div class="profile">
	<img alt="profilePic" src="http://ipsumimage.appspot.com/50x50?l=이미지"> 
	<span class="welcome"><%=vo.getNickname()%>님</span>
</div>
	<div class="tab">
		<button class="tablinks" onclick="openTab(event, 'myProfile')">나의 프로필</button>
		<button class="tablinks" onclick="openTab(event, 'myCalendar')">일정관리</button>
		<button class="tablinks" onclick="openTab(event, 'myPost')">내가 쓴 글</button>
		<button class="tablinks" onclick="openTab(event, 'myVideo')">내 영상 보기</button>
	</div>
	<hr>

	<div id="myProfile" class="tabcontent">
		<p>테이블 넣기</p>
	</div>

	<div id="myCalendar" class="tabcontent">
		<p>달력이랑 연결</p>
	</div>

	<div id="myPost" class="tabcontent">
		<p>내가 쓴 글 / 내 댓글 탭 메뉴 추가</p>
	</div>
	<div id="myVideo" class="tabcontent">
		<p>구매한 영상 목록</p>
	</div>

</body>
<%@include file="../view/footer.jsp"%>
