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
div {
	text-align: center;
	background-color: rgb(209, 202, 202);
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function() {
		$("#id").keyup(function() {
			var id = $("#id").val().trim();
			var reg1 = /^[A-Za-z0-9]{4,15}$/g;
			if (!reg1.test(id)) {
				$("#idcheck").text("아이디 형식이 잘못되었습니다");
				$("#idcheck").css("color", "red");
				$("#idcheck").css("font-size", "1px");
			} else {
				$("#idcheck").text("올바른 아이디 형식입니다");
				$("#idcheck").css("color", "blue");
				$("#idcheck").css("font-size", "1px");
			}
		});
		$("#password").keyup(function() {
			var password = $("#password").val().trim();
			var reg2 = /^[가-힣A-Za-z0-9!@#$%^&*()]{8,15}$/g;
			if (!reg2.test(password)) {
				$("#passcheck").text("비밀번호 형식이 잘못되었습니다");
				$("#passcheck").css("color", "red");
				$("#passcheck").css("font-size", "1px");
			} else {
				$("#passcheck").text("올바른 비밀번호 형식입니다");
				$("#passcheck").css("color", "blue");
				$("#passcheck").css("font-size", "1px");
			}
		});

	});
</script>
</head>

<body>
	<div>
		<form id="frm">
			<h1>로그인</h1>
			<span id="idcheck"></span> <br> <input type="text" id="id"
				name="id" placeholder="아이디를 입력해주세요"> <br> <span
				id="passcheck"></span> <br> <input type="password"
				id="password" name="password" placeholder="비밀번호를 입력해주세요"> <br>
			<span style="font-size: 1px">비밀번호를 잊으셨나요?</span> <br> <a
				href="passfind.html">비밀번호 찾기</a>
		</form>
		<button type="button" onclick="location.href='signup.html'">회원가입</button>
		<button type="button" onclick="alert('로그인 내용 미구현')">로그인하기</button>
	</div>

</body>

</html>