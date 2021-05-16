<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>shopping mall</title>
</head>
<body class="content">
<%@include file="../view/header.jsp"%>


<h3>쇼핑몰 메이</h3>
	<button><a href="<%=request.getContextPath()%>/bookIntro?bkind=${bkind1}">자바</a></button>
	<button><a href="<%=request.getContextPath()%>/bookIntro?bkind=${bkind2}">자바</a></button>
	<button><a href="<%=request.getContextPath()%>/bookIntro?bkind=${bkind3}">자바</a></button>
	<button><a href="<%=request.getContextPath()%>/videoIntro?vkind=${vkind1}">자바</a></button>
	<button><a href="<%=request.getContextPath()%>/videoIntro?vkind=${vkind2}">자바</a></button>
	<button><a href="<%=request.getContextPath()%>/videoIntro?vkind=${vkind3}">자바</a></button>
</body>
<%@include file="../../view/footer.jsp"%>
</html>
