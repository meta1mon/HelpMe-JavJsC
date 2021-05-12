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
			dayMaxEvents: true,
			displayEventTime: true,
			displayEventEnd: false,
			eventTimeFormat: 
			{
				hour : 'numeric',
				minute: '2-digit',
			},
			selectable: true,
			selectMirror: true,
			unselectAuto: true,
			select: function(arg){ 
				// 달력 한 칸을 select하면 arg에 start, end, startStr("yyyy-mm-dd") endStr, view(type:"dayGridMonth")가 들어옴
				
				var start = arg.start;
				var end = arg.end;
				var view = arg.view;
				
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
					
					
					
					// 새로운 일정 등록 모달창 기본 설정
					modalTitle.text('새로운 일정 등록');
					$('#edit-start').val(start);
					$('#edit-end').val(end);
					// 모달창 초기화 - 위치 수정 필요	   		
			        editAllDay.prop('checked', false);
			        editTitle.val('');
					editType.val('');
					editCont.val('');
					if(addBtnContainer.css("display") == "none"){
						addBtnContainer.show();
					}else{
						addBtnContainer.hide();
					}
				
					$("#scheModal").css("display", "block");


					$(".close").on("click", function() {
						$("#scheModal").css("display", "none");
					});
					
					$(".btn-default").on("click", function() {
						$("#scheModal").css("display", "none");
					});
					
					//새로운 일정 저장 버튼 클릭
					$("#save-schedule").on('click', function(){
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
						
						
						// 하루종일 체크박스가 체크되었을 경우
						if(editAllDay.is(':checked')){
							scheduleData.start = moment(scheduleData.start).format('YYYY-MM-DD');
							// 달력 render 시 날짜 표기 수정
							scheduleData.end = moment(scheduleData.end).format('YYYY-MM-DD');
							// db에 넣을 때
							var realEndDay = moment(scheduleData.end).format('YYYY-MM-DD');
							
							scheduleData.allDay = true;
							
						} 
						
						calendar.addEvent(scheduleData);

						
				        console.log(scheduleData);
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
				        
						
					}) // 저장버튼 클릭

				} //newSchedule
				
			}, //select 
			
			editable : true,
			eventClick : function(info) {
				console.log(info);
				
				editSchedule(info.event);
				
				function editSchedule(event){
					console.log("event : " + event);
					
					modalTitle.html('일정 수정');
				    editTitle.val(event.title);
				    editStart.val(moment(event.start).format('YYYY-MM-DD HH:mm'));
				    editType.val(event.type);
				    editCont.val(event.content);
				    editColor.val(event.backgroundColor).css('color', event.backgroundColor);

				    
				    if(modifyBtnContainer.css("display") == "none"){
				    	addBtnContainer.hide();
				    	modifyBtnContainer.show();
					} else {
						modifyBtnContainer.hide();
					}
					

					$("#scheModal").css("display", "block");


					$(".close").on("click", function() {
						$("#scheModal").css("display", "none");
					});
					
					$(".btn-default").on("click", function() {
						$("#scheModal").css("display", "none");
					});
					
					 // 수정 버튼 클릭 시
				    $("#updateSchedule").on('click', function(){
				    	
					console.log("update 수행!!!!");
				    	if(editStart.val() > editEnd.val()){
				    		alert('끝나는 날짜가 앞설 수 없습니다.');
				    		return false;
				    	}
				    	
				    	if(editTitle.val() === '') {
				    		alert('일정명은 필수입니다.');
				    		return false;
				    	}
				    	
				    	var statusAllDay;
				        var startDate;
				        var endDate;
				        var displayDate;
				    	
				    	if(editAllDay.is(':checked')){
				    		statusAllDay = true;
				    		startDate = editStart.val();
				    		endDate = editEnd.val();
				    		displayDate = endDate;
				    	}
							
				    	console.log(statusAllDay);
				    	console.log(startDate);
				    	console.log(endDate);
				    	console.log(displayDate);
				    	
				    	event.remove();
				    	var modifyData = {
				          allDay : statusAllDay,
				          title : editTitle.val(),
				          start : startDate,
				          end : displayDate,
				          type : editType.val(),
				          backgroundColor : editColor.val(),
				          content : editCont.val()
				    			
				    	}
					      console.log(event);
					      
					      calendar.addEvent(modifyData);
					      console.log(modifyData);
					      $.ajax({
					            type: "post",
					            url: "<%=request.getContextPath()%>/scheduleupdate",
					            data: modifyData,
					            
					            success: function (response) {
					                alert('수정되었습니다.');
					            },
					     		error: function(request, status, error ){
				        		console.log("일정 수정 실패");
								alert("code: "+ request.status + "\n" + "message: "+ request.responseText + "\n" + "error: "+ error );
							} 
					        });
					      
				    }) // 수정 버튼 클릭 끝
				    
				    // 삭제 버튼 클릭 시
				    $("#deleteSchedule").on('click', function(){
				    	event.remove();
				    	$("#scheModal").css("display", "none");
				    	
				    	 $.ajax({
				    	        type: "post",
				    	        url: "<%=request.getContextPath()%>/scheduledelete",
				    	      
				    	        success: function (response) {
				    	            alert('삭제되었습니다.');
				    	        },
				    	        error: function(request, status, error ){
					        		console.log("일정 삭제 실패");
									alert("code: "+ request.status + "\n" + "message: "+ request.responseText + "\n" + "error: "+ error );
								} 
				    	  })
				    }) // 삭제 버튼 클릭 끝
				    
				} // editSchedule 끝
				} /* eventClick 끝*/
				
			
		}); // var calendar
		calendar.render();
	}); //$(document)

	
</script>
<title>달력</title>
</head>
<section class="content">
	
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
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="save-schedule">저장</button>
				</div>
				 <div class="modal-footer modalBtnContainer-modifySchedule">
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-danger" id="deleteSchedule">삭제</button>
                    <button type="button" class="btn btn-primary" id="updateSchedule">저장</button>
                 </div>
				<!-- modal-footer 끝 -->
			</div>
		<!-- modal-content 끝 -->
	</div>
<!-- scheModal 끝 -->
	
	
<%@include file="../view/footer.jsp" %>
</section>
</html>