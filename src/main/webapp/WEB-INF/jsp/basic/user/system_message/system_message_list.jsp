<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%-- <jsp:include page="../../../../admin/admin_layout/admin_css_js_links.jsp" /> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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

<style>
	 article{
	 	margin-top:70px;
	 	font-family: 微軟正黑體;
	 }
	 
	 article fieldset {
/*  		width: 500px;  */
 		border-radius: 20px; 
 		padding: 20px 20px 0px 20px;  
/*  		border: 3px double #bebebe;  */
		background-color:#d1e9e9;
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

</style>
<meta charset="UTF-8">
<title>站內信清單</title>
</head>
<body>
	<!-- 加入nav.html -->
<%-- 	<jsp:include page="../../../../admin/admin_layout/nav.jsp" /> --%>
	<article>
		<div class="container" style="margin-top: 140px">
			<h2 class="text-center text-uppercase text-secondary mb-0" style="font-family: '微軟正黑體'">站內信列表</h2>
		</div>
		
		<fieldset style="width:1300px">
			<div class="btn-group" style="margin-bottom: 20px">
			  <button type="button" class="btn btn-info" id="allMessages">全部訊息</button>
			  <button type="button" class="btn btn-info" id="notRead">未讀</button>
			  <button type="button" class="btn btn-outline-info dropdown-toggle" id="alreadyRead">已讀</button>
			</div>
	
			
			<table id="table" class="table table-hover">
				<thead>
					<tr style="background-color: white">
						<th scope="col"></th>
						<th scope="col" width="50px"></th>
						<th scope="col">訊息時間</th>
						<th scope="col">訊息類型</th>
						<th scope="col">訊息內容</th>
						<th scope="col">是否已讀</th>
					</tr>
				</thead>
				<tbody id="tableBody">
					<!-- 會員資料 -->
				</tbody>
			</table>
		</fieldset>
	</article>
	
	<script>

		var dataTable;
		var readStatus = "";

		$(document).ready(function() {

			$("form").addClass("form-inline");
			$("form div[id!='collapse']").addClass("form-group mx-sm-3 mb-3");
			$("form input, select").addClass("form-control mx-3");
			$("#searchButt, #resetButt").addClass("btn btn-outline-info");

			dataTable = $('#table').DataTable({
				pageResize: true, 
				fixedHeader: true,
				pagingType: 'full_numbers',
				searching: false,				
			 	processing: true,
				serverSide: true,  //DataTable:分頁、排序都交由伺服器處理
				lengthMenu: [ 3, 6, 9, 12, ],
				ajax:{
					url:"/system-message/getSystemMessages",
					type:"get",
					dataType:"json",
					data:function(d){ 				//DataTable:傳送給伺服器的資料(datatable預設會傳送d的資料)
						var start = d.start;
						var length = d.length;
						var request = "readStatus=" + readStatus + "&start=" + start + "&length=" + length;
						
						return request;
					},
					dataSrc:"content",
					dataFilter:function(resp){		//DataTable:對伺服器送來的資料進行修改
						
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
				}, columns: [ 		//DataTable:設定datatable要顯示的資訊，需與表頭<th>數量一致(可隨意串接資料內容)
		     		{data:null},
		           	{data: function (data) {
		           		var vertifyButt = "";
		           		
// 		           		if(data.status != 1){
// 		           			vertifyButt = "<div name='vertifyBtn'><input type='button' class=\"btn btn-info btn-sm\"  onclick=\"javascript:document.location.href='/penalty/vertify?id="
// 								+ data.id + "'\" value='檢視紀錄'  /></div>";
// 						}else{
// 							vertifyButt = "<div name='vertifyBtn'><input type='button' class=\"btn btn-info btn-sm\"  onclick=\"javascript:document.location.href='/penalty/vertify?id="
// 								+ data.id + "'\" value='審核'  /></div>";
// 						}
		               	return vertifyButt;	}
		           	},
		           	{data:null, render:function(data, type, row){
						return new Date(data.releaseTime).toLocaleDateString();
						}
					},
		           	{data:"messageType" },
					{data:"message"},
					{data:"readStatus"},
					
					
				], columnDefs:[{		//DataTable:禁用第0123列的搜索和排序
					"searchable": false,
	                "orderable": true,
	                "targets": [0, 1],
				}], order: [[1, 'asc']]   
			 });
			
			dataTable.on('draw.dt',function() {
				dataTable.column(0, {
	                search:'applied',
	                order:'applied'
	            }).nodes().each(function(cell, i) {
					 i = i+1;								//DataTable:i從0開始，所以先加1
	                var pageinfo = dataTable.page.info();	//DataTable:服務氣模式下，使用DT提供的API直接獲取分頁資訊
	                var pageno = pageinfo.page;				//DataTable:当前第几页，从0开始
	                var length = pageinfo.length;			//DataTable:每页数据
	                var columnIndex = (i+pageno*length);	//DataTable:行号等于 页数*每页数据长度+行号
	                cell.innerHTML = columnIndex;
	            });
	        });
			
			
			
			//日期選擇器
			var datePickerSetting = {
				format : "yyyy/mm/dd",
				autoclose : true,
				todayHighlight : true,
				language : 'zh-TW',
				clearBtn : true,
				startView : "2",
				endDate : "0d",
			};
			$("#dateBefore").datepicker(datePickerSetting);
			$("#dateAfter").datepicker(datePickerSetting);
			
			
			//按下已讀未讀信件
// 			<button type="button" class="btn btn-info" id="allMessages">全部訊息</button>
// 			  <button type="button" class="btn btn-info" id="notRead">未讀</button>
// 			  <button type="button" class="btn btn-outline-info dropdown-toggle" id="alreadyRead">已讀</button>
			$("#allMessages").click(function(){
				readStatus="";
				alert("allMessages");
				dataTable.ajax.reload();
			})
			
			$("#notRead").click(function(){
				readStatus="N";
				alert("notRead");
				dataTable.ajax.reload();
			})
			
			$("#alreadyRead").click(function(){
				readStatus="Y";
				alert("alreadyRead");
				dataTable.ajax.reload();
			})
			
			
			
			
			
			//搜尋
			$("#searchButt").click(	function(){
				dataTable.ajax.reload();
			})
			
			//按下審核中的按鍵
			$("#vertifyingCase").click(	function(){
				$('#status').val("1");
				dataTable.ajax.reload();
				$("#history").attr('class', 'btn btn-outline-info dropdown-toggle');
				$(this).attr('class', 'btn btn-info');
			})
			
			//按審核歷史紀錄按紐
			$("#history").click(function(){
				$("#vertifyingCase").attr('class', 'btn btn-outline-info');
				$(this).attr('class', 'btn btn-info dropdown-toggle');
			})
			
			//選擇有罪無罪
			$("#vertified2").click(function(){
				$('#status').val("2");
				dataTable.ajax.reload();
			})
			$("#vertified3").click(function(){
				$('#status').val("3");
				dataTable.ajax.reload();
			})
			
			
			

		})
						

	</script>

</body>
</html>