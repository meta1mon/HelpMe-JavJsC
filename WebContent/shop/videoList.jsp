<%@page import="shop.DAO.ShopvideoDAO"%>
<%@page import="shop.VO.VideoVO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%!SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>
<%@include file="../admin/adminAside.jsp" %>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<style>

.page-header {
   font-weight: bold;
   margin: 0 20px 20px 40px;
}

.table {
   border-collapse: collapse;
   width: 1500px;
   margin: 20px;
}


.table tr:nth-child(odd){background-color: #f2f2f2;}


.table td{
   padding: 8px;
   line-height: 1.42857143;
   border-top: 1px solid #ddd;
   border-bottom: 1px solid #ddd;
   vertical-align: middle;
} 

select {
   width: 10%;
   padding: 8px;
   margin-left: 40px;
   display: inline-block;
   border: 1px solid #ccc;
   border-radius: 4px;
   box-sizing: border-box;
}


.fas.fa-times-circle {
   color: red;
}

.fas.fa-edit{
   color: #3d5a73;
}

</style>

<script>
function move(){
   
   location.href="<%=request.getContextPath()%>/avideolist?vkind="+$("#kind option:selected").val();
   
}

</script>
</head>
<main>
   <div style="padding: 50px; margin-left: 200px;">
   <h1 class="page-header">영상 리스트</h1>
   
   <div>
         <select id="kind" onchange="move();">
            <c:choose>
               <c:when test="${vkind == null}">
                  <option value="100">Java</option>
                  <option value="200">Jsp</option>
                  <option value="300">HTML</option>
               </c:when>
               <c:when test="${vkind == 100}">
                  <option value="100" selected>Java</option>
                  <option value="200">Jsp</option>
                  <option value="300">HTML</option>
               </c:when>
               <c:when test="${vkind == 200}">
                  <option value="100">Java</option>
                  <option value="200" selected>Jsp</option>
                  <option value="300">HTML</option>
               </c:when>
               <c:when test="${vkind == 300}">
                  <option value="100">Java</option>
                  <option value="200">Jsp</option>
                  <option value="300" selected>HTML</option>
               </c:when>
            </c:choose>
         </select>
         <!-- 자바의 스위치문과 비슷 -->
      <c:choose>
         <c:when test="${vkind == 100}">Java</c:when>
         <c:when test="${vkind == 200}">Jsp</c:when>
         <c:when test="${vkind == 300}">HTML</c:when>
      </c:choose>
   </div>
      <table class="table">
      <tr>
         <td style="width:93px;">번호</td>
         <td style="width:80px;">영상분류</td>
         <td style="width:300px;">영상 제목</td>
         <td style="width:80px;">가격</td>
         <td style="width:53px;">영상 썸네일</td>
         <td style="width:71px;">할인율</td>
         <td style="width:227px;">등록일</td>
         <td style="width:140px;">시청 가능 시작일</td>
         <td style="width:140px;">시청 종료일</td>
         <td style="width:80px;">영상길이</td>
         <td style="width:50px;">수정</td>
         <td style="width:50px;">삭제</td>
      </tr>
      <!-- el태그는 if문은 else 안된다-->
         <c:if test="${videolist.size() == 0 }">
               등록된 영상 없음
         </c:if>
         <c:if test="${videolist.size() != 0 }">
      <!-- foreach문에서 list는 items를 사용, var도 사용 -->
         <c:forEach items="${videolist }" var="v" >
            <tr height="30">
            <td>${v.vid} </td>
            <td>${v.vkind} </td>
            <td>${v.vtitle}</td>
            <td>${v.vprice}</td>
            <td>${v.vimage}</td>
            
            <td>${v.discountRate}</td>
            <td>${v.regdate}</td>
            <td>${v.startDate}</td>
            <td>${v.endDate}</td>
            <td>${v.vsize} </td>
            <td width="50" style="text-align: center !important;">
            <a href="<%=request.getContextPath() %>/videoupdateForm?vid=${v.vid}"><i class="fas fa-edit" id="full"></i></a></td>
            
            <td width="50" style="text-align: center !important;">
            <a href="<%=request.getContextPath() %>/videodeleteForm?vid=${v.vid}"><i class="fas fa-times-circle" id="full"></i></a></td>
            </tr>
         </c:forEach>
         </c:if>
      </table>
   </div>

</main>
</html>