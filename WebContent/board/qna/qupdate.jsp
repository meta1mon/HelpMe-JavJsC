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
<script src="https://cdn.ckeditor.com/ckeditor5/27.1.0/classic/ckeditor.js"></script>
<style>
.ck.ck-editor {
	max-width:800px;
}
.ck-editor__editable {
	min-height: 400px;
}
</style>
</head>
<%@include file="../../view/header.jsp"%>
<body class="content">
	<!-- 게시판(게시글 목록) 영역 -->
	<div class="container">
		<div class="row">
			<form action="<%=request.getContextPath()%>/qnaupdate" method="post">
				<table style="text-align: center; border: 1px solid #dddddd">
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
							<td><input type="text" class="form-control"
								name="qsubject" maxlength="50" value="${qna.qsubject }"></td>
						</tr>
						<tr>
							<td><textarea
									id="editor" name="qcontent" maxlength="2048"
									style="height: 350px;">${qna.qcontent }</textarea></td>

						<script>
						    ClassicEditor
						        .create( document.querySelector( '#editor' ), {
						            cloudServices: {
						                tokenUrl: 'https://80479.cke-cs.com/token/dev/7ac95c09e51707fa1d95f2ea91d9a83fcb6e5bc7fc5a60c689f1f30dfb21',
						                uploadUrl: 'https://80479.cke-cs.com/easyimage/upload/'
						            }
						        } )
						        .catch( error => {
						            console.error( error );
						        } );
						</script>
						</tr>
					</tbody>
				</table>
				<div id="fileDiv">
					<p>
						첨부파일<br> <input type="file" id="file" name="file"> <a
							href="#this" class="btn" id="delete" name="delete">삭제</a>
					</p>
				</div>
				<br /> <br /> <a href="#this" class="btn" id="addFile">파일 추가</a> 
				<input type="button" value="취소" onclick="location.href = '<%=request.getContextPath()%>/qnalist'">
				<input type="submit" value="수정">
			</form>
		</div>
	</div>
<script type="text/javascript">
		var gfv_count = 1;
		$(document).ready(function() {

			$("#addFile").on("click", function(e) { //파일 추가 버튼
				if(gfv_count==10) {
					alert(gfv_count+"개까지만 첨부 가능합니다.");
					return false;
				} else {
				gfv_count++;
				e.preventDefault();
				fn_addFile();
				}
			});

			$("a[name='delete']").on("click", function(e) { //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		});

		function fn_addFile() {
			var str = "<p><input type='file' name='file'><a href='#this' class='btn' name='delete'>삭제</a></p>";
			$("#fileDiv").append(str);
			$("a[name='delete']").on("click", function(e) { //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		}
		

		function fn_deleteFile(obj) {
			obj.parent().remove();
			gfv_count--;
		}
	</script>
</body>
<%@include file="../../view/footer.jsp"%>
</html>