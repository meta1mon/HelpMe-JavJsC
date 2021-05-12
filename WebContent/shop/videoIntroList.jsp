<%@page import="bookshop.DAO.ShopvideoDAO"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="bookshop.DAO.ShopBookDAO"%>
<%@page import="bookshop.VO.ShopBookVo"%>
<%@page import="bookshop.VO.VideoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String vkind = request.getParameter("vkind");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Video Shopping Mall</title>
</head>
<body>
	<%
		List<VideoVO> vLists = null;
			VideoVO vList = null;
			String video_kindName = "";

			ShopvideoDAO vprocess = ShopvideoDAO.getinstance();

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
	<h3>
		<b><%=video_kindName%>분류의 목록</b>
	</h3>
	<%
		for (int i = 0; i < vLists.size(); i++) {
			vList = (VideoVO) vLists.get(i);
	%>
	<table border="1px solid white">
		<tr height="40">
			<td rowspan="4" width="100"><a href="<%=request.getContextPath() %>/shop/videoContent.jsp?vid=<%=vList.getVid()%>&vkind=<%=vList.getVkind()%>">
					<img src="../imageFile/<%=vList.getVimage()%>" border="0" width="100" height="120">
			</a></td>
			<td width="350"><font size="+1">
			<b>
			<a href="<%=request.getContextPath() %>/shop/videoContent.jsp?vid=<%=vList.getVid()%>&vkind=<%=vList.getVkind()%>">
			<%=vList.getVtitle() %></a></b></font></td>
			<td rowspan="4" width="50" align="center" valign="middle">
			</td>
			</tr>
			<tr>
			<td width="350" >
			영상길이 : <%=vList.getVsize() %>>
			</td>
			</tr>
			<tr height="30">
			<td width="350"> 정가 <%=NumberFormat.getInstance().format(vList.getVprice()) %><br>
			판매가 : <b><font color="red">
			<%=NumberFormat.getInstance().format(vList.getVprice()*(double)(100-vList.getDiscountRate()/100)) %>
			</font></b> 
			</td>
			</tr>
	</table>
	<br>
<%
}
%>
<%@include file="../view/footer.jsp" %></section>
</html>