<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="../admin_layout/admin_css_js_links.jsp" />  
				
<!-- 台灣縣市地區選單	 -->
<script src="/js/tw-city-selector.min.js"></script>


<!-- DateTimePicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/i18n/jquery-ui-timepicker-zh-TW.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.css" rel="stylesheet" />


<meta charset="UTF-8">
<title>mission list</title>
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
	}
 
    </style>
</head>
<body>
<jsp:include page="../admin_layout/nav.jsp" />
<article>
	<div class="margintop"></div>
	<div class="container" style="margin-top: 140px">
		<h2 class="text-center text-uppercase text-secondary mb-0">mission list</h2>
<!--         <hr class="star-dark mb-5"> -->
	</div>
	
	<div id="sideBar">
		<form>
			<fieldset style="width:1100px">
			<legend>Search</legend>
				
				
				<div>
					<label>memberAccount :</label> 
					<input type="text" value="" placeholder="memberAccount" id="memberAccount" name="memberAccount"/>
						
					<label>會員類型 :</label> 
						<select  id="serviceTypeDetail" name="serviceTypeDetail">
							<option value="">請選擇</option>
							<option value="婦幼關懷">婦幼關懷</option>
					        <option value="身心障礙">身心障礙</option>
					        <option value="老人服務">老人服務</option>
					        <option value="社會服務">社會服務</option>
					        <option value="動物保護">動物保護</option>
					        <option value="國際救援">國際救援</option>
					        <option value="環境保護">環境保護</option>
					        <option value="文教藝術">文教藝術</option>
					        <option value="醫療服務">醫療服務</option>
					        <option value="宗教信仰">宗教信仰</option>
						</select>
						
					
					<input type="button" value="搜尋"  id="searchButt" style="margin:10px"/> 
					<input type="reset" value="重設" id="resetButt" style="margin:10px"/>
					<a class="btn btn-secondary" data-toggle="collapse" href="#collapse" 
						role="button" aria-expanded="false" aria-controls="collapse">進階查詢</a>
				</div> 
				<div class="collapse" id="collapse">
					<div>
						<label>長短期 :</label> 
						<select  id="termType" name="termType">
							<option value="">請選擇</option>
							<option value="L">長期</option>
					        <option value="S">短期</option>
						</select>
					</div>
					
					<div>
						<label>縣市:</label> 
						<div id="twCitySelector" style='display:inline' role="tw-city-selector"></div>
						
						<label>startDate:</label>
						<input type="text"  id="startDate" name="startDate" autocomplete="off"/>
						
						<label>endDate:</label>
						<input type="text"  id="endDate" name="endDate" autocomplete="off"/>
						
					</div>
					<div>
						<label>title :</label> 
						<input type="text" value="" placeholder="title" id="title" name="title"/>
						
						<label>timeValue :</label> 
						<input type="text" value="" placeholder="timeValue" id="timeValue" name="timeValue"/>
						
						<label>statusDetail :</label> 
						<input type="text" value="" placeholder="statusDetail" id="statusDetail" name="statusDetail"/>
					</div>
				</div>
			</fieldset>
		</form>
	</div>
	
	<fieldset style="width:1300px">
		<div style="margin-bottom: 20px">
			<button class="btn btn-warning btn-sm" onclick="javascript:document.location.href='/admin/mission/add'">新增</button>
		</div>
		<table id="table" class="table table-hover">
			<thead>
				<tr style="background-color: white">
					<th width="100px">選項</th>
					<th scope="col">會員編號</th>
					<th scope="col">會員帳號</th>
					<th scope="col">活動名稱</th>
					<th scope="col">時數</th>
					<th scope="col">長短期</th>
					<th scope="col">服務類型</th>
					<th scope="col">結束日期</th>
					<th scope="col">需求人數</th>
					<th scope="col">狀態</th>
					<th scope="col">地址</th>
				</tr>
			 </thead>	
			 <tbody id="tbody">	
			 </tbody>
		</table>
		
	</fieldset>
</article>

	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
	
	<script>
	
	var dataTable;
	
 	$("#searchButt").click(	function(){
		dataTable.ajax.reload();
	})
	
	
	function deleteMission(id) {
		$.ajax({
			url : '/admin/mission/delete?id=' + id,
			type : 'post',
			dataType : 'JSON',
			success : function(deleteResult) {
 				//alert(deleteResult.obj.id);
				if(deleteResult.status == "SUCCESS"){
					alert("刪除編號" + deleteResult.obj.id + " " + deleteResult.status);									
					
				}else{
					alert("刪除編號" + deleteResult.obj.id + " " + deleteResult.status);
					alert("FAIL reason:" + deleteResult.messages);	
				}
				dataTable.ajax.reload();
				
			},
		})
	}
		
	

	$(document).ready( function () {

		new TwCitySelector();
		
// 		$("select[name='district']").removeClass();
// 		$("select[name='district']").addClass("form-control mx-3");
		
		$("form").addClass("form-inline");
		$("form div[id!='collapse']").addClass("form-group mx-sm-3 mb-3");
		$("form input, select").addClass("form-control mx-3");
		$("#searchButt, #resetButt").addClass("btn btn-outline-secondary");
		
		$('#startDate').datetimepicker({
			dateFormat: "yy/mm/dd",
		    todayHighlight: true,
		    language: 'zh-TW',
		    startView:"years",
		})
		
		$('#endDate').datetimepicker({
			dateFormat: "yy/mm/dd",
		    todayHighlight: true,
		    language: 'zh-TW',
		    startView:"years",
		})
		
		
		dataTable=$('#table').DataTable({
				pageResize: true,
				fixedHeader: true,
				pagingType: 'full_numbers',
	 			searching:false,
	 			processing:false,
	 			serverSide:true,
	 			"stateSave": true,
				"infoCallback": function( settings, start, end, max, total, pre ) {
		 			    var api = this.api();
		 			    var pageInfo = api.page.info();
		 			   	console.log(pageInfo);
		 			   api.rows( {page:'current'} ).data()
		 			    return '顯示第 '+(pageInfo.start+1)+' 筆到第  '+(pageInfo.end)+' 筆 共 '+ pageInfo.recordsTotal+' 筆資料 ';
		 			 },	
				"lengthMenu": [ 10, 25, 50, 100],
				ajax:{
					url:"/admin/mission/querypage",
					type: "get",
				    dataType : "json",
// 	 			    "data":$("form").serialize(),
				    data: function(d){
		            	console.log(d);
		            	var start = d.start;
						var length = d.length;
						var request = $("form").serialize()+"&start="+start+"&length="+length;
		            	return request;
		            },

				    dataSrc:"content",
				    dataFilter: function(resp){
// 		            	console.log(resp)
		                var json = jQuery.parseJSON( resp );
		                json.recordsTotal = json.totalElements;
		                json.recordsFiltered = json.totalElements;	     			
// 		     			console.log(JSON.stringify( json ))
		                return JSON.stringify( json ); 
		            	},
					},
// 					 drawCallback: function (d) {
// 		 		        	//console.log(d)
// 				        	  var api = this.api();
// 				        	  var pageNum = parseInt(d.json.pageable.pageNumber) ;
// 				        	  var totalPages = d.json.totalPages;
// 				        	  $('#table_info').html('Currently showing page '+(pageNum+1)+' of '+totalPages+' pages.');
// 				       },
					columns:[						
						{"data": function (data, type, val) {
							 var editbutton="<button class='btn btn-warning btn-sm' onclick=\"javascript:document.location.href='/admin/mission/edit?id="+data.id+"'\">修改</button>";     
							 var deletebutton="<button class='btn btn-warning btn-sm' onclick=\"deleteMission("+data.id+")\">刪除</button>"; 	
							 return editbutton + deletebutton;}
						},					 
						{"data":"id"},
						{"data":"member.account"},
						{"data":"title"},
						{"data":"timeValue"},
						{"data":null, render: function ( data, type, row ) {
			                	if(data.termType=='S'){
			                		return '短期';	
			                	}else
			                		return '長期';
			            } },
						{"data":"serviceType.serviceType"},
						{"data":null, render: function ( data, type, row ) {
			                return new Date(data.endDate).toLocaleDateString();
			            } },	
						
// 						{"data":"startDate"},						
// 						{"data":"endDate"},						
						{"data":"peopleNeeded"},						
// 						{"data":"contactPerson"},						
// 						{"data":"contactPhone"},						
// 						{"data":"contactEmail"},						
						{"data":"status.missionStatus"},						
						{"data": null, render: function ( data, type, row ) {
			                return data.county + data.district+ data.address;
			            }},						
					],
					 columnDefs: [{
			                "searchable": false,
			                "orderable": false,
			                "targets": [0],
			            }],
			            order: [[1, 'asc']]
					
					
					
				});		
			
		
// 			dataTable.on('draw.dt',function() {
// 				dataTable.column(0, {
// 	                search: 'applied',
// 	                order: 'applied'
// 	            }).nodes().each(function(cell, i) {
// 	                //i從0開始，所以先加1
// 	                i = i+1;
// 	                //服務模式下，使用DT提供的API直接獲取分頁資訊
// 	                var pageinfo = dataTable.page.info();
// 	                //當前第幾頁，從0开始
// 	                var pageno = pageinfo.page;
// 	                //每頁數據
// 	                var length = pageinfo.length;
// 	                //行號等於頁數*每頁數據長度+行號
// 	                var columnIndex = (i+pageno*length);
// 	                cell.innerHTML = columnIndex;
// 	            });
// 	        });
		
		
		
	});
	</script>	
</body>
</html>