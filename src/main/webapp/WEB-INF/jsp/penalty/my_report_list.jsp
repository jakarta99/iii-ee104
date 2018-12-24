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

	<h1 style="padding-top: 2cm">第二步、上傳佐證資料</h1>
		<h3>確認第一步填寫資料</h3>
		<table border='1'>
			<tr>
				<td>媒合案件編號(Order.id)</td>
				<td>${reportOnePenalty.order.id}</td>
			</tr>
			<tr>
				<td>活動編號(Mission.id)</td>
				<td>${reportOnePenalty.order.mission.id}</td>
			</tr>
			<tr>
				<td>活動名稱(Mission.title)</td>
				<td>${reportOnePenalty.order.mission.title}</td>
			</tr>
			<tr>
				<td>活動時間(Mission.startDate~endDate)</td>
				<td>${reportOnePenalty.order.mission.startDate} ~ ${reportOnePenalty.order.mission.endDate}</td>
			</tr>
			<tr>
				<td>#被檢舉人會員編號  defendant-memberId</td>
				<td>${reportOnePenalty.defendant.id}</td>
			</tr>
			<tr>
				<td>被檢舉人姓名</td>
				<td>${reportOnePenalty.defendant.name}</td>
			</tr>
			<tr>
				<td>檢舉情形描述description</td>
				<td>${reportOnePenalty.description}</td>
			</tr>
		</table>
		<hr>
		<h3>上傳舉證資料</h3>
		<form action="/penalty/storeProofPic" method="Post" enctype="multipart/form-data">
			<input type="hidden" id="penaltyId" name="penaltyId" value="${reportOnePenalty.id}">
			<input type="file" id="proofPic" name="proofPic"  accept="image/*"><p>
			請選擇圖檔，如無佐證資料，則直接送出審核<p>
			<input type="submit" value="送出審核">
		</form>
		
		<a href="#">back to 我的檢舉案件</a><p>
		<a href="/penalty/tempPenaltyEntrance">back to 我的所有媒合案件(清單)</a>
		
		
		
	
	
</body>
</html>