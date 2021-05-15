<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style/main.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style/rcCalendarStyle.css" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../view/header.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.6.0/main.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>


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
	
	
	 var calendarEl = document.getElementById('calendar');
	
	 var calendar = new FullCalendar.Calendar(calendarEl, {
	    initialView: 'dayGridMonth',
	    timeZone: "local",
	    locale: "ko",
	    headerToolbar: {
	      center: 'addEventButton'
	    },
	  
	    customButtons: {
	      addEventButton: {
	        text: '공채 일정 추가',
	        click: function() {
	        	
    			// 새로운 일정 등록 모달창 기본 설정
    			// 모달창 초기화	   		
    			modalTitle.text('새로운 일정 등록');
    			$('#edit-start').val('');
    			$('#edit-end').val('');
    		    editTitle.val('');
    			editType.val('');
    			editCont.val(''); 
    			
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
	        	
	        	
	        	var title = editTitle.val();
	        	var dateStrStart = editStart.val();
	        	var dateStrEnd = editEnd.val();
	        	var dateStart = new Date(dateStrStart);
	        	var dateEnd = new Date(dateStrEnd);
	        	
	        	   if (!isNaN(date.valueOf())) { // valid?
	                   calendar.addEvent({
	                     title: title,
	                     start: dateStart,
	                     end: dateEnd,
	                     allDay: true
	                   });
	        	   
	                 } else {
	                   alert('일정 등록 실패');
	                 }
       			}
        	
   		}
      
	    },
	    eventClick: function(arg) {
			
			if(!confirm('일정을 지우시겠습니까?')){
				//모달창 open
				checkSchedule(arg.event);
			}else{
				arg.event.remove();
				 
			}
	
			
			}, /* eventClick 끝*/
	      editable: true
	  });
	
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
			
			console.log("calendar.addEvent(scheduleData) 호출"+ scheduleData);
			
			calendar.addEvent(scheduleData);
			
			$("#scheModal").css("display", "none");
			//console.log(scheduleData);
			
	     
		}) // 저장버튼 클릭 끝
		
		
		function checkSchedule(event){
			console.log(event);
			
			// 모달창 setting
			modalTitle.html('일정 확인');
		    editTitle.val(event.title);
		    
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
		    
		    if(event.allDay == true){
			    editAllDay.prop('checked', true);
		    } else {
			    editAllDay.prop('checked', false);
		    }

		    
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
	});


</script>
</head>
<body class="content">
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
							<td><label for="edit-title">일정명</label></td>
							<td><input class="inputModal" type="text"
								name="scheName" id="edit-title" required="required" />
						</tr>

						<tr>
							<td><label for="edit-start">시작일</label></td>
							<td><input class="inputModal" type="text" name="scheStart" 
								id="edit-start" placeholder="YYYY-MM-DD" /></td>
						</tr>
						<tr>
							<td><label for="edit-end">마감일</label></td>
							<td><input class="inputModal" type="text" name="scheEnd"
								id="edit-end" placeholder="YYYY-MM-DD" /></td>
						</tr>

						
						<tr>
							<td><label for="edit-type">일정 구분</label></td>
							<td><select class="inputModal" name="scheCode"
								id="edit-type">
									<option value="1" style="color: #8cdeb8;">공채 일정 - 신입</option>
									<option value="2" style="color: #8cded4;">공채 일정 - 경력</option>
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
					<button type="button" class="btn btn-default" id="cancel" data-dismiss="modal">닫기</button>
				</div>
				<!-- modal-footer 끝 -->
			
			<!-- modal-footer 끝 -->
		</div>
		<!-- modal-content 끝 -->
	</div>
	<!-- scheModal 끝 -->
	
</body>
</html>
<%@include file="../view/footer.jsp"%>