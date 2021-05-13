<%@page import="bookshop.VO.VideocartVO"%>
<%@page import="bookshop.DAO.VideocartDAO"%>
<%@page import="bookshop.VO.BookcartVO"%>
<%@page import="bookshop.DAO.BookcartDAO"%>
<%@page import="member.vo.Member"%>
<%@page import="java.text.NumberFormat"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@include file="../view/shopheader.jsp"%>
<%
	Member vo = (Member) request.getSession().getAttribute("loginMember");
String bkind = request.getParameter("bkind");
String vkind = request.getParameter("vkind");
String id = vo.getId();
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
	<%
		List<BookcartVO> bookcartLists = null;
			BookcartVO bookcartList = null;

			List<VideocartVO> videocartLists = null;
			VideocartVO videocartList = null;

			
			int count = 0;
			int count2 = 0;
			int number = 0;
			int number2 = 0;
			int total = 0;
			int vtotal = 0;

			if (session.getAttribute("loginMember") == null) {
		response.sendRedirect("#");
			} else {
		BookcartDAO bookprocess = BookcartDAO.getInstance();
		count = bookprocess.getBookListCount(id);
		
		VideocartDAO videoprocess = VideocartDAO.getInstance();
		count2 = videoprocess.getVideoListCount(id);
		
		if (count == 0 && count2 ==0) {
	%>
	<h3>장바구니</h3>
	<div class="">
	<table>
		<tr>
			<td>장바구니에 담긴 물품이 없습니다.</td>
		</tr>
	</table>
	</div>
	<input type="button" value="책쇼핑 계속" id="backbtn"
		onclick="javascript:window.location='introList.jsp?bkind=<%=bkind%>'">
	<input type="button" value="영상쇼핑 계속" id="mainbtn"
		onclick="javascript:window.location='videoIntroList.jsp?vkind=<%=vkind%>'">

	<%
		} else {
			bookcartLists = bookprocess.getBookCart(id);
			videocartLists = videoprocess.getVideoCart(id);
		System.out.println("리스트로 다시들어옴22");
	%>
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
        
			<%
				for (int i = 0; i < bookcartLists.size(); i++) {
						bookcartList = (BookcartVO) bookcartLists.get(i);
			%>
			 <div class="row data">
                    <div class="subdiv">
                        <div class="check"><input type="hidden" name="buy" value="260" checked="">&nbsp;</div>
                        <div class="img"><img src="../imageFile/<%=bookcartList.getBimage()%>" width="60"></div>
                        <div class="pname">
                            <span><%=bookcartList.getBtitle()%></span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice"><input type="hidden" name="p_price" id="p_price2" class="p_price" >
                        <p class="price2">
                    <%=NumberFormat.getInstance().format(bookcartList.getBprice())%>원</div>
                        </p>
                        <div class="num">
                            <div class="updown">
                                <input type="text" name="p_num1" id="buycount" size="2" maxlength="4" class="p_num" value="<%=bookcartList.getBuycount()%>">
                                <%
                  String url = "../bookupdateCartForm?bcid=" + bookcartList.getBcid() + "&bkind=" + bkind + "&buycount="
                              + bookcartList.getBuycount();
               %>  
                               
                                <a href="javascript:void(0)" id="abutton" onclick="javascript:window.location='<%=url%>'">수정</a>
                            </div>
                        </div>
                        <div class="sum"><%=NumberFormat.getInstance().format(bookcartList.getBuycount() * bookcartList.getBprice())%></div>
                    </div>
                    <div class="subdiv1">
                        <%
                  String url2 = "../bookcartListDel?list=" + bookcartList.getBcid() + "&bkind=" + bkind;
              			 %> 
                        <div class="basketcmd"><a class="abutton" onclick="javascript:window.location='<%=url2%>'">삭제</a></div>
                    </div>
                </div>
				
					<%
						total += bookcartList.getBuycount() * bookcartList.getBprice();
					%> 
				
			<%
						}
					%>
			</form>
				
			  <div class="right-align basketrowcmd">
			<%
				String url3 = "../bookcartListDel?list=all&bkind=" + bkind;
			%>  <a class="abutton" onclick="javascript:window.location='<%=url3%>'">책비우기</a>
			
		</div>	
		
			<form name="orderform" id="orderform" method="post" class="orderform" >
		
			<p>영상 장바구니 목록</p>
		
	  <div class="basketdiv" id="basket">
                <div class="row head">
                    <div class="subdiv">
                        <div class="check">수량</div>
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
				
		

			<%
				for (int i = 0; i < videocartLists.size(); i++) {
					videocartList = (VideocartVO) videocartLists.get(i);
			%>
			
			 <div class="row data">
                    <div class="subdiv">
                        <div class="check"><input type="hidden" name="buy" value="260" checked="">&nbsp;</div>
                        <div class="img"><img src="../imageFile/<%=videocartList.getVimage()%>" width="60"></div>
                        <div class="pname">
                            <span><%=videocartList.getVtitle()%></span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice"><input type="hidden" name="p_price" id="p_price2" class="p_price" >
                        <p class="price2">
                    <%=NumberFormat.getInstance().format(videocartList.getVprice())%>원</div>
                        </p>
                        <div class="num">
                            <div class="updown">
                                <input type="text" name="p_num1" id="buycount" size="2" maxlength="4" class="p_num" value="1">
                            </div>
                        </div>
                          <%
                  vtotal += videocartList.getBuycount() * videocartList.getVprice();
             			  %> 
                        <div class="sum"><%=NumberFormat.getInstance().format(videocartList.getVprice())%></div>
                    </div>
                    <div class="subdiv1">
                       <%
                  String url2 = "../videocartListDel?list=" + videocartList.getVcid() + "&vkind=" + vkind;
            		   %>
                        <div class="basketcmd"><a class="abutton" onclick="javascript:window.location='<%=url2%>'">삭제</a></div>
                    </div>
                </div></div>
				
				
					<%
						}
					%>
					<br>
					</form>
				
			  <div class="right-align basketrowcmd">
			<%
							String url4 = "../videocartListDel?list=all&vkind=" + vkind;
			%>
			 <a class="abutton" onclick="javascript:window.location='<%=url4%>'">영상비우기</a>
			</div>	
			
            <div class="bigtext right-align box blue summoney" id="sum_p_price">합계금액:<%=NumberFormat.getInstance().format(total + vtotal)%>원</div>
    
				<%
							String url5 = "../buyForm";
				%>
					<td colspan="5"><input type="button" value="구매하기"
						onclick="javascript:window.location='<%=url5%>'"> <input
						type="button" value="쇼핑 계속하기"
						onclick="javascript:window.location='introList.jsp?bkind=<%=bkind%>'"></td>
						
										
		<% 
			}
		}
		%>
		</div>
		
</body>
</html>
<%@include file="../view/footer.jsp"%>