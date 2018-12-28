<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Role List</title>
<jsp:include page="../admin_layout/admin_css_js_links.jsp" />
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

</head>
<body>
	<jsp:include page="../admin_layout/nav.jsp" />
	<article>
	<div class="container" style="margin-top: 140px">
		<h2 class="text-center text-uppercase text-secondary mb-0">Role List</h2>
        <hr class="star-dark mb-5">
	</div>
	<fieldset style="width:700px">
		<table  id=table class="table table-striped table-bordered">				
			<thead>
				<tr>
<!-- 					<th scope="col"></th> -->
					<th scope="col" width="100px"></th>
					<th scope="col">id</th>
					<th scope="col">使用者角色</th>


				
				</tr>
			</thead>
			<tbody id="tableBody">
				<!-- 由程式產生出的member清單 -->
				
			</tbody>
		</table>
		</fieldset>
		
		<span id="securityUser">
		
		
		</span>
			
	</article>
	
	
	<script>
	
		var dataTable;

		function deleteRow(memberId){
// 			alert( memberId);
			$.ajax({
				type: "get",
				dataType: "json",         
				url: "/admin/role/delete",
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
				dataTable.ajax.reload(); //會回到第一頁
			})	
		}

	

		$(document).ready(function(){						

			$("form").addClass("form-inline");
			$("form div[id!='collapse']").addClass("form-group mx-sm-3 mb-3");
			$("form input, select").addClass("form-control mx-3");
			$("#searchButt, #resetButt").addClass("btn btn-warning");
			
			
// 			$.get("/admin/securityUser/query" ,function(data){
// 				alert("security User")
				
// 				$("#securityUser" ).html(data);
// 			})
			
			
			dataTable =  $('#table').DataTable( {
				pageResize: true, 
				fixedHeader: true,
// 				pagingType: 'full_numbers',
				searching: false,
		        ajax: {
		            url: "/admin/role/query",
		            type: "get",
		            dataType : "json",
		            dataSrc:"",
		        },
		        
		     	columns: [		        
		           {data: function (source, type, val) {
		        	   	var editButt= "<input type='button' class=\"btn btn-warning btn-sm\"  onclick=\"javascript:document.location.href='/admin/role/edit?id="+source.id+"'\" value='修改'  />";
						var deleteButt="<input type='button' class=\"btn btn-warning btn-sm\" onclick=\"deleteRow("+source.id+")\" id='deleteButt"+ source.id +"' value='刪除' />"  
		               	return editButt + deleteButt;			        	   
		           	}		        	   
		           },
		           {data: "id" },
		           { data: "roleName" },

		       ],
				
			        
			 } );
			
			
		})	
				

	
	
	</script>

</body>
</html>