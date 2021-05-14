<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<style>
<%@include file="style/index.css" %>
</style>
<meta charset="UTF-8">
</head>
<%@include file="../view/header.jsp"%>
<body class="content">
	<!--<div class="index-content">
		<img alt="메인 이미지 입니다."
			src="http://ipsumimage.appspot.com/500x500?l=멋진 이미지" id="mainImg"><br>
		<button onclick="location.href='secondPage.jsp'" class="start">도와줘 잡스씨</button>
	</div>-->
	<div id="app-cover">
		<div id="app">
			<form method="get" action="">
				<div id="f-element">
					<div id="inp-cover">
						<input type="text" name="query"
							placeholder="도와줘 잡스씨" autocomplete="off">
					</div>
				</div>
				<button type="submit" class="shadow">
					<i class="fas fa-power-off"></i>
				</button>
			</form>
		</div>
		<div id="layer"><i class="fas fa-power-off"></i></div>
		<div id="init"></div>
	</div>
</body>
<%@include file="../view/footer.jsp"%>

</html>
