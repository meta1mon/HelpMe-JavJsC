<%@page import="java.text.NumberFormat"%>
<%@page import="bookshop.DAO.ShopBookDAO"%>
<%@page import="bookshop.VO.ShopBookVo"%>
<%@page import="bookshop.VO.VideoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="../view/header.jsp"%>

	
<%
	String bkind = request.getParameter("bkind");
%>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
	<%@include file="../style/shop.css" %>

</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Book Shopping Mall</title>
</head>
<body class="content">
	<%
		List<ShopBookVo> bookLists = null;
			ShopBookVo bookList = null;
			String book_kindName = "";
			int number = 0;

			ShopBookDAO bookprocess = ShopBookDAO.getinstance();

			bookLists = bookprocess.getBooks(bkind);
			if (bkind.equals("100")) {
		book_kindName = "JAVA";
			} else if (bkind.equals("200")) {
		book_kindName = "JSP";
			} else if (bkind.equals("300")) {
		book_kindName = "HTML";
			} else if (bkind.equals("all")) {
		book_kindName = "전체";
			}
	%>
	<h3>
		<b><%=book_kindName%></b>
	</h3>
	<%
		for (int i = 0; i < bookLists.size(); i++) {
			bookList = (ShopBookVo) bookLists.get(i);
	%>
	<center>
	<div id="contents" class="seller_contents">
		<form name="smartForm" method="post">
		<ul class="list_type01">
					<li>
						<!--스마트 상품 담을때 쓸 변수들 -->
                        <input type="hidden" name="ortxBrcd" value="9780689878572" />
    	                <input type="hidden" name="ortxDvcd" value="ENG" />
						<div class="cover">
                                <a href="<%=request.getContextPath() %>/shop/bookContent.jsp?bid=<%=bookList.getBid()%>&bkind=<%=bookList.getBkind()%>">
								<strong class="rank"><%= ++number %></strong>
                                        <img src="../imageFile/<%=bookList.getBimage()%>" alt="book image"/>
								
							</a>
							<div class="button">
		                        	<a href="<%=request.getContextPath() %>/shop/bookContent.jsp?bid=<%=bookList.getBid()%>&bkind=<%=bookList.getBkind()%>" class="btn_small btn_blue4">
									자세히보기<span class="glyphicon glyphicon-hand-up" aria-hidden="true"></span>
		                        </a>
							</div>
						</div>
						<div class="detail">
							<div class="title">
                                    <a href="<%=request.getContextPath() %>/shop/bookContent.jsp?bid=<%=bookList.getBid()%>&bkind=<%=bookList.getBkind()%>">
                                        <strong><%=bookList.getBtitle() %></strong>                                            
                                    </a>
							</div>
	                            <div class="author">
	                             작가 | <%=bookList.getAuthor() %>
	                            </div>

							<div class="info">
								<strike class="org_price"><%=NumberFormat.getInstance().format(bookList.getBprice()) %>원</strike> → 
									<strong class="sell_price"><%=NumberFormat.getInstance().format(bookList.getBprice()*(double)(100-bookList.getDiscountRate()/100)) %>원</strong>
									<span class="dc_rate">[<strong><%=bookList.getDiscountRate() %></strong>%↓]</span>
							</div>
							
								등록일 : <%=bookList.getRegdate() %>
							</div>
							
						
							<input type="hidden" name="bid" value="<%=bookList.getBid()%>">
					</li>
					</ul>
					</form>
					</div>
					</center>
	
	<br>
<%
}
%>
</body>
</html>
<%@include file="../view/footer.jsp"%>