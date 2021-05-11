<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.qna.dao.QnaDao"%>
<!-- write.jsp 일부 수정해 만듦 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 반응형 웹으로 설정 -->
<title>JSP 게시판 웹 사이트</title>
<!-- CSS(부트스트랩 사용) -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/27.1.0/classic/ckeditor.js"></script>


<style>
	<%@include file="../../style/common.css" %>
	<%@include file="../../style/header.css" %>
	<%@include file="../../style/footer.css"%>

</style>
<script>
	function open_win(url, name){
		window.open(url, name, "width=1000px, height=500px, resizable = no, left= 100, top=100");
	};
	
	function qlike() {
		$.ajax({
			url : "<%=request.getContextPath()%>/qlike",
			type : "post",
			data : {
				id : "${loginMember.id}",
				qno : "${qna.qno}"
			},
			datatype : "json",
			success : function(data) {
				alert(data);
				if(data == "추천 성공") {					
				$("#qlikeid").attr("src", "images/doLike.png");
				} else {
				$("#qlikeid").attr("src", "images/undoLike.png");					
				}
				window.location.reload();
			}
		});
	};

	function rqlike(rqno) {
		$.ajax({
			url : "<%=request.getContextPath()%>/rqlike",
			type : "post",
			data : {
				id : "${loginMember.id}",
				rqno : rqno
			},
			datatype : "json",
			success : function(data) {
				alert(data);
	            window.location.reload();
			}
		});
	}
</script>
</head>
<%@include file="../../view/header.jsp"%>
<body class="content">
	<div style="width: 800px; margin: 0 auto 0 auto;">
		<h1 style="text-align: justify;">${qna.qsubject }</h1>
		<h4 style="width: 400px; float: left; text-align: left;">조회수
			${qna.qviewcnt }</h4>
		<h4 style="width: 400px; float: right; text-align: right; color: #546E7A">${qna.qwriter }</h4>
		<h4 style="clear: both; width: 800px; text-align: left;">
			<c:choose>
				<c:when test="${qna.qtag ==1}">Java</c:when>
				<c:when test="${qna.qtag ==2}">C</c:when>
				<c:when test="${qna.qtag ==3}">Python</c:when>
			</c:choose>
		</h4>
		<hr>
		<div id="question">
			<div style="width: 80px; float: left;">
<!--  추천수~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
				<img src="images/like.png" onclick="qlike()" style="cursor:pointer;" id="qlikeid"> <br>
				추천수 ${qna.qlikecnt }
			</div>
			<div style="width: 720px; float: left; background-color: lightgray; word-wrap:break-word">
				${qna.qcontent }</div>
			<div style="clear: both; padding: 10px 0; text-align: left;">
				첨부파일 :
				<c:forTokens var="fileName" items="${qna.qfilepath}" delims=","
					varStatus="st">
					<a download="${fileName}"
						href="<%=request.getContextPath() %>/board/files/${fileName }">${fileName}</a>
					<c:if test="${!st.last }">
                        /
                    </c:if>
				</c:forTokens>
			</div>
			<hr>
			<form action="<%=request.getContextPath()%>/rqnawrite" method="post">
				<div style="float: right; margin-top: 10px; width: 720px;">
					<input type="hidden" name="qno" value="${qna.qno }">
					<textarea placeholder="댓글 쓰기" id="editor" name="rqcontent"
						maxlength="2048"></textarea>
				</div>
				<div style="clear: both; float: right; padding-top: 10px;">
					<button type="submit">등록</button>
				</div>
			</form>
		</div>

		<h3 style="clear: both; text-align: left;">답변 수 ${qna.rqnacnt }</h3>
		<hr>
		<c:if test="${reply != null}">
			<c:forEach items="${reply }" var="r">
				<div id="answer">
					<div style="width: 80px; float: left;">
						<img src="images/like.png" onclick="rqlike(${r.rqno})"> <br>
						추천수 ${r.rqlikecnt }
					</div>
					<div style="width: 720px; float: left; background-color: lightgray; word-wrap:break-word">
						${r.rqcontent }</div>
					<div style="float: right; margin: 10px 0;">
						<button type="button"
							onclick="open_win('<%=request.getContextPath()%>/moverqnaupdate?rqno=${r.rqno }', '_blank')">수정</button>
						<button type="button"
							onclick="location.href='<%=request.getContextPath()%>/rqnadelete?rqno=${r.rqno }&qno=${r.qno }'">삭제</button>
					</div>
					<hr style="clear: both;">
				</div>
			</c:forEach>
		</c:if>
		<div>
			<button type="button"
				onclick="location.href='<%=request.getContextPath()%>/qnalist'">목록으로
				돌아가기</button>
			<button type="button"
				onclick="location.href='<%=request.getContextPath()%>/moveqnaupdate?qno=${qna.qno }'">수정</button>
			<button type="button"
				onclick="location.href='<%=request.getContextPath()%>/qnadelete?qno=${qna.qno }'">삭제</button>
		</div>
	</div>
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
<%@include file="../../view/footer.jsp"%>
</html>