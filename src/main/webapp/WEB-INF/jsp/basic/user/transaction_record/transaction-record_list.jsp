<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Transaction Record</title>
<jsp:include page="../../../admin/admin_layout/admin_css_js_links.jsp" />
<!-- css -->
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp" />
<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />

<style>
	 article{
	 	margin-top:70px;
	 }
	 
	 article fieldset {
 		border-radius: 20px; 
 		padding: 20px 20px 0px 20px;  
/*  		border: 3px double #bebebe;  */
		background-color:#ffeecc;
		margin: auto; 
 		margin-top: 10px;  
 		margin-bottom: 20px;  
 		
	}

	 table tr td, button{
	 	text-align:center;
	 	line-height:center; 
	 }
	 
	 article .btn{
	 	margin-left:3px;
	 	margin-right:3px
	 }
	 
	 legend{
	 	color:#2c3e50;
	 	font-size: 30px;
	 }
</style>
</head>
<body>
	<!-- Top bar-->
	<jsp:include page="../../commons/commons_layout/commons_top-bar.jsp"/>
	<!-- Navbar -->
	<jsp:include page="../../commons/commons_layout/commons_nav.jsp"/>
	<div id="heading-breadcrumbs">
    	<div class="container">
        	<div class="row d-flex align-items-center flex-wrap">
            	<div class="col-md-7">
              		<h1 class="h2">我的交易紀錄</h1>
            	</div>
<!-- 	            <div class="col-md-5"> -->
<!-- 	              	<ul class="breadcrumb d-flex justify-content-end"> -->
<!-- 	                	<li class="breadcrumb-item"><a href="index.html">Home</a></li> -->
<!-- 	                	<li class="breadcrumb-item"><a href="team.html">Our Team</a></li> -->
<!-- 	                	<li class="breadcrumb-item active">Team Member</li> -->
<!-- 	              	</ul> -->
<!-- 	            </div> -->
        	</div>
        </div>
    </div>
	<!-- Sidebar -->
    <jsp:include page="../user_layout/user_sidebar.jsp"/>
	<section class="bar">
	<div class="container">
    	<div class="row">
            <article>
				<div class="container" style="margin-top: 140px">
					<h2 class="text-center text-uppercase text-secondary mb-0">我的交易紀錄</h2>
			        <hr class="star-dark mb-5">
				</div>
				<div id="sideBar">
					<form>
						<fieldset style="width:1100px">
						<legend>Search</legend>
						<div>
							<div>	
								<label>depositValue :</label>
								<input type="text" value="${param.depositValue}" id="depositValue" name="depositValue"/>
								<label>withdrawalValue :</label> 
								<input type="text" value="${param.withdrawalValue}"  id="withdrawalValue" name="withdrawalValue"/>
							</div>
							<div>
							    <label>Start Date :</label>
							    <input type="text" value="${param.transactionTimeBegin}" id="transactionTimeBegin" name="transactionTimeBegin" autocomplete="off"/>
							    <label>End Date :</label>
							    <input type="text" value="${param.transactionTimeEnd}" id="transactionTimeEnd" name="transactionTimeEnd" autocomplete="off"/>
						  	</div>
							<input type="button" class="btn btn-outline-secondary" onclick="dataTable.ajax.reload()" value="search" id="searchButt" />
						  	<input type="reset" class="btn btn-outline-secondary" onclick="dataTable.ajax.reload()" value=reset id="resetButt" />
						</div>
					  	</fieldset>
					</form>
					</div>
					
					<fieldset style="width:1300px">
					<div style="margin-bottom: 20px">
						<button onclick="javascript:document.location.href='/admin/time-ledger/add'" class="btn btn-warning btn-sm">新增</button>
					</div>
						<table id="table" class="table table-bordered">
							<thead>
								<tr>
									<th scope="col"></th>
									<th scope="col">transactionTime</th>
			<!-- 						<th scope="col">description</th> -->
									<th scope="col">depositValue</th>
									<th scope="col">withdrawalValue</th>
			<!-- 						<th scope="col">balanceValue</th> -->
								</tr>
							</thead>
							<tbody id="tableBody">
							</tbody>
						</table>
					</fieldset>
				</article>
			</div>
		</div>
	</section>
	<!-- FOOTER -->
<%-- 	<jsp:include page="../../commons/commons_layout/commons_footer.jsp"/> --%>
	<script>
	var dataTable;
	$(document).ready(function() {
		$("form").addClass("form-inline");
		$("form div[id!='collapse']").addClass("form-group mx-sm-3 mb-3");
		$("form input, select").addClass("form-control mx-3");
		$("#searchButt, #resetButt").addClass("btn btn-outline-secondary");
		
		dataTable = $('#table').DataTable({
			pageResize: true, 
			fixedHeader: true,
			pagingType: 'full_numbers',
			searching: false,				
		 	processing: true,
			serverSide: true,  //分頁、排序都交由伺服器處理
// 			lengthMenu: [ 3, 6, 9, 12, ],
			ajax:{
				url:'/user/transaction-record/query',
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
				$('#table_info').html('Currently showing page '+(pageNum+1)+' of '+totalPages+' pages.');
			},
			//設定datatable要顯示的資訊，需與表頭<th>數量一致(可隨意串接資料內容)
			columns:[
				{data:null},
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
	            "targets": [0, 1, 2],
	        }],
	        order:[[1, 'asc']]
		});
		
		dataTable.on('draw.dt',function() {
			dataTable.column(0, {
                search:'applied',
                order:'applied'
            }).nodes().each(function(cell, i) {
				 i = i+1;								//i從0開始，所以先加1
                var pageinfo = dataTable.page.info();	//服務氣模式下，使用DT提供的API直接獲取分頁資訊
                var pageno = pageinfo.page;				//当前第几页，从0开始
                var length = pageinfo.length;			//每页数据
                var columnIndex = (i+pageno*length);	//行号等于 页数*每页数据长度+行号
                cell.innerHTML = columnIndex;
            });
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
	})
		
	</script>
</body>
</html>