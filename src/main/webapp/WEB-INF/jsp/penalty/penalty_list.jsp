<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>


<meta charset="UTF-8">
<title>Penalty List</title>
</head>
<body>
	<h1>Penalty List</h1>
	<button onclick="javascript:document.location.href='/penalty/add'" class="btn btn-primary">Add</button>
	<table class="table table-light table-sm table-striped table-bordered">
	<thead class="thead-dark">
		<tr>
			<th></th>
			<th>ID</th>
			<th>雇主ID</th>
			<th>被檢舉者ID</th>
			<th>逞罰時間</th>
			<th>處理進度</th>
			<th>描述</th>
		</tr>
	</thead>
		<c:forEach items="${penalties}" var="penalty">
			<tr>
				<td>
				<button
					onclick="javascript:document.location.href='/penalty/edit?id=${penalty.id}&penaltyTimeValue=${penalty.penaltyTimeValue}&status=${penalty.status}'" class="btn btn-success">Edit</button>
				<button
					onclick="javascript:document.location.href='/penalty/delete?id=${penalty.id}'" class="btn btn-danger">Delete</button>
				</td>
				<td>${penalty.id}</td>
				<td>${penalty.orderListId }</td>
				<td>${penalty.memberId }</td>
				<td>${penalty.penaltyTimeValue}</td>
				<td>${penalty.status}</td>
				<td>${penalty.description}</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>