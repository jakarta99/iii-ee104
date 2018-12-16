<%@page import="java.time.LocalDateTime"%>
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

<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />
<!-- data table -->
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">  
<script src="https://cdn.datatables.net/buttons/1.5.4/js/dataTables.buttons.min.js"></script>	
<script src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>	


</head>
<body>
	<script src="/js/backstageNav.js"></script>
	<br>
	<br>
	<br>
	<h1>donation list</h1>
	
	<form action="#">
	  <fieldset>
	    <legend>search</legend>
	    <label>id:</label>
	    <input type="text" value="${param.id}" id="id" name="id"/>
	    <label>memberId:</label>
	    <input type="text" value="${param.memberId}" id="memberId" name="memberId"/>
	    <label>起始日期</label>
	    <input type="text" value="${param.donateTimeBegin}" id="donateTimeBegin" name="donateTimeBegin"/>
	    <label>結束日期</label>
	    <input type="text" value="${param.donateTimeEnd}" id="donateTimeEnd" name="donateTimeEnd"/>
	  	<input type="button" onclick="getData()" value="搜尋" id="searchButt" />
	  </fieldset>
	</form>

	
	

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
		$("tbody").text("");// 先清空資料
		$.ajax({
			url : "/admin/donation/query",
			type : "post",
			data : $("form").serialize(),
			dataType : 'json',
			success : function(donations) {
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
			url : "/admin/donation/delete?id=" + donationId,
			type : "delete",
			dataType : 'json',
			success : function(response){
				if(response.status == "SUCCESS"){
					alert("刪除成功");
				}
				else{
					$.each(response.message, function(idx, message){
						alert(message);
					});
				}
				getData();
			}
		})
	}
</script>
</body>

</html>