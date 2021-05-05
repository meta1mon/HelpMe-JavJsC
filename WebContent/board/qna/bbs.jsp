<%@page import="member.vo.Member"%>
<%@page import="board.qna.vo.Bbs"%>
<%@page import="board.qna.dao.BbsDAO"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 반응형 웹으로 설정 -->
<!-- CSS(부트스트랩 사용) -->
<title>JSP 게시판 웹 사이트</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<style>
	<%@include file="../../style/common.css" %>
	<%@include file="../../style/header.css" %>
	<%@include file="../../style/footer.css"%>
	
	table {
	display:block;
	}
	
</style>

</head>
<%@include file="../../view/header.jsp"%>
<body class="content">
	<%
		Member vo = (Member) session.getAttribute("loginMember");
		String bwriter = null;
		if (session.getAttribute("loginMember") != null) {
			bwriter = vo.getNickname();
		}
		int pageNumber = 1; // 1은 기본 페이지
		if (request.getParameter("pageNumber") != null) { // 현재 페이지가 몇 페이지인지 알려주기 위해
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>

	<!-- 게시판(게시글 목록) 영역 -->
	<h3>Q&A</h3>
	<input type="button" value="글쓰기" onclick="location.href = 'write.jsp'"">

	<div class="container">
		<div class="row">
			<table 
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<!-- 양식 -->
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%  // 게시글 가져오기
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for(int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<!-- 내용 -->
						<td><%= list.get(i).getBno() %></td>
						<td><a href="view.jsp?bno=<%= list.get(i).getBno() %>"><%= list.get(i).getBsubject() %></a></td>
						<td><%= list.get(i).getBwriter() %></td>
						<td><%= list.get(i).getBdate().substring(2, 11)
							  + list.get(i).getBdate().substring(11, 13) + ":"
							  + list.get(i).getBdate().substring(14, 16) %></td>
					</tr>
					<%		
						}
					%>
				</tbody>
			</table>
			<%	// 페이징 - 이전버튼, 다음버튼 생성
				if(pageNumber != 1) {
			%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>">이전</a>
			<%
				} if(bbsDAO.nextPage(pageNumber + 1)) {
			%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>">다음</a>
			<%		
				}
			%>

		</div>
	</div>

</body>
<%@include file="../../view/footer.jsp"%>
</html>