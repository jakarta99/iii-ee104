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
<style type="text/css">
.fc td, .fc th {
  padding: 1px;
  vertical-align: top; 
   border-color: #0e0d0d;
  }
.fc-title{	
	letter-spacing:3px;
}
.fc-event{
	padding:3px;
	margin:3px;
}
.fc-button{
	  background: #4fbfa8;
	  border: 1px solid #4fbfa8 !important;
	  color: #fff !important;
	  border-radius: 0 !important;
}
</style>
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
	<div id="fullCalModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 id="modalTitle" class="modal-title"></h4>
	            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          		<span aria-hidden="true">&times;</span>
	        	</button>
            </div>
            <div id="modalBody" class="modal-body">
	            <h5>活動開始時間</h5>
	            <p id="eventBegin"></p>
	            <h5>活動結束時間</h5>
	            <p id="eventEnd"></p>
            </div>
            <div class="modal-footer">
            	<a id="eventUrl" href="#" role="button" class="btn btn-primary" title="Popover title">查看活動頁面</a> 
            </div>
        </div>
    </div>
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
							  end: data[idx].mission.endDate,
							  id: data[idx].mission.id,
							  status: data[idx].orderStatus,
						  });
					  });
					  callback(events);
				  }
			  })
		  },
		  eventClick: function(event, jsEvent, view){	  
			  	$('#modalTitle').html(event.title);
	            $('#eventBegin').text(new Date(event.start).Format('yyyy-MM-dd hh:mm'));
	            $('#eventEnd').text(new Date(event.end).Format('yyyy-MM-dd hh:mm'));
	            $('#eventUrl').attr('href','/commons/domesticVolunteer/apply?missionId=' + event.id);
	            $('#fullCalModal').modal();
			},
			eventAfterRender: function (event, element, view) {
				element.css('font-weight', '700')
				element.css('border', 'white');
				element.css('color', 'black');
		        if (event.status == 'VolunteerApply' || event.status == 'RequesterAcceptService' || event.status == 'ServiceFinishNotPay') {		        	
		            element.css('background-color', '#d2e9ff');	
		        } else {
		            element.css('background-color', '#ceffce');		            
		        }
		    },
		  eventTextColor: '	#000000',
		});
	})
	
	//自訂日期格式
	Date.prototype.Format = function (fmt) {
	    var o = {
	        "M+": this.getMonth() + 1, //月份
	        "d+": this.getDate(), //日
	        "h+": this.getHours(), //小时
	        "m+": this.getMinutes(), //分
	        "s+": this.getSeconds(), //秒
	        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
	        "S": this.getMilliseconds() //毫秒
	    };
	    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
	        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	    return fmt;
	}
	</script>
</body>
</html>