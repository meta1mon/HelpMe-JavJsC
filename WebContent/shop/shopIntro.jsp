<%@page import="bookshop.DAO.ShopvideoDAO"%>
<%@page import="bookshop.VO.VideoVO"%>
<%@page import="bookshop.DAO.BookcartDAO"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="bookshop.DAO.ShopBookDAO"%>
<%@page import="bookshop.VO.ShopBookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>shopping mall</title>
</head>
<body class="content">
<%@include file="../view/header.jsp"%>
<div>
<h3>신간소개</h3>
<%
	ShopBookVo bookLists[] = null;
	int number = 0;
	String book_kindName= "";
	

	
	ShopBookDAO bookprocess = ShopBookDAO.getinstance();
	for(int i=1; i<=3; i++){
		bookLists = bookprocess.getBooks(i +"00", 3);
		if(bookLists[0].getBkind().equals("100")){
			book_kindName = "JAVA";
		}else if(bookLists[0].getBkind().equals("200")){
			book_kindName = "JSP";
		}else if(bookLists[0].getBkind().equals("300")){
			book_kindName = "HTML";
		}	
	%>
	<div>
	<br><font size="+1"><b><%=book_kindName %><b>분류의 신간 목록</b>
	<img src="../imageFile/<% %>">
	<a class ="more" href="introList.jsp?bkind=<%=bookLists[0].getBkind()%>">구경하러가기</a>
	</font>
	</div>
 <%
	}
 %>
 
 
	<%
		VideoVO videoLists[] = null;
		String video_kindName= " ";
		
		
		ShopvideoDAO videoprocess= ShopvideoDAO.getinstance();
		for(int j=1; j <= 3; j++){
			videoLists = videoprocess.getVideos( j+"00", 3);
			if(videoLists[0].getVkind().equals("100")){
				video_kindName = "JAVA";
			}else if(videoLists[0].getVkind().equals("200")){
				video_kindName = "JSP";
			}else if(videoLists[0].getVkind().equals("300")){
				video_kindName = "HTML";
			}
	%>
		<div>
	<br><font size="+1"><b><%=video_kindName %><b>분류의 신간 목록</b>
	<a class ="more" href="videoIntroList.jsp?vkind=<%= videoLists[0].getVkind()%>">구경하러가기</a>
	</font>
	</div>	
	<%
		}
	%>	
</body>
</html>
