<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>donation list</title>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
  
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


</head>
<body>
	<script src="/js/backstageNav.js"></script>
	<br>
	<br>
	<br>
	<h1>donation list</h1>
	<fieldset>
		<table id="dataTable" class="table table-hover">
			<thead>
			<tr>
				<th></th>
				<th></th>
				<th scope="col">id</th>
				<th scope="col">memberId</th>
				<th scope="col">organizationId</th>
				<th scope="col">value</th>
				<th scope="col">donateTime</th>
			</tr>
			</thead>
			<tbody>
			</tbody>

		</table>
	</fieldset>
	<button class="btn btn-outline-secondary"
		onclick="javascript:document.location.href='/donation/add'">Add</button>
	<p>
	<script>
	$(document).ready(function(){ 
		getData();
	})

	function getData() {
		$.ajax({
			url : "/donation/query",
			type : "post",
			dataType : 'json',
			success : function(donations) {
				$("tbody").text("");  //delete 轉回原本頁面先清空資料
				$.each(donations,function(index, donation){
					$("tbody").append(
							[$("<tr>"),
							$("<td><button onclick=\"javascript:document.location.href='/donation/edit?id="+ donation.id +"'\">Edit</button></td>"),
							$("<td><button onclick=\"deleteData(" + donation.id + ")\">Delete</button></td>"),
							$("<td></td>").text(donation.id),
							$("<td></td>").text(donation.memberId),
							$("<td></td>").text(donation.organizationId),
							$("<td></td>").text(donation.value),
							$("<td></td>").text(donation.donateTime),
							$("</tr>")]);
				})
			}
		
		})
	}
	function deleteData(donationId){
		$.ajax({
			url : "/donation/delete?id=" + donationId,
			type : "delete",
			dataType : 'text',
			success : function(result){
				alert(result);
				getData();
			}
		})
	}
</script>
</body>

</html>