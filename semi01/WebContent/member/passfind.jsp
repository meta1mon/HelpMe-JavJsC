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
	// 아이디와 비밀번호 답변의 형식이 맞는지 체크
	var idCheck = false;
	var passAnswerCheck = false;
	
	$(function() {
		$("#id").keyup(function() {
			var id = $("#id").val().trim();
			var reg1 = /^[A-Za-z0-9]{4,15}$/g;
			if (!reg1.test(id)) {
				$("#idcheck").text("아이디 형식이 잘못되었습니다");
				$("#idcheck").css("color", "red");
				$("#idcheck").css("font-size", "1px");
				idCheck = false;
			} else {
				$("#idcheck").text("올바른 아이디 형식입니다");
				$("#idcheck").css("color", "blue");
				$("#idcheck").css("font-size", "1px");
				idCheck = true;
			}
		});
		$("#passanswer").keyup(function() {
			var passanswer = $("#passanswer").val().trim();
			var reg4 = /^[가-힣A-Za-z0-9]{1,20}$/g;
			if (!reg4.test(passanswer)) {
				$("#passanswercheck").text("비밀번호 답변 형식이 잘못되었습니다");
				$("#passanswercheck").css("color", "red");
				$("#passanswercheck").css("font-size", "1px");
				passAnswerCheck = false;
			} else {
				$("#passanswercheck").text("올바른 비밀번호 답변 형식입니다");
				$("#passanswercheck").css("color", "blue");
				$("#passanswercheck").css("font-size", "1px");
				passAnswerCheck = true;
			}
		});

	});
	
	function findPass() {
		if(idCheck == false) {
			alert("아이디 형식을 확인해주세요");
			return false;
		}
		if($("#passquestion").val() == "") {
			alert("비밀번호 질문을 선택해주세요");
			return false;
		}
		if(passAnswerCheck == false) {
			alert("비밀번호 답변 형식을 확인해주세요");
			return false;
		}
		return true;
	}
</script>
</head>

<body class="content">
	<div>
		<form action="<%=request.getContextPath()%>/findpassword"
			method="post">
			<h1>비밀번호 찾기</h1>
			<span id="idcheck"></span> <br> <input type="text" name="id"
				placeholder="아이디를 입력해주세요" id="id"> <br> <select
				name="passquestion" id="passquestion">
				<option value="">비밀번호 질문을 선택해주세요</option>
				<option value="1">첫 수학여행 장소는?</option>
				<option value="2">가장 친한 친구의 이름은?</option>
				<option value="3">첫 해외여행지는?</option>
				<option value="4">어린시절 자신의 별명은?</option>
			</select> <br> <span id="passanswercheck"></span> <br> <input
				type="text" name="passanswer" placeholder="답변을 입력해주세요"
				id="passanswer"> <br> <input type="submit"
				onclick="return findPass();" value="비밀번호 찾기">
				<input type="button"
				onclick="location.href='login.jsp'" value="로그인으로 이동">
		</form>
	</div>
</body>

</html>