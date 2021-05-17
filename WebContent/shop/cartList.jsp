<%@page import="shop.VO.VideocartVO"%>
<%@page import="shop.DAO.VideocartDAO"%>
<%@page import="shop.VO.BookcartVO"%>
<%@page import="shop.DAO.BookcartDAO"%>
<%@page import="member.vo.Member"%>
<%@page import="java.text.NumberFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 <%@include file="../view/header.jsp"%>
<%
int total1=0;
int total2 = 0;
%>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<%@include file="../style/shop2.css"%>

</style>
</head>
<body class="content">
   <c:if test="${count == null} && ${vcount == null}">
      
   <h3>장바구니</h3>
   <div class="">
   <table>
      <tr>
         <td>장바구니에 담긴 물품이 없습니다.</td>
      </tr>
   </table>
   
   <input type="button" value="책쇼핑 계속" id="backbtn"
      onclick="javascript:window.location='bookIntro'">
   <input type="button" value="영상쇼핑 계속" id="mainbtn"
      onclick="javascript:window.location='videoIntro'">
   </div>
   </c:if>
   <h3>장바구니</h3>
      <div style="width: 800px; margin: 0 auto 0 auto;">
   <form name="orderform" id="orderform" method="post" class="orderform" >
      
      <p>책 장바구니 목록</p>
      
     <div class="basketdiv" id="basket">
                <div class="row head">
                    <div class="subdiv">
                        <div class="check"></div>
                        <div class="img">이미지</div>
                        <div class="pname">상품명</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">가격</div>
                        <div class="num">수량</div>
                        <div class="sum">합계</div>
                    </div>
                    <div class="subdiv">
    
                        <div class="basketcmd">삭제</div>
                    </div>
                    <div class="split"></div>
                </div>
        
         <c:forEach items="${bookcart }" var="b"   >
          <div class="row data">
                    <div class="subdiv">
                        <div class="check"><input type="hidden" name="buy" value="260" checked="">&nbsp;</div>
                        <div class="img"><img src="imageFile/${b.bimage}" width="60" height="60"></div>
                        <div class="pname">
                            <span>${b.btitle}</span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice"><input type="hidden" name="p_price" id="p_price2" class="p_price" >
                        <p class="price2">
                         <fmt:formatNumber value="${(b.bprice * (100- b.discountRate)/100)}" type="number" />
                       원</div>
                        </p>
                        <div class="num">
                            <div class="updown">
                                <input type="text" name="p_num1" id="buycount" size="2" maxlength="4" class="p_num" value="${b.buycount}"
                                readonly>
                              
                               
                                <a href="<%=request.getContextPath()%>/bookupdateCartForm?bcid=${b.bcid}&buycount=${b.buycount}" id="abutton"
                                >수정</a>
                            </div>
                        </div>
                          <div class="sum">
                          <c:set var="bprice" value="${bprice+ (b.bprice * (100- b.discountRate)/100)*b.buycount}"></c:set>
                         <fmt:formatNumber value="${(b.bprice * (100- b.discountRate)/100)*b.buycount}" type="number" />
                         </div>
                    </div>
                    <div class="subdiv1">
                        
                        <div class="basketcmd"><a class="abutton" href="
                        <%=request.getContextPath()%>/bookcartListDel?list=${b.bcid}&bkind=${b.bkind}" >삭제</a></div>
                    </div>
                </div>
               </c:forEach>
         </form>
            
           <div class="right-align basketrowcmd">
          <a class="abutton" href="
         <%=request.getContextPath()%>/bookcartListDel?list=all&bkind=${b.bkind}">책비우기</a>
         
      </div>   
      
         <form name="orderform" id="orderform" method="post" class="orderform" >
         <p>영상 장바구니 목록</p>
            
      
     <div class="basketdiv" id="basket">
                <div class="row head">
                    <div class="subdiv">
                        <div class="check"></div>
                        <div class="img">이미지</div>
                        <div class="pname">상품명</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">가격</div>
                        <div class="num">수량</div>
                        <div class="sum">합계</div>
                    </div>
                    <div class="subdiv">
    
                        <div class="basketcmd">삭제</div>
                    </div>
                    <div class="split"></div>
                </div>
            <c:forEach items="${videocart}" var="v"   >
      
          <div class="row data">
                    <div class="subdiv">
                        <div class="check"><input type="hidden" name="buy" value="260" checked="">&nbsp;</div>
                        <div class="img"><img src="imageFile/${v.vimage}" width="60" height="60"></div>
                        <div class="pname">
                            <span>${v.vtitle}</span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice"><input type="hidden" name="p_price" id="p_price2" class="p_price" >
                        <p class="price2">
                        <fmt:formatNumber value="${(v.vprice * (100- v.discountRate)/100)}" type="number" />
                       원</div>
                        </p>
                        <div class="num">
                            <div class="updown">
                                <input type="text" name="p_num1" id="buycount" size="2" maxlength="4" class="p_num" value="1" readonly>
                            </div>
                        </div>
                           
                        <div class="sum">
                       <fmt:formatNumber value="${(v.vprice * (100- v.discountRate)/100)*v.buycount}" type="number" />
                         <c:set var="vprice" value="${vprice + (v.vprice * (100- v.discountRate)/100)* v.buycount}"/>
                         </div>
                    </div>
                    <div class="subdiv1">
                     
                        <div class="basketcmd">
                        <a class="abutton" href="
                        <%=request.getContextPath()%>/videocartListDel?list=${v.vcid}&vkind=${v.vkind}">삭제</a></div>
                    </div>
                </div>
         </c:forEach>
            
            
            
               <br>
               
               </form>
            
           <div class="right-align basketrowcmd">
         
          <a class="abutton" href="
          <%=request.getContextPath()%>/videocartListDel?list=all&vkind=${v.vkind}">영상비우기</a>
         </div>   
            <div class="bigtext right-align box blue summoney" id="sum_p_price">
               합계금액:
               <fmt:formatNumber value="${bprice+vprice}" type="number" />
                           원</div>
    
            <%
                     String url5 = "../../buyForm";
            %>
               <td colspan="5"><input type="button" value=" 구매하기  "
                  onclick="javascript:window.location='<<%=url5%>'"> <input
                  type="button" value="쇼핑 계속하기"
                  onclick="javascript:window.location='<%=request.getContextPath()%>/shopmain'"></td>
                  
                              
            </div>
      
</body>
</html>
<%@include file="../view/footer.jsp"%>