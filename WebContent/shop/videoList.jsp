<%@page import="bookshop.DAO.ShopvideoDAO"%>
<%@page import="bookshop.VO.VideoVO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");%>
<%
	List<VideoVO> vList = null;
int number = 0;
String vkind = "";

vkind = request.getParameter("vkind");

ShopvideoDAO vProcess = ShopvideoDAO.getinstance();
int count = vProcess.getVideoCount();

if (count > 0) {
	vList = vProcess.getVideos(vkind);
}
%>
<html>
<head>
<meta charset="UTF-8">
<title>등록된 영상 목록</title>
</head>
<body>
	<%
		String v_kindName = "";
		if (vkind.equals("100")) {
			v_kindName = "JAVA";
		} else if (vkind.equals("200")) {
			v_kindName = "JSP";
		} else if (vkind.equals("300")) {
			v_kindName = "HTML";
		} else if (vkind.equals("all")) {
			v_kindName = "전체";
		}
	%>

	<p><%=v_kindName%>
		분류의 목록:
		<%
		if (vkind.equals("all")) {
	%>
		<%=count%>개
		<%
			} else {
		%>
		<%=vList.size()%>개
		<%
			}
		%>
	</p>
	<table>
		<tr>
		<td><a href="./videoRegisterForm.jsp">영상 등록</a></td>		
		</tr>
	</table>
	<%
		if (count == 0) {
	%>
	<table>
		<tr>
			<td>등록된 책 없음</td>
		</tr>
	</table>
	<%
		} else {
	%>
	<table border="1">
		<tr hegiht="30">
			<td>번호</td>
			<td>영상분류</td>
			<td>영상 제목</td>
			<td>가격</td>
			<td>영상 썸네일</td>
			<td>할인율</td>
			<td>등록일</td>
			<td>시청 가능 시작일</td>
			<td>시청 종료일</td>
			<td>영상길이</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
			<%
				for (int i = 0; i < vList.size(); i++) {
					VideoVO video = (VideoVO)vList.get(i);
			%>
			<tr height="30">
			<td><%=video.getVid()%></td>
			<td><%=video.getVkind()%></td>
			<td><%=video.getVtitle()%></td>
			<td><%=video.getVprice()%></td>
			<td><%=video.getVimage()%></td>
			
			<td><%=video.getDiscountRate()%></td>
			<td><%=sdf.format(video.getRegdate())%></td>
			<td><%=video.getStartDate() %></td>
			<td><%=video.getEndDate() %></td>
			<td><%=video.getVsize() %></td>
			<td width="50" style="text-decoration: underline;">
			<a href="<%=request.getContextPath() %>/videoupdateForm?vid=<%=video.getVid()%>&vkind=<%=video.getVkind()%>">수정</a></td>
			<td width="50" style="text-decoration: underline;">
			<a href="<%=request.getContextPath() %>/videodeleteForm?vid=<%=video.getVid()%>&vkind=<%=video.getVkind()%>">삭제</a></td>
			</tr>
			<%
				}
			%>
		
	</table>
	<%
		}
	%>
</body>
</html>