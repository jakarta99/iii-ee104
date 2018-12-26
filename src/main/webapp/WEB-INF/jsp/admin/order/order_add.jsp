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
<!-- <link href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.3/sketchy/bootstrap.min.css" rel="stylesheet" integrity="sha384-5cy8WdlNAGqQwyB33aLiqJoRQQxZsc3TDUkSTahHAx2gMK3o0te7Xqm+nNLe4Ou3" crossorigin="anonymous"> -->
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
<jsp:include page="../admin_layout/nav.jsp" />
<br>
<br>
<br>
<h1> Order Add </h1>

<form>

<!-- id:<input type="text" value="" id="id" name="id"/> -->
misson_Id:
<input type="text" value="" id="mission" name="mission"/><p> 

volunteer:
<input type="text" value="" id="volunteer" name="volunteer"/><p>

serviceRequesterId:
<input type="text" value="" id="serviceRequesterId" name="serviceRequesterId"/><p>

<label>orderAcception(Y/N):  </label>
<input type="radio" value="Y" name="orderAcception" />Y  
<input type="radio" value="N" name="orderAcception" />N<p>

<label>orderConfirmation(Y/N):  </label>
<input type="radio" value="Y" name="orderConfirmation" />Y  
<input type="radio" value="N" name="orderConfirmation" />N<p>

status:
<input type="text" value="" id="status" name="status"><p>

<button type="button" onclick="addOrder()" class="btn btn-outline-primary">add</button>
</form><p>
<a href="/admin/order/list">back to order_list</a>

<script>

function addOrder(){
	$.ajax({
		url:'/admin/order/insert',
		type:'post',
		data:$('form').serialize(),
		dataType:'json',
		success:function(addResult){
			if(addResult.status == "SUCCESS"){
				alert("add no." + addResult.obj.id + " order - STATUS:" + addResult.status);
				document.location.href="/admin/order/add";
			}else{
				alert("add no." + addResult.obj.id + " order - STATUS:" + addResult.status);
				alert("FAIL reason:" + addResult.messages);
			}
			
		},
	})
}

</script>
</body>
</html>