<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order List</title>
</head>
<body>


 <h1> Order Lists </h1>

<button onclick="javascript:document.location.href='/order/add'">Add</button><p>
<table border="1">
	<tr>
		<th></th>
		<th>id</th>
		<th>requestListId</th>
		<th>supplierId</th>
		<th>requesterId</th>
		<th>supplierAcception</th>
		<th>confirmation</th>
		<th>status</th>
		<th>jobTitle</th>
		<th>timeValue</th>
	</tr>
	<c:forEach var="order" items="${orders}">
		<tr>
			<td>
				<button onclick="javascript:document.location.href='/order/edit?id=${order.id}'">Edit</button>
				<button onclick="javascript:document.location.href='/order/delete?id=${order.id}'">Delete</button>
			</td>
			<td>${order.id}</td>
			<td>${order.requestListId}</td>
			<td>${order.supplierId}</td>
			<td>${order.requesterId}</td>
			<td>${order.supplierAcception}</td>
			<td>${order.confirmation}</td>
			<td>${order.status}</td>
			<td>${order.request.jobTitle}</td>
			<td>${order.request.timeValue}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>