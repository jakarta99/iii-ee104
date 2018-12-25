<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
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
<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />
<!-- data table -->
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="/js/dataTable_full_numbers_no_ellipses.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">  
<script src="https://cdn.datatables.net/buttons/1.5.4/js/dataTables.buttons.min.js"></script>	
<script src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>	


<style>
	 article{
	 	margin-top:70px;
	 }
	 
	 article fieldset {
/*  		width: 500px;  */
 		border-radius: 20px; 
 		padding: 20px 20px 0px 20px;  
 		border: 3px double #bebebe; 
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
<title>檢舉案件審查</title>
</head>
<body>
	<!-- 加入nav.html(放在static/html) -->
<%-- 	<jsp:include page="../admin_layout/nav.jsp" /> --%>
	<article>
		<input type="button" class="btn btn-primary btn-sm" onclick="javascript:document.location.href='/'" value="回首頁"  />
		<h1 style="padding-top: 2cm">檢舉案件審查  Vertify Report List</h1>
		<h4>預設載入尚未完成審查之案件</h4>
		<!-- 條件搜尋表單 -->
		<div id="sideBar">
			<form>
				<fieldset>
				<legend>Serach</legend>
				<div>
					<label>檢舉人: </label>
					<input type="text" value="${param.memberId}" id="accuser" name="accuser" placeholder="accuser" />
					
					<label>status: </label>
					<select id="status" name="status">
						<option value="">請選擇</option>
						<option value=1>審核中</option>
						<option value=2>審核完成，有懲罰</option>
						<option value=3>審核完成，未懲罰</option>
					</select>
					<input type="button" value="搜尋"  id="searchButt" style="margin:10px"/> 
					<input type="reset" value="重設" id="resetButt" style="margin:10px"/>
					<a class="btn btn-outline-secondary" data-toggle="collapse" href="#collapse" 
						role="button" aria-expanded="false" aria-controls="collapse">進階查詢:</a>
				</div>
				<div class="collapse" id="collapse">
<!-- 					<div> -->
<!-- 						<label>orderListId</label> -->
<%-- 						<input type="text" value="${param.orderListId}" id="order" name="order" /> --%>
<!-- 					</div> -->
					<div>
						<label>description</label>
						<input type="text" value="${param.description}" id="description" name="description" />
					</div>
					<div>
						<label>penaltyTimeValue</label>
						<input type="text" value="${param.penaltyTimeValue}" id="penaltyTimeValue" name="penaltyTimeValue"/>
					</div>
					<div>
						<label>起始日期</label>
						<input type="text" value="${param.dateBefore}" id="dateBefore" name="dateBefore" autocomplete="off" /> 
						<input type="text" value="${param.dateAfter}" id="dateAfter" name="dateAfter" autocomplete="off" />
					</div>
				</div>
				</fieldset>
			</form>
		</div>
		<fieldset style="width:300">
		
		<table border="1">
			<tr>
				<td>審核中案件查詢</td>
				<td><button id="vertifyingCase">查詢</button></td>
			</tr>
			<tr>
				<td>歷史紀錄查詢</td>
				<td>
					<select id="penaltyChosen" name="penaltyChosen" style="width:150px">
						<option value=2>有懲罰</option>
						<option value=3>未懲罰</option>
					</select>
					<button id="vertified">查詢</button>
				</td>
			</tr>
		</table>

		
		<table id="table" class="table table-striped table-bordered">
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col" width="50px"></th>
					<th scope="col">檢舉案件編號ID</th>
					<th scope="col">媒合案件編號(order.id)</th>
					<th scope="col">檢舉案件活動名稱(order.mission...)</th>
					
					<th scope="col">提出檢舉時間</th>
					<th scope="col">檢舉人ID(accuser)</th>
					<th scope="col">被檢舉者ID(defendant.id)</th>
					<th scope="col">被檢舉者姓名(defendant.name)</th>
<!-- 					<th scope="col">被檢舉者帳戶餘額(timeledger)(debug用)</th> -->
					
					<th scope="col">檢舉事由描述</th>
					<th scope="col">逞罰額度(時間)</th>
					<th scope="col">處理進度</th>
					
					
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


		$(document).ready(function() {
			//預設僅先載入審核中檢舉案件
			$('#status').val("1");
			
			$("form").addClass("form-inline");
			$("form div[id!='collapse']").addClass("form-group mx-sm-3 mb-3");
			$("form input, select").addClass("form-control mx-3");
			$("#searchButt, #resetButt").addClass("btn btn-primary");

			dataTable = $('#table').DataTable({
				pageResize: true, 
				fixedHeader: true,
				pagingType: 'full_numbers',
				searching: false,				
			 	processing: true,
				serverSide: true,  //分頁、排序都交由伺服器處理
				lengthMenu: [ 3, 6, 9, 12, ],
				ajax:{
					url:"/penalty/getVertifyList",
					type:"get",
					dataType:"json",
					data:function(d){ 				//傳送給伺服器的資料(datatable預設會傳送d的資料)
						var start = d.start;
						var length = d.length;
						var request = $('form').serialize() + "&start=" + start + "&length=" + length;
						
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
						var vertifyButt = "<input type='button' class=\"btn btn-primary btn-sm\"  onclick=\"javascript:document.location.href='/penalty/vertify?id="
											+ data.id + "'\" value='審核'  />";
		               	return vertifyButt;	}
		           	},
		           	{data:"id" },
					{data:"order.id"},
					{data:"order.mission.title"},
					{data:null, render:function(data, type, row){
						return new Date(data.updateDate).toLocaleDateString();
						}
					},
					{data:"accuser"},
					{data:"defendant.id"},
					{data:"defendant.name"},
					//{data:" "},
					{data:"description"},
					{data:"penaltyTimeValue"},
					{data:"status"},
					
					
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
			
			//搜尋事件
			$("#searchButt").click(	function(){
				dataTable.ajax.reload();
			})
			
			//按下審核中的按鍵
			$("#vertifyingCase").click(	function(){
				$('#status').val("1");
				dataTable.ajax.reload();
			})
			
			//按審核歷史紀錄按紐
			$("#vertified").click(function(){
				$('#status').val($('#penaltyChosen').val());
				dataTable.ajax.reload();
			})
			

		})
						

	</script>

</body>
</html>