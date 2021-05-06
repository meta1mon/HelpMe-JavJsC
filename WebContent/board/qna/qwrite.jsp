<%@page import="member.vo.Member"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JSP 게시판 웹 사이트</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="//cdn.ckeditor.com/4.16.0/full/ckeditor.js"></script>
	<style>
	<%@include file="../../style/common.css" %>
	<%@include file="../../style/header.css" %>
	<%@include file="../../style/footer.css"%>
</style>
</style>
</head>
<body>

	<%@include file="../../view/header.jsp"%>
<body class="content">

	<!-- 게시판(게시글 목록) 영역 -->
	<div class="container">
		<div class="row">
			<form action="<%=request.getContextPath()%>/qnawrite"
				method="post">
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
							<!-- 내용 -->
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="bsubject" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									id="editor1" name="bcontent" maxlength="2048"
									style="height: 350px;"></textarea></td>

							       <script>
										CKEDITOR.replace( 'editor1' );
					               </script>
					               
						</tr>
					</tbody>
				</table>
				<div id="fileDiv"> <p> <input type="file" id="file" name="file_0"> 
				<a href="#this" class="btn" id="delete" name="delete">삭제</a> 
				</p> 
				</div> 
				<br/><br/> 
				<a href="#this" class="btn" id="addFile">파일 추가</a>

				<input type="button" value="취소" onclick="location.href = 'index.jsp'">
				<input type="submit" value="등록">
			</form>
		</div>
	</div>
</body>
<%@include file="../../view/footer.jsp"%>
</html>