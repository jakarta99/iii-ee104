<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>calendar</title>
<!-- Javascript files-->
<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />
<!-- TOAST UI Calendar -->
<script src="https://uicdn.toast.com/tui.code-snippet/latest/tui-code-snippet.js"></script>
<script src="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.js"></script>
<link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui-calendar/latest/tui-calendar.css" />
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp"/>
</head>
<body>
<!-- Top bar-->
	<jsp:include page="../../commons/commons_layout/commons_top-bar.jsp" />
	<!-- Navbar -->
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
	    <div id="calendar" style="height: 800px;"></div>
	    </div>
    </section>
      
      
    <!-- FOOTER -->
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp" />
	<script>
	var Calendar = tui.Calendar;
	$('#calendar').tuiCalendar({
	  defaultView: 'month',
	  taskView: true,
	  template: {
	    monthGridHeader: function(model) {
	    var date = new Date(model.date);
	    var template = '<span class="tui-full-calendar-weekday-grid-date">' + date.getDate() + '</span>';
	    return template;
	  	}
	  }
	});
	</script>
</body>
</html>