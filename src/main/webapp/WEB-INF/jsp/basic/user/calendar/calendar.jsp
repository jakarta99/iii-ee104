<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>calendar</title>
<!-- Java script files-->
<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />
<!-- Moment.js v2.20.0 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.0/moment.min.js"></script>
<!-- FullCalendar v3.8.1 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.1/fullcalendar.min.css" rel="stylesheet"  />
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.1/fullcalendar.print.css" rel="stylesheet" media="print">
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.8.1/fullcalendar.min.js"></script>
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp"/>
</head>
<body>
<!-- Top bar-->
	<jsp:include page="../../commons/commons_layout/commons_top-bar.jsp" />
	<!-- Nav bar -->
	<jsp:include page="../../commons/commons_layout/commons_nav.jsp" />
  	<div id="heading-breadcrumbs">
       <div class="container">
         <div class="row d-flex align-items-center flex-wrap">
           <div class="col-md-7">
             <h1 class="h2">行事曆</h1>
           </div>
         </div>
       </div>
     </div>
    <section class="bar">
	    <div class="container">
	    <div id="calendar"></div>
	    </div>
    </section>
      
      
    <!-- FOOTER -->
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp" />
	<script>
	$(document).ready(function(){
	  $('#calendar').fullCalendar({
		  header: {
			  left: 'month,agendaWeek,agendaDay',
			  center: 'title',
			  right: 'today, prev, next'
			  },
		  monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
		  monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
		  dayNames: ["週日", "週一", "週二", "週三", "週四", "週五", "週六"],
		  dayNamesShort: ["週日", "週一", "週二", "週三", "週四", "週五", "週六"],
		  today: ["今天"],
		  firstDay: 1,
		  buttonText: {
			  prev: '«', next: '»', prevYear: ' << ', nextYear: ' >> ',
			  today: '今天', month: '月', week: '周', day: '日'
			  },
		  events: function(start, end, timezone, callback) {
			  $.ajax({
				  url: '/user/getOrder',
				  success: function(data) {
					  var events = [];
					  $.each(data, function(idx){
						  events.push({
							  title: data[idx].mission.title,
							  start: data[idx].mission.startDate,
							  end: data[idx].mission.endDate
						  });
					  });
					  callback(events);
				  }
			  })
		  },
		  eventClick: function(event, jsEvent, view){
				alert('Event:' + event.title);
				console.log(jsEvent);
				console.log(view);
			},
		  eventColor: 'yellow',
		  eventTextColor: 'black',
		});
	})
	</script>
</body>
</html>