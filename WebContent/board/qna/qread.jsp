<%@ page import="java.io.PrintWriter"%>
<%@ page import="board.qna.dao.QnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JSP 게시판 웹 사이트</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/27.1.0/classic/ckeditor.js"></script>


<style>
	<%@include file="../../style/common.css" %>
	<%@include file="../../style/header.css" %>
	.ck.ck-editor {
   max-width:800px;
}
.ck-editor__editable {
   min-height: 200px;
}
</style>
<script>
	function open_win(url, name){
		window.open(url, name, "width=1000px, height=500px, resizable = no, left= 100, top=100");
	};
	
	function qlike() {
		if(${loginMember == null}) {
			alert("로그인이 필요합니다");			
		} else {
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
				if(data == "좋아요") {					
				$("#qlikeid").attr("src", "<%=request.getContextPath() %>/images/doLike.png");
				} else {
				$("#qlikeid").attr("src", "<%=request.getContextPath() %>/images/undoLike.png");					
				}
				window.location.reload();
			}
		});
		}
	};

// rqlike는 몇 번째 댓글인지 알아와야 되는데, 어떻게 할지 모르겠어서 그냥 하트 이펙트 뺐음...
	function rqlike(rqno) {
		if(${loginMember == null}) {
			alert("로그인이 필요합니다");			
		} else {
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
	}
</script>
</head>
<%@include file="../../view/header.jsp"%>
<body class="content">
	<div style="width: 800px; margin: 0 auto 0 auto;">
		<h1 style="text-align: justify;">${qna.qsubject }</h1>
		<div style="float: right;">${qna.qdate}</div>
		<h4 style="width: 400px; float: left; text-align: left;">조회수
			${qna.qviewcnt }</h4>
		<h4
			style="width: 400px; float: right; text-align: right; color: #546E7A">${qna.qwriter }</h4>
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
				<img src="<%=request.getContextPath()%>/images/like.png"
					onclick="qlike()" style="cursor: pointer;" id="qlikeid"> <br>
				추천수 ${qna.qlikecnt }
			</div>
			<div
				style="width: 720px; float: left; background-color: lightgray; word-wrap: break-word">
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
			<c:if test="${loginMember != null }">
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
			</c:if>
			<c:if test="${loginMember == null }">
				<div style="float: right; margin-top: 10px; width: 720px;">
					<h3 style="border: 1px solid black;">댓글 작성은 로그인이 필요합니다.</h3>
				</div>
			</c:if>
		</div>

		<h3 style="clear: both; text-align: left;">답변 수 ${qna.rqnacnt }</h3>
		<hr>
		<c:if test="${reply != null}">
			<c:forEach items="${reply }" var="r">
				<div id="answer">
					<div style="width: 80px; float: left;">
						<img src="<%=request.getContextPath() %>/images/like.png"
							onclick="rqlike(${r.rqno})" style="cursor: pointer;"> <br>
						추천수 ${r.rqlikecnt }
					</div>
					<div
						style="width: 720px; float: left; background-color: lightgray; word-wrap: break-word">
						${r.rqcontent }</div>
					<div style="float:right;">${r.rqdate }
					</div>

					<c:if test="${loginMember.id == r.rqwriter}">
						<div style="float: right; margin: 10px 0;">
							<button type="button"
								onclick="open_win('<%=request.getContextPath()%>/moverqnaupdate?rqno=${r.rqno }', '_blank')">수정</button>
							<button type="button"
								onclick="location.href='<%=request.getContextPath()%>/rqnadelete?rqno=${r.rqno }&qno=${r.qno }'">삭제</button>
						</div>
					</c:if>
					<hr style="clear: both;">
				</div>
			</c:forEach>
		</c:if>
		<div>
			<button type="button"
				onclick="location.href='<%=request.getContextPath()%>/qnalist'">목록으로
				돌아가기</button>
			<c:if test="${loginMember.nickname == qna.qwriter}">
				<button type="button"
					onclick="location.href='<%=request.getContextPath()%>/moveqnaupdate?qno=${qna.qno }'">수정</button>
				<button type="button"
					onclick="location.href='<%=request.getContextPath()%>/qnadelete?qno=${qna.qno }'">삭제</button>
			</c:if>
		</div>
	</div>
	<script>
	function show()
	{
		var pmt = ('수정 시 첨부한 파일은 삭제됩니다.');
	var inputString = prompt(); 
	alert(inputString);
	}

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