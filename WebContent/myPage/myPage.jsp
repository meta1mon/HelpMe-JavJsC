<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style/main.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style/calendarStyle.css" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.qna.vo.Qna"%>
<%@page import="member.vo.Member"%>
<%@page import="board.qna.dao.QnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../view/header.jsp"%>
<!-- tab 버튼 디자인 -->
<style>
/* tab */
ul, li {
	margin: 0;
	padding: 0;
	list-style: none;
}

a {
	text-decoration: none;
}

.tab-main {
	display: block;
	clear: both;
	margin-top: 20px;
}

.tab-main:after {
	display: block;
	height: 0;
	content: ".";
	font-size: 0;
	visibility: hidden;
	clear: both
}

.tab-main>.tab>li {
	float: left;
	margin-right: 7px;
	text-align: center;
	border-radius: 7px;
	border: none;
}

.tab-main>.tab .title {
	display: block;
	padding: 10px;
	color: #fff;
	border-radius: 7px;
	background-color: #2c3e50;
	cursor: pointer;
}

.tab-main>.tab .on {
	position: relative;
}

.tab-main>.tab .on .title {
	background-color: #1abc9c;
}

.tab-main>.tab-cont {
	float: left;
	width: 1000px;
	clear: both;
	margin-top: 10px;
	border-radius: 7px;
	color: black;
	background: transparent;
}

.tab-main>.tab-cont>.cont {
	padding-top: 20px;
	background-color: white;
	border-top: 1px solid black;
	box-sizing: border-box;
	width: 800px;
	background: transparent;
}

#profile {
	padding-left: 118.5;
}

.tab-main .comm_refer {
	margin: 5px 0 18px 15px
}

.tab-sub {
	display: block;
	clear: both;
}

.tab-sub:after {
	display: block;
	height: 0;
	content: ".";
	font-size: 0;
	visibility: hidden;
	clear: both
}

.tab-sub>.tab {
	float: left;
}

.tab-sub>.tab>li {
	float: left;
	text-align: center;
	font-size: 13px;
	white-space: nowrap;
	margin-left: 4px;
}

.tab-sub>.tab .title {
	display: block;
	height: 30px;
	padding: 5px 20px;
	font-weight: bold;
	color: white;
	border-top-left-radius: 7px;
	border-top-right-radius: 7px;
	border: none;
	background-color: #2c3e50;
	cursor: pointer;
}

.tab-sub>.tab .on {
	position: relative;
}

.tab-sub>.tab .on .title {
	height: 30px;
	background-color: #1abc9c;
}

.tab-sub>.tab-cont {
	float: left;
	width: 800px;
	clear: both;
}

.tab-sub>.tab-cont .cont {
	padding: 15px 5px;
	color: black;
	background: rgba(255, 255, 255, 0.5);
	box-sizing: border-box;
	width: 800px;
	border: 1px solid black;
}

.tab-sub>.tab-cont>.cont:last-child {
	border-top-right-radius: 0
}
</style>
<!-- myProfile 디자인 -->
<style>
/*profile*/
.profile {
	width: 1240px;
	height: 60px;
	text-align: left;
	float: left;
	line-height: 1em;
}

[type='text'], [type='password'], select, option {
	width: 400px;
	height: 40px;
	font-size: 17px;
}

.profileFrm {
	font-size: 17px;
}

td {
	padding: 5px 5px;
}

tr td:first-child {
	text-align: center;
}
</style>
<!-- qlist.jsp의 디자인 -->
<style>
.board {
	margin: 0 0 0 10px;
	text-align: left;
	font-size: 17px;
}

#searchType {
	width: 80px;
	height: 65px;
	border: none;
	font-size: 18px;
	color: #aca4ae;
	margin: 0;
	padding: 0;
}

#searchType:hover {
	color: black;
	transition: color 0.15s ease-in-out;
}

#search {
	width: 590px;
	height: 65px;
	top: 0;
	background-color: #efeff3;
	border: none;
	font-size: 18px;
	margin: 0;
	padding: 0;
}

#search:hover {
	color: black;
	background-color: #ffffff;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
	box-shadow: 10px 10px 10px #eeeeee;
}

#write {
	width: 100px;
	height: 65px;
	background-color: #1abc9c;
	border: none;
	color: #ffffff;
	border-radius: 4px;
	float: right;
	font-size: 18px;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
	margin-left: 10px;
	padding: 0;
}

#write:hover {
	color: #2c3e50;
	background-color: #ffffff;
	box-shadow: 10px 10px 10px #eeeeee;
}

#table {
	clear: both;
	width: 800px;
	margin-right: auto;
	margin-left: auto;
}

.bcont{
	border:1px solid black;
	background: 
	rgba(255, 255, 255, 0.5);
}
#table td{
	font-size:14px;
}
table>tr>td:first-child {
	width: 5%;
} /*No 열 크기*/
table>tr>td:first-child+td {
	width: 5%;
} /*No 열 크기*/
table>tr>td:first-child+td+td {
	width: 5%;
} /*No 열 크기*/
table>tr>td:first-child+td+td+td {
	width: 65%;
} /*제목 열 크기*/
table>tr>td:first-child+td+td+td+td {
	width: 20%;
} /*작성일 열 크기*/
#subject {
	color: #0054FF;
	font-size: 18px;
	text-decoration: none;
}

#subject:hover {
	color: #0100FF;
}

#page {
	padding: 6px 12px;
	margin-left: -1px;
	color: #337ab7;
	text-decoration: none;
}
</style>
<!-- cdn -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.6.0/main.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- 탭 기능 -->
<script>

	$(document)
			.ready(
					function() {
						//탭(ul) onoff
						$('.onoff>.tab-cont').children().css('display', 'none');
						$('.onoff>.tab-cont div:first-child').css('display',
								'block');
						$('.onoff>.tab li:first-child').addClass('on');
						$('.onoff')
								.delegate(
										'.tab>li',
										'click',
										function() {
											var index = $(this).parent()
													.children().index(this);
											$(this).siblings().removeClass();
											$(this).addClass('on');
											$(this).parent().next('.tab-cont')
													.children().hide()
													.eq(index).show();
										});
					});
</script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 정보 수정 팝업 띄우기 -->
<script>
function showPopup(url, name) { 
	window.open(url, name, "width=1000px, height=761px resizable=0");
	
}
</script>

<!-- 프로필 비밀번호 질문 선택 -->
<script>
$(document).ready(function(){
    $("select option[value='${loginMember.passquestion}']").attr("selected", true);
});
</script>
<!-- 캘린더 -->
<script>
	var calendar = null;
	
	$(document).ready(function(){
	
	var scheModal = $('#scheModal');
	
	var modalTitle = $('.modal-title');
	var editAllDay = $('#edit-allDay');
	var editTitle = $('#edit-title');
	var editStart = $('#edit-start');
	var editEnd = $('#edit-end');
	var editType = $('#edit-type');
	var editColor = $('#edit-color');
	var editCont = $('#edit-cont');
	
	var addBtnContainer = $('.modalBtnContainer-addSchedule');
	var modifyBtnContainer = $('.modalBtnContainer-modifySchedule');

	var calendarEl = document.getElementById("calendar");
		calendar = new FullCalendar.Calendar(calendarEl, {
			initialView: "dayGridMonth",
			timeZone: "local",
			locale: "ko",
			headerToolbar: {
				left: "prevYear,prev,next,nextYear",
				center: "title",
				right: "today dayGridMonth,listMonth",
			},
			handleWindowResize: true,
			dayMaxEvents: false,
			displayEventTime: false,
			displayEventEnd: false,
			eventDisplay: 'block',
			eventTimeFormat: 
			{
				hour: 'numeric',
				minute: '2-digit',
				meridiem: 'short'
			},
			eventResiableFromStart : true,
			selectable: true,
			selectMirror: true,
			unselectAuto: true,
			select: function(arg){ 
				// (startDate, endDate, jsEvent, view)
				// 달력 한 칸을 select하면 arg에 start, end, startStr("yyyy-mm-dd") endStr, view(type:"dayGridMonth")가 들어옴
				var start = arg.start;
				var end = arg.end;
				var view = arg.view;
				var e = arg.jsEvent;
				e.preventDefault();
				
				// start, end 날짜 포맷 정하기 -> 자동으로 00:00으로 입력됨. 
				if (view.type == "dayGridMonth") {
					start = moment(start).format('YYYY-MM-DD HH:mm');
					end = moment(end).subtract(1, 'minutes').format('YYYY-MM-DD HH:mm');
				} else {
					start = moment(start).format('YYYY-MM-DD HH:mm');
					end = moment(end).format('YYYY-MM-DD HH:mm');
				}

				console.log("newSchedule 호출");
				newSchedule(start, end);

			}, //select 
			
			editable : true,
			droppable: true,
			eventBorderColor: '#fff',
			
			events : function (info, successCallback, failureCallback) {
				console.log(info);
		   		  $.ajax({
		 				url:"<%=request.getContextPath()%>/scheduleview",
		 				type:"post",
		 				dataType:"json",
		 				
		 				success:function(data){	
		 					var events = [];
		 					if(data != null){
			 					$.each(data,function(index,e) {
									console.log(data);
			 						console.log(e);
									console.log(e.scheName);
	
									var title = e.scheName;
									console.log(title);
									
									var startDay = moment(e.scheStart).format('YYYY-MM-DD HH:mm');
									console.log("startDay" + startDay);
									
									var endDay = moment(e.scheEnd).format('YYYY-MM-DD HH:mm');
									console.log("endDay : " + endDay);
									console.log("e.scheEnd : " + e.scheEnd);

									if(e.scheAllDay === 'on'){
										console.log("if문 들어옴");
										startDay = moment(e.scheStart);
										endDay = moment(e.scheEnd);
										var calcDay = moment(endDay.diff(startDay)).format('D');
										
										console.log("startDay: " + startDay);
										console.log("endDay : " + endDay);
										console.log("cacDay : " + calcDay);
										
										
										if(calcDay >= 2){
											// 하루종일 일정이 2일 이상일 경우 달력에 표기 시 db 날짜 보다 하루를 더해야 정상출력
											startDay = moment(e.scheStart).format('YYYY-MM-DD');
											endDay = moment(e.scheEnd).add(1, 'days').format('YYYY-MM-DD HH:mm'); 	
										}else{
											startDay = moment(e.scheStart).format('YYYY-MM-DD');
											endDay = moment(e.scheEnd).subtract(1, 'minutes').format('YYYY-MM-DD HH:mm');
										}
									}
									
									
									var type = e.scheCode;
									console.log(type);
									
									var content = e.scheContent;
									console.log(content);
									
									if(e.scheAllDay === 'on'){
										var allDay = true;
									}else{
										allDay = false;
									}
									
									var backgroundColor = e.scheColor;
									
									console.log(e.scheAllDay);
									console.log(allDay);
									
									events.push({
										title : title,
										start : startDay, 
										end : endDay,
										allDay : allDay,
										backgroundColor : backgroundColor,
										type: type,
										content : content
										
									}); // push
									console.log(events);
								}); // each 끝
		 						
		 					} // if 끝
							console.log(events); 
							successCallback(events); 
		 				}, // success 끝
		 				error: function(request, status, error ){
			        		console.log("일정 load 실패");
							alert("code: "+ request.status + "\n" + "message: "+ request.responseText + "\n" + "error: "+ error );
						} 
		 				}); // ajax 끝
		 				
		   		  }, // events 끝
			
			
			eventClick : function(arg) {
				
				if(!confirm('일정을 지우시겠습니까? 확인: 일정 삭제, 취소: 상세 일정 확인')){
					//모달창 open
					checkSchedule(arg.event);
				}else{
					arg.event.remove();
					var title = arg.event.title;
					$.ajax({
			    	        type: "post",
			    	        url: "<%=request.getContextPath()%>/scheduledelete",
							data:{
								title : title
							},
								
			    	        success: function (response) {
			    	        	console.log(response);
			    	        	alert("일정 삭제 성공");
			    	        },
			    	        error: function(request, status, error ){
				        		console.log("일정 삭제 실패");
								alert("code: "+ request.status + "\n" + "message: "+ request.responseText + "\n" + "error: "+ error );
							} 
			    	  })
				}
		
				
				}, /* eventClick 끝*/
				
				eventResize: function(arg){
					console.log(arg);
					
					var title = arg.event._def.title;
					var start = arg.event._instance.range.start;
					var end = arg.event._instance.range.end;
					var allDay = arg.event.allDay
					
					console.log(title);
					console.log(start);
					console.log(end);
					
					
					if (allDay == true) {
					    var startRs = moment(start).format('YYYY-MM-DD HH:mm');
					    var endRs = moment(end).subtract(1, 'minutes').format('YYYY-MM-DD HH:mm');
					  } else {
					    startRs = moment(start).format('YYYY-MM-DD HH:mm');
					    endRs = moment(end).format('YYYY-MM-DD HH:mm');
					  }
					
					
					console.log(startRs);
					console.log(endRs);
					var data2 = {title : title, start : startRs, end : endRs} 
					// var data = JSON.stringify();
					
					console.log(data2);
					// console.log(data);
					$.ajax({
					      type: "get",
					      url: "<%=request.getContextPath()%>/scheduleresize",
					      data: data2,
					      dataType: "text",
					      success: function (response) {
					        alert('일정 수정 완료');
					      }
					    });
				
				}, // eventResize 끝
				
				eventDrop: function(arg){
					console.log(arg);
					
					var title = arg.event._def.title;
					var start = arg.event._instance.range.start;
					var end = arg.event._instance.range.end;
					var allDay = arg.event.allDay
					
					console.log(title);
					console.log(start);
					console.log(end);
					
					
					if (allDay == true) {
					    var startRs = moment(start).format('YYYY-MM-DD HH:mm');
					    var endRs = moment(end).subtract(1, 'minutes').format('YYYY-MM-DD HH:mm');
					  } else {
					    startRs = moment(start).format('YYYY-MM-DD HH:mm');
					    endRs = moment(end).format('YYYY-MM-DD HH:mm');
					  }
					
					
					console.log(startRs);
					console.log(endRs);
					var data2 = {title : title, start : startRs, end : endRs} 
					// var data = JSON.stringify();
					
					console.log(data2);
					// console.log(data);
					$.ajax({
					      type: "get",
					      url: "<%=request.getContextPath()%>/scheduledrop",
					      data: data2,
					      dataType: "text",
					      success: function (response) {
					    	  alert('일정 수정 완료');
					      }
					    });
				} // eventDrop 끝
		}); // var calendar
		calendar.render();
		
		//새로운 일정 저장 버튼 클릭
		$("#save-schedule").on('click', function(e){
		    e.preventDefault();
			console.log("저장함수 호출");
			var scheduleData = {
				title: editTitle.val(),
				start: editStart.val(),
				end: editEnd.val(),
				type: editType.val(),
				backgroundColor: editColor.val(),
				content: editCont.val(),
				textColor: "fff",
				allDay: false
			};
			
			console.log("저장함수 닫기");
			// 일정 시작 날짜보다 마감 날짜가 앞설 경우 
			if(scheduleData.start > scheduleData.end) {
				alert('일정 마감 날짜가 앞설 수 없습니다.');
				return false;
			}
			// 일정명을 기입하지 않았을 경우
			if(scheduleData.title === ''){
				alert('일정명은 필수입니다.')
				return false;
			}
			
			if(scheduleData.type === ''){
				alert('일정 종류를 선택해주세요.')
				return false;
			}
			
			// 하루종일 체크박스가 체크되었을 경우
			if(editAllDay.is(':checked')){
				console.log("editAllDay.is 호출");
				scheduleData.start = moment(scheduleData.start).format('YYYY-MM-DD');
				// render 시 날짜표기 수정
				scheduleData.end = moment(scheduleData.end).format('YYYY-MM-DD');
				
				
				scheduleData.allDay = true;
				
			} 
			
			
			console.log("calendar.addEvent(scheduleData) 호출"+ scheduleData);
			
			calendar.addEvent(scheduleData);
			
			$("#scheModal").css("display", "none");
			//console.log(scheduleData);
			
	        // 입력한 새로운 일정 저장
	        var querystring = $("#frm").serialize();
	        console.log(querystring);
	        $.ajax({
	        	type: "post",
	        	url: "<%=request.getContextPath()%>/scheduleinsert",
	        	data: querystring,
	        	
	        	success: function(data){
	        		console.log("일정 등록 성공");
	        	},
	        	error: function(request, status, error ){
	        		console.log("일정 등록 실패");
					alert("code: "+ request.status + "\n" + "message: "+ request.responseText + "\n" + "error: "+ error );
				} 
	        	
	        })
		}) // 저장버튼 클릭 끝
		
		
		
		function newSchedule (start, end) {
			
			// 새로운 일정 등록 모달창 기본 설정
			modalTitle.text('새로운 일정 등록');
			$('#edit-start').val(start);
			$('#edit-end').val(end);
			// 모달창 초기화	   		
	       	editAllDay.prop('checked', true);
		    editTitle.val('');
			editType.val('1');
			editCont.val(''); 
			
			//SELECT 색 변경
			$('#edit-color').change(function () {
			    $(this).css('color', $(this).val());
			});
			
			if(addBtnContainer.css("display") == "none"){
				modifyBtnContainer.hide();
				addBtnContainer.show();
			}
		
			$("#scheModal").css("display", "block");

			
			$(".close").on("click", function() {
				$("#scheModal").css("display", "none");
			});
			
			$(".btn-default").on("click", function() {
				$("#scheModal").css("display", "none");
			});
			
		} //newSchedule
		
		function checkSchedule(event){
			console.log(event);
			
			// 모달창 setting
			modalTitle.html('일정 확인');
		    editTitle.val(event.title);
		    
		    if(event.allDay == true){
			    editAllDay.prop('checked', true);
		    } else {
			    editAllDay.prop('checked', false);
		    }

		    if(editAllDay.is(':checked')){
		    	editStart.val(moment(event.start).format('YYYY-MM-DD HH:mm'));
		    	editEnd.val(moment(event.end).subtract(1, 'minutes').format('YYYY-MM-DD HH:mm'));
		    }else{
			    editStart.val(moment(event.start).format('YYYY-MM-DD HH:mm'));
			    editEnd.val(moment(event.end).format('YYYY-MM-DD HH:mm'));
		    }
		    
		    editType.val(event._def.extendedProps.type);
		    console.log(event._def.extendedProps.type);
		    
		    editColor.val(event.backgroundColor).css('color', event.backgroundColor);
		    editCont.val(event._def.extendedProps.content);
		    console.log(event._def.extendedProps.content);
		    

		    
		    if(modifyBtnContainer.css("display") == "none"){
		    	addBtnContainer.hide();
		    	modifyBtnContainer.show();
			} 
			
			// 모달창 display
			$("#scheModal").css("display", "block");


			$(".close").on("click", function() {
				$("#scheModal").css("display", "none");
			});
			
			$(".btn-default").on("click", function() {
				$("#scheModal").css("display", "none");
			});
			
		
			
		} // checkSchedule 끝
		
	}); //$(document)

	
</script>
</head>
<body class="content">
	<div style="width: 800px; margin-left: auto; margin-right: auto;s">
		<!-- 이미지 + 닉네임 표시 -->
		<div class="welcome" style="padding-bottom: 20px;">
			<div class="picBtn"
				style="margin-top: 20px; float: left; background-color: white; border: 1px solid white;">
				<img class="pic" alt="profilePic"
					src="<%=request.getContextPath()%>/images/user.png" width="50"
					height="50"
					onmouseover="this.src='<%=request.getContextPath()%>/images/userhover2.png'">
			</div>
			<p
				style="text-align: left; padding-top: 30px; padding-left: 60px; font-weight: bold;">${loginMember.nickname}님의
				마이페이지</p>
		</div>
		<!-- 마이 페이지 메인 탭메뉴 -->
		<div class="onoff tab-main">
			<ul class="tab">
				<li><a href="#" class="title">일정 관리</a></li>
				<li><a href="#" class="title">내 프로필</a></li>
				<li><a href="#" class="title">내 글 목록</a></li>
				<li><a href="#" class="title">내 구매 목록</a></li>
			</ul>
			<!-- 탭 컨텐츠 -->
			<div class="tab-cont">


				<!-- 탭1 마이 캘린더 -->
				<div class="cont">
					<div id="calendar"></div>
					<!-- 일정 추가 modal -->
					<div class="modal" id="scheModal">
						<div class="modal-content">
							<div class="modal-header">
								<span class="close">&#10006;</span>
								<h4 class="modal-title"></h4>
							</div>
							<div class="modal-body">
								<form class="sche-form" id="frm">
									<table class="modal-tbl">
										<tr>
											<td><label for="edit-allDay">하루종일</label></td>
											<td><input class="allDayEvent" name="scheAllDay"
												id="edit-allDay" type="checkbox"></td>
										</tr>

										<tr>
											<td><label for="edit-title">일정명</label></td>
											<td><input class="inputModal" type="text"
												name="scheName" id="edit-title" required="required" />
										</tr>

										<tr>
											<td><label for="edit-start">시작일</label></td>
											<td><input class="inputModal" type="text"
												name="scheStart" id="edit-start" /></td>
										</tr>

										<tr>
											<td><label for="edit-end">마감일</label></td>
											<td><input class="inputModal" type="text" name="scheEnd"
												id="edit-end" /></td>
										</tr>

										<tr>
											<td><label for="edit-type">일정 종류</label></td>
											<td><select class="inputModal" name="scheCode"
												id="edit-type">
													<option value="1" selected>공채 일정 - 신입</option>
													<option value="2">공채 일정 - 경력</option>
													<option value="3">개인 일정</option>
											</select></td>
										</tr>
										<tr>
											<td><label for="edit-color">색상</label></td>
											<td><select class="inputModal" name="scheColor"
												id="edit-color">
													<option value="#D25565" style="color: '#D25565';">빨간색</option>
													<option value="#9775fa" style="color: #9775fa;">보라색</option>
													<option value="#ffa94d" style="color: #ffa94d;">주황색</option>
													<option value="#74c0fc" style="color: #74c0fc;">파란색</option>
													<option value="#f06595" style="color: #f06595;">핑크색</option>
													<option value="#63e6be" style="color: #63e6be;">민트색</option>
													<option value="#a9e34b" style="color: #a9e34b;">초록색</option>
													<option value="#4d638c" style="color: #4d638c;">남색</option>
													<option value="#495057" style="color: #495057;">검정색</option>
											</select></td>
										</tr>
										<tr>
											<td><label for="edit-cont">설명</label></td>
											<td><textarea rows="4" cols="50" class="inputModal"
													name="scheContent" id="edit-cont"></textarea></td>
										</tr>
									</table>
								</form>
							</div>
							<!-- modal-body 끝 -->
							<div class="modal-footer modalBtnContainer-addSchedule">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">취소</button>
								<button type="button" class="btn btn-primary" id="save-schedule">저장</button>
							</div>
							<div class="modal-footer modalBtnContainer-modifySchedule">
								<button type="button" class="btn btn-default" id="cancel"
									data-dismiss="modal">닫기</button>
							</div>
							<!-- modal-footer 끝 -->
						</div>
						<!-- modal-content 끝 -->
					</div>
					<!-- scheModal 끝 -->

				</div>

				<!-- 탭2 내 정보 확인 -->
				<div class="cont" id="profile" style="display:none">
					<table class="profileFrm">
						<tr>
							<td>아이디<span class="required">(필수)</span></td>
							<td colspan="2"><input type="text" name="id" id="id"
								readonly class="readonly" value="${loginMember.id}"></td>
						</tr>
						<tr>
							<td>닉네임<span class="required">(필수)</span></td>
							<td><input type="text" name="nickname" id="nickname"
								readonly class="readonly" value="${loginMember.nickname}"></td>
						</tr>
						<tr>
							<td>비밀번호<span class="required">(필수)</span></td>
							<td><input type="password" name="password1" id="password1"
								readonly class="readonly" value="${loginMember.password}"></td>
						</tr>
						<tr>
							<td>비밀번호 확인<span class="required">(필수)</span></td>
							<td><input type="password" name="password2" id="password2"
								readonly class="readonly" value="${loginMember.password}"></td>
						</tr>
						<tr>
							<td>비밀번호 질문<span class="required">(필수)</span></td>
							<td><select name="passquestion" id="passquestion"
								style="font-family: 'GmarketSansMedium', 'GmarketSansMedium', serif"
								onFocus='this.initialSelect = this.selectedIndex;'
								onChange='this.selectedIndex = this.initialSelect;'>
									<option value="0"
										style="font-family: 'GmarketSansMedium', 'GmarketSansMedium', serif">비밀번호
										질문을 선택해주세요</option>
									<option value="1"
										style="font-family: 'GmarketSansMedium', 'GmarketSansMedium', serif">첫
										수학여행 장소는?</option>
									<option value="2"
										style="font-family: 'GmarketSansMedium', 'GmarketSansMedium', serif">가장
										친한 친구의 이름은?</option>
									<option value="3"
										style="font-family: 'GmarketSansMedium', 'GmarketSansMedium', serif">첫
										해외여행지는?</option>
									<option value="4"
										style="font-family: 'GmarketSansMedium', 'GmarketSansMedium', serif">어린시절
										자신의 별명은?</option>
							</select></td>
						</tr>
						<tr>
							<td>비밀번호 답변<span class="required">(필수)</span></td>
							<td><input type="text" name="passanswer" id="passanswer"
								readonly class="readonly" value="${loginMember.passanswer}"></td>
						</tr>
						<tr>
							<td>주소<span class="optional">(선택)</span></td>
							<td><input type="text" id="sample6_postcode" name="postcode"
								style="margin-bottom: 5px" readonly class="readonly"
								value="${loginMember.postcode}"></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="text" id="sample6_address" name="address1"
								style="margin-bottom: 5px" readonly class="readonly"
								value="${loginMember.address1}"></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="text" id="sample6_detailAddress"
								name="address2" style="margin-bottom: 5px" readonly
								class="readonly" value="${loginMember.address2}"></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="text" id="sample6_extraAddress"
								name="address3" style="margin-bottom: 5px" readonly
								class="readonly" value="${loginMember.address3}"></td>
						</tr>
						<tr>
							<td>전화번호<span class="optional">(선택)</span></td>
							<td><input type="text" name="tel" id="tel" readonly
								class="readonly" value="${loginMember.tel}"></td>
						</tr>
						<tr>
							<td>이메일<span class="optional">(선택)</span></td>
							<td><input type="text" name="email" id="email" readonly
								class="readonly" value="${loginMember.email}"></td>
						</tr>
						<c:if test="${loginMember.rcvmail.equals('1') }">
							<tr>
								<td colspan="2" style="text-align: left"><label><input
										type="checkbox" name="rcvmail" value="1" checked
										disabled="disabled"> 도와줘 잡스씨의 다양한 소식을 받아보겠습니다(선택)</label></td>
							</tr>
						</c:if>
						<c:if test="${!loginMember.rcvmail.equals('1') }">
							<td colspan="2" style="text-align: left"><label><input
									type="checkbox" name="rcvmail" value="1" disabled="disabled">
									도와줘 잡스씨의 다양한 소식을 받아보겠습니다(선택)</label></td>
						</c:if>
						<tr>
							<td colspan="2"><input type="button" value="수정"
								class="darkbutton"
								onclick="showPopup('<%=request.getContextPath()%>/myPage/myProfilePopup.jsp', 'popup');">
								<input type="button" value="회원 탈퇴"
								class="darkbutton"
								onclick="location.href='<%=request.getContextPath()%>/memberwithdraw?id=${loginMember.id }'"></td>
						</tr>
					</table>
				</div>
				<!-- 탭3 내 글 목록-->
				<div class="cont"  style="display:none">
					<div class="onoff tab-sub">
						<!-- 내 글 목록 상세 메뉴 -->
						<ul class="tab">
							<li>
								<button type="button" class="title" id="myPost">나의 게시글</button>
							</li>
							<li><button type="button" class="title" id="myReply">댓글
									단 글</button></li>
						</ul>
						<!-- 서브탭 컨텐츠 -->
						<div class="tab-cont">
							<!-- 탭3-1 내 글 목록-->
							<div class="cont">
								<div
									style="width: 800px; margin: 0 auto 0 auto; color: #aca4ae;">
									<div class="board"	style="position:relative; color:black;">
										Q&A 게시판 <a onclick="myqlist();" style="position:absolute; right: 40;  color:#1abc9c; text-decoration: underline;">전체 글 보기</a>
									</div>
									<table id="table" style="border: 1; text-align: center;">
										<c:if test="${qlist.size() == 0 }">
											<tr>
												<td>Q&A 게시판에 작성한 글이 없습니다</td>
											</tr>
										</c:if>
										<c:if test="${qlist.size() != 0 }">
											<c:forEach items="${qlist }" var='q'>
												<tr style="border-bottom: 1px solid #eeeeee;">
													<td style="width: 60px; font-size: 14px;"><a
														style="font-size: 18px;">${q.qviewcnt }</a><br>조회</td>
													<td style="width: 60px;"><a style="font-size: 18px;">${q.qlikecnt }</a><br>좋아요</td>
													<td style="width: 60px;"><a style="font-size: 18px;">${q.rqnacnt }</a><br>답변</td>
													<td style="text-align: left; width: 450px;"><a
														href="qnaread?qno=${q.qno}" id="subject">${q.qsubject }</a>
														<br> <c:choose>
															<c:when test="${q.qtag ==1}">Java</c:when>
															<c:when test="${q.qtag ==2}">C</c:when>
															<c:when test="${q.qtag ==3}">Python</c:when>
														</c:choose></td>
													<td><a style="color: #0054FF; text-align: left;">${q.qwriter }</a>
														<br> <a style="font-size: 13px;">${q.qdate }</a></td>
												</tr>
											</c:forEach>
										</c:if>
									</table>
								</div>
								<br>
								<div
									style="width: 800px; margin: 0 auto 0 auto; color: #aca4ae;">
									<div class="board"	style="position:relative;  color:black;">
										Study 게시판 <a onclick="myslist();" style="position:absolute; right: 40;  color:#1abc9c; text-decoration: underline;">전체 글 보기</a>
									</div>
									<table id="table" style="border: 1; text-align: center;">
										<c:if test="${slist.size() == 0 }">
											<tr>
												<td>Study 게시판에 작성한 글이 없습니다</td>
											</tr>
										</c:if>
										<c:if test="${slist.size() != 0 }">
											<c:forEach items="${slist }" var='s'>
												<tr style="border-bottom: 1px solid #eeeeee;">
													<td style="width: 60px; font-size: 14px;"><a
														style="font-size: 18px;">${s.sviewcnt }</a><br>조회</td>
													<td style="width: 60px;"><a style="font-size: 18px;">${s.slikecnt }</a><br>좋아요</td>
													<td style="width: 60px;"><a style="font-size: 18px;">${s.rstudycnt }</a><br>답변</td>
													<td style="text-align: left; width: 450px;"><a
														href="studyread?sno=${s.sno}" id="subject">${s.ssubject }</a>
														<br> <c:choose>
															<c:when test="${s.stag ==1}">Java</c:when>
															<c:when test="${s.stag ==2}">C</c:when>
															<c:when test="${s.stag ==3}">Python</c:when>
														</c:choose></td>
													<td><a style="color: #0054FF; text-align: left;">${s.swriter }</a>
														<br> <a style="font-size: 13px;">${s.sdate }</a></td>
												</tr>
											</c:forEach>
										</c:if>
									</table>
								</div>
								<br>
								<div style="width: 800px; margin: 0 auto 0 auto; color: #aca4ae;">
									<div class="board"	style="position:relative; color:black;">
										Review 게시판 <a onclick="myrlist();" style="position:absolute; right: 40; color:#1abc9c; text-decoration: underline;">전체 글 보기</a>
									</div>
									<table id="table" style="border: 1; text-align: center;">
										<c:if test="${rlist.size() == 0 }">
											<tr>
												<td>Review 게시판에 작성한 글이 없습니다</td>
											</tr>
										</c:if>
										<c:if test="${rlist.size() != 0 }">
											<c:forEach items="${rlist }" var='r'>
												<tr style="border-bottom: 1px solid #eeeeee;">
													<td style="width: 60px; font-size: 14px;"><a
														style="font-size: 18px;">${r.rviewcnt }</a><br>조회</td>
													<td style="width: 60px;"><a style="font-size: 18px;">${r.rlikecnt }</a><br>좋아요</td>
													<td style="width: 60px;"><a style="font-size: 18px;">${r.rreviewcnt }</a><br>답변</td>
													<td style="text-align: left; width: 450px;"><a
														href="reviewread?rno=${r.rno}" id="subject">${r.rsubject }</a>
														<br> <c:choose>
															<c:when test="${r.rtag ==1}">Java</c:when>
															<c:when test="${r.rtag ==2}">C</c:when>
															<c:when test="${r.rtag ==3}">Python</c:when>
														</c:choose></td>
													<td><a style="color: #0054FF; text-align: left;">${r.rwriter }</a>
														<br> <a style="font-size: 13px;">${r.rdate }</a></td>
												</tr>
											</c:forEach>
										</c:if>
									</table>
								</div>
							</div>
							<!-- 탭3-2 내가 댓글 단 목록-->
							<div class="cont">
								<div style="width: 800px; margin: 0 auto 0 auto; color: #aca4ae;">
									<div class="board"	style="position:relative;  color:black;">
										Q&A 게시판 <a onclick="myrqlist();" style="position:absolute; right: 40;  color:#1abc9c; text-decoration: underline;">전체 글 보기</a>
									</div>
									<table id="table" style="border: 1; text-align: center;">
										<c:if test="${rqlist.size() == 0 }">
											<tr>
												<td>Q&A 게시판에 작성한 댓글이 없습니다</td>
											</tr>
										</c:if>
										<c:if test="${rqlist.size() != 0 }">
											<c:forEach items="${rqlist }" var='r'>
												<tr style="border-bottom: 1px solid #eeeeee;">
													<td style="width: 60px; font-size: 14px;"><a
														style="font-size: 18px;">${r.qviewcnt }</a><br>조회</td>
													<td style="width: 60px;"><a style="font-size: 18px;">${r.qlikecnt }</a><br>좋아요</td>
													<td style="width: 60px;"><a style="font-size: 18px;">${r.rqnacnt }</a><br>답변</td>
													<td style="text-align: left; width: 450px;"><a
														href="qnaread?qno=${r.qno}" id="subject">${r.qsubject }</a>
														<br> <c:choose>
															<c:when test="${r.qtag ==1}">Java</c:when>
															<c:when test="${r.qtag ==2}">C</c:when>
															<c:when test="${r.qtag ==3}">Python</c:when>
														</c:choose></td>
													<td><a style="color: #0054FF; text-align: left;">${r.qwriter }</a>
														<br> <a style="font-size: 13px;">${r.qdate }</a></td>
												</tr>
											</c:forEach>
										</c:if>
									</table>
								</div>
								<br>
								<div
									style="width: 800px; margin: 0 auto 0 auto; color: #aca4ae;">
									<div class="board"	style="position:relative;  color:black;">
										Study 게시판 <a onclick="myrslist();" style="position:absolute; right: 40;  color:#1abc9c; text-decoration: underline;">전체 글 보기</a>
									</div>
									<table id="table" style="border: 1; text-align: center;">
										<c:if test="${rslist.size() == 0 }">
											<tr>
												<td>Study 게시판에 작성한 댓글이 없습니다</td>
											</tr>
										</c:if>
										<c:if test="${rslist.size() != 0 }">
											<c:forEach items="${rslist }" var='k'>
												<tr style="border-bottom: 1px solid #eeeeee;">
													<td style="width: 60px; font-size: 14px;"><a
														style="font-size: 18px;">${k.sviewcnt }</a><br>조회</td>
													<td style="width: 60px;"><a style="font-size: 18px;">${k.slikecnt }</a><br>좋아요</td>
													<td style="width: 60px;"><a style="font-size: 18px;">${k.rstudycnt }</a><br>답변</td>
													<td style="text-align: left; width: 450px;"><a
														href="studyread?sno=${k.sno}" id="subject">${k.ssubject }</a>
														<br> <c:choose>
															<c:when test="${k.stag ==1}">Java</c:when>
															<c:when test="${k.stag ==2}">C</c:when>
															<c:when test="${k.stag ==3}">Python</c:when>
														</c:choose></td>
													<td><a style="color: #0054FF; text-align: left;">${k.swriter }</a>
														<br> <a style="font-size: 13px;">${k.sdate }</a></td>
												</tr>
											</c:forEach>
										</c:if>
									</table>
								</div>
								<br>
								<div
									style="width: 800px; margin: 0 auto 0 auto; color: #aca4ae;">
									<div class="board"	style="position:relative;  color:black;">
										Review 게시판 <a onclick="myrrlist();" style="position:absolute; right: 40; color:#1abc9c; text-decoration: underline;">전체 글 보기</a>
									</div>
									<table id="table" style="border: 1; text-align: center;">
										<c:if test="${rrlist.size() == 0 }">
											<tr>
												<td>Review 게시판에 작성한 댓글이 없습니다</td>
											</tr>
										</c:if>
										<c:if test="${rrlist.size() != 0 }">
											<c:forEach items="${rrlist }" var='r'>
												<tr style="border-bottom: 1px solid #eeeeee;">
													<td style="width: 60px; font-size: 14px;"><a
														style="font-size: 18px;">${r.rviewcnt }</a><br>조회</td>
													<td style="width: 60px;"><a style="font-size: 18px;">${r.rlikecnt }</a><br>좋아요</td>
													<td style="width: 60px;"><a style="font-size: 18px;">${r.rreviewcnt }</a><br>답변</td>
													<td style="text-align: left; width: 450px;"><a
														href="reviewread?rno=${r.rno}" id="subject">${r.rsubject }</a>
														<br> <c:choose>
															<c:when test="${r.rtag ==1}">Java</c:when>
															<c:when test="${r.rtag ==2}">C</c:when>
															<c:when test="${r.rtag ==3}">Python</c:when>
														</c:choose></td>
													<td><a style="color: #0054FF; text-align: left;">${r.rwriter }</a>
														<br> <a style="font-size: 13px;">${r.rdate }</a></td>
												</tr>
											</c:forEach>
										</c:if>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 탭4 구매한 영상 목록 -->
				<div class="bcont" style="display:none">
					<div style="width: 800px; margin: 0 auto 0 auto; color: #aca4ae;">
					<br>
						<div class="board"	style="position:relative; color:black;">
							책 구매내역 <a onclick="myBookList();" style="position:absolute; right: 40;  color:#1abc9c; text-decoration: underline;">전체 구매내역 보기</a>
						</div>
						<table id="table" style="border: 1; text-align: center;">
							<c:if test="${myBook.size() == 0 }">
								<tr>
									<td>구매한 책이 없습니다</td>
								</tr>
							</c:if>
							<c:if test="${myBook.size() != 0 }">
								<tr>
								
									<td><b>책이름</b></td>
									<td><b>판매가격</b></td>
									<td><b>수량</b></td>
									<td><b>총 금액</b></td>
									<td><b>구매 날짜</b></td>
									<td><b>배송 상태</b></td>
								</tr>
								
								<c:forEach items="${myBook }" var='b'>
								   <c:if test="${b.bid != null}">
									<tr>
										<td align="left" width="300"><img
											src="imageFile/${b.bimage}" width="30" height="50"
											align="middle"  style="float:left;"> ${b.btitle}</td>
										<td>\ ${b.bprice}</td>
										<td>${b.buycount}</td>
										<td><c:set var="bprice"
												value="${bprice+ (b.buycount * b.buyprice)}"></c:set>
											${(b.buycount * b.buyprice)}</td>
										<td>${b.buydate }</td>
										<td>${b.saction }</td>
									</tr>
									</c:if>
								</c:forEach>
							</c:if>
						</table>
					</div>
					<div style="width: 800px; margin: 0 auto 0 auto; color: #aca4ae;" >
						<div class="board"	style="position:relative; color:black;">
							영상 구매내역 <a onclick="myVideoList();" style="position:absolute; right: 40;  color:#1abc9c; text-decoration: underline;">전체 구매내역 보기</a>
						</div>
						<table id="table" style="border: 1; text-align: center;">
							<c:if test="${myVideo.size() == 0 }">
								<tr>
									<td>구매한 영상이 없습니다</td>
								</tr>
							</c:if>
							<c:if test="${myVideo.size() != 0 }">
								<tr>
									<td><b>영상 이름</b></td>
									<td><b>판매가격</b></td>
									<td><b>수량</b></td>
									<td><b>총 금액</b></td>
									<td><b>구매 날짜</b></td>
									<td><b>배송 상태</b></td>
								</tr>
								<c:forEach items="${myVideo }" var='v'>
								   <c:if test="${v.vid != null}">
									<tr>
										<td align="left" width="300"><img
											src="imageFile/${v.vimage}" width="30" height="50"
											align="middle"   style="float:left;"> ${v.vtitle}</td>
										<td>\ ${v.vprice}</td>
										<td>${v.buycount}</td>
										<td><c:set var="vprice"
												value="${vprice+ (v.buycount * v.buyprice)}"></c:set>
											${(v.buycount * v.buyprice)}</td>
										<td>${v.buydate }</td>
										<td>${v.saction }</td>
									</tr>
									</c:if>
								</c:forEach>
							</c:if>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 탭3 내 글/댓글 목록 불러오기 -->
	<script>
		function myqlist() {
			window
					.open("<%=request.getContextPath()%>/myqlist", "myQna","width=1000px, height=500px, resizable = no, left= 100, top=100");

			};

		function myrqlist() {
			window.open("<%=request.getContextPath()%>/myrqlist", "myRqna", "width=1000px, height=500px, resizable = no, left= 100, top=100");

		};
		
		function myslist() {
			window.open("<%=request.getContextPath()%>/myslist", "myStudy","width=1000px, height=500px, resizable = no, left= 100, top=100");

		};

		function myrslist() {
		window.open("<%=request.getContextPath()%>/myrslist", "myRstudy", "width=1000px, height=500px, resizable = no, left= 100, top=100");

		};	
		
		function myrlist() {
			window.open("<%=request.getContextPath()%>/myrlist", "myReview","width=1000px, height=500px, resizable = no, left= 100, top=100");

		};

		function myrrlist() {
		window.open("<%=request.getContextPath()%>/myrrlist", "myRreview", "width=1000px, height=500px, resizable = no, left= 100, top=100");

		};	
		
		function myBookList() {
			window.open("<%=request.getContextPath()%>/mybooklist", "myBookList","width=1000px, height=500px, resizable = no, left= 100, top=100");

		};

		function myVideoList() {
		window.open("<%=request.getContextPath()%>/myvideolist", "myVideoList", "width=1000px, height=500px, resizable = no, left= 100, top=100");

		};	
		
	</script>
</body>
</html>
<%@include file="../view/footer.jsp"%>