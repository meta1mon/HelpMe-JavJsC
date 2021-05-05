<%@ page import="board.qna.dao.QnaDao" %> <!-- write.jsp 일부 수정해 만듦 -->
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
<script src="https://cdn.ckeditor.com/ckeditor5/27.1.0/classic/ckeditor.js"></script>
</head>
	<%@include file="../../view/header.jsp"%>
<body class="content">
	<!-- 게시판(게시글 목록) 영역 -->
	<div class="container">
		<div class="row">
			<form action="<%=request.getContextPath()%>/qnaupdate"
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
							<td><input type="hidden" name="qno" value="${qna.qno }"><td>
						</tr>
						<tr>
							<!-- 내용 -->
							<td><input type="text" class="form-control"
								name="bsubject" maxlength="50" value="${qna.qsubject }"></td>
						</tr>
						<tr>
							<td><textarea class="form-control"
									id="editor" name="bcontent" maxlength="2048"
									style="height: 350px;">${qna.qcontent }</textarea></td>

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
				<input type="button" value="취소" onclick="location.href = 'index.jsp'">
				<input type="submit" value="수정">
			</form>
		</div>
	</div>
</body>
<%@include file="../../view/footer.jsp"%>
</html>