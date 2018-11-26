<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TimeLedger Edit</title>
</head>
<body>

	<h1>TimeLedger Edit</h1>

	<form action="/time-ledger/update" method="post">
		<fieldset>
			<!-- id:<input type="text" value="" id="id" name="id"/> -->
			<div class="form-group">
				memberId: <input type="text" value="${timeLedger.memberId}"
					id="memberId" name="memberId" class="form-control" />
			</div>
<!-- 			<div class="form-group"> -->
<!-- 				transactionTime: <input type="text" -->
<%-- 					value="${timeLedger.transactionTime}" id="transactionTime" --%>
<!-- 					name="transactionTime" class="form-control" /> -->
<!-- 			</div> -->
			<div class="form-group">
				description: <input type="text" value="${timeLedger.description}"
					id="description" name="description" class="form-control" />
			</div>
			<div class="form-group">
				depositValue: <input type="text" value="${timeLedger.depositValue}"
					id="depositValue" name="depositValue" class="form-control" />
			</div>
			<div class="form-group">
				withdrawalValue: <input type="text"
					value="${timeLedger.withdrawalValue}" id="withdrawalValue"
					name="withdrawalValue" class="form-control" />
			</div>
			<div class="form-group">
				balanceValue: <input type="text" value="${timeLedger.balanceValue}"
					id="balanceValue" name="balanceValue" class="form-control" />
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-outline-secondary" /> <input
					type="reset" class="btn btn-outline-secondary" />
			</div>
	</form>
	<div>
		<a href='/time-ledger/list'>back to TimeLedger List</a>
	</div>
</body>
</html>