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
	<%@include file="../../style/header.css" %>
.ck.ck-editor {
   max-width:800px;
}
.ck-editor__editable {
   min-height: 400px;
}
	#write {
	margin : 40px 0 20px 10px;
	text-align:left;
	font-size:17px;
	color:black;
	float:left;
	}
	#subject {
	background-color: #FBFBFC;
	border: 1px solid #D5D5D5;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	}
	#subject:hover, #subject:focus {
	background-color: #ffffff;
	color: black;
	}
	#tag {
	color:#76858C;
	background-color: #FBFBFC;
	border: 1px solid #D5D5D5;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	}
	#tag:hover, #tag:focus {
	background-color: #ffffff;
	color: black;
	}
	
	.ck-content {
	background-color: #FBFBFC;
	border: 1px solid #D5D5D5;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	}
	#editor:hover, #editor:focus {
	background-color: #ffffff;
	color: black;
	}
	
	#file_text {
	style="width: 150px;
	float:left;
	line-height:70px;"
	}
	
	#file_div {
	float:left;
	}
	
	#submit {
	width:125px;
	height:35px;
	padding:5px;
	margin:10px 0 100px 0;
	border:none;
	border-radius: 4px;
	text-align: center;
	color:#ffffff;
	background-color:#1abc9c;
	font-size:18px;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	float:left;
	}
	#cancel{
	width:90px;
	height:35px;
	padding:5px;
	margin:10px 0 100px 0;
	border:none;
	border-radius: 4px;
	text-align: center;
	color:#1abc9c;
	background-color:#ffffff;
	font-size:18px;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	float:left;
	}
	#submit:hover, #submit:active {
	background-color: #1FE0BA;
	box-shadow: 10px 10px 20px 5px #eeeeee;
	}
	#cancel:active, #cancel:hover {
	box-shadow: 10px 10px 20px 5px #eeeeee;
	}
	
	
	input.upload_text {/*읽기전용 인풋텍스트*/
	float:left;
	width:230px;/* 버튼 포함 전체 가로 길이*/
	height:19px;
	line-height:19px;
	padding:0 3px;
	border:1px solid #bbb;
}

div.upload-btn_wrap input.input_file {/*파일찾기 폼 투명하게*/
	position:absolute;
	top:0;
	right:0;
	cursor:pointer;
	opacity:0;
	filter:alpha(opacity=0);
	-ms-filter:"alpha(opacity=0)";
	-moz-opacity:0;
}
div.upload-btn_wrap {/*버튼테두리 감싼 div*/
	overflow:hidden;
	position:relative;
	float:left;
	width:70px;/*width, height 값은 button(찾아보기)값과 같아야함 */
	height:21px;
	padding-left:3px;
}
div.upload-btn_wrap button {/*버튼 div*/
	width:70px;
	height:21px;
	font-weight:bold;
	background:#333;
	border:1px solid #333;
	color:#fff;
}
</style>
</head>
	<%@include file="../../view/header.jsp"%>
<body class="content">
	<div style="width: 800px; margin: 0 auto 0 auto; color:#76858C;">
		<div id="write">글쓰기</div>
		<form action="<%=request.getContextPath()%>/qnawrite" method="post" enctype="multipart/form-data">
			<input type="hidden" name="qno" value="${qna.qno }">
			<div style="margin-bottom:10px;">
				<input id="subject" style="width: 800px; height: 40px; font-size: 15px; box-sizing: border-box;"
					type="text" placeholder="제목을 입력해 주세요." name="qsubject" maxlength="100" value="${qna.qsubject }">
			</div>
			<div style="margin-bottom:10px;">
				<select id="tag" name="qtag" style="width: 800px; height: 40px; font-size: 15px;">
					<option value="1">JAVA</option>
					<option value="2">C</option>
					<option value="3">Python</option>
				</select>
			</div>
			<div style="margin-bottom:10px;">
				<textarea id="editor" name="qcontent"
					maxlength="4000">${qna.qcontent }</textarea>
			</div>
			<div>
				<input type="submit" value="등록"  id = "submit"> 
				<input type="button" value="취소"  id = "cancel" onclick="location.href = '<%=request.getContextPath()%>/qnalist'">
			</div>
			<div id="file_text">첨부파일</div>
			<div id="fileDiv" style="width: 500px; float:left;">
				<p>
					<input type="file" id="file" name="file" onchange="fn_addFile();" style="margin-top: 5px;">
					<a href="#this" class="btn" id="delete" name="delete"
						style="margin-left: -5px; text-decoration:none; border:1px solid #eeeeee;" >삭제</a>
				</p>
			</div>
			<div style="margin-bottom: 10px; clear:both;">
				<a href="#this" class="btn" id="addFile" style='display:none;'>파일 추가</a>
			</div>
			
			<!--input box-->
<input type="text" class="upload_text" readonly="readonly">
<!--button-->
<div class="upload-btn_wrap">
  <button type="button" title="파일찾기">
   <span>파일찾기</span>  
  </button>
  <input type="file" class="input_file" title="파일찾기">
</div>
		</form>
	</div>
	<script type="text/javascript">
	$(function(){
		$('.upload_text').val('미리보여줄 텍스트.');
		$('.input_file').change(function(){
			var i = $(this).val();
			$('.upload_text').val(i);
		});
	});
	
	
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
    
		var gfv_count = 1;
		$(document).ready(function() {

			$("a[name='delete']").on("click", function(e) { //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		});

		function fn_addFile() { //파일 추가 함수
			console.log(gfv_count);
			if(gfv_count==10) {
				alert(gfv_count+"개까지만 첨부 가능합니다.");
				return false;
			} else {
			gfv_count++;
			
			var str = "<p><input type='file' onchange='fn_addFile();' name='file"+(gfv_count)+"'><a href='#this' class='btn' name='delete' style='text-decoration:none; border:1px solid #eeeeee;'>삭제</a></p>";
			$("#fileDiv").append(str);
			$("a[name='delete']").on("click", function(e) { //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
			}
		}

		function fn_deleteFile(obj) {
			obj.parent().remove();
			gfv_count--;
		}
	</script>

</body>
<%@include file="../../view/footer.jsp"%>
</html>