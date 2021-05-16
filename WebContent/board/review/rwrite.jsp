<%@page import="member.vo.Member"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/27.1.0/classic/ckeditor.js"></script>
<style>
.ck.ck-editor {
	max-width: 800px;
}

.ck-editor__editable {
	min-height: 400px;
}

#write {
	margin: 40px 0 20px 10px;
	text-align: left;
	font-size: 17px;
	color: black;
	float: left;
}

#subject {
	background-color: #FBFBFC;
	border: 1px solid #D5D5D5;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
}

#subject:hover, #subject:focus {
	background-color: #ffffff;
	color: black;
	border: 1px solid #BDBDBD;
}

#tag {
	color: #76858C;
	background-color: #FBFBFC;
	border: 1px solid #D5D5D5;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
}

#tag:hover, #tag:focus {
	background-color: #ffffff;
	color: black;
	border: 1px solid #BDBDBD;
}

#folder {
	float: right;
	position: relative;
	left: 83px;
	bottom: 2px;
}

#file_text {
	color: black;
	font-size: 14px;
	float: right;
	width: 150px;
	position: relative;
	top: 2px;
	left: 42px;
}

#file {
	color: #76858C;
	position: relative;
	top: 6px;
	left: 276px;
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
	border: none;
}

#file2 {
	color: #76858C;
	position: relative;
	top: 6px;
	left: 216px;
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
	border: none;
}

#delete {
	position: relative;
	font-size: 14px;
	top: 6px;
	left: 198px;
	color: #c0041f;
	text-decoration: none;
}

#delete2 {
	font-size: 14px;
	color: #c0041f;
	text-decoration: none;
	position: relative;
	top: 6px;
	left: 159px;
}

#submit {
	width: 125px;
	height: 35px;
	padding: 5px;
	margin: 30px 0 350px 0;
	border: none;
	border-radius: 4px;
	text-align: center;
	color: #ffffff;
	background-color: #1abc9c;
	font-size: 18px;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
	float: left;
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#cancel {
	width: 90px;
	height: 35px;
	padding: 5px;
	margin: 30px 0px 0px 0;
	border: none;
	border-radius: 4px;
	text-align: center;
	color: #1abc9c;
	background-color: #ffffff;
	font-size: 18px;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
	float: left;
	display: inline;
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#submit:hover, #submit:active {
	background-color: #1FE0BA;
	box-shadow: 10px 10px 20px 5px #eeeeee;
}

#cancel:active, #cancel:hover {
	box-shadow: 10px 10px 20px 5px #eeeeee;
}
</style>
</head>
<%@include file="../../view/header.jsp"%>
<body class="content">
	<div style="width: 840px; margin: 0 auto 0 auto; color: #99ADB6; background:#ffffff; padding:20px; border-radius: 4px;">
		<div id="write">글 쓰기</div>
		<form action="<%=request.getContextPath()%>/reviewwrite" method="post"
			enctype="multipart/form-data">
			<div style="margin-bottom: 10px;">
				<input id="subject"
					style="width: 800px; height: 40px; font-size: 15px; box-sizing: border-box;"
					type="text" placeholder="제목을 입력해 주세요." name="rsubject"
					maxlength="100">
			</div>
			<div style="margin-bottom: 10px;">
				<select id="tag" name="rtag"
					style="width: 800px; height: 40px; font-size: 15px;">
					<option value="1">JAVA</option>
					<option value="2">C</option>
					<option value="3">Python</option>
				</select>
			</div>
			<div style="margin-bottom: 10px;">
				<textarea id="editor" name="rcontent" maxlength="4000"></textarea>
			</div>
			<div>
				<input type="submit" value="등록" id="submit"> <input
					type="button" value="취소" id="cancel"
					onclick="location.href = '<%=request.getContextPath()%>/reviewlist'">
			</div>


			<div id="file_text">파일 첨부</div>
			<img src="<%=request.getContextPath()%>/images/folder.png"
				id="folder">
			<p id="fileDiv">
				<input type="file" id="file" name="file" onchange="fn_addFile();"
					style="margin-top: 25px;"> <a href="#this" class="btn"
					id="delete" name="delete">전체 삭제</a>
			</p>
			<div style="margin-bottom: 10px; clear: both;">
				<a href="#this" class="btn" id="addFile" style='display: none;'>파일
					추가</a>
			</div>

		</form>
	</div>
	<script type="text/javascript">
	
	
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
			
			var str = "<p><input type='file' onchange='fn_addFile();' id='file2' name='file"+(gfv_count)+"'><a href='#this' class='btn' name='delete' id='delete2'>삭제</a></p>";
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