<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
#loginbody {
	width: 400px;
	margin: 0 auto 0 auto;
}

#btnLogin {
	display: none;
}

input {
	width: 400px;
	height: 40px;
	font-size: 17px;
	padding-left: 10px;
}

#idcheck, #passcheck {
	float:left;
	margin: 10px 0;
	font-size: 13px;
}

#misspass {
	float:left;
	margin: 5px 0;
	font-size: 13px;
}

#showpass {
	float: right;
	font-size: 13px;
	margin: 5px 0;
	cursor: pointer;
	
}

#findpass {
	clear:both;
	float:left;
	margin: 5px 0;
	font-size: 13px;
	text-decoration: none;
	color: red;
}

#buttonbox {
	clear:both;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
// 아이디와 비밀번호의 형식을 체크
	var rightId = false;
	var rightPassword = false;

// 키를 입력할 때마다 아이디와 비밀번호의 형식을 검사함
	$(function() {
		$("#id").keyup(function() {
			var id = $("#id").val().trim();
			var reg1 = /^[A-Za-z0-9]{4,15}$/g;
			if (!reg1.test(id)) {
				$("#idcheck").text("아이디 형식이 잘못되었습니다");
				$("#idcheck").css("color", "red");
				rightId = false;
			} else {
				$("#idcheck").text("올바른 아이디 형식입니다");
				$("#idcheck").css("color", "blue");
				rightId = true;
			}
		});
		$("#password").keyup(function() {
			var password = $("#password").val().trim();
			var reg2 = /^[가-힣A-Za-z0-9!@#$%^&*()]{8,15}$/g;
			if (!reg2.test(password)) {
				$("#passcheck").text("비밀번호 형식이 잘못되었습니다");
				$("#passcheck").css("color", "red");
				rightPassword = false;
			} else {
				$("#passcheck").text("올바른 비밀번호 형식입니다");
				$("#passcheck").css("color", "blue");
				rightPassword = true;
			}
		});
		
		$("#showpass").click(function() {
			if($("#password").attr('type') == "password") {
				$("#password").attr('type', 'text');
				$("#bulb").attr('src', '<%=request.getContextPath() %>/images/big-lighton.png')
			} else {
				$("#password").attr('type', 'password');					
				$("#bulb").attr('src', '<%=request.getContextPath() %>/images/big-light.png')
			}
			
			
		});

	});

// 아이디와 비밀번호를 전송함
	function login() {
		if(rightId == false || rightPassword == false) {
			return false;			
		}
		return true;

	}
</script>
</head>
<%@include file="../view/header.jsp"%>
<body class="content">
<div id="loginbody">
	<div class="loginFrm">
		<form action="<%=request.getContextPath()%>/memberlogin" method="post">
			<h1>로그인</h1>
			<div><span id="idcheck">&nbsp;</span></div>
			<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요">
			<div><span id="passcheck">&nbsp;</span></div>
			<input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요"> <br>
			<span id="misspass">비밀번호를 잊으셨나요?</span>
			<span id="showpass">비밀번호 보기<img src="<%=request.getContextPath() %>/images/big-light.png" width="16" height="16" id="bulb"></span>
			<a href="<%=request.getContextPath() %>/movefindpass" id="findpass">비밀번호 찾기</a>
			<div id="buttonbox">
				<button type="submit" onclick="return login();" class="darkbutton">로그인하기</button>
				<button type="button" onclick="location.href='<%=request.getContextPath()%>/member/signup.jsp'" class="darkbutton">회원가입</button>
			</div>
		</form>
	</div>
</div>
</body>
<%@include file="../view/footer.jsp"%>
</html>
