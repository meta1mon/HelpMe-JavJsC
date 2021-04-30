<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>




<!-- 마지막에 약관 두 가지는 필수 체크만 하고, 실제 디비에 넣거나 메일 연동하는 건 일단 없음 -->




<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<style>
div {
	text-align: center;
	background-color: rgb(209, 202, 202);
}

table {
	margin: 0 auto 0 auto;
}

.required {
	color: green;
	font-size: 1px;
}

.optional {
	color: brown;
	font-size: 1px;
}

#idcheck {
	cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
// 아이디 중복 체크 결과
	$(function() {
		// 아이디 중복 체크
		$("#idcheck").click(function() {
			var id = $("#id").val().trim();
			if(id == "") {
				alert("아이디를 입력하고 중복확인을 눌러주세요");
				$("id").focus();
				return;
			}
			$.ajax({
				url : "<%=request.getContextPath()%>/uniqueid",
				type : "post",
				data : {
					"id" : id
				},
				dataType : "json",
				success : function(data) {
					if (data == "사용가능") {
						alert("사용 가능한 아이디입니다");
					} else {
						alert("이미 존재하는 아이디입니다. 다른 아이디를 사용해주세요");
					}
				}

			});
		});

		// 비밀번호 일치 체크
		$("#password2").keyup(function() {
			var pass1 = $("#password1").val();
			var pass2 = $("#password2").val();

			if (pass1 == pass2) {
				$("#passcheck").text("비밀번호가 일치합니다.");
				$("#passcheck").css("color", "blue").css("font-size", "1px");
			} else {
				$("#passcheck").text("비밀번호가 일치하지 않습니다.");
				$("#passcheck").css("color", "red").css("font-size", "1px");
			}
		});
	});

	// 필수칸 입력 체크
	function required() {
		if ($("#id").val() == "") {
			alert("필수 입력칸입니다");
			$("#id").focus();
			return false;
		}

		if ($("#nickname").val() == "") {
			alert("필수 입력칸입니다");
			$("#nickname").focus();
			return false;
		}

		if ($("#password1").val() == "") {
			alert("필수 입력칸입니다");
			$("#password1").focus();
			return false;
		}

		if ($("#password2").val() == "") {
			alert("필수 입력칸입니다");
			$("#password2").focus();
			return false;
		}

		if ($("#passquestion").val() == "0") {
			alert("비밀번호 질문을 선택하십시오");
			$("#passquestion").focus();
			return false;
		}

		if ($("#passanswer").val() == "") {
			alert("필수 입력칸입니다");
			$("#passanswer").focus();
			return false;
		}

		if ($("#agelimit").is(":checked") == false) {
			alert("만 14세 이상만이 가입할 수 있습니다");
			return false;
		}

	}

	// 회원가입 입력칸 형식 체크
	function regCheck() {
		var id = $("#id").val().trim();
		var reg1 = /^[A-Za-z0-9]{4,15}$/g;

		var nickname = $("#nickname").val().trim();
		var reg2 = /^[가-힣A-Za-z0-9]{1,8}$/g;

		var password = $("#password1").val().trim();
		var reg3 = /^[A-Za-z0-9!@#$%^&*]{8,15}$/g;

		var passanswer = $("#passanswer").val().trim();
		var reg4 = /^[가-힣A-Za-z0-9]{1,20}$/g;

		var tel = $("#tel").val().trim();
		var reg5 = /^[0-9]{10,13}$/;

		var email = $("#email").val().trim();
		var reg6 = /^[A-Za-z0-9]+@[A-Za-z0-9]+\.[A-Za-z0-9]+$/g;

		if (!reg1.test(id)) {
			alert("아이디 형식이 잘못되었습니다");
			$("#id").focus();
			return false;
		}
		if (!reg2.test(nickname)) {
			alert("닉네임 형식이 잘못되었습니다");
			$("#nickname").focus();
			return false;
		}
		if (!reg3.test(password)) {
			alert("비밀번호 형식이 잘못되었습니다");
			$("#password1").focus();
			return false;
		}
		if (!reg4.test(passanswer)) {
			alert("비밀번호 답변 형식이 잘못되었습니다");
			$("#passanswer").focus();
			return false;
		}
		
		if (!reg5.test(tel) && (tel != "")) {
			alert("전화번호 형식이 잘못되었습니다");
			$("#tel").focus();
			return false;
		}

		if (!reg6.test(email) && (email != "")) {
			alert("이메일 형식이 잘못되었습니다");
			$("#email").focus();
			return false;
		}

	}

	// 비밀번호 일치 체크
	function passequal() {
		if ($("#password1").val() != $("#password2").val()) {
			alert("비밀번호가 일치하지 않습니다");
			$("#password1").val("");
			$("#password2").val("");
			$("#password1").focus();
			return false;
		}
	}
	// 회원가입 버튼 눌렀을 때,
	function admit() {
		if (required() == false) {
			return false;
		}

		if (regCheck() == false) {
			return false;
		}

		if (passequal() == false) {
			return false;
		}

		// 다 충족 되었다면
		return true;
	};

	// 주소 api
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						if (data.userSelectedType === 'R') {
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>
</head>

<body>
	<div>
		<h1>회원가입</h1>
		<form action="<%=request.getContextPath()%>/memberinsert"
			method="post">
			<span id="idcheck">중복확인</span>
			<table>
				<tr>
					<td>아이디<span class="required">(필수)</span></td>
					<td><input type="text" name="id" id="id"></td>
					<td><span style="font-size: 1px"> 4~15자의 영문자, 숫자만 사용
							가능합니다.</span></td>
				</tr>
				<tr>
					<td>닉네임<span class="required">(필수)</span></td>
					<td><input type="text" name="nickname" id="nickname"></td>
					<td><span style="font-size: 1px"> 1~8자의 한글, 영문자, 숫자만 사용
							가능합니다.</span></td>
				</tr>
				<tr>
					<td>비밀번호<span class="required">(필수)</span></td>
					<td><input type="password" name="password1" id="password1"></td>
					<td><span style="font-size: 1px"> 8~15자의 영문자, 숫자,
							특수문자(!, @, #, $, %, ^, &, *)만 사용 가능합니다.</span></td>
				</tr>
				<tr>
					<td>비밀번호 확인<span class="required">(필수)</span></td>
					<td><input type="password" name="password2" id="password2"></td>
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
					<td><input type="text" name="passanswer" id="passanswer"></td>
					<td><span style="font-size: 1px"> 1~20자의 한글, 영문자, 숫자만
							사용 가능합니다.</span></td>
				</tr>
				<tr>
					<td>주소<span class="optional">(선택)</span></td>
					<td><input type="text" id="sample6_postcode"
						placeholder="우편번호" name="postcode" readonly> <br> <input
						type="text" id="sample6_address" placeholder="주소" name="address1"
						readonly><br> <input type="text"
						id="sample6_detailAddress" placeholder="상세주소" name="address2"><br>
						<!-- 참고항목은 도로명 주소 클릭 시, 동을 표시한다 --> <input type="text"
						id="sample6_extraAddress" placeholder="참고항목" name="address3"
						readonly></td>
					<td><input type="button" onclick="sample6_execDaumPostcode()"
						value="우편번호 찾기"></td>
				</tr>
				<tr>
					<td>전화번호<span class="optional">(선택)</span></td>
					<td><input type="text" name="tel" id="tel"></td>
					<td><span style="font-size: 1px"> 10~13자의 숫자만 사용 가능합니다.</span></td>
				</tr>
				<tr>
					<td>이메일<span class="optional">(선택)</span></td>
					<td><input type="text" name="email" id="email"></td>
					<td><span style="font-size: 1px"> 8~15자의 영문자, 숫자,
							특수문자(@)만 사용 가능합니다.</span></td>
				</tr>
				<tr>
					<td colspan="3"><label><input type="checkbox"
							name="agree" value="1" id="agelimit"> 만 14세 이상 회원가입에
							동의합니다(필수)</label></td>
				</tr>
				<tr>
					<td colspan="3"><label><input type="checkbox"
							name="agree" value="2"> 도와줘~ 잡스!의 다양한 소식을 받아보겠습니다(선택)</label></td>
				</tr>
				<tr>
					<td colspan="3"><input type="submit" value="회원가입"
						onclick="return admit();" id="btnSubmit"></td>
				</tr>
				<tr>
					<td colspan="3"><input type="button" value="로그인으로 이동"
						onclick="location.href='login.jsp'"></td>
				</tr>
			</table>
		</form>
	</div>
</body>

</html>