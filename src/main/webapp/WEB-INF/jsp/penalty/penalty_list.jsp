<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Penalty List</title>
</head>
<body>
	<h1>Penalty List</h1>
	<button onclick="javascript:document.location.href='/penalty/add'">Add</button>
	<table>
		<tr>
			<th>ID</th>
			<th>雇主ID</th>
			<th>被檢舉者ID</th>
			<th>描述</th>
		</tr>
		<c:forEach items="${penalties}" var="penalty">
			<tr>
				<td>
				<button
					onclick="javascript:document.location.href='/penalty/edit?id=${penalty.id}'">Edit</button>
				<button
					onclick="javascript:document.location.href='/penalty/delete'">Delete</button>
				</td>
				<td>${penalty.id}</td>
				<td>${penalty.orderListId }</td>
				<td>${penalty.memberId }</td>
				<td>${penalty.description }</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>