<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<style>
.loginFrm {
	text-align: center;
	background-color: rgb(209, 202, 202);
}

#btnLogin {
	display: none;
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
				$("#idcheck").css("font-size", "1px");
				rightId = false;
			} else {
				$("#idcheck").text("올바른 아이디 형식입니다");
				$("#idcheck").css("color", "blue");
				$("#idcheck").css("font-size", "1px");
				rightId = true;
			}
		});
		$("#password").keyup(function() {
			var password = $("#password").val().trim();
			var reg2 = /^[가-힣A-Za-z0-9!@#$%^&*()]{8,15}$/g;
			if (!reg2.test(password)) {
				$("#passcheck").text("비밀번호 형식이 잘못되었습니다");
				$("#passcheck").css("color", "red");
				$("#passcheck").css("font-size", "1px");
				rightPassword = false;
			} else {
				$("#passcheck").text("올바른 비밀번호 형식입니다");
				$("#passcheck").css("color", "blue");
				$("#passcheck").css("font-size", "1px");
				rightPassword = true;
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
	<div class="loginFrm">
		<form action="<%=request.getContextPath()%>/memberlogin" method="post">
			<h1>로그인</h1>
			<span id="idcheck"></span> <br> <input type="text" id="id"
				name="id" placeholder="아이디를 입력해주세요"> <br> <span
				id="passcheck"></span> <br> <input type="password"
				id="password" name="password" placeholder="비밀번호를 입력해주세요"> <br>
			<span style="font-size: 1px">비밀번호를 잊으셨나요?</span> <br> <a
				href="passfind.jsp">비밀번호 찾기</a> <br>
			<button type="submit" onclick="return login();">로그인하기</button>
			<button type="button" onclick="location.href='signup.jsp'">회원가입</button>
		</form>
	</div>

</body>
<%@include file="../view/footer.jsp"%>
</html>