<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request list</title>
</head>
<body>
	<h1>request list</h1>
	<button onclick="javascript:document.location.href='/request/add'">add</button>
	<table border="1">
	<tr>
		<th>選項</th>
		<th>id</th>
		<th>jobArea</th>
		<th>jobTitle</th>
		<th>memberId</th>
		<th>serviceType</th>
		<th>termType</th>
		<th>timeValue</th>
	</tr>
	
	
	
	
	<c:forEach items="${requests}" var="request">
		<tr>
			<td>
			<button onclick="javascript:document.location.href='/request/edit?id=${request.id}'">Edit</button>
			<button onclick="javascript:document.location.href='/request/delete?id=${request.id}'">Delete</button>
			</td>
			<td>${request.id}</td>
			<td>${request.jobArea}</td>
			<td>${request.jobTitle}</td>
			<td>${request.memberId}</td>
			<td>${request.serviceType}</td>
			<td>${request.termType}</td>
			<td>${request.timeValue}</td>	
		</tr>
	</c:forEach>
	</table>
</body>
</html>