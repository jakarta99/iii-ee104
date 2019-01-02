<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../admin_layout/admin_css_js_links.jsp" />
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
	 
/* 	 @font-face{ */
/* 		font-family: custom-serif; */
/* 	    src: local("LiSong Pro"), local("微軟正黑體"), local("PMingLiU"); */
/* 	    unicode-range: U+4E00-9FFF; */
/* 	 } */
	 
/* 	 body{ */
/* 	 	font-family: custom-serif; */
/* 	 } */

</style>
<meta charset="UTF-8">
<title>Order List</title>
</head>
<body>
	<fmt:formatDate value="${order.orderAcceptTime }" pattern="yyyy/MM/dd HH:mm" var="orderAcceptTime" />
	<fmt:formatDate value="${order.orderConfirmationTime }" pattern="yyyy/MM/dd HH:mm" var="orderConfirmationTime" />
	<!-- 加入nav.html(放在static/html) -->
	<jsp:include page="../admin_layout/nav.jsp" />
	<article>
		<div class="container" style="margin-top: 140px">
			<h2 class="text-center text-uppercase text-secondary mb-0">Order List</h2>
<!-- 	        <hr class="star-dark mb-5"> -->
		</div>

		<!-- 條件搜尋表單 -->
		<div id="sideBar">
			<form>
				<fieldset style="width:1100px">
				<legend>Search</legend>
				<div>
					<div>
						<label>id: </label>
						<input type="text" value="${param.id}" id="id" name="id" placeholder="id" />
					</div>
					<div>
						<label>volunteer:</label>
						<input type="text" value="${param.volunteerId}" id="volunteerId" name="volunteerId"/>
					</div>
					<input type="button" value="搜尋"  id="searchButt" style="margin:10px"/> 
					<input type="reset" value="重設" id="resetButt" style="margin:10px"/>
					<a class="btn btn-secondary" data-toggle="collapse" href="#collapse" 
						role="button" aria-expanded="false" aria-controls="collapse">進階查詢:</a>
				</div>
				<div class="collapse" id="collapse">
					<div>
						<label>orderAcceptTime</label>
						<input type="radio" value="Y" name="orderAcceptTime" />Y
						<input type="radio" value="N" name="orderAcceptTime" />N
					</div>
					<div>
						<label>orderConfirmationTime:</label>
						<input type="radio" value="Y" name="orderConfirmationTime" />Y
						<input type="radio" value="N" name="orderConfirmationTime" />N
					</div>
					<div>	
						<label>orderStatus:</label>
						<input type="text" value="${param.orderStatusDetail}" id="orderStatusDetail" name="orderStatusDetail"/>
					</div>
				</div>
				</fieldset>
				
			</form>
		</div>
		<fieldset style="width:1300px">
		<div style="margin-bottom: 20px">
			<button onclick="javascript:document.location.href='/admin/order/add'" class="btn btn-warning btn-sm">新增</button>
		</div>
		<table id="table" class="table table-striped table-bordered">
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col" width="100px"></th>
					<th scope="col">ID</th>			
					<th scope="col">volunteer</th>
					<th scope="col">orderAcceptionTime</th>
					<th scope="col">orderConfirmationTime</th>
					<th scope="col">orderStatus</th>
					<th scope="col">missionTitle</th>
					<th scope="col">missionTimeValue</th>
				</tr>
			</thead>
			<tbody id="TableBody">
				<!-- 會員資料 -->
			</tbody>
		</table>
		</fieldset>
	</article>
	<script>

		var dataTable;
		
		function deleteRow(orderId){
			$.ajax({
				type: "get",
				dataType: "json",         
				url: "/admin/order/delete",
				data: {"id":orderId}					
			})
			.done(function(response){			
				if (response.status =="SUCCESS"){
					alert("刪除成功");
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
// 				lengthMenu: [ 3, 6, 9, 12, ],
				ajax:{
					url:"/admin/order/query",
					type:"get",
					dataType:"json",
					data:function(d){ 				//傳送給伺服器的資料(datatable預設會傳送d的資料)
						var start = d.start;
						var length = d.length;
						var request = $("form").serialize()+"&start="+start+"&length="+length;
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
		           	{data: function (data, type, row ) {
						var editButt = "<input type='button' class=\"btn btn-warning btn-sm\"  onclick=\"javascript:document.location.href='/admin/order/edit?id="
											+ data.id + "'\" value='修改'  />";
						var deleteButt="<input type='button' class=\"btn btn-warning btn-sm\" onclick=\"deleteRow("+data.id+")\" id='deleteButt"+ data.id +"' value='刪除' />"  
		               	return editButt + deleteButt;	}
		           	},
		           	{data:"id" },
					{data:"volunteer.id"},
					{data: null, render: function ( data, type, row ) {
						return new Date(data.orderAcceptTime).toLocaleDateString();}},
					{data: null, render: function ( data, type, row ) {
						return new Date(data.volunteerApplyTime).toLocaleDateString();}},
					{data:"orderStatus.orderStatus"},
					{data:"mission.title"},
					{data:"mission.timeValue"},
							
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
		var datePickerSetting = {
			format : "yyyy/MM/dd",
			autoclose : true,
			todayHighlight : true,
			language : 'zh-TW',
			clearBtn:true,
			startView:"2",
			endDate:"0d",
		};
	$('#orderConfirmationTime').datepicker(datePickerSetting);
	$('#orderAcceptTime').datepicker(datePickerSetting);
		

	</script>

</body>
</html>