<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../admin/adminAside.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<title>영상 등록</title>
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
	background-color: #f2f2f2;
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
	background-color: #f2f2f2;
	border: 1px solid #ebebeb;
	border-radius: 5px;
	font-family: 'GmarketSansLight';
	font-weight: bold;
}

</style>
<script>
  $.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
   
  });

  $(function() {
    $("#startDate, #endDate").datepicker();
  });

  
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
   	<h1 class="page-header">영상 등록</h1>
	<form action="<%=request.getContextPath()%>/vregister" method="post"
		name="writeForm" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<td style="border-right: 1px solid #ddd; text-align: center;">분류선택</td>
				<td><select name="vkind">
						<option value="100">JAVA</option>
						<option value="200">JSP</option>
						<option value="300">HTML</option>
				</select></td>
			</tr>
			<tr>
				<td style="border-right: 1px solid #ddd; text-align: center;">영상번호</td>
				<td><input type="text" name="vid" placeholder="v00001 양식으로 맞춰주세요"></td>
			</tr>
			<tr>
				<td style="border-right: 1px solid #ddd; text-align: center;">영상제목</td>
				<td><input type="text" name="vtitle"></td>
			</tr>
			<tr>
				<td style="border-right: 1px solid #ddd; text-align: center;">가격</td>
				<td><input type="text" name="vprice"></td>
			</tr>
			<tr>
				<td style="border-right: 1px solid #ddd; text-align: center;">영상썸네일</td>
				<td><label class="label" for="file">업로드</label>
							<input type="file" name="vimage" id="file">
							<input class="upload-name" value="파일 선택"></td> 
			</tr>
			<tr>
				<td style="border-right: 1px solid #ddd; text-align: center;">할인율</td>
				<td><input type="text" name="discountRate"></td>
			</tr>
			<tr>
				<td style="border-right: 1px solid #ddd; text-align: center;">영상유효기간</td>
				<td>
				<label>시작일&nbsp;<img src="<%=request.getContextPath() %>/images/calendar.gif"><input type="text" id="startDate" name=startDate></label>
				<br>
				<label>종료일&nbsp;<img src="<%=request.getContextPath() %>/images/calendar.gif"><input type="text" id="endDate" name="endDate"></label>
				</td>
			</tr>
			<tr>
				<td style="border-right: 1px solid #ddd; text-align: center;">영상길이</td>
				<td><input type="text" name="vsize" placeholder="분 단위로 기입"></td>
			</tr>
			<tr>
				<td colspan="2" style="border-right: 1px solid #ddd; text-align: center;">
					<input class="btn" type="submit" value="영상등록">
					<input class="btn" type="reset" value="다시작성">
				</td>
			</tr>
		</table>
	</form>
	</div>
</main>
</html>