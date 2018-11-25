<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Penalty Add</title>
</head>
<body>

	<h1>Penalty Add</h1>
	<form action="/penalty/insert" method="post">
		orderListId:<input type="text" id="orderListId" name="orderListId"/><p>
		memberId:<input type="text" id="memberId" name="memberId"/><p>
		description:<input type="text" id="description" name="description"/><p>
		status:<input type="text" id="status" name="status"/><p>
		penaltyTimeValue:<input type="text" id="penaltyTimeValue" name="penaltyTimeValue"/><p>
		<input type="submit" />
	</form>
	<a href="/penalty/list">back to penalty_list</a>
</body>
</html>