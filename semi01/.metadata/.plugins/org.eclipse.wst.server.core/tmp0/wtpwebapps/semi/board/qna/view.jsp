<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.qna.dao.BbsDAO" %> <!-- write.jsp 일부 수정해 만듦 -->
<%@ page import="board.qna.vo.Bbs" %> <!-- 데이터베이스 접근 위해 추가 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 반응형 웹으로 설정 -->
<!-- CSS(부트스트랩 사용) -->
<title>JSP 게시판 웹 사이트</title>
	<!-- CSS(부트스트랩 사용) -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/27.1.0/classic/ckeditor.js"></script>
	<style>
	<%@include file="../../style/common.css" %>
	<%@include file="../../style/header.css" %>
	<%@include file="../../style/footer.css"%>
</style>
</head>
<%@include file="../../view/header.jsp"%>
<body class="content">
	<%
		String bwriter = null;
		if (session.getAttribute("loginMember") != null) {
			bwriter = (String) session.getAttribute("loginMember");
		}
		// 매개변수, 기본세팅 처리
		int bno = 0; // 존재하는 글
		if (request.getParameter("bno") != null) {
			bno = Integer.parseInt(request.getParameter("bno"));
		}
		if (bno == 0) { // 존재하지 않는 글
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 글입니다.')"); 
			script.println("location.href = 'bbs.jsp'"); 
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bno);
	%>

	<!-- 게시글 하나 보여주는 영역 -->
	<div class="container">
	<div class="row"> <!-- form 태그 삭제함 -->
			<table  style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr> <!-- 글 제목 -->
						<th colspan="2" style="background-color: #eeeeee; text-align: center;"><%= bbs.getBsubject() %></th>
					</tr>
				</thead>
				<tbody> <!-- 작성자, 작성일 -->
					<tr>
						<td>작성자 | <%= bbs.getBwriter() %></td>
						<td>작성일 | <%= bbs.getBdate().substring(2, 11)
								  		  + bbs.getBdate().substring(11, 13) + ":"
								  		  + bbs.getBdate().substring(14, 16) %></td>
					</tr>
					<tr> <!-- 글 내용 출력 -->
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= bbs.getBcontent() %></td>
					</tr>
				</tbody>
			</table>
			<a href="bbs.jsp" >목록</a>
			<%	// 글 수정/삭제기능
				if(bwriter != null && bwriter.equals(bbs.getBwriter())) { // 접속한 userID가 빈 값이 아닌 로그인 상태인 동시에 작성자와 일치할 때
			%>
					<a href="<%=request.getContextPath() %>/BoardUpdateCtrl?bno=<%= bno %>" >수정</a> <!-- 글 수정 페이지로 보냄 -->
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="<%=request.getContextPath() %>/BoardDelteCtrl"?bno=<%= bno %>" ">삭제</a> <!-- 글 삭제 페이지로 보냄 -->
			<%
				}
			%>
	</div>
	</div>
</body>
<%@include file="../../view/footer.jsp"%>
</html>