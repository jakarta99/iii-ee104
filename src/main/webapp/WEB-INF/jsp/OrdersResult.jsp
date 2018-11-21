<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Try JSP</title>
</head>
<body>
<table border="1">
	<tr>
		<th>requestListId [Order]</th>
		<th>supplierId [Order]</th>
		<th>requesterId [Order]</th>
		<th>supplierAcception [Order]</th>
		<th>confirmation [Order]</th>
		<th>status [Order]</th>
		
		<th>jobTitle [Requests]</th>
		<th>timeValue [Requests]</th>
		<th>jobArea [Requests]</th>
	</tr>
	<c:forEach var="order" items="${orderBean}">
	<tr>
		<td>${order.requestListId}</td>
		<td>${order.supplierId}</td>
		<td>${order.requesterId}</td>
		<td>${order.supplierAcception}</td>
		<td>${order.confirmation}</td>
		<td>${order.status}</td>
		<td>${order.request.jobTitle}</td>
		<td>${order.request.timeValue}</td>
		<td>${order.request.jobArea}</td>
	</tr>
	</c:forEach>
</table>
<div>${dataNotFound}</div>
<div>${wrongInput}</div>
</body>
</html>