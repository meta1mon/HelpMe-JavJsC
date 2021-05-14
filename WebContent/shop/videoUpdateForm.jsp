<%@page import="bookshop.DAO.ShopvideoDAO"%>
<%@page import="com.sun.media.jfxmedia.control.VideoDataBuffer"%>
<%@page import="bookshop.VO.VideoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String vid = request.getParameter("vid");
String vkind = request.getParameter("vkind");
try {
	ShopvideoDAO vProcess = ShopvideoDAO.getinstance();
	VideoVO video = vProcess.getVideo(vid);
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<meta charset="UTF-8">
<title>책 수정하기</title>
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
	<p>영상 수정하기</p>
	<form action="<%=request.getContextPath()%>/videoUpdate" method="post"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td>분류 선택</td>
				<td><select name="vkind">
						<option value="100" <%if (video.getVkind().equals("100")) {%>
							selected <%}%>>JAVA</option>
						<option value="200" <%if (video.getVkind().equals("200")) {%>
							selected <%}%>>JSP</option>
						<option value="300" <%if (video.getVkind().equals("300")) {%>
							selected <%}%>>HTML</option>
				</select></td>
			</tr>
			<tr>
				<td>영상 제목</td>
				<td><input type="text" name="vtitle"
					value="<%=video.getVtitle()%>"> 
					<input type="hidden" name="vid" value="<%=vid%>"></td>
			</tr>
			<tr>
				<td>영상 가격</td>
				<td><input type="text" name="vprice"
					value="<%=video.getVprice()%>">원</td>
			</tr>
			<tr>
				<td>이미지</td>
				<td><input type="file" name="vimage"
					value="<%=video.getVimage()%>"></td>
			</tr>
			<tr>
				<td>할인율</td>
				<td><input type="text" name="discountRate"
					value="<%=video.getDiscountRate()%>"></td>
			</tr>
			<tr>
				<td>영상유효기간</td>
				<td><lable>시작일<input type="text" id="startDate"
						name=startDate value="<%=video.getStartDate()%>"></lable> <img
					src="../images/calendar.gif"> <label>종료일<input
						type="text" id="endDate" name="endDate"
						value="<%=video.getEndDate()%>"></label> <img
					src="../images/calendar.gif"></td>
			</tr>
			<tr>
				<td>영상길이</td>
				<td><input type="text" name="vsize"
					value="<%=video.getVsize()%>"></td>
			</tr>

			<tr>
				<td colspan=2 align="center"><input type="submit" value="수정하기">
					<input type="submit" value="다시작성"></td>
			</tr>
		</table>
	</form>
	<%
		} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</body>

</html>