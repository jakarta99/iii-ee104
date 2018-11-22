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

<form action="/order/insert" method="post">

id:<input type="hidden" value="${order.id}" id="id" name="id"/>
supplierAcception(boolean):<input type="text" value="" id="supplierAcception" name="supplierAcception"><p>
confirmation(boolean):<input type="text" value="" id="confirmation" name="confirmation"><p>
status:<input type="text" value="" id="status" name="status"><p>
<input type="submit"/>
</form>
</body>
</html>