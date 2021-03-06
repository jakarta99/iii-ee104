<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css-->
<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp"/>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>




<title>Violation Report 提出檢舉</title>
</head>
<body>
	<!-- Top bar-->
	<jsp:include page="../../commons/commons_layout/commons_top-bar.jsp" />
	<!-- Navbar -->
	<jsp:include page="../../commons/commons_layout/commons_nav.jsp" />
	
	
	<h1 style="padding-top: 2cm">填寫檢舉資料</h1>
	<h4>#開頭為debug用，正式上線時拿掉</h4>
	<hr>
	<form enctype="multipart/form-data" onSubmit="return CheckForm();" action="/admin/penaltyVertify/doReport" method="post">
<!-- 	<form enctype="multipart/form-data" onSubmit="return CheckForm();"> -->
<!-- 	input設disabled，則不會被序列化 -->
		#媒合案件編號(Order.id):
		<input type="text" id="orderListId" name="order" value="${reportBasicData.order.id}" readonly/><p>

		#活動編號(Mission.id):
		<input type="text" id="" name="" value="${reportBasicData.order.mission.id}"  disabled="disabled"/><p>
		活動名稱(Mission.title):
		<input type="text" id="" name="" value="${reportBasicData.order.mission.title}"  disabled="disabled"/><p>
		活動時間(Mission.startDate~endDate):
		<input type="text" id="" name="" value="${reportBasicData.order.mission.startDate} ~ ${reportBasicData.order.mission.endDate}" size="50"  disabled="disabled"/><p>
		
		
		#檢舉人會員編號  accuser-memberId(暫時直接抓目前登入者之id):
		<input type="text" id="accuser" name="accuser" value="${reportBasicData.accuser.id}"  readonly/><p>
		檢舉人姓名:
		<input type="text" id="" name="" value="${reportBasicData.accuser.name}"  disabled="disabled"/><p>
		
		#被檢舉人會員編號  defendant-memberId:
		<input type="text" id="defendant" name="defendant" value="${reportBasicData.defendant.id}" readonly/><p>
		被檢舉人姓名:
		<input type="text" id="" name="" value="${reportBasicData.defendant.name}"  disabled="disabled"/><p>
		
		檢舉內容描述description:
		<textarea  id="description" name="description" cols="50" rows="5"></textarea><p>
		
		<input type="hidden" id="status" name="status" value="1"/><p>
		
		<input type="file" id="proofPic" name="proofPic"  accept="image/*"><p>
			請選擇圖檔，如無佐證資料，則直接送出審核<p>
<!-- 		<input type="submit" value="上傳佐證資料"> -->
		<button id="add" class="btn btn-primary mb-2" >送出檢舉</button>
<!-- 		<input id="submit" type="submit" id="add" value="送出檢舉" class="btn btn-primary mb-2" /> -->
	</form>
	
	<!-- FOOTER -->
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp" />
	
	
	<script type="text/javascript">
	function CheckForm(){
		if(confirm("確認要送出檢舉嗎？")==true) {
			return true;
		} else {
			return false;
		}
	} 
	

// 	$("form").submit(function(e){
// 		e.preventDefault();
// 		var formData = new FormData($('form')[0]);

// 		$.ajax({
// 			method: "post",
// 			dataType: "json",
// 			url: "/admin/penaltyVertify/doReport",
// 			data: formData, //$("form").serialize(),
// 			enctype : "multipart/form-data",
// 		    cache: false,
// 		    async: false,
// 		    contentType: false,
// 		    processData: false,
// 			success: function(response){
// 				if(response.status == "SUCCESS"){
// 					alert("檢舉成功");
// 				}else{
// 					$.each(response.message, function(idx, message){
// 						alert("檢舉失敗，" + message);
// 					});
// 				}
// 				window.location.replace("/admin/penaltyVertify/tempPenaltyEntrance");
// 			}
// 		})
// 	})
	

	</script>
</body>
</html>