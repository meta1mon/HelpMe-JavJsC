<%@page import="bookshop.DAO.ShopvideoDAO"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="bookshop.DAO.ShopBookDAO"%>
<%@page import="bookshop.VO.ShopBookVo"%>
<%@page import="bookshop.VO.VideoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="../view/header.jsp"%>
<%
	String vkind = request.getParameter("vkind");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Video Shopping Mall</title>
<style>
	<%@include file="../style/shop.css" %>
</style>
</head>
<body class="content">
	<%
		List<VideoVO> vLists = null;
			VideoVO vList = null;
			String video_kindName = "";
			int number=0;

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
	<center>
	<div id="contents" class="seller_contents">
		<form name="smartForm" method="post">
		<ul class="list_type01" style="list-style:none;">
					<li>
						<div class="cover">
                                <a href="<%=request.getContextPath() %>/shop/videoContent.jsp?vid=<%=vList.getVid()%>&vkind=<%=vList.getVkind()%>">
								<strong class="rank"><%= ++number %></strong>
                                        <img src="../imageFile/<%=vList.getVimage()%>" alt="video image"/>
								
							</a>
							<div class="button">
		                        	<a href="<%=request.getContextPath() %>/shop/videoContent.jsp?vid=<%=vList.getVid()%>&vkind=<%=vList.getVkind()%>" class="btn_small btn_blue4">
									자세히보기<span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span>
		                        </a>
							</div>
						</div>
						<div class="detail">
							<div class="title">
                                    <a href="<%=request.getContextPath() %>/shop/videoContent.jsp?vid=<%=vList.getVid()%>&vkind=<%=vList.getVkind()%>">
                                        <strong><%=vList.getVtitle() %></strong>                                            
                                    </a>
							</div>
	                            <div class="author">
	                             영상길이 | <%=vList.getVsize() %>
	                            </div>

							<div class="info">
								<strike class="org_price"><%=NumberFormat.getInstance().format(vList.getVprice()) %>원</strike> → 
									<strong class="sell_price"><%=NumberFormat.getInstance().format(vList.getVprice()*(double)(100-vList.getDiscountRate()/100)) %>원</strong>
									<span class="dc_rate">[<strong><%=vList.getDiscountRate() %></strong>%↓]</span>
							</div>
							
								등록일 : <%=vList.getRegdate() %>
							</div>
							
						
							
					</li>
					</ul>
					</form>
					</div>
					</center>
	
<%
}
%>
</body>
</html>