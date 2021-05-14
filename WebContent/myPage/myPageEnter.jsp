<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	table {
		margin: 0 auto;
	}
	
	input {
		width: 300px;
		height: 40px;
		font-size: 17px;
		text-align: center;
	}
	
	td {
		padding: 5px 0;
		text-align: center;
	}

</style>
<%@include file="../view/header.jsp"%>
<body class="content">
	<div id="display">
		<h1>비밀번호 확인</h1>
		<form action="<%=request.getContextPath() %>/mypageenter" method="post">
		<table>
			<tr>
				<td><input type="password" placeholder="비밀번호를 입력해주세요" id="password" name="password"></td>
			</tr>
			<tr>
				<td><button type="submit" class="darkbutton">ENTER</button></td>
			</tr>
		</table>
		</form>
	</div>
</body>
<%@include file="../view/footer.jsp"%>