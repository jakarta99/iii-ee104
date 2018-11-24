<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Edit</title>
</head>
<body>


<h1> Order Edit </h1>
<h4>edit no.${order.supplierId} supplier's  Order</h4>

<form action="/order/update" method="post">
	<input type="hidden" value="${order.id}" id="id" name="id"/>
	supplierAcception(Y/N):<input type="text" value="" id="supplierAcception" name="supplierAcception"><p>
	confirmation(Y/N):<input type="text" value="" id="confirmation" name="confirmation"><p>
	status:<input type="text" value="" id="status" name="status"><p>
	<input type="submit"/>
</form>
<a href="/order/list">back to order_list</a>
</body>
</html>