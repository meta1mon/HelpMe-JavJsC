<%@page import="member.vo.Member"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 반응형 웹으로 설정 -->
<!-- CSS(부트스트랩 사용) -->
<link rel="stylesheet" href="css/bootstrap.css">
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
<body>
	<%
	Member vo = (Member) session.getAttribute("loginMember");
	String bwriter = null;
	if (session.getAttribute("loginMember") != null) {
		bwriter = vo.getNickname();
	}
	%>

<%@include file="../../view/header.jsp"%>
<body class="content">
	
	<!-- 게시판(게시글 목록) 영역 -->
	<div class="container">
		<div class="row">
	<form action="<%=request.getContextPath() %>/BoardWriteCtrl" method="post">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<!-- 양식 -->
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">
								글쓰기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<!-- 내용 -->
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									id="editor" name="bbsContent" maxlength="2048"
									style="height: 350px;"></textarea></td>

							<script>
                        ClassicEditor.create( document.querySelector( '#editor' ), {
                        	ckfinder : {
                        		uploadUrl : 'http://localhost:8090/images'
                        	}
                        }).then( editor => {
                                        console.log( editor );
                                } )
                                .catch( error => {
                                        console.error( error );
                                } );
                </script>
						</tr>
					</tbody>
				</table>
				<input type="button" value="취소" onclick="location.href = 'bbs.jsp'"">
				<input type="submit" value="등록">
			</form>
		</div>
	</div>
</body>
<%@include file="../../view/footer.jsp"%>
</html>