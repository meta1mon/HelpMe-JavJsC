<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        input {
        	width: 300px;
			height: 40px;
			font-size: 17px;
			text-align: center;
        }
        
    </style>
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script>
    
            
        </script>
</head>
<%@include file="../view/header.jsp"%>
<body class="content">
    <div id="display">
            <h1>비밀번호 찾기</h1>
            <table>
            	<tr>
            		<td>${idfind }님의 비밀번호는</td>
            	</tr>
            	<tr>
            		<td><input type="text" name="password" value="${passfind }" readonly></td>
            	</tr>
            	<tr>
            		<td>입니다</td>
            	</tr>
               	<tr>
            		<td><button type="button" onclick="location.href='member/login.jsp'">로그인으로 이동</button></td>
            	</tr>
            </table>
    </div>
</body>
<%@include file="../view/footer.jsp"%>
</html>