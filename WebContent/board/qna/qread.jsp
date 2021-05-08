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
<title>JSP 게시판 웹 사이트</title>
	<!-- CSS(부트스트랩 사용) -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="//cdn.ckeditor.com/4.16.0/full/ckeditor.js"></script>

	
	<style>
	<%@include file="../../style/common.css" %>
	<%@include file="../../style/header.css" %>
	<%@include file="../../style/footer.css"%>
	
	table {
	width:70%;
	margin-right:auto;
	margin-left:auto;
	text-align: center;
	}
	
	tr {
  border-style: groove;
  border-width: 1px;
  border-color: #FEFEFE;
	}
</style>
<script>
	function open_win(url, name){
		window.open(url, name, "width=1000px, height=500px, resizable = no, left= 100, top=100");
	}
	
	function like() {
		console.log("좋아요 들어왕");
		
		
	}
</script>
</head>
<%@include file="../../view/header.jsp"%>
<body class="content">
	<!-- 게시글 내용 표시 -->
	<table class="1" border="2">
		<tr>
			<td colspan="2" style= text-align: center;"><h3>글쓴이 ${qna.qwriter }</h3></td>
			<td>조회수 ${qna.qviewcnt } 추천수 ${qna.qlikecnt }</td>
		</tr>
		<tr>
			<td colspan="2"><h4>글 제목 ${qna.qsubject }</h4></td>
			<td>&nbsp;</td>
		</tr>
		<tr style="border-bottom: hidden;">
			<td colspan="2">&nbsp;</td>
			<td><a name="bfilepath" href="<%=request.getContextPath() %>/board/files/${qna.qfilepath }"
				download="${qna.qfilepath }">${qna.qfilepath }</a></td>
		</tr>
		<tr>
			<td colspan="2">글 내용 ${qna.qcontent }</td>
			<td>&nbsp;</td>
		</tr>
	</table>

	<br>

	<form action="<%=request.getContextPath()%>/rqnawrite" method="post">
		<table border="2">
					<tr>
						<td colspan="3" style="background-color: #F0F0F0; text-align: center;">댓글</td>
					</tr>
			<!-- 댓글이 있으면 댓글 내용 표시 -->
			<c:if test="${reply != null}">
				<c:forEach items="${reply }" var="r">
					<tr>
						<td>추천수 ${r.rqlikecnt }<br>태그 : 미구현
						</td>
						<td>${r.rqcontent }</td>
						<td><button type="button"
								onclick="location.href='<%=request.getContextPath()%>/rqnadelete?rqno=${r.rqno }'">삭제</button>
							<button type="button" id="rqnareply" onclick="open_win('<%=request.getContextPath()%>/moverqnaupdate?rqno=${r.rqno }', '_blank')">수정</button></td>
					</tr>
				</c:forEach>
			</c:if>
			<!-- 댓글 유무에 상관없이 댓글 작성 부분은 표시 -->
			<tr>
				<td colspan="2"><input type="hidden" name="qno" value="${qna.qno }"></td>
			</tr>
			<tr>							
				<td><textarea placeholder="댓글 쓰기"
									id="editor" name="rqcontent" maxlength="2048"
									style="height: 350px;"></textarea></td>
				<td><button type="submit">등록</button></td>
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
	<button type="button"
		onclick="like();">추천</button>
<script>
								CKEDITOR.replace('editor');
							</script>

</body>
<%@include file="../../view/footer.jsp"%>
</html>