<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Security user list</title>

<jsp:include page="../admin_layout/admin_css_js_links.jsp" />
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

	 table tr td, button{
	 	text-align:center;
	 	line-height:center; 
	 }
	 article .btn{
	 	margin-left:3px;
	 	margin-right:3px
	 }
	 

</style>
</head>
<body>

<jsp:include page="../admin_layout/nav.jsp" />
	<article>
	<h2>securityUser List</h2>
	
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
		
	
			
	</article>
	
	
	<script>
	
		var dataTable;

// 		function deleteRow(memberId){
// 			$.ajax({
// 				type: "get",
// 				dataType: "json",         
// 				url: "/admin/role/delete",
// 				data: {"id":memberId}					
// 			})
// 			.done(function(response){
// 				if (response.status =="SUCCESS"){
// 					alert("刪除成功");
// 				} else {
// 					$.each(response.messages, function(idx, message) {
// 						alert("the "+idx+"th ERROR, because "+message);
// 					});
// 				}			
// 				dataTable.ajax.reload(); //會回到第一頁
// 			})	
// 		}

	

		$(document).ready(function(){						

			$("form").addClass("form-inline");
			$("form div[id!='collapse']").addClass("form-group mx-sm-3 mb-3");
			$("form input, select").addClass("form-control mx-3");
			$("#searchButt, #resetButt").addClass("btn btn-primary");
			
			
// 			$.get("/admin/securityUser/query" ,function(data){
				
// 				$("#securityUser" ).html(data);
// 			})
			
			
			dataTable =  $('#table').DataTable( {
				pageResize: true, 
				fixedHeader: true,
// 				pagingType: 'full_numbers',
				searching: false,
		        ajax: {
		            url: "/admin/securityUser/query",
		            type: "get",
		            dataType : "json",
		            dataSrc:"",
		        },
		        
		     	columns: [		        
		           {data: function (source, type, val) {
		        	   console.log(source)
		        	   	var editButt= "<input type='button' class=\"btn btn-primary btn-sm\"  onclick=\"javascript:document.location.href='/admin/role/edit?id="+source.id+"'\" value='修改'  />";
						var deleteButt="<input type='button' class=\"btn btn-primary btn-sm\" onclick=\"deleteRow("+source.id+")\" id='deleteButt"+ source.id +"' value='刪除' />"  
		               	return editButt + deleteButt;			        	   
		           	}		        	   
		           },
		           {data: "id" },
		           { data: "account" },
// 		           {data: ""}

		       ],
				
			        
			 } );
			
			
		})	
				

	
	
	</script>


</body>
</html>