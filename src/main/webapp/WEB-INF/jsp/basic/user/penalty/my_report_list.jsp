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

<title>My Report List</title>
</head>
<body>
	<!-- Top bar-->
	<jsp:include page="../../commons/commons_layout/commons_top-bar.jsp" />
	<!-- Navbar -->
	<jsp:include page="../../commons/commons_layout/commons_nav.jsp" />
	
	
		<h2>您已提出檢舉，資料如下：</h2>
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
		<h2>是否上傳舉證資料?</h2>
		<form action="/penalty/storeProofPic" method="Post" enctype="multipart/form-data" onSubmit="return CheckForm();">
			<input type="hidden" id="penaltyId" name="penaltyId" value="${reportOnePenalty.id}">
			<input type="file" id="proofPic" name="proofPic"  accept="image/*"><p>
			請選擇圖檔，如無佐證資料，則直接送出審核<p>
			<input type="submit" value="上傳佐證資料">
		</form>
		
		
		<!-- FOOTER -->
		<jsp:include page="../../commons/commons_layout/commons_footer.jsp" />
		
<script type="text/javascript">

	function CheckForm(){
		if($("#proofPic").val() == ""){
			if(confirm("您沒有選擇佐證資料，確定不上傳嗎？")==true) {
				return true;
			} else {
				return false;
			}
		}
		if(confirm("上傳佐證資料後將無法修改，確認要上傳佐證資料嗎？")==true) {
			return true;
		} else {
			return false;
		}
	} 
</script>		
</body>
</html>