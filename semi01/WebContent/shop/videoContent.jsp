<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@page import="bookshop.DAO.shopvideoDAO"%>
<%@page import="bookshop.VO.videoVO"%>
<%@page import="member.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String vid = request.getParameter("vid");
	String vkind = request.getParameter("vkind");
	String id = "";
	Member vo = (Member) request.getSession().getAttribute("loginMember");
int vBuyPrice = 0;
try {
	if (session.getAttribute("loginMember") == null){
		id = "not";	
	}else{
		id = vo.getId();
		System.out.println(id);
	}
} catch (Exception e){}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>영상 상세 페이지</title>
</head>
<body>
	<%
	List<videoVO> vLists = null;
	videoVO vList = null;
	String video_kindName = "";

	shopvideoDAO vprocess = shopvideoDAO.getinstance();
	vList = vprocess.getVideo(Integer.parseInt(vid));

	vLists = vprocess.getVideos(vkind);
	if (vkind.equals("100")) {
		video_kindName = "JAVA";
	} else if (vkind.equals("200")) {
		video_kindName = "JSP";
	} else if (vkind.equals("300")) {
		video_kindName = "HTML";
	} else if (vkind.equals("all")) {
		video_kindName = "전체";
	}
	%>

</body>
<form name="inform" action="<%=request.getContextPath() %>/shop/videocartInsert.jsp" method="post">
	<table border="1">
		<tr>
			<td rowspan="6" width="150"><img src="../imageFile/<%=vList.getVimage()%>" border="0" width="150"
				height="200"></td>
		</tr>
		<tr>
			<td width="500"><font size="+1"> <b><%=vList.getVtitle()%></b>
			</font></td>
		</tr>
		<tr>
			<td width="500">영상길이: <%=vList.getVsize()%></td>
		</tr>
		<tr>
			<td width="500">영상 유효기간: <%=vList.getStartDate()%>
			~ <%=vList.getEndDate() %>
			</td> 
		</tr>
		<tr>
			<td width="500">정가 <%=NumberFormat.getInstance().format(vList.getVprice())%>원<br>
				<%
					vBuyPrice = (int) (vList.getVprice() * ((double) (100 - vList.getDiscountRate()) / 100));
				%> 판매가: <b><font color="red"> <%=NumberFormat.getInstance().format((int) (vBuyPrice))%>원
				</font></b></td>
		<tr>
			<td width="500">수량  : <input type="text" size="5" name="buyCount" value="1">개
			<%
			if(id.equals("not")){
			%>
				<font color="red">로그인 후 구매가능합니다.</font>
			<b>일시품절</b>
			<%
				}else{
			%>
			<input type="hidden" name="vid" value="<%= vid %>">
			<input type="hidden" name="vimage" value="<%=vList.getVimage() %>">
			<input type="hidden" name="vtitle" value="<%=vList.getVtitle() %>">
			<input type="hidden" name="vBuyPrice" value="<%= vBuyPrice %>">
			<input type="hidden" name="vkind" value="<%=vkind %>">
			<input type="hidden" name="bkind" value="0">
			<input type="hidden" name="bid" value="0">
			<input type="hidden" name="btitle" value="0">
			<input type="hidden" name="bimage" value="0">
			<input type="hidden" name="buyPrice" value="0">
			
			<input type="submit" value="장바구니 담기">	
	
			<%
				}
		%>
			<input type="button" value="목록으로" onclick="javascript:window.location='bookList.jsp?bkind=<%=vkind %>>'">
			<input type="button" value="메인으로" onclick="javascript:window.location='#'">
			
			</td>
		</tr>
		
		


	</table>
</form>
</html>