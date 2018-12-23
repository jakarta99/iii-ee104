<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" 
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" 
		crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" 
		integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" 
		crossorigin="anonymous"></script>
<link rel="stylesheet" 
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" 
		integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" 
		crossorigin="anonymous">
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">  
				
<!-- 台灣縣市地區選單	 -->
<script src="/js/tw-city-selector.min.js"></script>
<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />

<!-- DateTimePicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/i18n/jquery-ui-timepicker-zh-TW.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.css" rel="stylesheet" />


<jsp:include page="../../commons/commons_layout/commons_css_links.jsp"/>
<meta charset="UTF-8">
<title>mission list</title>
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
      <jsp:include page="../../commons/commons_layout/commons_top-bar.jsp"/>
 	
	  <!-- Navbar -->
      <jsp:include page="../../commons/commons_layout/commons_nav.jsp"/>
	<div class="margintop">
	
	<h1 class="s2">mission list</h1>
	
	<fieldset>
	<form>
			<div>
			基本查詢:
			</div>
			
			<label>縣市:</label> 
			<div style='display:inline' role="tw-city-selector" ></div>
			
			<label>會員類型 :</label> 
				<select  id="serviceType" name="serviceType">
					<option value="">選擇服務類型</option>
					<option value="1">照顧老人</option>
			        <option value="2">孩童教育</option>
			        <option value="3">環境清潔</option>
			        <option value="4">生態保育</option>	
				</select>
				
			<label>長短期 :</label> 
				<select  id="termType" name="termType">
					<option value="">選擇長短期</option>
					<option value="L">長期</option>
			        <option value="S">短期</option>
				</select>
				
			<label>startDate:</label>
			<input type="text"  id="startDate" name="startDate" autocomplete="off"/>
			<label>endDate:</label>
			<input type="text"  id="endDate" name="endDate" autocomplete="off"/>
			
			
			<input type="button" value="搜尋" id="searchButt" />
			<div>
			
			<a class="btn btn-outline-secondary" data-toggle="collapse" href="#collapse" role="button" aria-expanded="false" aria-controls="collapseExample">
			進階查詢:
  			</a>
  			</div> 
			<div class="collapse" id="collapse">
			
			<label>timeValue :</label> 
			<input type="text" value="" placeholder="timeValue" id="timeValue" name="timeValue"/>
			
			<label>jobTitle :</label> 
			<input type="text" value="" placeholder="jobTitle" id="jobTitle" name="jobTitle"/>
			
			
			</div>
		</form>
	</fieldset>
	
	<fieldset>
	<button class="btn btn-outline-secondary" onclick="javascript:document.location.href='/admin/mission/add'">add</button>
	<table id="table" class="table table-hover">
	<thead>
	<tr>
		<th>選項</th>
		<th scope="col">id</th>
		<th scope="col">memberId</th>
		<th scope="col">title</th>
		<th scope="col">timeValue</th>
		<th scope="col">termType</th>
		<th scope="col">serviceType</th>
		<th scope="col">publishDate</th>
<!-- 		<th scope="col">startDate</th> -->
<!-- 		<th scope="col">endDate</th> -->
		<th scope="col">peopleNeeded</th>
<!-- 		<th scope="col">contactPerson</th> -->
<!-- 		<th scope="col">contactPhone</th> -->
<!-- 		<th scope="col">contactEmail</th> -->
<!-- 		<th scope="col">discription</th> -->
		<th scope="col">地址</th>
	</tr>
	 </thead>	
	 <tbody id="tbody">	
	 </tbody>
	</table>
		
	<button class="btn btn-outline-secondary" onclick="javascript:document.location.href='/'">回列表頁</button>
	</fieldset>
	</div>
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
				"lengthMenu": [ 3, 6, 9, 12, ],
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
							 var editbutton="<button class='btn btn-outline-secondary' onclick=\"javascript:document.location.href='/admin/mission/edit?id="+data.id+"'\">Edit</button>";     
							 var deletebutton="<button class='btn btn-outline-secondary' onclick=\"deleteMission("+data.id+")\">Delete</button>"; 	
							 return editbutton + deletebutton;}
						},					 
						{"data":"id"},
						{"data":"memberId"},
						{"data":"title"},
						{"data":"timeValue"},
						{"data":"termType"},
						{"data":"serviceType.serviceType"},
						{"data":null, render: function ( data, type, row ) {
			                return new Date(data.publishDate).toLocaleDateString();
			            } },	
						
// 						{"data":"startDate"},						
// 						{"data":"endDate"},						
						{"data":"peopleNeeded"},						
// 						{"data":"contactPerson"},						
// 						{"data":"contactPhone"},						
// 						{"data":"contactEmail"},						
// 						{"data":"discription"},						
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