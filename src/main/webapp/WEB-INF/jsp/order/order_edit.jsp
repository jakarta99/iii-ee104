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
  
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
	integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
	integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
</head>

<body>
<script src="/js/backstageNav.js"></script>
<br>
<br>
<br>
<h1> Order Edit </h1>
<h4>edit no.${order.id}  Order</h4>

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
		dataType:'json',
		success:function(editResult){
			if(editResult.status == "SUCCESS"){
				alert("edit no." + editResult.obj.id + " order - STATUS:" + editResult.status);
				document.location.href="/order/list";
			}else{
				alert("edit no." + editResult.obj.id + " order - STATUS:" + editResult.status);
				alert("FAIL reason:" + editResult.messages);
			}
			
			
		}
	})
}
</script>
</body>
</html>