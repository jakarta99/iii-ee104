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
		<h2 class="text-center text-uppercase text-secondary mb-0">securityUser List</h2>
<!--         <hr class="star-dark mb-5"> -->
	</div>
	<fieldset style="width:700px">
		<input type="button" class="btn btn-warning btn-sm" id="editButt3" onclick="editRow()" value="更新-2"/>
		
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-warning btn-sm" id="editButt" onclick="editRow()" data-toggle="modal" data-target="#exampleModal" > 更新</button>
		
 		<!-- Modal --> 
		<div class="modal fade" id=exampleModal tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      <form>
		      	<label>會員編號 :</label> 
		      	<input type="text" name="memberId" value="">
		      
		      </form>
		        Are you sure you want to delete this Member?
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary" onclick='deleteRow()' >OK</button>
		      </div>
		    </div>
		  </div>
		</div>

		<table  id=table class="table table-hover">				
			<thead>
				<tr style="background-color:white">
<!-- 					<th scope="col"></th> -->
					<th scope="col" width="100px"></th>
					<th scope="col">會員編號</th>	
					<th scope="col">會員帳號</th>
					<th scope="col">角色</th>


				
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
		var selectedRowId = 0;

// 		function deleteRow(memberId, roleId){
// // 			alert(memberId+","+ roleId)
// 			$.ajax({
// 				type: "get",
// 				dataType: "json",         
// 				url: "/admin/securityUser/delete",
// 				data: {"memberId":memberId,
// 						"roleId" : roleId}					
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
		
		function editRow(){
			var array = selectedRowId.split(",",2);
			if (array!= null ){
				$.post("/admin/securityUser/add", 
						{memberId:array[0],rowId: array[1]}, 
						function(data){
							console.log(data);
						}) 
// 				javascript:document.location.href='/admin/securityUser/securityUser_add?memberId='+array[0]+'&rowId=' +array[1];
// 				window.location.replace("/admin/member/list");
			}
		}

	

		$(document).ready(function(){						

			$("form").addClass("form-inline");
			$("form div[id!='collapse']").addClass("form-group mx-sm-3 mb-3");
			$("form input, select").addClass("form-control mx-3");
			$("#searchButt, #resetButt").addClass("btn btn-warning");
			
			

			dataTable =  $('#table').DataTable( {
				pageResize: true, 
				fixedHeader: true,
// 				pagingType: 'full_numbers',
				searching: false,
				select:true,
				
				rowId:function(source, type, val){
					return "memberId="+source.id+",roleId=" + source.role.id;
				},
		        ajax: {
		            url: "/admin/securityUser/query",
		            type: "get",
		            dataType : "json",
		            dataSrc:"",
		        },
		        
		     	columns: [		        
		           {data: function (source, type, val) {
		        	  	console.log(source)
		 				var deleteButt="<input type='button' class=\"btn btn-warning btn-sm\" onclick=\"deleteRow("+source.id+","+source.role.id+")\" id='deleteButt"+ source.id +"' value='刪除' />"  
		               	return deleteButt;			        	   
		           	}		        	   
		           },
		           {data: "id" },
		           {data: "account" },
		           {data: function(source, type, val){
		        	   return source.role.roleName;
		           }}

		       ],
				
			        
			 } );
			
			
			 $('#table tbody').on( 'click', 'tr', function () {
			        if ( $(this).hasClass('selected')) {
			            $(this).removeClass('selected');
			            selectedRowId = 0;
			            $('#deleteButt').prop("disabled", true);
			            $('#editButt').prop("disabled", true);
			        }
			        else {
			        	$('tr.selected').removeClass('selected');
			        	selectedRowId = this.id;
						$(this).addClass('selected');
			            $('#deleteButt').prop("disabled", false);
			            $('#editButt').prop("disabled", false);
			        }
			    } );
			
			
		})	
				

	
	
	</script>


</body>
</html>