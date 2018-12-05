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
	$(document).ready( function () {
		
//  $('#table').DataTable({
			 
// 	         ajax:"../request/query",
// 	         columns: [
// 	             { requests: "request.id" },
// 	             { requests: "request.jobArea" },
// 	             { requests: "request.jobTitle" },
// 	             { requests: "request.memberId" }
// 	             { requests: "request.serviceType" }
// 	             { requests: "request.termType" }
// 	             { requests: "request.timeValue" }
// 	         ]
//       	 });
		
		$.get("/html/nav.html",function(data){
				$("#navBar").html(data);
			});
		
		
		
		$.getJSON("/request/query",function(data){
			var docFragment=$(document.createDocumentFragment());
			var tb = $('#tbody');
 		    tb.empty();
			$.each(data,function(index,request){
			    var editbutton="<button class='btn btn-outline-secondary' onclick=\"javascript:document.location.href='/request/edit?id="+request.id+"'\">Edit</button>";     
			   	var deletebutton="<button class='btn btn-outline-secondary' onclick=\"javascript:document.location.href='/request/delete?id="+request.id+"'\">Delete</button>"; 	
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
		});			
//  		   $('#table').DataTable();
		
	});
	</script>
	
</body>

</html>