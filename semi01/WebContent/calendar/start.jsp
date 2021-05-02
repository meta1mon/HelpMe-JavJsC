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
<script>
	document.addEventListener("DOMContentLoaded", function(){
		var calendarEl = document.getElementById("calendar");
		var now = new Date();
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
			selectable: true,
			selectMirror: true,
			select: function(arg) {
			        var title = prompt('일정 이름:');
			        if (title) {
			          calendar.addEvent({
			            title: title,
			            start: arg.start,
			            end: arg.end,
			            allDay: arg.allDay
			          })
			        }
			        calendar.unselect();
			      },
			      eventClick: function(arg) {
			        if (confirm('일정을 삭제하시겠습니까?')) {
			          arg.event.remove();
			        }
			      },
			      editable: true,
			      events: [
			        {
			          title: 'All Day Event',
			          start: '2021-04-01'
			        },
			        {
			          title: 'Long Event',
			          start: '2021-04-07',
			          end: '2021-04-10'
			        },
			        {
			          groupId: 999,
			          title: 'Repeating Event',
			          start: '2021-04-09T16:00:00'
			        },
			        {
			          groupId: 999,
			          title: 'Repeating Event',
			          start: '2021-04-16T16:00:00'
			        },
			        {
			          title: 'Conference',
			          start: '2021-04-11',
			          end: '2021-04-13'
			        },
			        {
			          title: 'Meeting',
			          start: '2021-04-12T10:30:00',
			          end: '2021-04-12T12:30:00'
			        },
			        {
			          title: 'Lunch',
			          start: '2021-04-12T12:00:00'
			        },
			        {
			          title: 'Meeting',
			          start: '2021-04-12T14:30:00'
			        },
			        {
			          title: 'Happy Hour',
			          start: '2021-04-12T17:30:00'
			        },
			        {
			          title: 'Dinner',
			          start: '2021-04-12T20:00:00'
			        },
			        {
			          title: 'Birthday Party',
			          start: '2021-04-13T07:00:00'
			        }
			      ]
			    });

			    calendar.render();
			  });

</script>
<title>달력</title>
</head>
<%@include file="../view/header.jsp"%>
<body>
	<div id="calendar"></div>
</body>
</html>