<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TimeLedger Add</title>
</head>
<body>

	<h1>TimeLedger Add</h1>

	<form action="/time-ledger/insert" method="post">
		<!-- id:<input type="text" value="" id="id" name="id"/> -->
		memberId:<input type="text" value="" id="memberId" name="memberId" />
		<p>
			transactionTime:<input type="text" value="" id="transactionTime"
				name="transactionTime" />
		<p>
			description:<input type="text" value="" id="description"
				name="description" />
		<p>
			depositValue:<input type="text" value="" id="depositValue"
				name="depositValue">
		<p>
			withdrawalValue:<input type="text" value="" id="withdrawalValue"
				name="withdrawalValue">
		<p>
			balanceValue:<input type="text" value="" id="balanceValue"
				name="balanceValue">
		<p>
			<input type="submit" />
	</form>
	<div>
		<a href='/time-ledger/list'>back to TimeLedger List</a>
	</div>
</body>
</html>