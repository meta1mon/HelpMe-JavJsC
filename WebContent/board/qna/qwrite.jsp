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
<script src="https://cdn.ckeditor.com/ckeditor5/27.1.0/classic/ckeditor.js"></script>
	<style>
	<%@include file="../../style/common.css" %>
	<%@include file="../../style/header.css" %>
	<%@include file="../../style/footer.css"%>
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
	<div style="width: 800px; margin: 0 auto 0 auto;">
		<h1>글쓰기</h1>
		<form action="<%=request.getContextPath()%>/qnawrite" method="post"
			enctype="multipart/form-data">
			<div style="margin-bottom:10px;">
				<input style="width: 800px; height: 40px; font-size: 15px; box-sizing: border-box;"
					type="text" placeholder="글 제목" name="qsubject" maxlength="150">
			</div>
			<div style="margin-bottom:10px;">
				<select name="qtag" style="width: 800px; height: 40px; font-size: 15px;">
					<option value="1">JAVA</option>
					<option value="2">C</option>
					<option value="3">Python</option>
				</select>
			</div>
			<div style="margin-bottom:10px;">
				<textarea placeholder="글 내용" id="editor" name="qcontent"
					maxlength="2048"></textarea>
			</div>
			<div style="width: 150px; float:left;">첨부파일</div>
			<div id="fileDiv" style="width: 650px; float:left;">
				<p>
					<input type="file" id="file" name="file" style="margin-top: 5px;">
					<a href="#this" class="btn" id="delete" name="delete"
						style="margin-left: -5px;">삭제</a>
				</p>
			</div>
			<div style="margin-bottom: 10px; clear:both;">
				<a href="#this" class="btn" id="addFile">파일 추가</a>
			</div>
			<div>
				<input type="submit" value="등록"> <input type="button"
					value="취소"
					onclick="location.href = '<%=request.getContextPath()%>/qnalist'">
			</div>
		</form>
	</div>
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
			var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
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