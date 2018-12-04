<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
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
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<title>TimeLedger List</title>
<style>
fieldset {
	width: 1200px;
	border-radius: 20px;
	padding: 20px;
	margin: 20px;
	border: 3px double #bebebe;
	margin: auto
}

.center {
	text-align: center
}

.margintop{
	 margin-top:70px;
}
</style>
</head>
<body>
	<div id="navBar"></div>
	<div class="margintop"></div>
	<h1 class="center">TimeLedger List</h1>
	<fieldset>
		<button onclick="javascript:document.location.href='/time-ledger/add'"
			class="btn btn-outline-secondary">Add</button>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>選項</th>
					<th scope="col">id</th>
					<th scope="col">memberId</th>
					<th scope="col">transactionTime</th>
					<th scope="col">description</th>
					<th scope="col">depositValue</th>
					<th scope="col">withdrawalValue</th>
					<th scope="col">balanceValue</th>
				</tr>
			</thead>
			<tbody id="timeLedgerTbody">
			</tbody>
		</table>
		<div>
			<a href='/'><i class="fas fa-home"></i>back to HOME</a>
		</div>
	</fieldset>
	<script>
		function listTimeLedger() {
			$("#timeLedgerTbody").text("");
			$.getJSON("/time-ledger/query", function(data) {
				$.each(data, function(index, timeLedger) {
					var editButton = "<input type='button' class=\"btn btn-outline-secondary\"  onclick=\"javascript:document.location.href='/time-ledger/edit?id="
						+ timeLedger.id	+ "'\" value='Edit'  />";
					var deleteButton = "<input type='button' class=\"btn btn-outline-secondary\"  onclick=\"deleteTimeLedger("
						+ timeLedger.id	+ ")\" value='Delete'  />";
					$("#timeLedgerTbody").append("<tr id='row"+ timeLedger.id +"'><td>"	+ editButton + deleteButton	+ "</td></tr>");
					var timeLedgerRow = $("#row"+ timeLedger.id);
					timeLedgerRow.append("<td >"+ timeLedger.id	+ "</td>");
					timeLedgerRow.append("<td >"+ timeLedger.memberId + "</td>");
					timeLedgerRow.append("<td >"+ timeLedger.transactionTime + "</td>");
					timeLedgerRow.append("<td >"+ timeLedger.description + "</td>");
					timeLedgerRow.append("<td >"+ timeLedger.depositValue + "</td>");
					timeLedgerRow.append("<td >"+ timeLedger.withdrawalValue + "</td>");
					timeLedgerRow.append("<td >"+ timeLedger.balanceValue + "</td>");
				})
			})
		}

		function deleteTimeLedger(id) {
			$.ajax({
				url : '/time-ledger/delete?id=' + id,
				type : 'delete',
				dataType : 'text',
				success : function(deleteResult) {
					alert(deleteResult);
					listTimeLedger();
				},
			})
		}

		$(document).ready(function() {
			$.get("/html/nav.html",function(data){
				$("#navBar").html(data);
			});
			
			listTimeLedger();

		})
	</script>
</body>
</html>