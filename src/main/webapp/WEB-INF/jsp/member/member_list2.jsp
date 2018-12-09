<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member List</title>

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
<!-- 台灣縣市地區選單	 -->
<script src="/js/tw-city-selector.min.js"></script>
<!-- date picker -->
<script type="text/javascript" src="/js/moment.min.js"></script>
<script type="text/javascript" src="/js/bootstrap-datepicker.js"></script>
<script src="/js/locales/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />
<!-- data table -->
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">  
		
<style>
	 article{
	 	margin-top:70px;
	 }
	 
	 article fieldset {
/* 		width: 500px; */
		border-radius: 20px;
		padding: 20px 20px 0px 20px; 
		border: 3px double #bebebe;
		margin: auto;
		margin-top: 10px; 
		margin-bottom: 20px; 
	}

	 article td{
	 	text-align:center;
	 }
	 article .btn{
	 	margin-left:10px;
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

<!-- 	<div id="navBar"></div> -->
<c:import url="/html/nav.html"/>

	<article>
		<input type="button" class="btn btn-primary btn-sm" onclick="javascript:document.location.href='/'" value="回首頁"  />
		<h2>Member List 2</h2>
		
		<div>
			<input type="button" class="btn btn-primary btn-sm"	
				onclick="javascript:document.location.href='/member/add?memberType=P'" value="新增一般會員" />
			<input type="button" class="btn btn-primary btn-sm"
					onclick="javascript:document.location.href='/member/add?memberType=O'" value="新增公益團體" />
		</div>
		
<!-- 		條件搜尋表單 -->
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
			</div>
		
			<div >
				<label>出生起始日期:</label> 
				<input type="text" value="${param.birthDateStart }"  id="birthDateStart" name="signUpDateStart" autocomplete="off" />
				<input type="text" value="${param.birthDateEnd }" id="birthDateEnd" name="signUpDateEnd" autocomplete="off"/>	
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
		
			<input type="button"  value="搜尋" id="searchButt" style="margin:10px"/>
			</fieldset>
			
		</form>
		<fieldset style="width:1200px">
		<table  id=table class="table table-striped table-bordered">				
			<thead>
				<tr>
					<th scope="col">會員編號</th>
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
	
		function list(){
			$("#memberTableBody").text("");
			$.getJSON("/member/queryPage",$("form").serialize(),function(data){
				$.each(data, function(idx, member){
					var editButt= "<input type='button' class=\"btn btn-primary btn-sm\"  onclick=\"javascript:document.location.href='/member/edit?id="+member.id+"'\" value='修改'  />";
					var deleteButt="<input type='button' class=\"btn btn-primary btn-sm\" id='deleteButt"+ member.id +"' value='刪除' />"
					$("#memberTableBody").append("<tr id='row"+ member.id +"'><td>"+editButt + deleteButt+"</td></tr>");					
					var memberRow = $("#row"+member.id);
					memberRow.append("<td >"+member.account+"</td>");
					memberRow.append("<td >"+member.name+"</td>");
					memberRow.append("<td >"+member.memberType+"</td>");
					memberRow.append("<td >"+member.email+"</td>");
					memberRow.append("<td >"+member.mobile+"</td>");
					memberRow.append("<td >"+ member.county + member.district + member.address +"</td>");		
					memberRow.append("<td >"+ new Date(member.signUpDate).toLocaleDateString()+"</td>");
				})
				
				
// 				var table = $('#table').DataTable({
// 					"searching": false,
// 					 "processing": true,
// 				     "serverSide": true,
// 				     "ajax": "/member/queryPage"
// 				});
// 				$('#table').on( 'page.dt', function () {
// 				    var info = table.page.info();
// 				    $('#pageInfo').html( 'Showing page: '+info.page+' of '+info.pages );
// 				    $.each(info, function(idx, value){  	
// 					    console.log("idx=" + idx + ", value=" + value);
// 				    })
// 				    var pageRequest = {
// 				    	"currentPage":info.page,
// 				    	"totalPage":info.pages,
// 				    	"size":info.length
// 				    }
				    				    	
// 				});
				
						
			})
			
		
		}
	
	
		
		$(document).ready(function(){
			
			
// 			$('#table').dataTable( {
// 			   "aoColumns": [
// 			       { "mData": "engine" },
// 			       { "mData": "browser" },
// 			       { "mData": "platform.inner" },
// 			       { "mData": "platform.details.0" },
// 			       { "mData": "platform.details.1" }
// 			     ]
// 			   }),
// 			   "bProcessing": true,
// 			   "bServerSide": true,
// 			   "sAjaxSource": url,
// 			   "fnServerData": function ( sSource, aoData, fnCallback, oSettings ) {
// 			     oSettings.jqXHR = $.ajax( {
// 			       "dataType": 'json',
// 			       "type": "POST",
// 			       "url": sSource,
// 			       "data": aoData,
// 			       "success": fnCallback,
// 			       "error": function (e) {
// 			           console.log(e.message);
// 			       }
// 			     });
// 			   }
// 			 });
		
			
			
			
			$('#table').DataTable( {
		        processing: true,
		        serverSide: true,
		 
		        ajax: {
		            url: "/member/queryPageRequest",
		            type: "get",
		            dataType : "json",
		            data: $("form").serialize(),
            		
		           	columns: [
			           { data: "id" },
			           { data: "account" },
			           { data: "name" },
			           { data: "memberType" },
			           { data: "mobile" },
			           { data: null, render: function ( data, type, row ) {
			                // Combine the first and last names into a single table field
			                return data.county + data.district+ data.address;
			            } },
			           { data: "signUpDate" },
			       ],
			       
		            
		        }
			
			
		    } );	
			    
		

			
			
			
			
	
			new TwCitySelector();
			$("form").addClass("form-inline");
			$("form div").addClass("form-group mx-sm-3 mb-3");
			$("form input").addClass("form-control mx-3");
			$("form select").addClass("form-control mx-3");
			$("#searchButt").addClass("btn btn-info");
			
			
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
			
		
			
			//將deleteButt綁定click事件
			$("#memberTableBody").on("click", "input[value='刪除']", function(){
				var memberId = $(this).attr("id").substring(10);
				$.ajax({
					type: "post",
					dataType: "json",         
					url: "/member/delete",
					data: {"id":memberId}					
				})
				.done(function(data){
					alert(data.msg);
					list();
				})			
			})

			$("#searchButt").click(function() {		
				list();		
			})
			
		
			
			
			
			
			
		})	
				

	
	
	</script>
	

</body>
</html>