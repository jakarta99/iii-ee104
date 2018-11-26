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
<title>TimeLedger Add</title>
<style>
fieldset {
	width: 800px;
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

	<h1 class="center">TimeLedger Add</h1>

	<form action="/time-ledger/insert" method="post">
		<fieldset>
			<!-- id:<input type="text" value="" id="id" name="id"/> -->
			<div class="form-group">
				memberId:<input type="text" value="" id="memberId" name="memberId"
					class="form-control" />
			</div>
			<div class="form-group">
				transactionTime:<input type="text" value="" id="transactionTime"
					name="transactionTime" class="form-control" />
			</div>
			<div class="form-group">
				description:<input type="text" value="" id="description"
					name="description" class="form-control" />
			</div>
			<div class="form-group">
				depositValue:<input type="text" value="" id="depositValue"
					name="depositValue" class="form-control" />
			</div>
			<div class="form-group">
				withdrawalValue:<input type="text" value="" id="withdrawalValue"
					name="withdrawalValue" class="form-control" />
			</div>
			<div class="form-group">
				balanceValue:<input type="text" value="" id="balanceValue"
					name="balanceValue" class="form-control" />
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-outline-secondary" /> <input
					type="reset" class="btn btn-outline-secondary" />
			</div>
	</form>
	<div>
		<a href='/time-ledger/list'><i
			class="fas fa-arrow-alt-circle-left"></i>back to TimeLedger List</a>
	</div>
	</fieldset>
</body>
</html>