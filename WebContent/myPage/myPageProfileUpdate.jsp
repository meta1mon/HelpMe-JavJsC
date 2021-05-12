<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="member.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//select 선택되어있던 값 불러오기
	$(document).ready(
			function() {
				$("select option[value='${loginMember.passquestion}']").attr(
						"selected", true);
			});
</script>
<script>
	// 비밀번호 일치 체크
	$(document).ready(function() {
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

	};

	// 회원가입 입력칸 형식 체크
	function regCheck() {
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

	};

	// 비밀번호 일치 체크
	function passequal() {
		if ($("#password1").val() != $("#password2").val()) {
			alert("비밀번호가 일치하지 않습니다");
			$("#password1").val("");
			$("#password2").val("");
			$("#password1").focus();
			return false;
		}
	};
	// 수정 완료 버튼 눌렀을 때,
	function modify() {
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
	};
</script>
</head>
<body>
	<form action="<%=request.getContextPath()%>/myprofileupdate"
		method="post">
		<table>
			<tr style="display: none">
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
				<td><span class="desc"> 8~15자의 영문자, 숫자, 특수문자(!, @, #, $,
						%, ^, &, *)만 사용 가능합니다.</span></td>
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
				<td><input type="text" id="sample6_postcode"
					name="postcode" readonly style="margin-bottom: 5px"
					value="${loginMember.postcode}"><br> <input
					type="text" id="sample6_address" name="address1" readonly
					style="margin-bottom: 5px" value="${loginMember.address1}"><br>
					<input type="text" id="sample6_detailAddress" name="address2"
					style="margin-bottom: 5px" value="${loginMember.address2}"><br>
					<input type="text" id="sample6_extraAddress" name="address3"
					readonly style="margin-bottom: 5px" value="${loginMember.address3}"></td>
				<td><input type="button" onclick="sample6_execDaumPostcode()"
					value="우편번호 찾기"></td>
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
				<td colspan="3"><button type="submit"
						onclick="return modify();">수정 완료</button>
						<button type="button" onclick="window.close();">취소</button></td>
			</tr>
		</table>
	</form>
</body>
</html>