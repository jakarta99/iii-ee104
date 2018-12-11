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
		<input type="button" class="btn btn-primary mb-2" id="serach" value="搜尋"/>
	</form>
	
	<div>show
		<select id="pageSize">
			<option>3</option>
			<option>5</option>
		</select>
	entires</div>
	<div>
		<button type="button" id="previous">上一頁</button>
		<span id="allPage"></span>
		<button type="button" id="next">下一頁</button>
	</div>
	
	<div id="pageInfo">Showing 0 to 0 of 0 entiries</div>

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
		//一頁幾筆
		var pageSize = $('#pageSize').val();
		//目前頁數
		var onPage;
		//總頁數
		var totalPage;
		//方法回傳的物件
		var pageIndex;
		//列清單方法
		function listPenalty(form, pageNumber, pageSize) {
			$("#dataTable").text("");
			$.getJSON("/penalty/query?pageNumber=" + pageNumber + "&pageSize=" + pageSize,
					form,
					function(penalties) {
							pageIndex = penalties.page;
							onPage = penalties.page.pageable.pageNumber;
							totalPage = penalties.page.totalPages;
							
							console.log(pageIndex);
							//table
							var docFrag = $(document.createDocumentFragment());
							$.each(penalties.page.content, function(idx, penalty) {
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
							//pageInfo
							var pageInfo = "第" + (onPage + 1) + "頁，共" + totalPage +"頁，收尋到" + pageIndex.totalElements + "筆資料";
							$('#pageInfo').html(pageInfo);
							//頁數按鈕
							var pageUrl = "";
							for(var i = 1 ; i <= totalPage ; i++){
								pageUrl += "<button type='button' name='pageLink'>" + i + "</button>";
							}
							$('#allPage').html(pageUrl);
					})
		}
		//綁定Serach
		$('#serach').click(function(){
			listPenalty($("#serachForm").serialize(), 0 ,pageSize);
		})
		//上一頁下一頁
		$('#previous').click(function(){
			if(pageIndex.first != true){
				listPenalty($("#serachForm").serialize(), onPage - 1, pageSize);				
			}
		})
		$('#next').click(function(){
			if(pageIndex.last != true){
				listPenalty($("#serachForm").serialize(), onPage + 1, pageSize);
			}
		})
		//切換每頁筆數
		$('#pageSize').change(function(){
			pageSize = $('#pageSize').val();
			listPenalty($("#serachForm").serialize(), onPage, pageSize);
		})
		$(document).ready(function() {
			listPenalty(null, 0, pageSize);
	
			//點選頁數超連結
			$('#allPage').on('click', 'button',function(){
				listPenalty($("#serachForm").serialize(), $(this).text() - 1, pageSize);
			})
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
				}).done(function(result) {
					alert(result.status);
					listPenalty($("#serachForm").serialize(), onPage, pageSize);
				})
			})
		})
	</script>

</body>
</html>