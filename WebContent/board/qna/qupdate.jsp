<%@ page import="board.qna.dao.QnaDao"%>
<!-- write.jsp 일부 수정해 만듦 -->
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 반응형 웹으로 설정 -->
<title>JSP 게시판 웹 사이트</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="//cdn.ckeditor.com/4.16.0/full/ckeditor.js"></script>
</head>
<%@include file="../../view/header.jsp"%>
<body class="content">
	<!-- 게시판(게시글 목록) 영역 -->
	<div class="container">
		<div class="row">
			<form action="<%=request.getContextPath()%>/qnaupdate" method="post">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<!-- 양식 -->
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">글쓰기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="hidden" name="qno" value="${qna.qno }">
							<td>
						</tr>
						<tr>
							<!-- 내용 -->
							<td><input type="text" class="form-control" name="bsubject"
								maxlength="50" value="${qna.qsubject }"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" id="editor1"
									name="bcontent" maxlength="2048" style="height: 350px;">${qna.qcontent }</textarea></td>

							<script>
								CKEDITOR.replace('editor1');
							</script>
						</tr>
					</tbody>
				</table>

				<br/><br/> 
				<input type="button" value="취소" onclick="location.href = '<%=request.getContextPath()%>/qnalist'">
				<input type="submit" value="수정">
			</form>
		</div>
	</div>

</body>
<%@include file="../../view/footer.jsp"%>
</html>