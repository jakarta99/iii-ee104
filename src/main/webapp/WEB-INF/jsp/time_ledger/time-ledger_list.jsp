<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
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
</style>
</head>
<body>

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
			<tbody>
				<c:forEach items="${timeLedgers}" var="timeLedger">
					<tr>
						<td>
							<button
								onclick="javascript:document.location.href='/time-ledger/edit?id=${timeLedger.id}'"
								class="btn btn-outline-secondary">Edit</button>
							<button
								onclick="javascript:document.location.href='/time-ledger/delete?id=${timeLedger.id}'"
								class="btn btn-outline-secondary">Delete</button>
						</td>
						<td>${timeLedger.id}</td>
						<td>${timeLedger.memberId}</td>
						<td>${timeLedger.transactionTime}</td>
						<td>${timeLedger.description}</td>
						<td>${timeLedger.depositValue}</td>
						<td>${timeLedger.withdrawalValue}</td>
						<td>${timeLedger.balanceValue}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<a href='/'><i class="fas fa-home"></i>back to HOME</a>
		</div>
	</fieldset>
</body>
</html>