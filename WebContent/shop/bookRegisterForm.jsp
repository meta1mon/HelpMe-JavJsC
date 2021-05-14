<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>
	<p>책등록</p>
	<form action="<%=request.getContextPath()%>/bookregister" method="post"
		name="writeForm" enctype="multipart/form-data">
		<table>
			<tr>
				<td>분류선택</td>
				<td><select name="bkind">
						<option value="100">JAVA</option>
						<option value="200">JSP</option>
						<option value="300">HTML</option>
				</select></td>
			</tr>
			<tr>
				<td>책번호</td>
				<td><input type="text" name="bid"
					placeholder="bid는 b0001 양식으로 입력해주세요"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="btitle"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="bprice"></td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input type="text" name="bcount"></td>
			</tr>
			<tr>
				<td>저자</td>
				<td><input type="text" name="author"></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" name="publishing_com"></td>
			</tr>
			<tr>
				<td>이미지</td>
				<td><input type="file" name="bimage"></td>
			</tr>
			<tr>
				<td>할인율</td>
				<td><input type="text" name="discountRate"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="책등록" /> <input
					type="reset" value="다시작성" /></td>
			</tr>
		</table>
	</form>
</body>
</html>
