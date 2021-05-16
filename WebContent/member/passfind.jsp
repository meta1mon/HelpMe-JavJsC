<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
table {
	margin: 0 auto;
}

td {
	padding: 5px 0;
}
input{
	width: 400px;
	height: 40px;
	font-size: 17px;
	padding-left: 10px;
}

select {
	width: 400px;
	height: 40px;
	background-color:rgba(255, 255, 255, 0.5);
	padding-left: 10px;
}

span {
	display: block;
	float: left;
	font-size: 13px;
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
				idCheck = false;
			} else {
				$("#idcheck").text("올바른 아이디 형식입니다");
				$("#idcheck").css("color", "blue");
				idCheck = true;
			}
		});
		$("#passanswer").keyup(function() {
			var passanswer = $("#passanswer").val().trim();
			var reg4 = /^[가-힣A-Za-z0-9]{1,20}$/g;
			if (!reg4.test(passanswer)) {
				$("#passanswercheck").text("비밀번호 답변 형식이 잘못되었습니다");
				$("#passanswercheck").css("color", "red");
				passAnswerCheck = false;
			} else {
				$("#passanswercheck").text("올바른 비밀번호 답변 형식입니다");
				$("#passanswercheck").css("color", "blue");
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
<%@include file="../view/header.jsp"%>
<body class="content">
	<div id="passform">
		<h1>비밀번호 찾기</h1>
		<form action="<%=request.getContextPath()%>/findpassword" method="post">
		<table>
			<tr>
				<td><div><span id="idcheck"></span> <br></div><input type="text" name="id" placeholder="아이디를 입력해주세요" id="id"></td>
			</tr>
			<tr>
				<td><select name="passquestion" id="passquestion">
						<option value="">비밀번호 질문을 선택해주세요</option>
						<option value="1">첫 수학여행 장소는?</option>
						<option value="2">가장 친한 친구의 이름은?</option>
						<option value="3">첫 해외여행지는?</option>
						<option value="4">어린시절 자신의 별명은?</option>
				</select></td>
			</tr>
			<tr>
				<td><div><span id="passanswercheck"> </span></div><br><input type=text name="passanswer" placeholder="답변을 입력해주세요" id="passanswer"></td>
			</tr>
			<tr>
				<td><button type="submit" onclick="return findPass();" >비밀번호 찾기</button></td>
			</tr>
			<tr>
				<td><button type="button" onclick="location.href='login.jsp'" >로그인으로 이동</button></td>
			</tr>
		</table>
		</form>
	</div>
</body>
<%@include file="../view/footer.jsp"%>
</html>