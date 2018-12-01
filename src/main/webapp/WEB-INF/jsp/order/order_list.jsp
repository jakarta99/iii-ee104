<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order List</title>
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
</head>
<body>
<h1> Order Lists </h1>

<hr>
<div>
	find all orders:
	<button onclick="findAllOrders()">findAllOrders</button>
</div>
<div>
	find by confirmation(Y/N):

		<select id="confirmation">
			<option value=""></option>　
			<option value="Y">Y</option>
			<option value="N">N</option>
		</select>
<!-- 	<input type="text" name="confirmation" id="confirmation" value=""/> -->
	<button onclick="findByConfirmation()">find</button>
</div>
<hr>


<table border="1">
	<thead>
		<tr class="tableTitle">
			<th><button onclick="javascript:document.location.href='/order/add'">Add</button></th>
			<th>id</th>
			<th>supplierId</th>
			<th>requesterId</th>
			<th>supplierAcception</th>
			<th>confirmation</th>
			<th>status</th>
			<th>jobTitle<p>(form REQUEST)</th>
			<th>timeValue<p>(form REQUEST)</th>
		</tr>
	</thead>
	<tbody>

	</tbody>
</table>

<div class="modifyResult"></div>

<script>
	$(document).ready(function(){
		findAllOrders();
	})
	
	function findAllOrders(){
		$("#confirmation").val("");  //如要查全部資料，需先將查詢confirmation的參數清空
		findByConfirmation();
	}
	
	function findByConfirmation(){
		$.ajax({
			url:'/order/query',  //如未傳入parameter(?confirmation=XXX)，該controller傳回所有資料
			type:'get',
			data:'confirmation=' + $("#confirmation").val(), 
			dataType:'json',
			success:function(orders){
				$("tbody").text(""); 
				$.each(orders, function(index, order){ //讀陣列資料(每筆資料為物件order)
					//產生首欄按鈕(edit、delete)
					var editBtn = $("<button onclick=\"javascript:document.location.href='/order/edit?id="+order.id+"'\">Edit</button>");
					var delBtn = $("<button onclick=\"deleteOrder("+order.id+")\">Delete</button>");						
					var btn =$("<td></td>").append([editBtn, delBtn]); 
					
					var id = $("<td></td>").text(order.id);					//將order的每個屬性放入欄
					var supplierId = $("<td></td>").text(order.supplierId);
					var requesterId = $("<td></td>").text(order.requesterId);
					var supplierAcception = $("<td></td>").text(order.supplierAcception);
					var confirmation = $("<td></td>").text(order.confirmation);
					var status = $("<td></td>").text(order.status);
					var jobTitle = $("<td></td>").text(order.requests.jobTitle);
					var timeValue = $("<td></td>").text(order.requests.timeValue);
						
					var row = $("<tr></tr>").append([btn, id, supplierId, requesterId, supplierAcception, confirmation, status, jobTitle, timeValue]);
					$("tbody").append(row);
				})
			}
		})
	}
	
	
	function deleteOrder(orderId){
		$.ajax({
			url:'/order/delete?id=' + orderId,
			type:'delete',
			dataType:'text',
			success:function(deleteResult){
				alert(deleteResult);
				findAllOrders();
			},
		})
	}

</script>



</body>
</html>