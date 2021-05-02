<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기 성공</title>
    <style>
        div {
            text-align: center;
            background-color: rgb(209, 202, 202);
        }
    </style>
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script>
    
            
        </script>
</head>
<%@include file="../view/header.jsp"%>
<body class="content">
    <div>
            <h1>비밀번호 찾기</h1>
            <p>${idfind }님의 비밀번호는</p>
            <input type="text" name="password" value="${passfind }" readonly>
            <p>입니다</p>
            <br>
        <input type="button" onclick="location.href='member/login.jsp'" value="로그인으로 이동">
    </div>
</body>
</html>