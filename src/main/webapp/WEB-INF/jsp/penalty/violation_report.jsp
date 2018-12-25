<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
	integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
	integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">

<title>Violation Report 提出檢舉</title>
</head>
<body>

	<h1 style="padding-top: 2cm">第一步、填寫檢舉資料</h1>
	<h4>#開頭為debug用，正式上線時拿掉</h4>
	<hr>
	<form action="/penalty/doReport" method="Post">
<!-- 	新發現:input設disabled，則不會被序列化 -->
		#媒合案件編號(Order.id):
		<input type="text" id="orderListId" name="order" value="${reportBasicData.order.id}" readonly/><p>

		#活動編號(Mission.id):
		<input type="text" id="" name="" value="${reportBasicData.order.mission.id}"  disabled="disabled"/><p>
		活動名稱(Mission.title):
		<input type="text" id="" name="" value="${reportBasicData.order.mission.title}"  disabled="disabled"/><p>
		活動時間(Mission.startDate~endDate):
		<input type="text" id="" name="" value="${reportBasicData.order.mission.startDate} ~ ${reportBasicData.order.mission.endDate}" size="50"  disabled="disabled"/><p>
		
		
		#檢舉人會員編號  accuser-memberId(暫時直接抓目前登入者之id):
		<input type="text" id="accuser" name="accuser" value="${reportBasicData.accuser}"  readonly/><p>
		檢舉人姓名:<p>
<%-- 		<input type="text" id="" name="" value="${reportBasicData.accuserName}"  disabled="disabled"/><p> --%>
		
		#被檢舉人會員編號  defendant-memberId:
		<input type="text" id="defendant" name="defendant" value="${reportBasicData.defendant.id}" readonly/><p>
		被檢舉人姓名:
		<input type="text" id="" name="" value="${reportBasicData.defendant.name}"  disabled="disabled"/><p>
		
		檢舉內容描述description:
		<textarea  id="description" name="description" cols="50" rows="5"></textarea><p>
		
		<input type="hidden" id="status" name="status" value="1"/><p>
		
		<input type="submit" id="add" value="下一步" class="btn btn-primary mb-2" />
	</form>
	
	<script type="text/javascript">
	

	</script>
</body>
</html>