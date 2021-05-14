<%@page import="java.sql.Connection"%>
<%@page import="common.jdbc.JDBCConnectionPool"%>
<%@page import="bookshop.VO.VideocartVO"%>
<%@page import="bookshop.DAO.VideocartDAO"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="bookshop.DAO.BuyDAO"%>
<%@page import="member.dao.MemberDao"%>
<%@page import="bookshop.DAO.BookcartDAO"%>
<%@page import="bookshop.VO.BookcartVO"%>
<%@page import="java.util.List"%>
<%@page import="member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="../view/header.jsp"%>

<%
	Member vo = (Member) request.getSession().getAttribute("loginMember");
	String bkind = request.getParameter("bkind");
	String vkind = request.getParameter("vkind");
	String id = vo.getId();
%>

<html>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script 	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
</head>
<body class="">
	<%
		List<BookcartVO> bookcartLists = null;
		List<VideocartVO> videocartLists = null;
		List<String> accountLists = null;
		BookcartVO bookcartList = null;
		VideocartVO videocartList = null;
		Member member = null;
		int number = 0; int number2 = 0;
		int total = 0; int total2=0;
		
		if(session.getAttribute("loginMember")==null){
			response.sendRedirect("#");
		}else{
			BookcartDAO bookprocess = BookcartDAO.getInstance();
			bookcartLists = bookprocess.getBookCart(id); //서비스구현
			
			VideocartDAO videoprocess = VideocartDAO.getInstance();
			videocartLists = videoprocess.getVideoCart(id);
			
			Connection conn = JDBCConnectionPool.getConnection();
			MemberDao memberprocess = new MemberDao();
			member = memberprocess.login(conn, id);
			
			BuyDAO buyprocess = new BuyDAO();
			accountLists = buyprocess.getAccount();
	%>
		<p>구매 목록</p>
		<form action="<%=request.getContextPath()%>/bookUpdateForm.jsp">
		<table border="1px;">
		<tr>
			<td width="50">책 번호</td>
			<td width="300">책이름</td>
			<td width="100">판매가격</td>
			<td width="150">수량</td>
			<td width="150">금액</td>
		</tr>	
		<%
			for(int i=0; i<bookcartLists.size(); i++){
			bookcartList = bookcartLists.get(i);	
		%>
			<tr>
			<td width="50"><%= ++ number %></td>
			<td width="300" align="left">
			<img src="imageFile/<%=bookcartList.getBimage()%>" border="0" width="30"
					height="50" align="middle" alt="bookimg">
			<%= bookcartList.getBtitle() %>
			</td>
			<td width="100">
			<%=NumberFormat.getInstance().format(bookcartList.getBprice()) %>
			</td>
			<td width="150">
			<%=bookcartList.getBuycount() %>
			</td>
			<td width="150">
			<%total += bookcartList.getBuycount() * bookcartList.getBprice(); %>
			<%= NumberFormat.getInstance().format(bookcartList.getBuycount() * bookcartList.getBprice()) %>
			</td>
			</tr>		
			<% 
			}
			%>
			<tr>
			<td colspan="5" align="right">
			<b>책 구매금액 : <%=NumberFormat.getInstance().format(total) %></b>
			</td>
			</tr>
		</table>
		</form>
		<%
		}
		%>
		<br>
		<form>
		<table border="1px;">
		<tr>
			<td width="50">영상 번호</td>
			<td width="300">영상 이름</td>
			<td width="100">판매가격</td>
			<td width="150">수량</td>
			<td width="150">금액</td>
		</tr>	
		<%
			for(int i=0; i<videocartLists.size(); i++){
				videocartList = videocartLists.get(i);	
		%>
			<tr>
			<td width="50"><%= ++ number2 %></td>
			<td width="300" align="left">
			<img src="../imageFile/<%=videocartList.getVimage() %>" 
			width="30" height="50" align="middle">
			<%= videocartList.getVtitle() %>
			</td>
			<td width="100">
			<%=NumberFormat.getInstance().format(videocartList.getVprice()) %>
			</td>
			<td width="150">
			1
			</td>
			<td width="150">
			<%total2 += videocartList.getBuycount() * videocartList.getVprice(); %>
			<%= NumberFormat.getInstance().format(videocartList.getBuycount() * videocartList.getVprice()) %>
			</td>
			</tr>		
			<% 
			}
			%>
			<tr>
			<td colspan="5" align="right">
			<b>영상 구매금액 : <%=NumberFormat.getInstance().format(total2) %></b>
			</td>
			</tr>
			<tr>
			<td colspan="5" align="right"><b>총 금액 :<%=NumberFormat.getInstance().format(total + total2)%></b></td>
				</tr>
		</table>
		</form>
		<form method="post" action="<%=request.getContextPath() %>/bookbuy">
			<table border="1px">
			<tr>
			<td colspan="2" height="30"><font size = "+1">
			<b>주문자정보</b></font>
			</td>
			</tr>
			<tr>
			<td width="200" height="40" align="center">성명</td>
			<td width="400" align="left"><%=member.getNickname() %></td>
			</tr>
			<tr>
			<td width="200" height="40" align="center">전화번호</td>
			<td width="400" align="left"><%=member.getTel() %></td>
			</tr>
			<tr>
			<td width="200" height="40" align="center">주소</td>
			<td width="400" align="left"><%=member.getAddress1() %></td>
			</tr>
			<tr>
			<td width="200" height="40" align="left">결제계좌</td>
			<td width="400" align="left">
			<select name="account">
			<%
			for(int i=0; i<accountLists.size(); i++){
				String accountList = accountLists.get(i);
			%>
			<option value="<%=accountList %>">
			<%=accountList %>
			</option>
			<%
			}
			%>
			</select>
			</td>
			</tr>
		
			<br>
			<tr>
			<td colspan="2" height="30" align="center"><font size="+1">
			<b>배송지 정보</b>
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
					<td><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td>
			</tr>
			
			
			<tr>
			<td colspan="2" align="center">
			<input type="submit" value="구매하기">
			<input type="button" value="취소"
			onclick="javascript:window.location='#'">
			<input type="hidden" name="buyprice" value="<%= total + total2 %>">
			
			
			</td>
			</tr>
			</table>
			
		</form>
</body>
</html>
<%@include file="../view/footer.jsp"%>