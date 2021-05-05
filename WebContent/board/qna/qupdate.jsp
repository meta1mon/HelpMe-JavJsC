<%@ page import="board.qna.vo.Bbs" %> <!-- 데이터베이스 접근 위해 추가 -->
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
		<form method="post" action="<%=request.getContextPath() %>/BoardUpdateCtrl?bbsID=<%=bno %>">
			<table  style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr> <!-- 수정 양식 -->
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">글 수정</th>
					</tr>
				</thead>
				<tbody>
					<tr> <!-- 수정 전 제목을 불러옴 -->
						<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBsubject() %>"></td>
					</tr>
					<tr> <!-- 수정 전 내용을 불러옴 -->
						<td><textarea class="form-control" placeholder="글 내용" id="editor" name="bbsContent" maxlength="2048" style="height: 350px;"><%= bbs.getBcontent() %></textarea></td>
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
			<input type="button" value="취소">
			<input type="submit" value="수정">
		</form>
</body>
<%@include file="../../view/footer.jsp"%>
</html>