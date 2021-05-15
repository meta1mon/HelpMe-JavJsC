<link href="<%=request.getContextPath()%>/style/admin.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/style/admin2.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/style/admin3.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/style/admin4.css" rel="stylesheet">

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<style>

.table{
	width: 600px;
}

td input[type="text"] {
	width: 100%;
  	padding: 8px;
  	border: 1px solid #ccc;
  	border-radius: 4px;
}

</style>
<script>
</script>
</head>
<body>
<%@include file="../admin/adminNav.jsp"%>

	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
            	<h1 class="page-header" style="font-weight:bold;">책 등록</h1>
            </div>
			<form action="<%=request.getContextPath()%>/bookregister" method="post"
				name="writeForm" enctype="multipart/form-data">
				<table class="table">
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
						<td colspan="2">
						<input class="btn btn-outline btn-primary" type="submit" value="책등록" /> 
						<input class="btn btn-outline btn-primary" type="reset" value="다시작성" /></td>
					</tr>
			</table>
		</form>
		</div>
	</div>
</body>
</html>
