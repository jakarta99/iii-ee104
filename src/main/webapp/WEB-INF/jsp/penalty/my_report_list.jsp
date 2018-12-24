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

<title>My Report List</title>
</head>
<body>

	<h1 style="padding-top: 2cm">檢舉成功(暫放，之後要放個人檢舉案件列表)</h1>


		媒合案件編號(Order.id):${penalty.order.id}<p>
		活動編號(Mission.id):${penalty.order.mission.id}<p>
		活動名稱(Mission.title):${penalty.order.mission.title}<p>
		活動時間(Mission.startDate~endDate):${penalty.order.mission.startDate} ~ ${penalty.order.mission.endDate}<p>
		
		
<!-- 		#檢舉人會員編號  accuser-memberId: -->
<%-- 		<input type="text" id="accuser" name="accuser" value="${penalty.accuser}"  readonly/><p> --%>
<!-- 		檢舉人姓名: -->
<%-- 		<input type="text" id="" name="" value="${penalty.accuserName}"  disabled="disabled"/><p> --%>
		
		#被檢舉人會員編號  defendant-memberId:${penalty.defendant.id}<p>
		被檢舉人姓名:${penalty.defendant.name}<p>
		檢舉情形描述description:${penalty.description}<p>
		狀態:${penalty.status}<p>
		
		
		
	
	
</body>
</html>