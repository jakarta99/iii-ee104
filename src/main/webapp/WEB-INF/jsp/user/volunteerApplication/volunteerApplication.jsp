<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Time Bank User</title>
<!-- css -->
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp" />

<body>
	<!-- Top bar-->
	<jsp:include page="../../commons/commons_layout/commons_top-bar.jsp" />
	<!-- Navbar -->
	<jsp:include page="../../commons/commons_layout/commons_nav.jsp" />
	<div>
		<ul>
			<li>申請</li>
			<ul>
				<li>申請中</li>
				<li>機構接受服務</li>
				<li>活動時間結束，未發時數</li>
			</ul>
			<li>服務紀錄</li>
			<ul>
				<li>媒合成功紀錄</li>
				<li>媒合失敗紀錄</li>
			</ul>
		</ul>
		<fieldset style="width: 300">
			<table id="table" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th scope="col">活動名稱(mission.title)</th>
						<th scope="col">地點(mission.county district address)</th>
						<th scope="col">時間(mission.startDate + mission.endDate)</th>
						<th scope="col">時數(mission.timeValue	)</th>
						<th scope="col">申請時間()</th>
						<th scope="col">狀態(order.status)</th>
						<th scope="col" width="100px"></th>
					</tr>
				</thead>
				<tbody id="tableBody">
					<!-- 會員資料 -->
				</tbody>
			</table>
		</fieldset>
	</div>

	<!-- FOOTER -->
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp" />
	<!-- Javascript files-->
	<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />
</body>
</html>