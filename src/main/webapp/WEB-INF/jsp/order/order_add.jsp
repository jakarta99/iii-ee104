<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Add</title>
</head>
<body>


 <h1> Order Add </h1>

<form action="/order/insert" method="post">

<!-- id:<input type="text" value="" id="id" name="id"/> -->
requestListId(FK, range:1~6):<input type="text" value="" id="requestListId" name="requestListId"/><p>
supplierId:<input type="text" value="" id="supplierId" name="supplierId"/><p>
requesterId<input type="text" value="" id="requesterId" name="requesterId"/><p>
supplierAcception(Y/N):<input type="text" value="" id="supplierAcception" name="supplierAcception"><p>
confirmation(Y/N):<input type="text" value="" id="confirmation" name="confirmation"><p>
status:<input type="text" value="" id="status" name="status"><p>
<input type="submit"/>
</form><p>
<a href="/order/list">back to order_list</a>

</body>
</html>