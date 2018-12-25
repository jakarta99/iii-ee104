<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member List</title>

<jsp:include page="../admin_layout/admin_css_js_links.jsp" />
<!-- 台灣縣市地區選單	 -->
<script src="/js/tw-city-selector.min.js"></script>
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
	 


	 
	 /* 	設定縣市地區選擇器的css樣式 */
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

	<jsp:include page="../admin_layout/nav.jsp" />
	<article>
		<h2>Member List</h2>
		
		<div >
			<input type="button" class="btn btn-primary btn-sm"	
				onclick="javascript:document.location.href='/admin/member/add?memberType=P'" value="新增一般會員" />
			<input type="button" class="btn btn-primary btn-sm"
					onclick="javascript:document.location.href='/admin/member/add?memberType=O'" value="新增公益團體" />
		</div>
		
<!-- 		條件搜尋表單 -->
		<div id="sideBar" >		
			<form>
				<fieldset>
				<legend>Search</legend>
				<div >
					<label>帳號 :</label> 
					<input type="text" value="${param.account }" placeholder="帳號" id="account" name="account"/>
					<label>名字 :</label> 
					<input type="text" value="${param.name }" placeholder="名字" id="name" name="name"/>
					<label>會員類型 :</label> 
					<select  id="memberType" name="memberType">
						<option value="">選擇會員類型</option>
						<option value="P">一般會員</option>
						<option value="O">機構會員</option>
					</select>
					<input type="button"  value="搜尋" id="searchButt" style="margin:10px"/>
					<input type="reset"  value="重設"  id="resetButt" style="margin:10px"/>
				<a class="btn btn-outline-secondary" data-toggle="collapse" href="#collapse" role="button" aria-expanded="false" aria-controls="collapse">
				進階查詢:</a>
				</div>
			<div class="collapse" id="collapse">
				<div >
					<label>出生起始日期:</label> 
					<input type="text" value="${param.birthDateStart }"  id="birthDateStart" name="birthDateStart" autocomplete="off" />
					<input type="text" value="${param.birthDateEnd }" id="birthDateEnd" name="birthDateEnd" autocomplete="off"/>	
				</div>
				<div >
					<label>email:</label> 
					<input type="text" 
							value="${param.email }" id="email" name="email">
					<label>Email驗證信確認(Y/N):</label>
					<label>Y</label> 
					<input type="radio" value="Y" name="emailVerification" />
					<label>N</label> 
					<input type="radio" value="N" name="emailVerification" />
				</div>
				<div >	
					<label>手機:</label> 
					<input type="text" 
							value="${param.mobile }" id="mobile" name="mobile">
				</div>
				<div >
					<label>縣市:</label> 
					<div style='display:inline' role="tw-city-selector" ></div>
				</div>
				
				<div >	
					<label>註冊起始日期 :</label> 			
					<input type="text" value="${param.signUpDateStart }"  id="signUpDateStart" name="signUpDateStart" autocomplete="off"/>
					<input type="text" value="${param.signUpDateEnd }" id="signUpDateEnd" name="signUpDateEnd" autocomplete="off"/>
				</div>
			</div>
				
		</fieldset>
			</form>
		</div>
		
		
		<fieldset style="width:1300px">
		<table  id=table class="table table-striped table-bordered">				
			<thead>
				<tr>
					<th scope="col"></th>
					<th scope="col">id</th>
					<th scope="col" width="100px"></th>
					<th scope="col">會員帳號</th>
					<th scope="col">會員姓名</th>
					<th scope="col">會員型態</th>
					<th scope="col">會員信箱</th>
					<th scope="col">會員手機</th>					
					<th scope="col">會員居住地址</th>
					<th scope="col">註冊日期</th>				
	<!-- 				<th>驗證信確認</th> -->
				
				</tr>
			</thead>
			<tbody id="memberTableBody">
				<!-- 由程式產生出的member清單 -->
				
			</tbody>
		</table>
		</fieldset>
			
	</article>
	

	<script>
	
		var dataTable;

		function deleteRow(memberId){
// 			alert( memberId);
			$.ajax({
				type: "get",
				dataType: "json",         
				url: "/admin/member/delete",
				data: {"id":memberId}					
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
// 					alert($("table tbody tr").length +", no row exists");
					dataTable.page( 'previous' ).draw('page');;
				} 
			})	
		}

	
	
		$(document).ready(function(){	
			new TwCitySelector();
			$("form").addClass("form-inline");
			$("form div[id!='collapse']").addClass("form-group mx-sm-3 mb-3");
			$("form input, select").addClass("form-control mx-3");
			$("#searchButt, #resetButt").addClass("btn btn-primary");
			

			dataTable =  $('#table').DataTable( {
				pageResize: true, 
				fixedHeader: true,
				pagingType: 'full_numbers',
				searching: false,				
			 	processing: true,
			 	//分頁、排序都交由伺服器處理
		        serverSide: true,
		        ajax: {
		            url: "/admin/member/queryPage",
		            type: "get",
		            dataType : "json",
					//傳送給伺服器的資料(datatable預設會傳送d的資料)
		            data: function(d){
		            	console.log(d);
		            	var start = d.start;
						var length = d.length;
						var request = $("form").serialize()+"&start="+start+"&length="+length;
		            	return request;
		            },
		            //dataTable需顯示表格的資料標籤(預設標籤為data:)
		            dataSrc:"content",
		            //對伺服器送來的資料進行修改
		            dataFilter: function(resp){
// 		            	console.log(resp)
		                var json = jQuery.parseJSON( resp );
		                json.recordsTotal = json.totalElements;
		                json.recordsFiltered = json.totalElements;	     			
// 		     			console.log(JSON.stringify( json ))
		                return JSON.stringify( json ); 
		            },
		            	

		        },
		        drawCallback: function (d) {
// 		        	console.log(d)
		        	  var api = this.api();
		        	  var pageNum = parseInt(d.json.pageable.pageNumber) ;
		        	  var totalPages = d.json.totalPages;
		        	  $('#table_info').html('Currently showing page '+(pageNum+1)+' of '+totalPages+' pages.');
		       },
				//設定datatable要顯示的資訊，需與表頭<th>數量一致(可隨意串接資料內容)
		     	columns: [
		     		{data:null},
		           	{data: "id" },
		           	{data: function (data, type, row ) {
// 		        	   console.log(data)
		        	   	var editButt= "<input type='button' class=\"btn btn-primary btn-sm\"  onclick=\"javascript:document.location.href='/admin/member/edit?id="+data.id+"'\" value='修改'  />";
						var deleteButt="<input type='button' class=\"btn btn-primary btn-sm\" onclick=\"deleteRow("+data.id+")\" id='deleteButt"+ data.id +"' value='刪除' />"  
		               	return editButt + deleteButt;			        	   
		           		}
		        	   
		           	},
		           	{ data: "account" },
		           	{ data: "name" },
		           	{ data: "memberType" },
				   	{ data: "email" },
		           	{ data: "mobile" },
		           	{ data: null, render: function ( data, type, row ) {
		                return data.county + data.district+ data.address;
		            } },
		           	{ data: null, render: function ( data, type, row ) {
		                return new Date(data.signUpDate).toLocaleDateString();
		            } },
		       ],
		       //禁用第0123列的搜索和排序
		       columnDefs: [{
	                "searchable": false,
	                "orderable": false,
	                "targets": [0, 1, 2],
	            }],
	            order: [[1, 'asc']]
				    
			        
			 } );
			//設定行號(非id)	
			dataTable.on('draw.dt',function() {
				dataTable.column(0, {
	                search: 'applied',
	                order: 'applied'
	            }).nodes().each(function(cell, i) {
	                //i從0開始，所以先加1
	                i = i+1;
	                //服務模式下，使用DT提供的API直接獲取分頁資訊
	                var pageinfo = dataTable.page.info();
	                //當前第幾頁，從0开始
	                var pageno = pageinfo.page;
	                //每頁數據
	                var length = pageinfo.length;
	                //行號等於頁數*每頁數據長度+行號
	                var columnIndex = (i+pageno*length);
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
			$('#birthDateStart').datepicker(datePickerSetting);
			$('#birthDateEnd').datepicker(datePickerSetting);
			$('#signUpDateStart').datepicker(datePickerSetting);
			$('#signUpDateEnd').datepicker(datePickerSetting)
			

			$("#searchButt").click(	function(){
				dataTable.ajax.reload();

			})
			
		
			
			
			
			
			
		})	
				

	
	
	</script>
	

</body>
</html>