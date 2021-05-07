<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.qna.dao.QnaDao" %> <!-- write.jsp 일부 수정해 만듦 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script>
	function open_win(url){
		window.open(url, "width=500, height=230");
	}
</script>
</head>
<%@include file="../../view/header.jsp"%>
<body class="content">

	<!-- 게시글 내용 표시 -->
	<table border="2">
		<tr>
			<td colspan="2"
				style="background-color: #eeeeee; text-align: center;">게시글 제목 :
				${qna.qsubject }</td>
		</tr>
		<tr>
			<td>조회수 ${qna.qviewcnt }<br>추천수 ${qna.qlikecnt }
			</td>
			<td>게시글 내용 : ${qna.qcontent }</td>
		</tr>
	</table>

	<br>

	<form action="<%=request.getContextPath()%>/rqnawrite" method="post">
		<table border="2">
			<!-- 댓글이 있으면 댓글 내용 표시 -->
			<c:if test="${reply != null}">
				<c:forEach items="${reply }" var="r">
					<tr>
						<td>추천수 ${r.rqlikecnt }<br>태그 : 미구현
						</td>
						<td>${r.rqcontent }</td>
						<td><button type="button"
								onclick="location.href='<%=request.getContextPath()%>/rqnadelete?rqno=${r.rqno }'">삭제</button>
							<button type="button" id="rqnareply" onclick="open_win('<%=request.getContextPath()%>/moverqnaupdate?rqno=${r.rqno }')">수정</button></td>
<!-- 
							<button type="button" id="rqnareply" onclick="window.open('<%=request.getContextPath()%>/moverqnaupdate?rqno=${r.rqno }'">수정</button></td>
 -->					</tr>
				</c:forEach>
			</c:if>
			<!-- 댓글 유무에 상관없이 댓글 작성 부분은 표시 -->
			<tr>
				<td colspan="2"><input type="hidden" name="qno" value="${qna.qno }"></td>
			</tr>
			<tr>
				<td>빈칸</td>
				<td><input type="text" name="rqcontent" placeholder="댓글을 입력하세요"></td>
				<td><button type="submit">댓글 작성</button></td>
			</tr>
		</table>
	</form>

	<button type="button"
		onclick="location.href='<%=request.getContextPath()%>/qnalist'">목록으로
		돌아가기</button>
	<button type="button"
		onclick="location.href='<%=request.getContextPath()%>/moveqnaupdate?qno=${qna.qno }'">수정</button>
	<button type="button"
		onclick="location.href='<%=request.getContextPath()%>/qnadelete?qno=${qna.qno }'">삭제</button>
		
</body>
<%@include file="../../view/footer.jsp"%>
</html>