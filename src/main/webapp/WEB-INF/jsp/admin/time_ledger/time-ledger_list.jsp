<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  
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

<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />
<!-- data table -->
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">  
<script src="https://cdn.datatables.net/buttons/1.5.4/js/dataTables.buttons.min.js"></script>	
<script src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>	

<title>TimeLedger List</title>
<style>
fieldset {
	width: 1200px;
	border-radius: 20px;
	padding: 20px;
	margin: 20px;
	border: 3px double #bebebe;
	margin: auto
}

.center {
	text-align: center
}

.margintop{
	 margin-top:70px;
}
</style>
</head>
<body>
	<jsp:include page="../admin_layout/nav.jsp" />
	<div class="margintop"></div>
	<h1 class="center">TimeLedger List</h1>
	<hr>
	<button onclick="javascript:document.location.href='/admin/time-ledger/add'"
				class="btn btn-outline-secondary">Add</button>
<!-- 			<button id="findAll" onclick="findAll()" class="btn btn-outline-secondary">findAll</button> -->
	<hr>
	<div id="sideBar">
		<form>
			<fieldset>
			<legend>Search</legend>
			<div>
				<label>id :</label>
				<input type="text" value="${param.id}" placeholder="id" id="id" name="id"/>
				<label>memberId :</label>
				<input type="text" value="${param.memberId}" placeholder="memberId" id="memberId" name="memberId"/>
<!-- 				description : -->
<%-- 				<input type="text" value="${param.description}" placeholder="description" id="description" name="description"/> --%>
			</div>
			<div>	
				<label>depositValue :</label>
				<input type="text" value="${param.depositValue}" id="depositValue" name="depositValue"/>
				<label>withdrawalValue :</label> 
				<input type="text" value="${param.withdrawalValue}"  id="withdrawalValue" name="withdrawalValue"/>
<!-- 				<label>balanceValue :</label> -->
<%-- 				<input type="text" value="${param.balanceValue}" id="balanceValue" name="balanceValue"/> --%>
			</div>
			<div>
			    <label>Start Date :</label>
			    <input type="text" value="${param.transactionTimeBegin}" id="transactionTimeBegin" name="transactionTimeBegin" autocomplete="off"/>
			    <label>End Date :</label>
			    <input type="text" value="${param.transactionTimeEnd}" id="transactionTimeEnd" name="transactionTimeEnd" autocomplete="off"/>
			  	<input type="button" class="btn btn-outline-secondary" onclick="dataTable.ajax.reload()" value="search" id="searchButt" />
			  	<input type="reset" class="btn btn-outline-secondary" onclick="dataTable.ajax.reload()" value=reset id="resetButt" />
		  	</div>
		  	</fieldset>
		</form>
		</div>
		<hr>
		<fieldset>
			<table id="table" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>選項</th>
						<th scope="col">id</th>
						<th scope="col">memberId</th>
						<th scope="col">transactionTime</th>
<!-- 						<th scope="col">description</th> -->
						<th scope="col">depositValue</th>
						<th scope="col">withdrawalValue</th>
<!-- 						<th scope="col">balanceValue</th> -->
					</tr>
				</thead>
				<tbody id="timeLedgerTbody">
				</tbody>
			</table>
		</fieldset>
		<hr>
		<div>
			<a href='/'><i class="fas fa-home"></i>back to HOME</a>
		</div>
	
	
	<script>
		var dataTable;
		dataTable = $('#table').DataTable({
			pageResize: true,
			fixedHeader: true,
			pageingType: 'full_numbers',
			searching: false,
			serverSide: true, //分頁&排序---server端處理
			ajax:{
				url:'/admin/time-ledger/query',
				type:'get',
				dataType:'json',
				//傳送給伺服器的資料(datatable預設傳送的資料)
				data: function(d){
// 					console.log(d);
					return $("form").serialize() + "&start=" + d.start + "&length=" + d.length;
				},
				//dataTable需顯示表格的資料標籤(預設標籤為data:)
				dataSrc:"content",
				//對伺服器送來的資料進行修改
				dataFilter: function(resp){
//	 				console.log(resp);
//	 				alert(console.log(resp));
//	 				alert("resp="+resp);
					var respJson = $.parseJSON(resp);
					respJson.recordsTotal = respJson.totalElements;
					respJson.recordsFiltered = respJson.totalElements;
//	 				console.log(JSON.stringify(respJson));
					return JSON.stringify(respJson);
				}
			},
			drawCallback: function (d) {
//	 			console.log(d);
				var api = this.api();
				var pageNum = parseInt(d.json.pageable.pageNumber);
				var totalPages = d.json.totalPages;
				$('#information').html('Currently showing page '+(pageNum+1)+' of '+totalPages+' pages.');
			},
			//設定datatable要顯示的資訊，需與表頭<th>數量一致(可隨意串接資料內容)
			columns:[
				{data:function(data, type, row){
					var editButton = "<input type='button' class=\"btn btn-outline-secondary\" onclick=\"javascript:document.location.href='/admin/time-ledger/edit?id=" + data.id + "'\" value='Edit' style='margin-right:1em'/>";
					var deleteButton = "<input type='button' class=\"btn btn-outline-secondary\" onclick=\"deleteData(" + data.id + ")\" value='Delete' />";
					return editButton + deleteButton;
				}},	
				{data:'id'},
				{data:"memberId"},
				{data: null, render: function ( data, type, row ) {
	                return new Date(data.transactionTime).toLocaleDateString();
	            }},
// 				{data:"description"},
				{data:"depositValue"},
				{data:"withdrawalValue"},
// 				{data:"balanceValue"},
			],
			columnDefs: [{
	            "searchable": false,
	            "orderable": false,
	            "targets": [0],
	        }],
	        order:[[1, 'asc']]
		});
		var datePickerSetting = {
				format : "yyyy/mm/dd",
				autoclose : true,
				todayHighlight : true,
				language : 'zh-TW',
				clearBtn:true,
				startView:"2",
				endDate:"0d",
			};
		$('#transactionTimeBegin').datepicker(datePickerSetting);
		$('#transactionTimeEnd').datepicker(datePickerSetting);
		
		function deleteData(timeLedgerId){
			$.ajax({
				url : "/admin/time-ledger/delete?id=" + timeLedgerId,
				type : "delete",
				dataType : 'json',
				success : function(response){
					if(response.status == "SUCCESS"){
						alert("Success to delete.");
					}
					else{
						$.each(response.message, function(idx, message){
							alert(message);
						});
					}
					dataTable.draw('page');
					if ($("table tbody tr").length < 2){
						dataTable.page( 'previous' ).draw('page');;
					} 
// 					dataTable.ajax.reload();
				}
			})
		}
		
	</script>
</body>
</html>