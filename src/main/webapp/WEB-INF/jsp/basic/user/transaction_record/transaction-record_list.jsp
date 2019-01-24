<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的交易紀錄 | TimeBank</title>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">  
<!-- css -->
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp" />
<!-- Javascript files -->
<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />
<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />

<style>
        fieldset {
            width: 100%;
            border: 3px solid rgba(0,0,0,0);
            padding: 20px;
            margin: 20px;
            margin: auto
        }
        .s2{
            text-align: center
        }
        .margintop{
			 margin-top:70px;
		}
		.table .thead-green th {
		    color: #fff;
		    background-color: #13b5b1;
		    border-color: #13b5b1;
		    border-left: 1px solid #fff;
		}
		.btn-outline-secondary {
		    color: #13b5b1;
		    background-color: #fff;
		    background-image: none;
		    border-color: #13b5b1;
		    font-size: 16px;
		}
		.btn-outline-secondary:hover {
		    color: #fff;
		    background-color: #13b5b1;
		    border-color: #13b5b1;
		}
		.btn {
		    border: 1px solid #13b5b1;
		    border-radius: 3px;
		}
		.dataTables_wrapper .dataTables_paginate .paginate_button.disabled, .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:hover, .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:active {
		    color: #13b5b1 !important;
		}
		.dataTables_wrapper .dataTables_paginate .paginate_button.current, .dataTables_wrapper .dataTables_paginate .paginate_button.current:hover {
		    color: #fff !important;
    		background-color: #13b5b1;
    		background: linear-gradient(to bottom, #13b5b1 0%, #13b5b1 100%);
		}
		.dataTables_wrapper .dataTables_paginate .paginate_button {
		    color: #13b5b1 !important;
		}
		.dataTables_wrapper .dataTables_length, .dataTables_wrapper .dataTables_filter, .dataTables_wrapper .dataTables_info, .dataTables_wrapper .dataTables_processing, .dataTables_wrapper .dataTables_paginate {
		    color: #13b5b1;
		}
		.dataTables_wrapper .dataTables_paginate .paginate_button:hover {
		    color: white !important;
		    border: 1px solid #111;
		    background-color: #13b5b1; 
		    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #13b5b1), color-stop(100%, #13b5b1)); 
		    background: -webkit-linear-gradient(top, #13b5b1 0%, #13b5b1 100%);
		    background: -moz-linear-gradient(top, #13b5b1 0%, #13b5b1 100%);
		    background: -ms-linear-gradient(top, #13b5b1 0%, #13b5b1 100%);
		    background: -o-linear-gradient(top, #13b5b1 0%, #13b5b1 100%);
		    background: linear-gradient(to bottom, #13b5b1 0%, #13b5b1 100%);
		}
		.form-1{
			padding-top:20px;
			width: 75%;
			text-align:center;
			margin:auto;
		}
</style>
</head>
<body>
	<!-- Top bar-->
	<jsp:include page="../../commons/commons_layout/commons_top-bar.jsp"/>
	<!-- Navbar -->
	<jsp:include page="../../commons/commons_layout/commons_nav.jsp"/>
	<!--heading crumbs-->
	<jsp:include page="../../commons/commons_layout/commons_heading_breadcrumbs_member_area.jsp" />
	<!-- Sidebar -->
    <jsp:include page="../user_layout/user_sidebar.jsp"/>
	<section class="bar"  style="background-color: #f7f7f7" >
	<div class="container">
    	<div class="row">
            <article>
<!-- 				<div class="container"> -->
<!-- 					<h2 class="text-center text-uppercase text-secondary mb-0">我的交易紀錄</h2> -->
<!-- 			        <hr class="star-dark mb-5"> -->
<!-- 				</div> -->
				<div id="sideBar">
					<form class="form-1" style="border-radius:5px;background-color: #fff;border-radius:3px;box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);">
						<fieldset style="width:1100px">
						<legend>搜尋</legend>
<!-- 						<div> -->
							<div class="d-flex justify-content-center">
<!-- 							    <label>起始時間</label> -->
							    <input type="text" value="${param.transactionTimeBegin}" placeholder="起始時間" id="transactionTimeBegin" name="transactionTimeBegin" autocomplete="off"/>
<!-- 							    <label>結束時間</label> -->
							    <input type="text" value="${param.transactionTimeEnd}" placeholder="結束時間" id="transactionTimeEnd" name="transactionTimeEnd" autocomplete="off"/>
<!-- 							    <label>摘要</label>  -->
								<input type="text" value="${param.description}" placeholder="摘要" id="description" name="description"/>
						  	</div>
							<div class="d-flex justify-content-center">	
<!-- 								<label>存入</label> -->
								<input type="text" value="${param.depositValue}" placeholder="存入" id="depositValue" name="depositValue"/>
<!-- 								<label>支出</label>  -->
								<input type="text" value="${param.withdrawalValue}" placeholder="支出" id="withdrawalValue" name="withdrawalValue"/>
<!-- 								<label>結餘</label>  -->
								<input type="text" value="${param.balanceValue}" placeholder="結餘" id="balanceValue" name="balanceValue"/>
							</div>
							<div class="d-flex justify-content-center">
								<input type="button" class="btn btn-outline-secondary" onclick="dataTable.ajax.reload()" value="搜尋" id="searchButt" />
							  	<input type="reset" class="btn btn-outline-secondary" onclick="dataTable.ajax.reload()" value="清除重填" id="resetButt" />
							</div>
<!-- 						</div> -->
					  	</fieldset>
					</form>
					</div>
					
					<fieldset>
						<table id="table" class="table table-hover">
							<thead class="thead-green">
								<tr>
									<th scope="col"></th>
									<th scope="col">時間</th>
									<th scope="col">存入</th>
									<th scope="col">支出</th>
									<th scope="col">結餘</th>
									<th scope="col">摘要</th>
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
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp"/>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
	<script>
	var dataTable;
	$(document).ready(function() {
		$("#webTitle").empty().append("我的交易紀錄");
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
			lengthMenu: [10],
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
				$('#table_info').html('目前顯示第  '+(pageNum+1)+' 頁，共  '+totalPages+'頁。');
			},
			//設定datatable要顯示的資訊，需與表頭<th>數量一致(可隨意串接資料內容)
			columns:[
				{data:null},
				{data: null,"orderable": false, render: function ( data, type, row ) {
	                return new Date(data.transactionTime).toLocaleDateString();
	            }},
				{data:"depositValue","orderable": false},
				{data:"withdrawalValue","orderable": false},
				{data:"balanceValue","orderable": false},
				{data:"description","orderable": false},
			],
			columnDefs: [{
	            "searchable": false,
	            "orderable": false,
	            "targets": 0,
	        }],
	        order:[]
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
		$("div[id='table_length'] label").css("display","none");
	})
		
	</script>
</body>
</html>