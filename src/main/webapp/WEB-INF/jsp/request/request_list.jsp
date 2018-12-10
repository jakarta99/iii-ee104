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
				

<meta charset="UTF-8">
<title>request list</title>
<style>


        fieldset {
            width: 1200px;
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
 
    </style>
</head>
<body>
<div id="navBar" class="margintop"></div>
	
	<h1 class="s2">request list</h1>
	
	<fieldset>
	<form id="form">
			<div>
			基本查詢:
			</div>
			<label>Id :</label> 
			<input type="text" value="" placeholder="Id" id="Id" name="Id"/>
			<label>jobArea :</label> 
			<input type="text" value="" placeholder="jobArea" id="jobArea" name="jobArea"/>
			<div>
			<a class="btn btn-outline-secondary" data-toggle="collapse" href="#collapse" role="button" aria-expanded="false" aria-controls="collapseExample">
			進階查詢:
  			</a>
  			</div> 
			<div class="collapse" id="collapse">
			<label>serviceType</label>
			<input type="text" value="" placeholder="serviceType" id="serviceType" name="serviceType"/>
			<label>jobTitle :</label> 
			<input type="text" value="" placeholder="jobTitle" id="jobTitle" name="jobTitle"/>
			<label>termType :</label> 
			<input type="text" value="" placeholder="termType" id="termType" name="termType"/>
			<input type="button" value="搜尋" id="searchButton" onclick="search()"/>
			</div>
		</form>
	</fieldset>
	
	<fieldset>
	<button class="btn btn-outline-secondary" onclick="javascript:document.location.href='/request/add'">add</button>
	<table id="table" class="table table-hover">
	<thead>
	<tr>
		<th>選項</th>
		<th scope="col">id</th>
		<th scope="col">jobArea</th>
		<th scope="col">jobTitle</th>
		<th scope="col">memberId</th>
		<th scope="col">serviceType</th>
		<th scope="col">termType</th>
		<th scope="col">timeValue</th>
	</tr>
	 </thead>	
	 <tbody id="tbody">	
	 </tbody>
	</table>
		
	<button class="btn btn-outline-secondary" onclick="javascript:document.location.href='/'">回列表頁</button>
	</fieldset>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
		
	<script>
	
	var datatable;
	
	function search() {	
	datatable.destroy();
	list();
	}
	
	
	function deleteRequest(id) {
		$.ajax({
			url : '/request/delete?id=' + id,
			type : 'post',
			dataType : 'JSON',
			success : function(deleteResult) {
 				//alert(deleteResult.obj.id);
				if(deleteResult.status == "SUCCESS"){
					alert("刪除編號" + deleteResult.obj.id + " " + deleteResult.status);									
					datatable.destroy();
					list();			
				}else{
					alert("刪除編號" + deleteResult.obj.id + " " + deleteResult.status);
					alert("FAIL reason:" + deleteResult.messages);
				}			
			},
		})
	}
		
	
	function list(){
		$.ajax({
			  dataType: "json",
			  url: "/request/query",
			  data: $('#form').serialize(),
			  success:function(data){
					var docFragment=$(document.createDocumentFragment());
					var tb = $('#tbody');
 		   			tb.empty();
					$.each(data,function(index,request){
					    var editbutton="<button class='btn btn-outline-secondary' onclick=\"javascript:document.location.href='/request/edit?id="+request.id+"'\">Edit</button>";     
					   	var deletebutton="<button class='btn btn-outline-secondary' onclick=\"deleteRequest("+request.id+")\">Delete</button>"; 	
					   	var cell1 = $('<td></td>').html(editbutton+deletebutton);
						var cell2 = $('<td></td>').text(request.id);
				        var cell3 = $('<td></td>').text(request.jobArea);
				        var cell4 = $('<td></td>').text(request.jobTitle);
				        var cell5 = $('<td></td>').text(request.memberId);
				        var cell6 = $('<td></td>').text(request.serviceType);
				        var cell7 = $('<td></td>').text(request.termType);
				        var cell8 = $('<td></td>').text(request.timeValue);
						var row = $('<tr></tr>').append([cell1, cell2, cell3, cell4,cell5,cell6,cell7,cell8]);
				        docFragment.append(row);						
						});
						tb.html(docFragment);
						datatable=$('#table').DataTable({
							"stateSave": true,
						    "infoCallback": function( settings, start, end, max, total, pre ) {
				 			    var api = this.api();
				 			    var pageInfo = api.page.info();
				 			   	console.log(pageInfo);
				 			    return '顯示第 '+(pageInfo.start+1)+' 筆到第  '+(pageInfo.end)+' 筆 共 '+ pageInfo.recordsTotal+' 筆資料 ';
				 			 },							
 							"lengthMenu": [ 3, 6, 9, 12, ],
 						});
					}				
			});			
		}
	

	$(document).ready( function () {
		$.get("/html/nav.html",function(data){
			$("#navBar").html(data);
		});		
		list();		
	});
	</script>	
</body>
</html>