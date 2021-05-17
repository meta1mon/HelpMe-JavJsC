<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style/main.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/style/rcCalendarStyle.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../view/header.jsp"%>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.6.0/main.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
   
  });

  $(function() {
    $("#edit-start, #edit-end").datepicker();
  });



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
	    height: 700,
	    timeZone: "local",
	    locale: "ko",
	    <c:if test="${sessionScope.AdminNickname ne null}">
	    headerToolbar: {
	       center: 'addEventButton'
	       },
	    </c:if>
	    handleWindowResize: true,
		dayMaxEvents: false,
		displayEventTime: false,
		displayEventEnd: false,
		eventDisplay: 'block',
		eventBorderColor: '#fff',
	    editable: false,
	    customButtons: {
	      addEventButton: {
	        text: '공채 일정 추가',
	        click: function() {
	        		
	        	
	        	var memberId1 = "<%=session.getAttribute("loginMember")%>"
				var memberId2 = '${loginMember}'
	        	
				console.log("memberId1" + memberId1);
				console.log("memberId2" + memberId2);
				
	        	
    			// 새로운 일정 등록 모달창 기본 설정
    			modalTitle.text('새로운 일정 등록');
    			$('#edit-start').val('');
    			$('#edit-end').val('');
    		    editTitle.val('');
    			editType.val('1');
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
	        		
	        	} // click 끝
	        	
    		} // addEventButton 끝
        	
      
	    }, // customButton 끝
	    
		events : function (info, successCallback, failureCallback) {
			console.log(info);
	   		  $.ajax({
	 				url:"<%=request.getContextPath()%>/rcscheduleview",
	 				type:"post",
	 				dataType:"json",
	 				
	 				success:function(data){	
	 					var events = [];
	 					if(data != null){
		 					$.each(data,function(index,e) {
								console.log(data);
		 						console.log(e);
								console.log(e.rcScheName);

								var title = e.rcScheName;
								console.log(title);
								
								
								
								startDay = moment(e.rcScheStart);
								endDay = moment(e.rcScheEnd);

								//var startDay = e.rcScheStart; 
								console.log("startDay : " + e.rcScheStart);
								
	//							var endDay = e.rcScheEnd;
								console.log("endDay : " + endDay);
								console.log("e.rcScheEnd : " + e.rcScheEnd);
								
								
								var calcDay = moment(endDay.diff(startDay)).format('D');
								
								
								if(calcDay >= 2){
									console.log("if문 들어옴");
									console.log("startDay: " + startDay);
									console.log("endDay : " + endDay);
									console.log("cacDay : " + calcDay);
									
									// 하루종일 일정이 2일 이상일 경우 달력에 표기 시 db 날짜 보다 하루를 더해야 정상출력
									startDay = moment(e.rcScheStart).format('YYYY-MM-DD');
									endDay = moment(e.rcScheEnd).add(1, 'days').format('YYYY-MM-DD'); 
									
								} else{
									startDay = moment(e.rcScheStart).format('YYYY-MM-DD');
									endDay = moment(e.rcScheEnd).format('YYYY-MM-DD');
								}
								
								
								var type = e.rcScheCode;
								console.log(type);
								
								var content = e.rcScheContent;
								console.log(content);
								
								
								var backgroundColor = '';
								if(type == 1){
									backgroundColor = '#809bbf'	
								}else{
									backgroundColor = '#add9d4'
								}
								
								events.push({
									title : title,
									start : startDay, 
									end : endDay,
									allDay : true,
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
	 				
	   		  }, 
	    
	    
	    
	    eventClick: function(arg) {
			
	    	
	    	if(!confirm('일정을 지우시겠습니까? 확인: 일정 삭제, 취소: 상세 일정 확인')){
				//모달창 open
				checkSchedule(arg.event);
			}else{
				<c:if test="${sessionScope.AdminNickname != '관리자'}">
				alert("일정 삭제 권한이 없습니다");
		    	</c:if>
				<c:if test="${sessionScope.AdminNickname == '관리자'}">
				arg.event.remove();
				
				var title = arg.event.title;
				$.ajax({
		    	        type: "post",
		    	        url: "<%=request.getContextPath()%>/rcscheduledelete",
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
		    	</c:if>
			}
			
			} /* eventClick 끝*/
	  });
	
	  calendar.render();
	  
		//새로운 일정 저장 버튼 클릭
		$("#save-schedule").on('click', function(e){
		    e.preventDefault();
			console.log("저장함수 호출");
				

        	var title = editTitle.val();
        	console.log("title : " + title);
        	
        	var dateStrStart = editStart.val();
        	console.log("dateStrStart : " + dateStrStart);
        	
        	var dateStrEnd = editEnd.val();
        	console.log("dateStrEnd : " + dateStrEnd);
        	
        	var dateStart = new Date(dateStrStart);
        	console.log("dateStart : " + dateStart);
        	
        	var dateEnd = new Date(dateStrEnd);
        	console.log("dateEnd : " + dateEnd);
        	
        	var type = editType.val();
        	console.log("type : " + type);
        	
        	var content = editCont.val();
        	console.log("content : " + content);
		
			
			console.log("저장함수 닫기");
			// 일정 시작 날짜보다 마감 날짜가 앞설 경우 
			if(dateStart > dateEnd) {
				alert('일정 마감 날짜가 앞설 수 없습니다.');
				return false;
			}
			// 일정명을 기입하지 않았을 경우
			if(title === ''){
				alert('일정명은 필수입니다.')
				return false;
			}
			
			if(type === ''){
				alert('일정 종류를 선택해주세요.')
				return false;
			}
			
			var backgroundColor = '';
			if(type == 1){
				backgroundColor = '#809bbf'	
			}else{
				backgroundColor = '#add9d4'
			}
			
			
			
			console.log("calendar.addEvent() 호출");
			
			  if (!isNaN(dateStart.valueOf())) { // valid?
	                   calendar.addEvent({
	                     title: title,
	                     start: dateStart,
	                     end: dateEnd,
	                     type: type,
	                     backgroundColor: backgroundColor,
	                     content: content,
	                     allDay: true
	                   });
	        	   
	                 } else {
	                   alert('일정 등록 실패');
	                 }
			
			$("#scheModal").css("display", "none");
			//console.log(scheduleData);
			
			
			  // 입력한 새로운 일정 저장
	        var datastring = $("#frm").serialize();
	        console.log(datastring);
	        $.ajax({
	        	type: "post",
	        	url: "<%=request.getContextPath()%>/rcscheduleinsert",
	        	data: datastring,
	        	
	        	success: function(data){
	        		console.log("일정 등록 성공");
	        	},
	        	error: function(request, status, error ){
	        		console.log("일정 등록 실패");
					alert("code: "+ request.status + "\n" + "message: "+ request.responseText + "\n" + "error: "+ error );
				} 
	        })
	        
	        
	        
	     
		}) // 저장버튼 클릭 끝
		
		
		function checkSchedule(event){
			console.log(event);
			
			// 모달창 setting
			modalTitle.html('일정 확인');
		    editTitle.val(event.title);
		    
		    editStart.val(event.startStr);
		    
		    var renderEnd = moment(event.end).subtract(1, 'days').format('YYYY-MM-DD');
		    editEnd.val(renderEnd);
		    
		    
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
	});


</script>
</head>
<body class="content">
	<div style="width: 840px; margin: 0 auto 0 auto; color: #99ADB6; background:#ffffff; padding:20px; border-radius: 4px;">
	<div id="calendar"></div>
	</div>
	
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
									<option value="1" style="color: #809bbf;">공채 일정 - 신입</option>
									<option value="2" style="color: #add9d4;">공채 일정 - 경력</option>
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