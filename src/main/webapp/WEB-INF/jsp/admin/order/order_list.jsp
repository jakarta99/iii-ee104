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
<!-- data tables -->
<!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" /> -->
<!-- <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script> -->

</head>
<body>
<script src="/js/backstageNav.js"></script>
<br>
<br>
<br>
<h2> Order Lists </h2>
<div>
	find all orders:
	<button id="find_all_btn">findAllOrders</button>
</div>
<hr>
<div>
	<form>
		id:
		<input type="text" value="" id="id" name="id"/><br>
		
		supplierId:
		<input type="text" value="" id="supplierId" name="supplierId"/><br>
		
		requesterId:
		<input type="text" value="" id="requesterId" name="requesterId"/><br>
		
		supplierAcception(Y/N):
		<input type="text" value="" id="supplierAcception" name="supplierAcception"/><br>
		
		confirmation(Y/N):
		<input type="text" value="" id="confirmation" name="confirmation"/><br>
		
		status:
		<input type="text" value="" id="status" name="status"/><br>
		
		<button type="button" id="find_btn">find</button>
	</form>
</div>

<hr>



<div id="myTable_length">
	<label>Show 
		<select name="myTable_length">
			<option value="3">3</option>
			<option value="6">6</option>
			<option value="10">10</option>
			<option value="15">15</option>
		</select> entries
	</label>
</div>

<div id="myTable_paginate">
<!-- 	<a id="myTable_previous" href="#">Previous</a> -->
	<button id="myTable_previous">Previous</button>
	<span id="myTable_pages" style="font-size:18px">0</span>
	<button id="myTable_next">Next</button>
<!-- 	<a id="myTable_next" href="#">Next</a> -->

</div>

<div id="myTable_info" style="font-size:18px">Showing 0 to 0 of 0 entries</div>

<table border="1" id="myTable"> 
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


<script>
	var thisPageSize = $("select[name='myTable_length']").val(); //一頁顯示幾筆
	var thisPageElements; //本頁幾筆資料
	var thisPage; //本頁的index
	var totalPages;
	var indexOfThisPageFirstData;
	
	$(document).ready(function(){
		findAllOrders(0,thisPageSize);
		//1.查詢全部資料
		$("#find_all_btn").click(function(){
			findAllOrders(0, thisPageSize);
		});
		
		//2.查詢部分條件資料
		$("#find_btn").click(function(){
			findOrders(0, thisPageSize);
		});

		//3.換頁功能
		//A.點擊動態生成的頁數標籤後，跳頁重新呼叫controller
		$("#myTable_pages").on("click",".pageNum",function(){
			var changePage = parseInt($(this).text()) - 1; //取得頁數值後減一(求index值)
			findOrders(changePage, thisPageSize);
		});
		//B.點擊前一頁、下一頁
		$("#myTable_previous").click(function(){
			if(thisPage > 0){
				findOrders(thisPage - 1, thisPageSize); //取得本頁頁數後減一(回前頁)
			}
		})
		
		$("#myTable_next").click(function(){
			if(thisPage + 1 < totalPages){
				findOrders(thisPage + 1, thisPageSize);
			}
		})
		
		//4.更改每頁資料筆數
		$("select[name='myTable_length']").change(function(){
			thisPageSize = $(this).val();
			//根據換頁前第一筆資料位置，推算換頁後應留在第幾頁(index)
			var changePageIndex = Math.floor((indexOfThisPageFirstData + 1) / thisPageSize);
			findOrders(changePageIndex, thisPageSize);
		})
				
	})
	
	function findAllOrders(pageNumber, pageSize){
		$("#id").val("");  
		$("#supplierId").val("");
		$("#requesterId").val("");
		$("#supplierAcception").val("");
		$("#confirmation").val("");
		$("#status").val("");
		findOrders(pageNumber, pageSize);
	}
	
	function findOrders(pageNumber, pageSize){
		$.ajax({
			url:'/order/query?pageNumber=' + pageNumber + '&pageSize=' + pageSize,  
			type:'post',
			data:$('form').serialize(),
			dataType:'json',
			success:function(orders){
// 				if(orders.status == "SUCCESS"){alert("");}else{}
				//1.讀取分頁各項資訊，初始化全域變數
					//本頁第一筆資料的index
					indexOfThisPageFirstData = orders.page.pageable.offset;
					
					//第index頁******待處理:頁數過多時要切割........
					thisPage = orders.page.pageable.pageNumber; 
		
					//orders.totalPages 共幾頁
					totalPages = orders.page.totalPages;
					
					//本頁共幾筆
					thisPageElements = orders.page.numberOfElements
				//A.顯示分頁資訊:Showing XXX to XXX of XXX entries
				var totalEntries = "Showing "+ (orders.page.totalElements > 0? indexOfThisPageFirstData + 1: indexOfThisPageFirstData)  //(indexOfThisPageFirstData + 1)
								+ " to " + (indexOfThisPageFirstData + thisPageElements)  //orders.numberOfElements本頁共幾筆資料
								+ " of " + orders.page.totalElements + " entries";  //orders.totalElements  所有資料共幾筆
				$("#myTable_info").text(totalEntries);
				
				//B.顯示每頁超連結
				if(totalPages > 0){
					var pageLinks = "";
					for(var i = 1; i <= totalPages; i++){ 
						if(thisPage + 1 == i){  //標示當下頁數，顯示為粗體且無超連結
							pageLinks += "<a class='pageNum' style='font-weight:bold'>" + i +"</a>  ";
						}else{   //其他頁數顯示超連結
							pageLinks += "<a class='pageNum' href='#'>" + i +"</a>  ";
						}
					}
					$("#myTable_pages").html(pageLinks);
				}else{
					$("#myTable_pages").text(" 0 "); //如查無資料，則顯示0頁
				}
				
				
				
				//------------------------------------------------------------------------------------------
				//2.產生表格
				$("tbody").text(""); 
				$.each(orders.page.content, function(index, order){ //讀陣列資料(每筆資料為物件order)
					//產生首欄按鈕(edit、delete)
					var editBtn = $("<button onclick=\"javascript:document.location.href='/order/edit?id="+order.id+"'\">Edit</button>");
					var delBtn = $("<button onclick=\"deleteOrder("+order.id+")\">Delete</button>");						
					var btn =$("<td></td>").append([editBtn, delBtn]); 
					//將order的每個屬性放入欄位
					var id = $("<td></td>").text(order.id);					
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
				
				//------------------------------------------------------------------------------------------
			}
		})
	}
	
	
	function deleteOrder(orderId){  //刪除資料的按鈕所觸發的方法(#delBtn的onclick)
		$.ajax({
			url:'/order/delete?id=' + orderId,
			type:'delete',
			dataType:'json',
			success:function(deleteResult){
				if(deleteResult.status == "SUCCESS"){
					alert("delete no." + deleteResult.obj.id + " order - STATUS:" + deleteResult.status);
					if(thisPageElements == 1){ //如果刪了該頁最後一筆資料，則直接跳轉到上一頁(否則留在該頁會無資料可供顯示)
						thisPage--;
						findOrders(thisPage, thisPageSize);
					}else{
						findOrders(thisPage, thisPageSize);
					}
				}else{
					alert("delete no." + deleteResult.obj.id + " order - STATUS:" + deleteResult.status);
					alert("FAIL reason:" + deleteResult.messages);
				}
			},
		})
	}
	
	

	

</script>



</body>
</html>