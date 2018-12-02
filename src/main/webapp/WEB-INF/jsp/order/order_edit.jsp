<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Edit</title>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/sketchy/bootstrap.min.css" rel="stylesheet" integrity="sha384-5cy8WdlNAGqQwyB33aLiqJoRQQxZsc3TDUkSTahHAx2gMK3o0te7Xqm+nNLe4Ou3" crossorigin="anonymous">
</head>
<body>


<h1> Order Edit </h1>
<h4>edit no.${order.supplierId} supplier's  Order</h4>

<form>
	<input type="hidden" value="${order.id}" id="id" name="id"/>
	supplierAcception(Y/N):<input type="text" value="${order.supplierAcception}" id="supplierAcception" name="supplierAcception"><p>
	confirmation(Y/N):<input type="text" value="${order.confirmation}" id="confirmation" name="confirmation"><p>
	status:<input type="text" value="${order.status}" id="status" name="status"><p>
	<button type="button" onclick="updateOrder()" class="btn btn-outline-primary">update</button>
</form>
<a href="/order/list">back to order_list</a>


<script>
function updateOrder(){
	$.ajax({
		url:'/order/update',
		type:'put',
		data:$('form').serialize(),
		dataType:'text',
		success:function(editResult){
			alert(editResult);
			document.location.href="/order/list";
		}
	})
}
</script>
</body>
</html>