<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기</title>
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
			<h1>비밀번호 찾기</h1>
			<span id="idcheck"></span> <input type="text" name="id"
				placeholder="아이디를 입력해주세요"> <br> <select
				name="passquestion">
				<option value="">비밀번호 질문을 선택해주세요</option>
				<option value="1">첫 수학여행 장소는?</option>
				<option value="2">가장 친한 친구의 이름은?</option>
				<option value="3">첫 해외여행지는?</option>
				<option value="4">어린시절 자신의 별명은?</option>
			</select> <br> <input type="text" name="passanswer"
				placeholder="답변을 입력해주세요">
		</form>
		<input type="button" onclick="location.href='passfind_good.html'"
			value="비밀번호 찾기">
	</div>
</body>

</html>