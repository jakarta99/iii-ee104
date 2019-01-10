<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../../../admin/admin_layout/admin_css_js_links.jsp" />
<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />


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
<title>檢舉案件審查</title>
</head>
<body>
	<!-- 加入nav.html -->
	<jsp:include page="../../../../admin/admin_layout/nav.jsp" />
	<article>
		<div class="container" style="margin-top: 140px">
			<h2 class="text-center text-uppercase text-secondary mb-0" style="font-family: '微軟正黑體'">檢舉案件列表</h2>
<!-- 		    <hr class="star-dark mb-5"> -->
		</div>
		<!-- 條件搜尋表單 -->
		<div id="sideBar">
			<form>
				<fieldset style="width:1100px">
				<legend>Search</legend>
				<div>
<!-- 					<label>檢舉人: </label> -->
<%-- 					<input type="text" value="${param.memberId}" id="accuser" name="accuser" placeholder="accuser" /> --%>
					
<!-- 					審核狀態status:-->
					<select id="status" name="status" style="display:none">  
						<option value="">請選擇</option>
						<option value=1>審核中</option>
						<option value=2>審核完成，有懲罰</option>
						<option value=3>審核完成，未懲罰</option>
						<option value=4>申訴審核中</option>
					</select>
					<div>
						<label>檢舉事由</label>
						<input type="text" value="${param.description}" id="description" name="description" />
					</div>
					<div>
						<label>懲罰額度(小時)</label>
						<input type="text" value="${param.penaltyTimeValue}" id="penaltyTimeValue" name="penaltyTimeValue"/>
					</div>
					<div>
						<label>檢舉日期</label>
						<input type="text" value="${param.dateBefore}" id="dateBefore" name="dateBefore" autocomplete="off" /> 
						<input type="text" value="${param.dateAfter}" id="dateAfter" name="dateAfter" autocomplete="off" />
					</div>
					<input type="button" value="搜尋"  id="searchButt" style="margin:10px"/> 
					<input type="reset" value="重設" id="resetButt" style="margin:10px"/>
					
					
<!-- 					<a class="btn btn-outline-secondary" data-toggle="collapse" href="#collapse"  -->
<!-- 						role="button" aria-expanded="false" aria-controls="collapse">進階查詢:</a> -->
				</div>
				<div class="collapse" id="collapse">
<!-- 					<div> -->
<!-- 						<label>orderListId</label> -->
<%-- 						<input type="text" value="${param.orderListId}" id="order" name="order" /> --%>
<!-- 					</div> -->
					
				</div>
				</fieldset>
			</form>
		</div>
		
		<fieldset style="width:1300px">
			<div class="btn-group" style="margin-bottom: 20px">
			  <button type="button" class="btn btn-info" id="vertifyingCase">【檢舉】審核中</button>
			  <button type="button" class="btn btn-outline-info" id="reVertifyingCase">【申訴】審核中</button>
			  <button type="button" class="btn btn-outline-info" id="allCases">所有案件</button>
			  <button type="button" class="btn btn-outline-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="history">
			    	審核歷史紀錄
			  </button>
			  <div class="dropdown-menu">
			    	<a class="dropdown-item" href="#" id="vertified2">有罪</a>
			    	<a class="dropdown-item" href="#" id="vertified3">無罪</a>
			  </div>
			  <div>
			  	<a class="btn btn-secondary" href="#" 
						id="excelButt" >產製報表(EXCEL)</a>
			  </div>
			  <div>
			  	<a class="btn btn-secondary" href="#" 
						id="pdfButt" >產製報表(PDF)</a>
			  </div>
			  
			</div>
			

			
			<table id="table" class="table table-hover">
				<thead>
					<tr style="background-color: white">
						<th scope="col"></th>
						<th scope="col" width="50px"></th>
						<th scope="col">檢舉案件編號</th>
<!-- 						<th scope="col">媒合案件編號</th> -->
						<th scope="col">檢舉案件活動名稱</th>
						
						<th scope="col">提出檢舉時間</th>
<!-- 						<th scope="col">檢舉人ID</th> -->
						<th scope="col">檢舉人帳號</th>
<!-- 						<th scope="col">被檢舉者ID</th> -->
						<th scope="col">被檢舉者帳號</th>
						
						<th scope="col">檢舉事由</th>
						<th scope="col">懲罰額度(小時)</th>
						<th scope="col">處理進度</th>
						<th scope="col">是否申訴</th>
						
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
					url:"/admin/penaltyVertify/getVertifyList",
					type:"get",
					dataType:"json",
					data:function(d){ 				//DataTable:傳送給伺服器的資料(datatable預設會傳送d的資料)
						var start = d.start;
						var length = d.length;
						var request = $('form').serialize() + "&start=" + start + "&length=" + length;
						
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
		           		//已完成審核之案件，不顯示審核按鈕
// 		           		if(data.status != 1){
// 		           			vertifyButt = "<div name='vertifyBtn'><input type='button' class=\"btn btn-info btn-sm\"  onclick=\"javascript:document.location.href='/admin/penaltyVertify/vertify?id="
// 								+ data.id + "'\" value='檢視紀錄'  /></div>";
// 						}else{
// 							vertifyButt = "<div name='vertifyBtn'><input type='button' class=\"btn btn-info btn-sm\"  onclick=\"javascript:document.location.href='/admin/penaltyVertify/vertify?id="
// 								+ data.id + "'\" value='審核'  /></div>";
// 						}
		           		if(data.status == 1){
		           			vertifyButt = "<div name='vertifyBtn'><input type='button' class=\"btn btn-primary btn-sm\"  onclick=\"javascript:document.location.href='/admin/penaltyVertify/vertify?id="
								+ data.id + "'\" value='[檢舉]審核'  /></div>";
						}else if(data.status == 4){
							vertifyButt = "<div name='vertifyBtn'><input type='button' class=\"btn btn-primary btn-sm\"  onclick=\"javascript:document.location.href='/admin/penaltyVertify/vertify?id="
								+ data.id + "'\" value='[申訴]審核'  /></div>";
						}else{
							vertifyButt = "<div name='vertifyBtn'><input type='button' class=\"btn btn-info btn-sm\"  onclick=\"javascript:document.location.href='/admin/penaltyVertify/vertify?id="
								+ data.id + "'\" value='檢視紀錄'  /></div>";
						}
		           		
		           		
		           		
		           		
		               	return vertifyButt;	}
		           	},
		           	{data:"id" },
// 					{data:"order.id"},
					{data:"order.mission.title"},
					{data:null, render:function(data, type, row){
						return new Date(data.updateDate).toLocaleDateString();
						}
					},
// 					{data:"accuser.id"},
					{data:"accuser.account"},
// 					{data:"defendant.id"},
					{data:"defendant.account"},
					{data:"description"},
					{data:"penaltyTimeValue"},
					{data:function (data){
						var status = data.status;
						if(status == 1){
							return "審核中";
						}else if(status == 2){
							return "已懲罰";
						}else if(status == 3){
							return "不懲罰";
						}else if(status == 4){
							return "申訴審核中";
						}
					}
					
					},
					{data:function (data){
						var applyReVertify = data.applyReVertify;
						if(applyReVertify == null){
							return "N";
						}else{
							return data.applyReVertify;
						}
					}},
					
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
			
			//搜尋
			$("#searchButt").click(	function(){
				dataTable.ajax.reload();
			})
			
			//按下檢舉審核中的按鍵
			$("#vertifyingCase").click(	function(){
				$('#status').val("1");
				dataTable.ajax.reload();
				$("#history").attr('class', 'btn btn-outline-info dropdown-toggle');
				$("#allCases").attr('class', 'btn btn-outline-info');
				$("#reVertifyingCase").attr('class', 'btn btn-outline-info');
				$(this).attr('class', 'btn btn-info');
			})
			//按下申訴審核中按鍵
			$("#reVertifyingCase").click(function(){
				$('#status').val("4");
				dataTable.ajax.reload();
				$("#history").attr('class', 'btn btn-outline-info dropdown-toggle');
				$("#allCases").attr('class', 'btn btn-outline-info');
				$("#vertifyingCase").attr('class', 'btn btn-outline-info');
				$(this).attr('class', 'btn btn-info');
			})
			
			//按下所有案件按鈕
			$("#allCases").click(function(){
				$('#status').val("");
				dataTable.ajax.reload();
				$("#vertifyingCase").attr('class', 'btn btn-outline-info');
				$("#reVertifyingCase").attr('class', 'btn btn-outline-info');
				$("#history").attr('class', 'btn btn-outline-info dropdown-toggle');
				$(this).attr('class', 'btn btn-info');
			})
			
			//按審核歷史紀錄按紐
			$("#history").click(function(){
				$("#vertifyingCase").attr('class', 'btn btn-outline-info');
				$("#allCases").attr('class', 'btn btn-outline-info');
				$("#reVertifyingCase").attr('class', 'btn btn-outline-info');
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
			
			//產製EXCEL報表功能之按鈕
			$("#excelButt").click(function(){
				$(this).attr("href", "/admin/penaltyVertify/penaltyExcel?" + $('form').serialize())
			})
			
			//產製PDF報表功能之按鈕
			$("#pdfButt").click(function(){
				$(this).attr("href", "/admin/penaltyVertify/penaltyPDF?" + $('form').serialize())
			})
			
			
		})
						

	</script>

</body>
</html>