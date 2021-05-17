<%@page import="shop.DAO.VideocartVO"%>
<%@page import="java.sql.Connection"%>
<%@page import="common.jdbc.JDBCConnectionPool"%>
<%@page import="shop.DAO.VideocartDAO"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="shop.DAO.BuyDAO"%>
<%@page import="member.dao.MemberDao"%>
<%@page import="shop.DAO.BookcartDAO"%>
<%@page import="shop.VO.BookcartVO"%>
<%@page import="java.util.List"%>
<%@page import="member.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@include file="../view/header.jsp"%>

<html>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script    src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//주소 api
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

<head>
<meta charset="UTF-8">
<title>구매창</title>
<style>
<%@include file="../style/shop3.css"%>
</style>
</head>
<body class="content">
<div style="width: 800px; margin: 0 auto 0 auto;" class="buywrap">
   <%
   
      int number = 0; int number2 = 0;
      int total = 0; int total2=0;
   %>
      <h1>구매 목록</h1>
      <form name="bookcart" >
      <table id="bcart">
      <tr>
         <td width="50">NO</td>
         <td width="300">책이름</td>
         <td width="100">판매가격</td>
         <td width="150">수량</td>
         <td width="150">금액</td>
      </tr>   
      <c:forEach items="${book }" var="b"   >
         <tr>
         <td width="50"><%= ++ number %></td>
         <td width="300" align="left">
         <img src="imageFile/${b.bimage}" border="0" width="30"
               height="50" align="middle" alt="bookimg">
         ${b.btitle}
         </td>
         <td width="100">
         <fmt:formatNumber value="${b.bprice * (100- b.discountRate)/100}" type="number" />
         
         </td>
         <td width="150">
         ${b.buycount}
         </td>
         <td width="150">
         <c:set var="bprice" value="${bprice+ (b.bprice * (100- b.discountRate)/100)*b.buycount}"></c:set>
           <fmt:formatNumber value="${(b.bprice * (100- b.discountRate)/100)*b.buycount}" type="number" />
         </td>
         </tr>
         </c:forEach>
         </table>      
         <tr>
         <div class="buyprice">
         <td colspan="5" align="right">
         <h4>책 구매금액 : \
         <fmt:formatNumber value="${bprice}" type="number" />
         </h4>
         </td>
         </div>
         </tr>
   
      </form>
      
      <br>
      <form>
      <table id="vcart">
      <tr>
         <td width="50">NO</td>
         <td width="300">영상 이름</td>
         <td width="100">판매가격</td>
         <td width="150">수량</td>
         <td width="150">금액</td>
      </tr>   
         <c:forEach items="${video }" var="v"   >
         <tr>
         <td width="50"><%= ++ number2 %></td>
         <td width="300" align="left">
         <img src="imageFile/${v.vimage}" 
         width="30" height="50" align="middle">
         ${v.vtitle}
         </td>
         <td width="100">
         <fmt:formatNumber value="${v.vprice * (100- v.discountRate)/100}" type="number" />
         </td>
         <td width="150">
         1
         </td>
         <td width="150">
         <fmt:formatNumber value="${v.vprice * (100- v.discountRate)/100}" type="number" />
         
         <c:set var="vprice" value="${vprice +(v.vprice * (100- v.discountRate)/100)}"></c:set>
         </td>
         </tr>
         </c:forEach>
      </table>      
         <tr>
         <td colspan="5" align="right">
         <h4>영상 구매금액 : \
         <fmt:formatNumber value="${vprice}" type="number" />
          </h4>
         </td>
         </tr>
         
            
      <div>
      <h2>총금액 : \ 
      <fmt:formatNumber value="${bprice+vprice}" type="number" />
      </h2>
      </div>
      </form>
      <center>
      <form method="post" action="<%=request.getContextPath() %>/bookbuy">
         <table id="order">
         <tr>
         <td colspan="2" height="30"><font size = "+1">
         <b>주문자정보</b></font>
         </td>
         </tr>
         <tr>
         <td width="200" height="40" align="center">성명</td>
         <td width="400" align="left">${member.nickname}</td>
         </tr>
         <tr>
         <td width="200" height="40" align="center">전화번호</td>
         <td width="400" align="left">${member.tel}</td>
         </tr>
         <tr>
         <td width="200" height="40" align="center">주소</td>
         <td width="400" align="left">${member.address1}</td>
         </tr>
         <tr>
         <td width="200" height="40" align="left">결제계좌</td>
         <td width="400" align="left">
         <select name="account" id="account">
         <c:forEach items="${account }" var="a"   >
         <option value="${a}">
         ${a}
         </option>
         </c:forEach>         
         </select>
         
         </td>
         </tr>
      
         <br>
         <tr>
			<td colspan="2" height="30" align="center" style="position:relative;"><font size="+1">
			<b>배송지 정보</b><button type="button" style="position:absolute; right:10px; background: #568C82; border-radius: 4px; font-family: 'GmarketSansBold'; color: #fff; border: none;" onclick="load();">주문자정보 내려받기</button>
			</font></td>

         </tr>
         <tr>
         <td width="200" height="40" align="center">배송받는 분 성함</td>
         <td width="400" align="left">
         <input type="text" nema="deliveryname" id="deliveryname">
         </td>
         </tr>
         <tr>
         <td width="200" height="40" align="center">배송지 전화</td>
         <td width="400" align="left">
         <input type="text" name="deliverytel" id="deliverytel">
         </td>
         </tr>
         <tr>
               <td>주소<span class="optional">(선택)</span></td>
               <td><input type="text" id="sample6_postcode" placeholder="우편번호" name="postcode" readonly style="margin-bottom:5px"><br>
                  <input type="text" id="sample6_address" placeholder="주소" name="deliveryadd1" readonly  style="margin-bottom:5px"><br>
                  <input type="text" id="sample6_detailAddress" placeholder="상세주소" name="deliveryadd2" style="margin-bottom:5px"><br>
            <!-- 참고항목은 도로명 주소 클릭 시, 동을 표시한다 -->
            <input type="text" id="sample6_extraAddress" placeholder="참고항목" name="address3" readonly style="margin-bottom:5px"></td>
               <td><input id="address" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td>
         </tr>
         
         
         <tr>
         
         <td colspan="2" align="center" style="border:none">
         <div  id="buy2">
         <button type="submit" id ="buybtn">구매하기</button>
         <button type="submit" id ="shopbtn">
         <a href="<%=request.getContextPath()%>/shopmain">
         돌아가기</a>
         </button>
         </div>
         
         </td>
         </tr>
         </table>
         
      </form>
      </center>
</div>      
<script>
	function load() {
		$("#deliveryname").val("${member.nickname}");
		$("#deliverytel").val("${member.tel}");
		$("#sample6_postcode").val("${member.postcode}");
		$("#sample6_address").val("${member.address1}");
		$("#sample6_detailAddress").val("${member.address2}");
		$("#sample6_extraAddress").val("${member.address3}");
	}
</script>
</body>
<%@include file="../../view/footer.jsp"%>
</html>