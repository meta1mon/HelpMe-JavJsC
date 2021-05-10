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
	
		table {
	width:80%;
	margin-right:auto;
	margin-left:auto;
	text-align: center;
	}
	
</style>
</head>
	<%@include file="../../view/header.jsp"%>
<body class="content">
	<!-- 게시판(게시글 목록) 영역 -->
	<div class="container">
		<div class="row">
			<form action="<%=request.getContextPath()%>/qnawrite" method="post"
				enctype="multipart/form-data">
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
							<td><select name="qtag">
									<option value="1">JAVA</option>
									<option value="2">C</option>
									<option value="3">Python</option>
							</select></td>
							<!-- 내용 -->
							<td><input type="text" placeholder="글 제목" name="qsubject"
								maxlength="50"></td>
						</tr>
						<tr>
							<td colspan="2"><textarea placeholder="글 내용" id="editor"
									name="qcontent" maxlength="2048"></textarea></td>

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
				<br /> <br /> <a href="#this" class="btn" id="addFile">파일 추가</a> <input
					type="button" value="취소"
					onclick="location.href = '<%=request.getContextPath()%>/qnalist'">
				<input type="submit" value="등록">
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