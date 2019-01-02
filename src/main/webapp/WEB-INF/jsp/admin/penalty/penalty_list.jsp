<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>Penalty List</title>
</head>
<body>
	<!-- 加入nav.html(放在static/html) -->
	<jsp:include page="../admin_layout/nav.jsp" />
	<article>
		<div class="container" style="margin-top: 140px">
			<h2 class="text-center text-uppercase text-secondary mb-0">Penalty List</h2>
<!-- 	        <hr class="star-dark mb-5"> -->
		</div>
		
		<!-- 條件搜尋表單 -->
		<div id="sideBar">
			<form>
				<fieldset style="width:1100px">
				<legend>Search</legend>
				<div>
					<label>accuserId: </label>
					<input type="text" value="${param.memberId}" id="accuser" name="accuser" placeholder="accuser" />
					<label>status: </label>
					<select id="status" name="status">
						<option value="">請選擇</option>
						<option value=1>審核中</option>
						<option value=2>有罪</option>
						<option value=3>無罪</option>
					</select>
					<input type="button" value="搜尋"  id="searchButt" style="margin:10px"/> 
					<input type="reset" value="重設" id="resetButt" style="margin:10px"/>
					
					<a class="btn btn-primary" href="#" 
						role="button" id="excelButt" >產製EXCEL</a>
					<a class="btn btn-secondary" data-toggle="collapse" href="#collapse" 
						role="button" aria-expanded="false" aria-controls="collapse">進階查詢:</a>
				</div>
				<div class="collapse" id="collapse">
					<div>
						<label>orderListId</label>
						<input type="text" value="${param.orderListId}" id="order" name="order" />
					</div>
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
		<fieldset style="width:1300px">
		<div style="margin-bottom: 20px">
			<button onclick="javascript:document.location.href='/admin/penalty/add'" class="btn btn-warning btn-sm">新增</button>
		</div>
		<table id="table" class="table table-bordered">
			<thead>
				<tr style="background-color:#ECFBFD">
					<th scope="col"></th>
					<th scope="col">ID</th>
					<th scope="col" width="100px"></th>
					<th scope="col">檢舉者(原告)ID</th>
					<th scope="col">被檢舉者(被告)ID</th>
					<th scope="col">逞罰時間</th>
					<th scope="col">處理進度</th>
					<th scope="col">描述</th>
					<th scope="col">被檢舉時間</th>
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
		
		function deleteRow(penaltyId){
			$.ajax({
				type:"get",
				dataType:"json",
				url:"/admin/penalty/delete",
				data:{"id":penaltyId}
			}).done(function(respones){
				if (respones.status =="SUCCESS"){
					alert("刪除成功");
				} else {
					$.each(respones.messages, function(idx, message) {
						alert("the "+idx+"th ERROR, because "+message);
					});
				}
				dataTable.draw('page');
				if($("table tbody tr").length < 2){
					dataTable.page("previous").draw('page');
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
					url:"/admin/penalty/query",
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
		           	{data: "id" },
		           	{data: function (data, type, row ) {
						var editButt = "<input type='button' class=\"btn btn-warning btn-sm\"  onclick=\"javascript:document.location.href='/admin/penalty/edit?id="
											+ data.id + "'\" value='修改'  />";
						var deleteButt="<input type='button' class=\"btn btn-warning btn-sm\" onclick=\"deleteRow("+data.id+")\" id='deleteButt"+ data.id +"' value='刪除' />"
		               	return editButt + deleteButt;	}
		           	},
					{data:"accuser.id"},
					{data:"defendant.id"},
					{data:"penaltyTimeValue"},
					{data:"status"},
					{data:"description"},
					{data:null, render:function(data, type, row){
						return new Date(data.updateDate).toLocaleDateString();
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
			
			//產製EXCEL報表功能之按鈕
			$("#excelButt").click(function(){
				$(this).attr("href", "/admin/penalty/penaltyExcel?" + $('form').serialize())
			})
			
		})
						

	</script>

</body>
</html>