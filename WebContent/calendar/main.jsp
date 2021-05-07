<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.6.0/main.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style/calendarStyle.css" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	#calendar {
		margin-top: 124px;
	}
</style>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.6.0/main.js"></script>
<script src="moment.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		var calendarEl = document.getElementById("calendar");
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView: "dayGridMonth",
			timeZone: "local",
			locale: "ko",
			headerToolbar: {
				left: "prevYear,prev,next,nextYear",
				center: "title",
				right: "today dayGridMonth,listMonth",
			},
			dayMaxEvents: true,
			displayEventTime: true,
			displayEventEnd: true,
			eventTimeFormat: 
			{
				hour : 'numeric',
				minute: '2-digit',
				meridiem: true
			},
			selectable: true,
			selectMirror: true,
			unselectAuto: true,
			select: function(arg){ 
				// 달력 한 칸을 select하면 arg에 start, end, startStr("yyyy-mm-dd") endStr, view(type:"dayGridMonth")가 들어옴
				
				var scheModal = $('#scheModal');
				console.log(arg);
				console.log("들어와라라라아아아ㅏㅇ")
				var start = arg.start;
				var end = arg.end;
				var view = arg.view;
				console.log(start);
				console.log(end);
				console.log(view);
	
				var modalTitle = $('.modal-title');
				var editAllDay = $('#edit-allDay');
				var editTitle = $('#edit-title');
				var editStart = $('#edit-start');
				var editEnd = $('#edit-end');
				var editType = $('#edit-type');
				var editColor = $('#edit-color');
				var editCont = $('#edit-cont');

				var addBtnContainer = $('.modalBtnContainer-addSchedule');
				var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');
				
				// start, end 날짜 포맷 정하기 -> 일단 자동으로 00:00으로 입력됨. (클릭했을 당시의 시간 입력되도록 수정 가능하면 하기...)
				if (view.type == "dayGridMonth") {
					console.log("if 들어옴!");
					
					start = moment(start).format('YYYY-MM-DD HH:mm');
					end = moment(end).format('YYYY-MM-DD HH:mm');

				} else {
					alert("다시 시도해주세요");
				}
					console.log(start);	
					console.log(end);	
				
					newSchedule(start, end);

					function newSchedule (start, end) {
					console.log("들어오오옴 제바아알dfdf");
					
					// 모달창 내용 초기화
					modalTitle.text('새로운 일정 등록');
					editStart.val(start);
					editEnd.val(end);
					/* editTitle.val('');
					editType.val('');
					editCont.val(''); */
					addBtnContainer.show();
					$("#scheModal").css("display", "block");

					$(".close").on("click", function() {
						$("#scheModal").css("display", "none");
					});
	
					//새로운 일정 저장 버튼 클릭
					$("#save-schedule").on('click', function(){
						var scheduleData = {
							title: editTitle.val(),
							start: editStart.val(),
							end: editEnd.val(),
							type: editType.val(),
							backgoundColor: editColor.val(),
							textColor: "fff",
							allDay: false
						};
						
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
						
						var realEndDay;
						
						
						// 하루종일 체크박스가 체크되었을 경우 - 현재 동작 안 하는 듯 ㅠㅜㅠㅜ
						if(editAllDay.is(':checked')){
							scheduleData.start = moment(scheduleData.start).format('YYYY-MM-DD');
							// 달력 render 시 날짜 표기 수정
							scheduleData.end = moment(scheduleData.end).add(1, 'days').format('YYYY-MM-DD');
							// db에 넣을 때
							//realEndDay = moment(eventData.end).format('YYYY-MM-DD');
							
							scheduleData.allDay = true;
							
						} 
						
						calendar.addEvent(scheduleData);

						
				        console.log(scheduleData);
				        console.log("a01");
				        // 입력한 새로운 일정 저장
				        var querystring = $("#frm").serialize();
				        console.log("a02");
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
				        
						scheModal.find('input, textarea').val('');
				        editAllDay.prop('checked', false);
				        scheModal.hide();
					}) // 저장버튼 클릭

				} //newSchedule
				
			}, //select 
			events: function(into, successCallback, failureCallback){
				$.ajax({
					type: "post",
					
				})
				
			},
			eventClick : function(arg) {
				if (confirm('일정을 삭제하시겠습니까?')) {
					arg.event.remove();
				}
			},
			editable : true,

		}); // var calendar
		console.log("calendar.render()");
		calendar.render();
	}); //$(document)
</script>
<title>달력</title>
</head>
<body>
	
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
								<td><input class="allDayEvent" id="edit-allDay" type="checkbox"></td>
							</tr>

							<tr>
								<td><label for="edit-title">일정명</label></td>
								<td><input class="inputModal" type="text" name="scheName" id="edit-title" required="required" />
							</tr>

							<tr>
								<td><label for="edit-start">시작일</label></td>
								<td><input class="inputModal" type="text" name="scheStart"	id="edit-start" /></td>
							</tr>

							<tr>
								<td><label for="edit-end">마감일</label></td>
								<td><input class="inputModal" type="text" name="scheEnd" id="edit-end" /></td>
							</tr>

							<tr>
								<td><label for="edit-type">구분</label></td>
								<td><select class="inputModal" name="scheCode"	id="edit-type">
										<option value="1">공채 일정 - 신입</option>
										<option value="2">공채 일정 - 경력</option>
										<option value="3">개인 일정</option>
								</select></td>
							</tr>
							<tr>
								<td><label for="edit-color">색상</label></td>
								<td><select class="inputModal" name="color" id="edit-color">
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
								<td><textarea rows="4" cols="50" class="inputModal" name="scheContent" id="edit-cont"></textarea></td>
							</tr>
						</table>
					</form>
				</div>
				<!-- modal-body 끝 -->
				<div class="modal-footer modalBtnContainer-addSchedule">
					<button type="reset" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="save-schedule">저장</button>
				</div>
				<!-- modal-footer 끝 -->
			</div>
		<!-- modal-content 끝 -->
	</div>
<!-- scheModal 끝 -->
	
	
	
</body>
</html>