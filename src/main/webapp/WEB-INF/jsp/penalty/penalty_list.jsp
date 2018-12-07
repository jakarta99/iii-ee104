<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>Penalty List</title>
</head>
<body>
	<!-- 加入nav.html(放在static/html) -->
	<c:import url="/html/nav.html"></c:import>
	<h1 style="padding-top: 2cm">Penalty List</h1>

	<form id="serachForm">
		<div class="form-group row">
			<label for="orderListId" class="col-sm-1 col-form-label">orderListId</label>
			<div class="col-sm-2">
				<input type="text" id="orderListId" name="orderListId"
					class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<label for="memberId" class="col-sm-1 col-form-label">memberId</label>
			<div class="col-sm-2">
				<input type="text" id="memberId" name="memberId"
					class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<label for="description" class="col-sm-1 col-form-label">description</label>
			<div class="col-sm-2">
				<input type="text" id="description" name="description"
					class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<label for="status" class="col-sm-1 col-form-label">status</label>
			<div class="col-sm-2">
				<select class="form-control" id="status" name="status">
					<option value="">請選擇</option>
					<option value=1>審核中</option>
					<option value=2>有罪</option>
					<option value=3>無罪</option>
				</select>
			</div>
		</div>
		<div class="form_group row">
			<label for="penaltyTimeValue" class="col-sm-1 col-form-label">penaltyTimeValue</label>
			<div class="col-sm-2">
				<input type="text" id="penaltyTimeValue" name="penaltyTimeValue"
					class="form-control" />
			</div>
		</div>
		<input type="button" class="btn btn-primary mb-2" id="serach" />
	</form>


	<button onclick="javascript:document.location.href='/penalty/add'"
		class="btn btn-primary">Add</button>
	<table class="table table-light table-sm table-striped table-bordered">
		<thead class="thead-dark">
			<tr>
				<th></th>
				<th>ID</th>
				<th>雇主ID</th>
				<th>被檢舉者ID</th>
				<th>逞罰時間</th>
				<th>處理進度</th>
				<th>描述</th>
				<th>被檢舉時間</th>
			</tr>
		</thead>
		<tbody id="dataTable">
			<!-- 會員資料 -->
		</tbody>
	</table>
	<script type="text/javascript">
		//列清單方法
		function listPenalty(Form) {
			$("#dataTable").text("");
			$.getJSON("/penalty/getList",
					Form,
					function(penalties) {
							var docFrag = $(document.createDocumentFragment());
							$.each(penalties,function(idx, penalty) {
							var editButt = "<input type='button' class=\"btn btn-primary btn-sm\"  onclick=\"javascript:document.location.href='/penalty/edit?id="
											+ penalty.id+ "'\" value='修改'  />";
							var deleteButt = "<input type='button' class=\"btn btn-primary btn-sm\" id='deleteButt"+ penalty.id +"' value='刪除' />";
							var p1 = $('<td></td>').text(penalty.id);
							var p2 = $('<td></td>').text(penalty.orderListId);
							var p3 = $('<td></td>').text(penalty.memberId);
							var p4 = $('<td></td>').text(penalty.penaltyTimeValue);
							var p5 = $('<td></td>').text(penalty.status);
							var p6 = $('<td></td>').text(penalty.description);
							var p7 = $('<td></td>').text(penalty.updateDate);
							var row = $('<tr></tr>').append([editButt,deleteButt,p1,p2,p3,p4,p5,p6,p7 ]);
							docFrag.append(row);
							})
							$('#dataTable').append(docFrag);
					})
		}
		//綁定Serach
		$('#serach').click(function(){
			listPenalty($("#serachForm").serialize());
		})

		$(document).ready(function() {
			listPenalty();

			//綁定delete事件
			$('#dataTable').on('click', 'input[value="刪除"]', function() {
				var penaltyId = $(this).attr("id").substring(10);
				$.ajax({
					type : 'post',
					dataType : "json",
					url : "/penalty/delete",
					data : {
						"id" : penaltyId
					}
				}).done(function(data) {
					alert(data.msg);
					listPenalty();
				})
			})
		})
	</script>

</body>
</html>