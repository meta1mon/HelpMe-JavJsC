<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="shop.DAO.BuyDAO"%>
<%@page import="shop.VO.BuyVO"%>
<%@page import="java.util.List"%>
<%@page import="member.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@include file="../view/header.jsp"%>

<html>
<head>
<meta charset="UTF-8">
<title>구매완료페이지</title>
<style>
<%@include file="../style/shop3.css"%>
</style>
</head>
<body class="content">
<div style="width: 800px; margin: 0 auto 0 auto;" class="buywrap">
   <%
         int count = 0;
         int number = 0;
         int number2 = 0;
         int total = 0;
   %>
   <c:if test="${count == 0}">
   <h3>구매목록</h3>
   <table>
      <tr>
         <td>구매 목록이 없습니다.</td>
      </tr>
   </table>
   </c:if>
   <h2>
      <b>결제가 완료되었습니다 ♥</b>
   </h2>
   <h3>구매 내역 및 배송 상황 확인은 마이 페이지에서 가능합니다</h3>
<br>
   
   <button type="submit" id ="shopbtn">
         <a href="<%=request.getContextPath()%>/shopmain">
         쇼핑 계속 하러가기 </a>
         </button>
   
</div>
</body>
</html>
<%@include file="../view/footer.jsp"%>