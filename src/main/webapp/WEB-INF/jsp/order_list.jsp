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

<button onclick="javascript:document.location.href='/order/add'">Add</button>

<c:forEach items="${orders }" var="order">
<li>
<button onclick="javascript:document.location.href='/order/edit?id=${order.id}'">Edit</button>
<button onclick="javascript:document.location.href='/order/delete'">Delete</button>
${order.id }</li>
</c:forEach>
</body>
</html>