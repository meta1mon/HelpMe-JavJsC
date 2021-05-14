<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/27.1.0/classic/ckeditor.js"></script>

</head>
<body>
	<form id="frm" action="<%=request.getContextPath()%>/rstudyupdate" method="post">
		<table>
			<tr>
				<td><input type="hidden" name="rsno" value="${rstudy.rsno }"></td>
			</tr>
			<tr>
				<td><textarea id="editor" name="rscontent" maxlength="2048">${rstudy.rscontent }</textarea></td>
			</tr>
			<tr>
				<td><button type="submit">수정</button></td>
			</tr>
		</table>
	</form>

						<script>
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
						</script>
	
</body>
</html>