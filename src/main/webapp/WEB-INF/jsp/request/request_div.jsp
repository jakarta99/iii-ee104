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

<!-- <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script> -->
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">   -->
		

<meta charset="UTF-8">
<title>request list</title>
<style>


        fieldset {
            width: 80%;
            border-radius: 20px;
            padding: 20px;
            margin: 20px;
            border: 3px double #bebebe;
            margin: auto
        }
        .s2{
            text-align: center
        }
 
    </style>
</head>
<body>
	
	<h1 class="s2">request list</h1>
	
	<fieldset>
		<div class="container">
	<button class="btn btn-outline-secondary" onclick="javascript:document.location.href='/request/add'">add</button>
			<div class="row" id="body">
				
			</div>
	<button class="btn btn-outline-secondary" onclick="javascript:document.location.href='/'">回列表頁</button>
		</div>
	</fieldset>
	<script>
	$(document).ready( function () {
		$.getJSON("/request/query",function(data){
			var docFragment=$(document.createDocumentFragment());
			var tb = $('#body');
 		    tb.empty();
 		   
			$.each(data,function(index,request){
				var editbutton="<button class='btn btn-outline-secondary' onclick=\"javascript:document.location.href='/request/edit?id="+request.id+"'\">Edit</button>";     
			   	var deletebutton="<button class='btn btn-outline-secondary' onclick=\"javascript:document.location.href='/request/delete?id="+request.id+"'\">Delete</button>"; 	
			   	var cell1 = $('<p></p>').html(editbutton+deletebutton);
				var cell2 = $('<p></p>').text("id:"+request.id);
		        var cell3 = $('<p></p>').text("jobArea:"+request.jobArea);
		        var cell4 = $('<p></p>').text("jobTitle:"+request.jobTitle);
		        var cell5 = $('<p></p>').text("memberId:"+request.memberId);
		        var cell6 = $('<p></p>').text("serviceType:"+request.serviceType);
		        var cell7 = $('<p></p>').text("termType:"+request.termType);
		        var cell8 = $('<p></p>').text("timeValue:"+request.timeValue);
				var row = $('<div class="col-md-4" ></div>').append([cell1, cell2, cell3, cell4,cell5,cell6,cell7,cell8]);
		 
			   	docFragment.append(row);
			});
			tb.html(docFragment);
		});		
//       	$('#table').DataTable();
	});
	</script>
	
</body>

</html>