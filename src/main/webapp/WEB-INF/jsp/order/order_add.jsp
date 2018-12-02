<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Add</title>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/sketchy/bootstrap.min.css" rel="stylesheet" integrity="sha384-5cy8WdlNAGqQwyB33aLiqJoRQQxZsc3TDUkSTahHAx2gMK3o0te7Xqm+nNLe4Ou3" crossorigin="anonymous">
</head>
<body>


<h1> Order Add </h1>

<form>

<!-- id:<input type="text" value="" id="id" name="id"/> -->
requestList_Id(FK, range:1~11):
<input type="text" value="" id="requests" name="requests"/><p> 

supplierId:
<input type="text" value="" id="supplierId" name="supplierId"/><p>

requesterId:
<input type="text" value="" id="requesterId" name="requesterId"/><p>

supplierAcception(Y/N):
<input type="text" value="" id="supplierAcception" name="supplierAcception"><p>

confirmation(Y/N):
<input type="text" value="" id="confirmation" name="confirmation"><p>

status:
<input type="text" value="" id="status" name="status"><p>

<button type="button" onclick="addOrder()" class="btn btn-outline-primary">add</button>
</form><p>
<a href="/order/list">back to order_list</a>

<script>

function addOrder(){
	$.ajax({
		url:'/order/insert',
		type:'post',
		data:$('form').serialize(),
		dataType:'text',
		success:function(addResult){
			alert(addResult);
			document.location.href="/order/add";
		},
	})
}

</script>
</body>
</html>