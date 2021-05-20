<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/27.1.0/classic/ckeditor.js"></script>


<style>
	<%@include file="../../style/header.css" %>
	.ck.ck-editor {
   max-width:800px;
   min-width:737px;   
}
.ck-editor__editable {
   min-height: 90px;
}

.qna {
	margin: 40px 0 20px 10px;
	text-align: left;
	font-size: 17px;
	color: black;
	float: left;
}

#table {
	border: 1px solid #eeeeee;
	width:800px;
}

#table tr {
	border-bottom: 1px solid #eeeeee;
}

#writer {
	margin:10px 10px 0 10px;
	float:left;
	color:#2c3e50;
}

#date, #rqdate {	
	clear:both;
	margin:10px;
	float:left;
	font-size:12px;
	color:#99ADB6;
	background-color:none;
}

#views {
	float:right;
	position:relative;
	right:20px;
	bottom:28px
}

#eye {
	position:relative;
	right:2px;
	top:12px;
}

#answer {
	float:right;
	position:relative;
	right:26px;
	bottom:19px;
}

#speechbubble {
	position:relative;
	right:5px;
	top:7px;
}

#tag {
	margin:10px;
	border-radius: 4px;
	font-size:12px;
	float:left;
	color:#ffffff;
	background-color:#BBBBBB;
	padding:2px;
}

#subject {
	margin:10px;
	text-align:left;
	clear:both;
	font-size:25px;
	color:black;
}

#qlikeid{
	width: 55px;
	float:left;
	margin:0;
	position:relative;
	top:40px;
	font-size:18px;
}

#rlike{
	width: 55px;
	float:left;
	font-size:18px;
	position:relative;
	top:35px
}
	
#content {
	color:black;
    width: 737px; 
    text-align:left;
    background-color: #FAFAFA; 
    word-wrap: break-word;
    float:right;
    padding:20px;
}

#rcontent {
	color:black;
    width: 737px; 
    text-align:left;
    background-color: #FAFAFA; 
    word-wrap: break-word;
    float:right;
    padding:20px;
}

#file {
	clear: both;
	padding: 10px 0;
	text-align: left;
}

hr {
	background-color:#FAFAFA;
	border: 1px solid #F5F5F5;
	width:800px;
}

#rsubmit {
		width: 125px;
	height: 35px;
	padding: 5px;
	border: none;
	border-radius: 4px;
	text-align: center;
	color: #ffffff;
	background-color: #1abc9c;
	font-size: 18px;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
	float:right;
}

#list {
	clear:both;
	margin-top : 80px; 
	width: 175px;
	height: 35px;
	padding: 5px;
	font-size: 16px;
	border: 1px solid #eeeeee;
	border-radius: 4px;
	text-align: center;
	background-color: #ffffff;
	font-size: 18px;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#update {
	width: 70px;
	height: 35px;
	padding: 5px;
	border: none;
	border-radius: 4px;
	text-align: center;
	color: #black;
	background-color: #ffffff;
	font-size: 18px;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#delete {
	width: 70px;
	height: 35px;
	padding: 5px;
	border: none;
	border-radius: 4px;
	text-align: center;
	color: #c0041f;
	background-color: #ffffff;
	font-size: 18px;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#rsubmit:hover, #rsubmit:active{
	background-color: #1FE0BA;
	box-shadow: 10px 10px 20px 5px #eeeeee;
}

#list:hover, #list:active {
	color: #2c3e50;
	background-color: #ffffff;
	box-shadow: 10px 10px 10px #eeeeee;
	}

#delete:active, #delete:hover, #update:hover, #update:active, #list:hover, #list:active {
	box-shadow: 10px 10px 20px 5px #eeeeee;
}

#login {
	float: right;
	margin-top: 10px; 
	width:800px;
	line-height:150px;
	text-align:left;
	color:black;
	font-size:30px;
	box-shadow: 5px 5px 10px 5px #eeeeee;
	padding:30px;
	font-family: 'GmarketSansBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>

</head>
<%@include file="../../view/header.jsp"%>
<body class="content">
	<div style="width: 840px; margin: 0 auto 0 auto; color: #99ADB6; background:#ffffff; padding:20px; border-radius: 4px;">
		<div class="qna">Q&A 게시판</div><br>
		<table id="table">
			<tr>
				<td>
					<div id="writer">${qna.qwriter }</div> <br>
					<div id="date">${qna.qdate}</div>
					<div id="views">
						<img src="<%=request.getContextPath()%>/images/eye.png" id="eye">
						${qna.qviewcnt }
					</div>
					<div id="answer">
						<img src="<%=request.getContextPath()%>/images/speechbubble.png"
							id="speechbubble"> ${qna.rqnacnt }&nbsp;
					</div> <br>
					<hr>
				</td>
			</tr>
			<tr>
				<td>
					<div id="tag">
						<c:choose>
							<c:when test="${qna.qtag ==1}">Java</c:when>
							<c:when test="${qna.qtag ==2}">C</c:when>
							<c:when test="${qna.qtag ==3}">Python</c:when>
						</c:choose>
					</div> <br>
					<div id="subject">${qna.qsubject }</div>

					<hr style="position: relative; top: 7px;">
					<div id="qlikeid">
						<img src="<%=request.getContextPath()%>/images/like.png"
							onclick="qlike()" style="cursor: pointer;"> <br>
						${qna.qlikecnt }
					</div>
					<div id="content">
						${qna.qcontent }<br>
						<div id="file">
						
							<c:forTokens var="fileName" items="${qna.qfilepath}" delims=","
								varStatus="st">
								<a download="${fileName}"
									href="<%=request.getContextPath() %>/board/qna/files/${fileName }">${fileName}</a>
								<c:if test="${!st.last }">
                        /
                    </c:if>
								<br>
							</c:forTokens>
							<c:if test="${(loginMember.nickname == qna.qwriter) || (loginMember.nickname == '관리자')}">
								<button type="button" id="delete"
									onclick="location.href='<%=request.getContextPath()%>/qnadelete?qno=${qna.qno }'"
									style="float: right;">삭제</button>
							</c:if>
							<c:if test="${(loginMember.nickname == qna.qwriter)}">
								<button type="button" id="update"
									onclick="location.href='<%=request.getContextPath()%>/moveqnaupdate?qno=${qna.qno }'"
									style="float: right;">수정</button>
							</c:if>
						</div>
					</div>
				</td>
			</tr>
		</table>

		<h3 style="clear: both; text-align: left;">${qna.rqnacnt } 답변</h3>
		<c:if test="${reply != null}">
			<c:forEach items="${reply }" var="r">
					<div id="rlike">
						<img src="<%=request.getContextPath() %>/images/like.png" onclick="rqlike(${r.rqno})" style="cursor: pointer;"> <br>
						${r.rqlikecnt }
					</div>
					<div id="rcontent">${r.rqwriter}<br>${r.rqcontent }
						<div style="float: right;">
 						<c:if test="${loginMember.nickname == r.rqwriter}">
							<button type="button" id="update"
								onclick="open_win('<%=request.getContextPath()%>/moverqnaupdate?rqno=${r.rqno }', '_blank')">수정</button>
 						</c:if>
 						<c:if test="${(loginMember.nickname == r.rqwriter) || (loginMember.nickname == '관리자')}">
							<button type="button" id="delete"
								onclick="location.href='<%=request.getContextPath()%>/rqnadelete?rqno=${r.rqno }&qno=${r.qno }'">삭제</button>
 						</c:if>
						</div></div>
						<div id="rqdate" style="float:right;">${r.rqdate }</div>
					<hr style="clear: both;">
			</c:forEach>
		</c:if>
		
					<c:if test="${loginMember != null }">
				<form action="<%=request.getContextPath()%>/rqnawrite" method="post">
					<div style="float: right; margin-top: 10px;">
						<input type="hidden" name="qno" value="${qna.qno }">
						<textarea placeholder="답변하기" id="editor" name="rqcontent"
							maxlength="4000"></textarea>
					</div>
					<div style="clear: both; float: right; padding-top: 10px;">
						<button type="submit" id="rsubmit">등록</button>
					</div>
				</form>
			</c:if>
			<c:if test="${loginMember == null }">
					<div id="login">답변을 하려면 로그인이 필요합니다.</div>
			</c:if>
			<br><hr style="border:#ffffff;">
			<button type="button" id="list"
				onclick="location.href='<%=request.getContextPath()%>/qnalist'">목록으로
				돌아가기</button>

	</div>
	<script>
	function open_win(url, name){
		var popupX = (window.screen.width/2) - (200/2);
		// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

		var popupY= (window.screen.height/2) - (300/2);
		// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

		window.open(url, name, "width=555px, height=500px, resizable = no, left='+ popupX + ', top='+ popupY");
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