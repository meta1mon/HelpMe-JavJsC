<%@ page import="java.io.PrintWriter"%>
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
	
	function slike() {
		if(${loginMember == null}) {
			alert("로그인이 필요합니다");			
		} else {
		$.ajax({
			url : "<%=request.getContextPath()%>/slike",
			type : "post",
			data : {
				id : "${loginMember.id}",
				sno : "${study.sno}"
			},
			datatype : "json",
			success : function(data) {
				alert(data);
				if(data == "좋아요") {					
				$("#slikeid").attr("src", "<%=request.getContextPath() %>/images/doLike.png");
				} else {
				$("#slikeid").attr("src", "<%=request.getContextPath() %>/images/undoLike.png");					
				}
				window.location.reload();
			}
		});
		}
	};

// rqlike는 몇 번째 댓글인지 알아와야 되는데, 어떻게 할지 모르겠어서 그냥 하트 이펙트 뺐음...
	function rslike(rsno) {
		if(${loginMember == null}) {
			alert("로그인이 필요합니다");			
		} else {
			$.ajax({
				url : "<%=request.getContextPath()%>/rslike",
				type : "post",
				data : {
					id : "${loginMember.id}",
					rsno : rsno
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
		<h1 style="text-align: justify;">${study.ssubject }</h1>
		<div style="float: right;">${study.sdate}</div>
		<h4 style="width: 400px; float: left; text-align: left;">조회수
			${study.sviewcnt }</h4>
		<h4
			style="width: 400px; float: right; text-align: right; color: #546E7A">${study.swriter }</h4>
		<h4 style="clear: both; width: 800px; text-align: left;">
			<c:choose>
				<c:when test="${study.stag ==1}">Java</c:when>
				<c:when test="${study.stag ==2}">C</c:when>
				<c:when test="${study.stag ==3}">Python</c:when>
			</c:choose>
		</h4>
		<hr>
		<div id="question">
			<div style="width: 80px; float: left;">
				<img src="<%=request.getContextPath()%>/images/like.png"
					onclick="slike()" style="cursor: pointer;" id="slikeid"> <br>
				추천수 ${study.slikecnt }
			</div>
			<div
				style="width: 720px; float: left; background-color: lightgray; word-wrap: break-word">
				${study.scontent }</div>
			<div style="clear: both; padding: 10px 0; text-align: left;">
				첨부파일 :
				<c:forTokens var="fileName" items="${study.sfilepath}" delims=","
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
				<form action="<%=request.getContextPath()%>/rstudywrite" method="post">
					<div style="float: right; margin-top: 10px; width: 720px;">
						<input type="hidden" name="sno" value="${study.sno }">
						<textarea placeholder="댓글 쓰기" id="editor" name="rscontent"
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

		<h3 style="clear: both; text-align: left;">답변 수 ${study.rstudycnt }</h3>
		<hr>
		<c:if test="${reply != null}">
			<c:forEach items="${reply }" var="r">
				<div id="answer">
					<div style="width: 80px; float: left;">
						<img src="<%=request.getContextPath() %>/images/like.png"
							onclick="rslike(${r.rsno})" style="cursor: pointer;"> <br>
						추천수 ${r.rslikecnt }
					</div>
					<div
						style="width: 720px; float: left; background-color: lightgray; word-wrap: break-word">
						${r.rscontent }</div>
					<div style="float:right;">${r.rsdate }
					</div>

					<c:if test="${loginMember.id == r.rswriter}">
						<div style="float: right; margin: 10px 0;">
							<button type="button"
								onclick="open_win('<%=request.getContextPath()%>/moverstudyupdate?rsno=${r.rsno }', '_blank')">수정</button>
							<button type="button"
								onclick="location.href='<%=request.getContextPath()%>/rstudydelete?rsno=${r.rsno }&sno=${r.sno }'">삭제</button>
						</div>
					</c:if>
					<hr style="clear: both;">
				</div>
			</c:forEach>
		</c:if>
		<div>
			<button type="button"
				onclick="location.href='<%=request.getContextPath()%>/studylist'">목록으로
				돌아가기</button>
			<c:if test="${loginMember.nickname == study.swriter}">
				<button type="button"
					onclick="location.href='<%=request.getContextPath()%>/movestudyupdate?sno=${study.sno }'">수정</button>
				<button type="button"
					onclick="location.href='<%=request.getContextPath()%>/studydelete?sno=${study.sno }'">삭제</button>
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