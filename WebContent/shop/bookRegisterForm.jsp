<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../admin/adminAside.jsp" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<style>
<%@include file="../style/common.css" %>
</style>
<style>
.page-header {
	font-weight: bold;
	margin: 0 20px 20px 40px;
}

.table {
	border-collapse: collapse;
	width: 800px;
	margin: 20px;
}


.table tr:nth-child(odd){background-color: #f2f2f2;}


.table td{
	padding: 8px;
	line-height: 1.42857143;
	border-top: 1px solid #ddd;
	vertical-align: middle;
} 

input[type=text], select {
	width: 100%;
	padding: 8px;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.btn {
	color: #809bbf;
	background-color: #eef0f5;
	border-color: #809bbf;
	border: 2px solid;
	border-radius: 4px;
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 0;
	font-size: 14px;
	line-height: 1.42857143;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	cursor: pointer;
	font-family: 'GmarketSansLight';
	font-weight: bold;
}


.btn:hover, .btn:active {
	color: #fff;
	background-color: #809bbf;
	border-color: #809bbf;
}


input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

.label {
	display: inline-block;
	padding: 5px 12px;
	color: #809bbf;
	vertical-align: middle;
	background-color: #eef0f5;
	cursor: pointer;
	border: 1px solid #809bbf;
	border-radius: 4px;
}

/* named upload */
.upload-name {
	display: inline-block;
	height: 20px;
	font-size: 15px; 
	padding: 0 10px;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-radius: 5px;
	font-family: 'GmarketSansLight';
	font-weight: bold;
}



</style>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){ 
	$("#file").on('change',function(){
		  var fileName = $("#file").val();
		  $(".upload-name").val(fileName);
		});
	}); 
</script>
</head>
<main>
<div style="padding: 50px; margin-left: 200px;">
         	<h1 class="page-header">책 등록</h1>
			<form action="<%=request.getContextPath()%>/bookregister" method="post"
				name="writeForm" enctype="multipart/form-data">
				<table class="table">
					<tr>
						<td style="border-right: 1px solid #ddd; text-align: center;">분류선택</td>
						<td><select name="bkind">
								<option value="100">JAVA</option>
								<option value="200">JSP</option>
								<option value="300">HTML</option>
						</select></td>
					</tr>
					<tr>
						<td style="border-right: 1px solid #ddd; text-align: center;">책번호</td>
						<td><input type="text" name="bid"
							placeholder="bid는 b00001 양식으로 입력해주세요"></td>
					</tr>
					<tr>
						<td style="border-right: 1px solid #ddd; text-align: center;">제목</td>
						<td><input type="text" name="btitle"></td>
					</tr>
					<tr>
						<td style="border-right: 1px solid #ddd; text-align: center;">가격</td>
						<td><input type="text" name="bprice"></td>
					</tr>
					<tr>
						<td style="border-right: 1px solid #ddd; text-align: center;">수량</td>
						<td><input type="text" name="bcount"></td>
					</tr>
					<tr>
						<td style="border-right: 1px solid #ddd; text-align: center;">저자</td>
						<td><input type="text" name="author"></td>
					</tr>
					<tr>
						<td style="border-right: 1px solid #ddd; text-align: center;">출판사</td>
						<td><input type="text" name="publishing_com"></td>
					</tr>
					<tr>
						<td style="border-right: 1px solid #ddd; text-align: center;">이미지</td>
						<td><label class="label" for="file">업로드</label>
							<input type="file" name="bimage" id="file">
							<input class="upload-name" value="파일 선택"></td> 
							
					</tr>
					<tr>
						<td style="border-right: 1px solid #ddd; text-align: center;">할인율</td>
						<td><input type="text" name="discountRate"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
						<input class="btn" type="submit" value="책등록" /> 
						<input class="btn" type="reset" value="다시작성" /></td>
					</tr>
			</table>
		</form>
</div>
</main>
</html>
