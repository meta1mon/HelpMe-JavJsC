<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<title>영상 등록</title>
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

</script>


</head>
<body>
	<p>영상등록</p>
	<form action="<%=request.getContextPath()%>/vregister" method="post"
		name="writeForm" enctype="multipart/form-data">
		<table>
			<tr>
				<td>분류선택</td>
				<td><select name="vkind">
						<option value="100">JAVA</option>
						<option value="200">JSP</option>
						<option value="300">HTML</option>
				</select></td>
			</tr>
			<tr>
			<td>영상번호</td>
			<td><input type="text" name="vid" placeholder="v00001 양식으로 맞춰주세요"></td>
			</tr>
			<tr>
				<td>영상제목</td>
				<td><input type="text" name="vtitle"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="vprice"></td>
			</tr>
			<tr>
				<td>영상썸네일</td>
				<td><input type="file" name="vimage"></td>
			</tr>
			<tr>
				<td>할인율</td>
				<td><input type="text" name="discountRate"></td>
			</tr>
			<tr>
				<td>영상유효기간</td>
				<td>
				<lable>시작일<input type="text" id="startDate" name=startDate></lable>
				<img src="../images/calendar.gif">
				<label>종료일<input type="text" id="endDate" name="endDate"></label>
				<img src="../images/calendar.gif">
			</td>
			</tr>
			<tr>
				<td>영상길이</td>
				<td><input type="text" name="vsize"></td>
			</tr>

			<input type="submit" value="영상등록">
			<input type="reset" value="다시작성">
		</table>
	</form>
</body>
</html>