<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Javascript files-->
<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />

<!-- data table -->
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="/js/dataTable_full_numbers_no_ellipses.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">  
<script src="https://cdn.datatables.net/buttons/1.5.4/js/dataTables.buttons.min.js"></script>	
<script src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>	
		
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp"/>
<meta charset="UTF-8">
<title>mission list(login)</title>
<style>
	fieldset {
		width: 100%;
		margin: 20px;
		border: 3px solid rgba(0,0,0,0);
		margin: auto
	}
	table {
		padding: 20px;
	}
	.nav-link{
		font-weight: bold;
	}
	
    </style>
</head>
<body>
	<!-- Top bar-->
	<jsp:include page="../../commons/commons_layout/commons_top-bar.jsp" />
	<!-- Navbar -->
	<jsp:include page="../../commons/commons_layout/commons_nav.jsp" />
	  <div id="heading-breadcrumbs">
        <div class="container">
          <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
              <h1 class="h2">進行中的活動</h1>
            </div>
          </div>
        </div>
      </div>
	
	<section class="bar">
        <div class="container">
        	<div class="row">
        	<fieldset>
<%-- 			<jsp:include page="../user_layout/user_sidebar.jsp" /> --%>
				<ul id="pills-tab" role="tablist" class="nav nav-pills nav-justified">
	                <li class="nav-item"><a id="orderStatus1" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true" class="nav-link active">申請中</a></li>
	                <li class="nav-item"><a id="orderStatus2" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false" class="nav-link">機構接受服務</a></li>
	                <li class="nav-item"><a id="orderStatus6" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false" class="nav-link">活動時間結束，未發時數</a></li>
              	</ul>
              	<hr>
				<table id="table" class="table table-bordered table-hover">
					<thead class="thead-light">
						<tr>
							<th scope="col"></th>
							<th scope="col">活動名稱</th>
							<th scope="col">地點</th>
							<th scope="col">活動開始時間</th>
							<th scope="col">活動結束時間</th>
							<th scope="col">時數</th>
							<th scope="col">申請時間</th>
							<th scope="col">狀態</th>
							<th scope="col" width="50px">備註</th>
						</tr>
					</thead>
					<tbody id="tableBody" class="table table-striped">
						<!-- 會員資料 -->
					</tbody>
				</table>
				</fieldset>
	 		</div>
	 	</div>
	</section>

	<!-- FOOTER -->
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp" />
		<script>	
		var dataTable;
		var orderStatusDetail = "VolunteerApply";
		$(document).ready(function() {
			dataTable = $('#table').DataTable({
				pageResize: true, 
				fixedHeader: true,
				pagingType: 'full_numbers',
				searching: false,				
			 	processing: true,
				serverSide: true,  //分頁、排序都交由伺服器處理
				ajax:{
					url:"/user/volunteerApplication/queryApplication",
					type:"get",
					dataType:"json",
					data:function(d){ 				//傳送給伺服器的資料(datatable預設會傳送d的資料)
						var start = d.start;
						var length = d.length;
						var request = "orderStatusDetail=" + orderStatusDetail + "&start=" + start + "&length="+ length;
						return request;
					},
					dataSrc:"content",
					dataFilter:function(resp){		//對伺服器送來的資料進行修改
						 var json = jQuery.parseJSON( resp );
			             json.recordsTotal = json.totalElements;
			             json.recordsFiltered = json.totalElements;	     			
			             return JSON.stringify( json ); 
					},
				}, drawCallback:function(d){
						var api = this.api();
						var pageNum = parseInt(d.json.pageable.pageNumber) ;
						var totalPages = d.json.totalPages;
						$('#table_info').html('Currently showing page '+(pageNum+1)+' of '+totalPages+' pages.');
				}, columns: [ 		//設定datatable要顯示的資訊，需與表頭<th>數量一致(可隨意串接資料內容)
		     		{data:null},
		           	{data:"mission.title" },
		           	{ data: null, render: function ( data, type, row ) {
		                return data.mission.county + data.mission.district+ data.mission.address;
		            } },
		            { data: null, render: function ( data, type, row ) {
		            	return new Date(data.mission.startDate).Format('yyyy-MM-dd hh-mm');
		            } },
		            { data: null, render: function ( data, type, row ) {
		            	return new Date(data.mission.endDate).Format('yyyy-MM-dd hh-mm');
		            } },
					{data:"mission.timeValue"},
					{ data: null, render: function ( data, type, row ) {
		            	return new Date(data.volunteerApplyTime).Format('yyyy-MM-dd hh-mm');
		            } },
					{data:"orderStatus"},
		           	{data: function (data, type, row ) {
		           		var cancelButt="<input type='button' class=\"btn btn-outline-danger btn-sm\" onclick=\"deleteRow("+data.id+")\" id='deleteButt"+ data.id +"' value='取消' />"
		           		if(data.orderStatus == "VolunteerApply"){
		           			return cancelButt;
			           		} else if (data.orderStatus == "RequesterAcceptService"){
			           			if(Date.parse(new Date()).valueOf() > Date.parse(data.mission.deadline).valueOf()){
				           			return cancelButt;
			           			} else {
			           				return null;
			           			}
			           		} else {
			           			return null;
			           		}
		           		}
		           	},							
				], columnDefs:[{		//禁用第0123列的搜索和排序
					"searchable": false,
	                "orderable": false,
	                "targets": [0, 1, 2],
				}], order: [[1, 'asc']]   
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
		})
		//切換服務狀態
		$('#orderStatus1').click(function(){
			orderStatusDetail = "VolunteerApply";
			dataTable.ajax.reload();
		})
		$('#orderStatus2').click(function(){
			orderStatusDetail = "RequesterAcceptService";
			dataTable.ajax.reload();
		})
		$('#orderStatus6').click(function(){
			orderStatusDetail = "ServiceFinishNotPay";
			dataTable.ajax.reload();
		})
		//刪除事件方法
		function deleteRow(orderId){
			$.ajax({
				type: "get",
				dataType: "json",         
				url: "/user/volunteerApplication/delete",
				data: {"id":orderId}					
			})
			.done(function(response){			
				if (response.status =="SUCCESS"){
					alert("申請已取消");
				} else {
					$.each(response.messages, function(idx, message) {
						alert("the "+idx+"th ERROR, because "+message);
					});
				}			
				dataTable.draw('page');
				if ($("table tbody tr").length < 2){
					dataTable.page( 'previous' ).draw('page');;
				} 
			})	
		}
		//自訂日期格式
		Date.prototype.Format = function (fmt) {
		    var o = {
		        "M+": this.getMonth() + 1, //月份
		        "d+": this.getDate(), //日
		        "h+": this.getHours(), //小时
		        "m+": this.getMinutes(), //分
		        "s+": this.getSeconds(), //秒
		        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
		        "S": this.getMilliseconds() //毫秒
		    };
		    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
		    for (var k in o)
		        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
		    return fmt;
		};
	</script>
</body>
</html>