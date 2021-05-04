<%@ page import="board.qna.vo.Bbs" %> <!-- 데이터베이스 접근 위해 추가 -->
<%@ page import="board.qna.dao.BbsDAO" %> <!-- write.jsp 일부 수정해 만듦 -->
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 반응형 웹으로 설정 -->
<!-- CSS(부트스트랩 사용) -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
<script src="https://cdn.ckeditor.com/ckeditor5/27.1.0/classic/ckeditor.js"></script>
</head>
	<%@include file="../../view/header.jsp"%>
<body class="content">
	<%
		String bwriter = null;
		if (session.getAttribute("loginMember") != null) {
			bwriter = (String) session.getAttribute("loginMember");
		}
		if (bwriter == null) { // 로그아웃 상태
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')"); // 경고창 띄우고 
			script.println("location.href = '../../member/login.jsp'"); // 로그인 페이지로 보냄
			script.println("</script>");
		}
			int bno = 0; // 존재하는 글
			if (request.getParameter("bno") != null) {
				bno = Integer.parseInt(request.getParameter("bno"));
			}
			if (bno == 0) { // 존재하지 않는 글
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('존재하지 않는 글입니다.')"); // 경고창 띄우고 
				script.println("location.href = 'bbs.jsp'"); // 게시판 페이지로 보냄
				script.println("</script>");
			}
			Bbs bbs = new BbsDAO().getBbs(bno);
			if (!bwriter.equals(bbs.getBwriter())) { // 접속자와 작성자가 다르면 
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('권한이 없습니다.')"); // 글 수정 권한 없음 
				script.println("location.href = 'bbs.jsp'"); // 게시판 페이지로 보냄
				script.println("</script>");
			}
	%>

	<!-- 게시글 수정 영역 -->
	<div class="container">
	<div class="row">
		<form method="post" action="<%=request.getContextPath() %>/BoardUpdateCtrl?bbsID=<%=bno %>">
			<table  style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr> <!-- 수정 양식 -->
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">글 수정</th>
					</tr>
				</thead>
				<tbody>
					<tr> <!-- 수정 전 제목을 불러옴 -->
						<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBsubject() %>"></td>
					</tr>
					<tr> <!-- 수정 전 내용을 불러옴 -->
						<td><textarea class="form-control" placeholder="글 내용" id="editor" name="bbsContent" maxlength="2048" style="height: 350px;"><%= bbs.getBcontent() %></textarea></td>
					  <script>
                        ClassicEditor.create( document.querySelector( '#editor' ), {
                        	ckfinder : {
                        		uploadUrl : 'http://localhost:8090/images'
                        	}
                        }).then( editor => {
                                        console.log( editor );
                                } )
                                .catch( error => {
                                        console.error( error );
                                } );
                </script>
					</tr>
				</tbody>
			</table>
			<input type="button" value="취소">
			<input type="submit" value="수정">
		</form>
	</div>
	</div>
</body>
<%@include file="../../view/footer.jsp"%>
</html>