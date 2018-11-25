<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Penalty Edit</title>
</head>
<body>

	<h1>Penalty Edit</h1>
	<h4>edit no.${penalty.id} penalty list</h4>
	
	<form action="/penalty/update" method="post">
		<input type="hidden" value="${penalty.id}" id="id" name="id"/>
		懲罰時間:<input type="text" value="${penalty.penaltyTimeValue}" id="penaltyTimeValue" name="penaltyTimeValue"><p>
		處理進度:<input type="text" value="${penalty.status}" id="status" name="status"><p>
		<input type="submit">
	</form>

<a href="/penalty/list">back to penalty_list</a>
</body>
</html>