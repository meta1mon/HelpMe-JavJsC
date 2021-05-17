<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
<%@include file="style/index.css"%>
</style>


<script>
	$(document).ready(function(){
		if($("#animation").css("display", "block")){
		} 
		$("#power").click(function(){
			console.log("클릭했다")
				$("#container").css("display", "block")
				$("#power").css("display", "none")
		})

	$("#animation").one(
			"transitionend webkitTransitionEnd oTransitionEnd MSTransitionEnd",
			function() {
				console.log("transitioned");
						});
	$("#animation").one(
			"animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd",
			function() {
				console.log("animationed");
				$("#animation").css("display", "none")
				location.href="<%=request.getContextPath()%>/javcsecond"
										});
					})
</script>
<meta charset="UTF-8">
</head>
<%@include file="../view/header.jsp"%>
<body class="content">
	<div id="animation" style="display: block;">
		<div class="power" id="power" style="cursor: pointer;">
			<span class="fas fa-power-off"
				style="width: 1em; height: 1em; margin-top: 5px; position: relative"></span>
			<span style="padding: 0 5px 5px 5px; margin-top: 2px;">도와줘 잡스씨</span>
		</div>
		<div class="container" style="display: none;" id="container">
			<div id="progress" class="progress2 progress-moved">
				<div class="progress-bar2"></div>
			</div>
		</div>
	</div>
</body>
<%@include file="../view/footer.jsp"%>

</html>
