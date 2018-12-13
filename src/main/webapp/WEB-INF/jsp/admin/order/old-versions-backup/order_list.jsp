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

<button onclick="javascript:document.location.href='/order/add'">Add</button><p>
<table border="1">
	<thead>
	<tr>
		<th></th>
		<th>id</th>
		<th>supplierId</th>
		<th>requesterId</th>
		<th>supplierAcception</th>
		<th>confirmation</th>
		<th>status</th>
		<th>jobTitle</th>
		<th>timeValue</th>
	</tr>
	</thead>
	
	<tbody>
	<c:forEach var="order" items="${orders}">
		<tr>
			<td>
				<button onclick="javascript:document.location.href='/order/edit?id=${order.id}'">Edit</button>
				<button onclick="javascript:document.location.href='/order/delete?id=${order.id}'">Delete</button>
			</td>
			<td>${order.id}</td>
			<td>${order.supplierId}</td>
			<td>${order.requesterId}</td>
			<td>${order.supplierAcception}</td>
			<td>${order.confirmation}</td>
			<td>${order.status}</td>
			<td>${order.requests.jobTitle}</td>
			<td>${order.requests.timeValue}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>

<script>
//【findAll_version1  (double foreach)】	
//	function findAll(){
//		$.ajax({
//			url:'/order/query',
//			type:'post',
//			dataType:'json',
//			success:function(orders){
//				$.each(orders, function(index, order){ //讀陣列資料(每筆資料為物件order)，放入列
//					var row = $("<tr></tr>");
//					var col = $("<td></td>");
//					var editBtn = $("<button onclick=\"javascript:document.location.href='/order/edit?id="+order.id+"'\">Edit</button>");
//					var delBtn = $("<button onclick=\"javascript:document.location.href='/order/delete?id="+order.id+"'\">Delete</button>");
//					row.append([col, editBtn, delBtn]);
//					$.each(order,function(orderField, orderValue){   //讀物件order的屬性值，放入欄
//						if(typeof orderValue != 'object'){
//							col.text(orderValue);
//						}else{
//							col.text(orderValue.jobTitle);			//order的屬性為物件的情況
//						}
//						row.append(col);
//						col = $("<td></td>");
//					})
//					$("tbody").append(row);
//				})
//			}
//		})
//	}
</script>
</body>
</html>