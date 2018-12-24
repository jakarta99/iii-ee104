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
<title>檢舉案件審核</title>
</head>
<body>
	<!-- 加入nav.html(放在static/html) -->
<%-- 	<jsp:include page="../admin_layout/nav.jsp" /> --%>
	
	<h1 style="padding-top: 2cm">檢舉案件審核</h1>
	<h4>審核 編號第${penalty.id}案</h4>

	<form>
		<input type="hidden" value="${penalty.id}" id="penaltyId" name="penaltyId" />
		媒合案件編號(Order.id):
		<input type="text" id="orderId" name="orderId"
					class="form-control" value="${penalty.order.id}" readonly /><p>
					
		活動編號(Mission.id):
		<input type="text" id="missionId" name="missionId"
					class="form-control" value="${penalty.order.mission.id}" readonly /><p>
		
		活動時間(Mission.startDate~endDate):
		<input type="text" id="missionDateRange" name="missionDateRange"
					class="form-control" value="${penalty.order.mission.startDate} ~ ${penalty.order.mission.endDate}" readonly /><p>
					
		活動名稱(Mission.title):
		<input type="text" id="missionTitle" name="missionTitle"
					class="form-control" value="${penalty.order.mission.title}" readonly /><p>
		
		活動描述(Mission.discription):
		<input type="text" id="missionDiscription" name="missionDiscription"
					class="form-control" value="${penalty.order.mission.discription}" readonly /><p>
					
		檢舉人id(accuserId):
		<input type="text" id="memberId" name="memberId"
					class="form-control" value="${penalty.accuser}" readonly /><p>
		檢舉人姓名:<p>
		
		被檢舉人會員編號  defendant-memberId:
		<input type="text" id="defendantId" name="defendantId"
					class="form-control" value="${penalty.defendant.id}" readonly /><p>
				
		被檢舉人姓名:
		<input type="text" id="defendantName" name="defendantName"
					class="form-control" value="${penalty.defendant.name}" readonly /><p>
					
<!-- 		被檢舉人帳戶餘額: -->
<!-- 		<input type="text" id="" name="" -->
<!-- 					class="form-control" value="" readonly /><p> -->
					
		檢舉內容描述(description):
		<input type="text" id="PenaltyDescription" name="PenaltyDescription"
					class="form-control" value="${penalty.description}" readonly/><p>
					
		審核結果 (審核中&無須懲罰案件的懲罰時數一律為0，且不得更改):
		<select class="form-control" id="status" name="status">
			<option value=1></option>
			<option value=2>需懲罰</option>
			<option value=3>無需懲罰</option>
		</select><p>
		
		penaltyTimeValue (如果需懲罰，時數小於等於0，會跳出alert):
		<input type="text" id="penaltyTimeValue" name="penaltyTimeValue"
					class="form-control" value="${penalty.penaltyTimeValue}" readonly/>
			
		<input type="button" class="btn btn-primary" id="vertify" value="完成審核">
	</form>

<!-- 	<a href="/admin/penalty/list">back to penalty_list</a> -->

	<script type="text/javascript">
		$(document).ready(function() {

			$('#status').val('${penalty.status}');

			$('#vertify').click(function() {
				//alert($('#penaltyId').val());
				if($('#status').val() == 2 && $('#penaltyTimeValue').val() <= 0){
					alert("處罰時數需大於0");
				}else{
					$.ajax({
						url : "/penalty/doneVertify",
						method : "put",
						dataType : "json",
						data : {"penaltyId":$('#penaltyId').val(),"status":$('#status').val(),"penaltyTimeValue":$('#penaltyTimeValue').val()}
					}).done(function(result) {
						alert(result.status);
						document.location.href="/penalty/showVertifyList";
					})
				}
				
			})
			
			$('#status').change(function(){
				//alert($(this).val());
				if($(this).val()==1 || $(this).val()==3){ //審核中&無須處罰者，扣款時數強制寫為0，且不得更改
					$('#penaltyTimeValue').prop("readonly", true);	
					$('#penaltyTimeValue').val("0");
				}
				
				if($(this).val() == 2){ //須處罰者，扣款時數可編輯
					$('#penaltyTimeValue').removeAttr("readonly");
				}
				
			})
			

		})
	</script>
</body>
</html>