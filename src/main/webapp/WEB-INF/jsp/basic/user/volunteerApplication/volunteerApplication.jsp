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
            width: 90%;
            border-radius: 20px;
            padding: 20px;
            margin: 20px;
            border: 3px double #bebebe;
            margin: auto
        }
        .s2{
            text-align: center
        }
        .margintop{
			 margin-top:70px;
		}
		.county,.district {
	  padding: 0.375rem 0.75rem;
	  font-size: 1rem;
	  line-height: 1.5;
	  color: #495057;
	  background-color: #fff;
	  background-image: none;
	  background-clip: padding-box;
	  border: 1px solid #ced4da;
	  border-radius: 0.25rem;
	  transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
	}
 
    </style>
</head>
<body>
	<!-- Top bar-->
	<jsp:include page="../../commons/commons_layout/commons_top-bar.jsp" />
	<!-- Navbar -->
	<jsp:include page="../../commons/commons_layout/commons_nav.jsp" />
	
	<div>
	<jsp:include page="../user_layout/user_sidebar.jsp" />
		<fieldset style="width: 300">
			<table id="table" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col">活動名稱(mission.title)</th>
						<th scope="col">地點(mission.county district address)</th>
						<th scope="col">活動開始時間(mission.startDate)</th>
						<th scope="col">活動結束時間(mission.endDate)</th>
						<th scope="col">時數(mission.timeValue)</th>
						<th scope="col">申請時間(volunteerApplyTime)</th>
						<th scope="col">狀態(status)</th>
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
		<script>
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
		
		var dataTable;
		
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
						var request = "start="+start+"&length="+length;
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
		           		console.log(data);
		                return data.mission.county + data.mission.district+ data.mission.address;
		            } },
					{data:"mission.startDate"},
					{data:"mission.endDate"},
					{data:"mission.timeValue"},
					{data:"volunteerApplyTime"},
					{data:"orderStatus.orderStatus"},
		           	{data: function (data, type, row ) {
		           		var cancelButt="<input type='button' class=\"btn btn-primary btn-sm\" onclick=\"deleteRow("+data.id+")\" id='deleteButt"+ data.id +"' value='刪除' />"
		               	return cancelButt	}
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
			//搜尋事件
			$("#searchButt").click(	function(){
				dataTable.ajax.reload();

			})
		})
	</script>
	
</body>
</html>