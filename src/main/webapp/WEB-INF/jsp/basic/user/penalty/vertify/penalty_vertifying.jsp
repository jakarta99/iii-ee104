<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../../../../admin/admin_layout/admin_css_js_links.jsp" />
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>檢舉案件審核</title>
<style>
	fieldset {
 		border-radius: 20px; 
 		padding: 20px 20px 0px 20px;  
		background-color:#d1e9e9;
		margin: auto; 
 		margin-top: 10px;  
 		margin-bottom: 20px;  
 		
	}
	
	body{
		font-family: "微軟正黑體"
	}
</style>
</head>
<body>

	<!-- 加入nav.html(放在static/html) -->
	<jsp:include page="../../../../admin/admin_layout/nav.jsp" />
	
	<div class="container" style="margin-top: 140px">
		<h2 class="text-center text-uppercase text-secondary mb-0" style="font-family: '微軟正黑體'" id="topic">檢舉案件審核</h2>
<!-- 	    <hr class="star-dark mb-5"> -->
	</div>

	<form>
		<fieldset style="width:1300px">
		<legend>第${penalty.id}號檢舉案件基本資料</legend>
			<input type="hidden" value="${penalty.id}" id="penaltyId" name="penaltyId" />
			<div class="form-row">
				<div class="form-group col-md-3">
					<label>媒合案件編號</label>
					<input type="text" id="orderId" name="orderId"
								 class="form-control" value="${penalty.order.id}" readonly />
				</div>	
				<div class="form-group col-md-3">		
					<label>活動編號</label>
					<input type="text" id="missionId" name="missionId"
								 class="form-control" value="${penalty.order.mission.id}" readonly />
				</div>
			</div>
	
			<div class="form-row">
				<div class="form-group col-md-3">	
					<label>檢舉人會員編號</label>
					<input type="text" id="accuserId" name="accuserId"
								class="form-control" value="${penalty.accuser.id}" readonly />
				</div>	
				<div class="form-group col-md-3">
					<label>檢舉人帳號</label>
					<input type="text" id="accuserAccount" name="accuserAccount"
								class="form-control" value="${penalty.accuser.account}" readonly />
				</div>
				
				<div class="form-group col-md-3">
					<label>被檢舉人會員編號</label>
					<input type="text" id="defendantId" name="defendantId"
								class="form-control" value="${penalty.defendant.id}" readonly />
				</div>
				<div class="form-group col-md-3">		
					<label>被檢舉人帳號</label>
					<input type="text" id="defendantAccount" name="defendantAccount"
								class="form-control" value="${penalty.defendant.account}" readonly />
				</div>
			</div>
			
			<div class="form-row">
				<div class="form-group col-md-3">
					<label>活動時間起迄</label>
					<input type="text" id="missionDateRange" name="missionDateRange"
								class="form-control" value="${penalty.order.mission.startDate}~${penalty.order.mission.endDate}" readonly />
				</div>
				
				<div class="form-group col-md-3">			
					<label>活動名稱</label>
					<input type="text" id="missionTitle" name="missionTitle"
								class="form-control" value="${penalty.order.mission.title}" readonly />
				</div>
				
				<div class="form-group col-md-6">
					<label>活動描述</label>
					<input type="text" id="missionDiscription" name="missionDiscription"
								class="form-control" value="${penalty.order.mission.discription}" readonly />
				</div>	
			</div>
			
			<div class="form-row">
				<div class="form-group col-md-6">
					<label>檢舉內容描述</label>
					<input type="text" id="PenaltyDescription" name="PenaltyDescription"
								class="form-control" value="${penalty.description}" readonly/>
				</div>
				<div class="form-group col-md-6">
					<label>是否檢附佐證資料</label>
					<div class="custom-control custom-radio">
						<input type="radio" id="proofRadio1" name="proofRadio" class="custom-control-input" readonly>
						<label class="custom-control-label" for="customRadio1">是</label>
						<a id="proofPic" href="../img/${penalty.proofPicName}" target="_blank">佐證資料檢視</a>
					</div>
					<div class="custom-control custom-radio">
						<input type="radio" id="proofRadio2" name="proofRadio" class="custom-control-input" readonly>
						<label class="custom-control-label" for="customRadio2">否</label>
					</div>
					
				</div>
			</div>
		</fieldset>
		
		<fieldset style="width:1300px">
		<legend>審核</legend>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label>審核結果:</label>
					<select id="status" name="status" class="form-control" >
						<option value=1>審核中</option>
						<option value=2>需懲罰</option>
						<option value=3>無需懲罰</option>
					</select>
				</div>
					
				<div class="form-group col-md-6">
					<label>懲罰時數:</label>
					<select class="custom-select my-1 mr-sm-2" id="penaltyTimeValue">
					  <option value="0">0</option>
					  <option value="1">1</option>
					  <option value="2">2</option>
					  <option value="3">3</option>
					  <option value="4">4</option>
					  <option value="5">5</option>
					</select>
				</div>
	
			</div>			
			<div class="form-row">
				<div class="form-group col-md-12">
					<label>審核意見、原因</label>
					<textarea class="form-control"  id="vertifyReason" name="vertifyReason" cols="50" rows="5"></textarea>
				</div>
			</div>
			
			<input type="button" class="btn btn-info" id="vertifyFinish" value="完成審核" disabled>
			<input type="button" class="btn btn-info" id="vertifyTemp" value="暫時儲存"><p>
		</fieldset>
	</form>

<!-- 	<a href="/admin/penalty/list">back to penalty_list</a> -->

	<script type="text/javascript">
		$(document).ready(function() {
			var penaltyStatus = "${penalty.status}";
			
			//設定審核狀態、審核意見及原因
			$('#status').val(penaltyStatus);
			$('#vertifyReason').val('${penalty.vertifyReason}');
			$('#penaltyTimeValue').val('${penalty.penaltyTimeValue}');
			
			//如檢視審核歷史紀錄，則刪去審核按鈕，並將所有欄位設為readonly
			if(penaltyStatus != 1){
				$("#vertifyFinish").remove();
				$("#vertifyTemp").remove();
				
				$("#status").prop("disabled", true);
				$("#penaltyTimeValue").prop("disabled", true);
				$("#vertifyReason").prop("readonly", true);
				
				$("#topic").html("檢舉案件歷史資料");
			}
			
			//無佐證資料時，不顯示佐證資料超連結
			var proofPicName = '${penalty.proofPicName}';
			if(proofPicName.length == 0){
				$("#proofPic").html("");
				$("#proofRadio2").prop("checked", true);
			}else{
				$("#proofRadio1").prop("checked", true);
			}
			
			//暫存或完成審核結果的方法
			function saveVertify(successMessage, errorMessage){
				if($('#status').val() == 2 && $('#penaltyTimeValue').val() <= 0){
					swal("處罰時數需大於0", {
					      icon: "warning",
					    });
					//alert("處罰時數需大於0");
				}else{
					$.ajax({
						url : "/penalty/doneVertify",
						method : "put",
						dataType : "json",
						data : {"penaltyId":$('#penaltyId').val(),"status":$('#status').val(),
							"penaltyTimeValue":$('#penaltyTimeValue').val(),"vertifyReason":$('#vertifyReason').val()},
						success : function(result) {
							if(result.status == "SUCCESS"){
								swal(successMessage, {
								      icon: "success",
								    });
								//alert(successMessage);
							}
							if(result.statusDescription != null){
								swal(result.statusDescription, {
							    	icon: "success",
							    }).then((result) => {
									if (result) {
										document.location.href="/penalty/showVertifyList";
									}
								});;
								//alert(result.statusDescription);
							}
							
						},
						error: function (result) {
							if(result.status == "ERROR"){
								alert(errorMessage);
							}
					        $.each(result.messages, function(idx, message) {
								alert("the "+idx+"th ERROR, because "+message);
							});
					    }
					})
				}
			}
			
			//完成審核
			$('#vertifyFinish').click(function() {
				swal({
					  title: "確定送出審核結果?",
					  text: "送出後將無法更改!",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
					.then((result) => {
					  if (result) {
						  saveVertify("完成審核", "審核結果儲存失敗");
					  } else {
					    swal("Your imaginary file is safe!");
					  }
					});
				
				
// 				var conf = confirm("確定送出審核結果? 送出後將無法更改");
// 				if(conf == true){
// 					saveVertify("完成審核", "審核結果儲存失敗");
// 				}
			})
			
			//暫存審核結果
			$('#vertifyTemp').click(function() {
				saveVertify("暫存審核內容成功", "暫存審核內容失敗");
			})
			
			$('#status').change(function(){
				//alert($(this).val());
				if($(this).val()==1){ //審核中，扣款時數可編輯
					$('#penaltyTimeValue').removeAttr("disabled");
					
					$('#vertifyFinish').prop("disabled", true);
					$('#vertifyTemp').prop("disabled", false);
				}
				
				if($(this).val() == 2){ //須處罰者，扣款時數可編輯
					$('#penaltyTimeValue').removeAttr("disabled");
				
					$('#vertifyFinish').prop("disabled", false);
					$('#vertifyTemp').prop("disabled", true);
				}
				
				if($(this).val()==3){ //無須處罰者，扣款時數強制寫為0，且不得更改
					$('#penaltyTimeValue').val("0");
					$('#penaltyTimeValue').prop("disabled", true);
					
					$('#vertifyFinish').prop("disabled", false);
					$('#vertifyTemp').prop("disabled", true);
				}
				
			})
			

		})
	</script>
</body>
</html>