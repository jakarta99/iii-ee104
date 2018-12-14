<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
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
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<title>TimeLedger List</title>
<style>
fieldset {
	width: 1200px;
	border-radius: 20px;
	padding: 20px;
	margin: 20px;
	border: 3px double #bebebe;
	margin: auto
}

.center {
	text-align: center
}

.margintop{
	 margin-top:70px;
}
</style>
</head>
<body>
	<jsp:include page="../admin_layout/nav.jsp" />
<!-- 	<div id="navBar"></div> -->
	<div class="margintop"></div>
	<h1 class="center">TimeLedger List</h1>
	<fieldset>
		<button onclick="javascript:document.location.href='/admin/time-ledger/add'"
			class="btn btn-outline-secondary">Add</button>
		<button id="findAll" onclick="findAll()" class="btn btn-outline-secondary">findAll</button>
		<hr>
		<form>
			id :
			<input type="text" value="" placeholder="id" id="id" name="id"/>
			memberId :
			<input type="text" value="" placeholder="memberId" id="memberId" name="memberId"/>
<!-- 			transactionTime : -->
<!-- 			<input type="text" value="" id="transactionTime" name="transactionTime"/> -->
			description:
			<input type="text" value="" id="description" name="description"/><p>
			depositValue :
			<input type="text" value="" id="depositValue" name="depositValue"/>
			withdrawalValue: 
			<input type="text" value=""  id="withdrawalValue" name="withdrawalValue"/>
			balanceValue:
			<input type="text" value="" id="balanceValue" name="balanceValue"/>
			<button type="button" id="search" onclick="findTimeLedger()" class="btn btn-outline-secondary">search</button>
		</form>
		<hr>
		<table class="table table-hover">
			<div id="numOfPage">
				<label>
					Show 
					<select name="numOfPage">
						<option value="3">3</option>
						<option value="6">6</option>
						<option value="10">10</option>
						<option value="15">15</option>
					</select>
					entries
				</label>
			</div>	
			<thead>
				<tr>
					<th>選項</th>
					<th scope="col">id</th>
					<th scope="col">memberId</th>
					<th scope="col">transactionTime</th>
					<th scope="col">description</th>
					<th scope="col">depositValue</th>
					<th scope="col">withdrawalValue</th>
					<th scope="col">balanceValue</th>
				</tr>
			</thead>
			<tbody id="timeLedgerTbody">
			</tbody>
		</table>
		<div id="information">Showing 0 to 0 of 0 entries</div>		
		<div id="paginate" class="center">
			<a id="previous" href="#">Previous</a>
			<span id="pages">pagesHere</span>
			<a id="next" href="#">Next</a>
		</div>
		<div>
			<a href='/'><i class="fas fa-home"></i>back to HOME</a>
		</div>
	</fieldset>
	
	<script>
		var thisPageSize = $("select[name='numOfPage']").val();
		var thisPageElements;	//此頁幾筆資料
		var thisPage;			//此頁的index
		var totalPages;
		var indexOfThisPageFirstData;
		
		function findTimeLedger(pageNumber, pageSize) {
// 			$("#timeLedgerTbody").text("");
// 			$.getJSON("/time-ledger/query", $("form").serialize(), function(data) {
// 				$.each(data, function(index, timeLedger) {
// 					var editButton = "<button class=\"btn btn-outline-secondary\" onclick=\"javascript:document.location.href='/time-ledger/edit?id="
// 						+ timeLedger.id	+ "'\">Edit</button>";
// 					var deleteButton = "<button class=\"btn btn-outline-secondary\" onclick=\"deleteTimeLedger("
// 						+ timeLedger.id	+ ")\">Delete</button>";
// 					$("#timeLedgerTbody").append("<tr id='row"+ timeLedger.id +"'><td>"	+ editButton + deleteButton	+ "</td></tr>");
// 					var timeLedgerRow = $("#row"+ timeLedger.id);
// 					timeLedgerRow.append("<td >"+ timeLedger.id	+ "</td>");
// 					timeLedgerRow.append("<td >"+ timeLedger.memberId + "</td>");
// 					timeLedgerRow.append("<td >"+ timeLedger.transactionTime + "</td>");
// 					timeLedgerRow.append("<td >"+ timeLedger.description + "</td>");
// 					timeLedgerRow.append("<td >"+ timeLedger.depositValue + "</td>");
// 					timeLedgerRow.append("<td >"+ timeLedger.withdrawalValue + "</td>");
// 					timeLedgerRow.append("<td >"+ timeLedger.balanceValue + "</td>");
// 				})
// 			})
			$.ajax({
				url:'/admin/time-ledger/query?pageNumber=' + pageNumber + '&pageSize=' + pageSize,  
				type:'post',
				data:$('form').serialize(),
				dataType:'json',
				success:function(data){
					//讀取分頁各項資訊，初始化全域變數
						//此頁第一筆資料的index
						indexOfThisPageFirstData = data.page.pageable.offset;
						//第index頁
						thisPage = data.page.pageable.pageNumber; 
						//共幾頁
						totalPages = data.page.totalPages;
						//此頁共幾筆資料
						thisPageElements = data.page.numberOfElements
					//A.顯示分頁資訊:Showing XXX to XXX of XXX entries
					var totalEntries = "Showing "+ (data.page.totalElements > 0 ? indexOfThisPageFirstData + 1 : indexOfThisPageFirstData)  //(indexOfThisPageFirstData + 1)
										+ " to " + (indexOfThisPageFirstData + thisPageElements)  //此頁共幾筆資料
										+ " of " + data.page.totalElements + " entries";  //所有資料共幾筆
					$("#information").text(totalEntries);
					//B.顯示每頁超連結
					if(totalPages > 0){
						var pageLinks = "";
						for(var i = 1; i <= totalPages; i++){
							if(thisPage + 1 == i){  //標示當下頁數，粗體且無超連結
								pageLinks += "<a class='pageNum' style='font-weight:bold'>" + i +"</a>  ";
							}else{   				//其他頁數顯示超連結
								pageLinks += "<a class='pageNum' href='#'>" + i +"</a>  ";
							}
						}
						$("#pages").html(pageLinks);
					}else{
						$("#pages").text(" 0 "); //如查無資料，則顯示0頁
					}
					
					$("#timeLedgerTbody").text(""); 
					$.each(data.page.content, function(index, timeLedger){
						var editButton = $("<button class=\"btn btn-outline-secondary\" onclick=\"javascript:document.location.href='/admin/time-ledger/edit?id="
		 						+ timeLedger.id	+ "'\">Edit</button>");
						var deleteButton = $("<button class=\"btn btn-outline-secondary\" onclick=\"deleteTimeLedger("
		 						+ timeLedger.id	+ ")\">Delete</button>");						
						var button =$("<td></td>").append([editButton, deleteButton]); 
						
						var id = $("<td></td>").text(timeLedger.id);					
						var memberId = $("<td></td>").text(timeLedger.memberId);
						var transactionTime = $("<td></td>").text(timeLedger.transactionTime);
						var description = $("<td></td>").text(timeLedger.description);
						var depositValue = $("<td></td>").text(timeLedger.depositValue);
						var withdrawalValue = $("<td></td>").text(timeLedger.withdrawalValue);
						var balanceValue = $("<td></td>").text(timeLedger.balanceValue);
	
						var row = $("<tr></tr>").append([button, id, memberId, transactionTime, description, depositValue, withdrawalValue, balanceValue]);
						$("#timeLedgerTbody").append(row);
					})
				}
			})
		}

		function findAll(pageNumber, pageSize){
			$("#id").val("");
			$("#memberId").val("");
			$("#transactionTime").val("");
			$("#description").val("");
			$("#depositValue").val("");
			$("#withdrawalValue").val("");
			$("#balanceValue").val("");
			findTimeLedger(pageNumber, pageSize);
		}

		function deleteTimeLedger(id) {
			$.ajax({
				url : '/admin/time-ledger/delete?id=' + id,
				type : 'delete',
				dataType : 'json',
				success : function(deleteResult) {
					if(deleteResult.status == "SUCCESS"){
						alert("delete no." + deleteResult.obj.id + " timeLedger - STATUS : " + deleteResult.status);
						if(thisPageElements == 1){ //如果刪了該頁最後一筆資料，則直接跳轉到上一頁(否則留在該頁會無資料可供顯示)
							thisPage--;
							findTimeLedger(thisPage, thisPageSize);
						}else{
							findTimeLedger(thisPage, thisPageSize);
						}
					}else{
						alert("delete no." + deleteResult.obj.id + " timeLedger - STATUS : " + deleteResult.status);
						alert("FAIL reason:" + deleteResult.messages);
					}
// 					alert(deleteResult);
// 					findAll();
				},
			})
		}

		$(document).ready(function() {
// 			$.get("/html/nav.html",function(data){
// 				$("#navBar").html(data);
// 			});
			
			findAll(0,thisPageSize);
			
			$("#findAll").click(function(){
				findAll(0, thisPageSize);
			});
			
			$("#search").click(function(){
				findTimeLedger(0, thisPageSize);
			});

			//點選頁數後，跳頁重新呼叫controller
			$("#pages").on("click",".pageNum",function(){	//index值，取得頁數值後減一
				var changePage = parseInt($(this).text()) - 1; 
				findTimeLedger(changePage, thisPageSize);
			});

			$("#previous").click(function(){				//上一頁，取得此頁頁數後減一
				if(thisPage > 0){
					findTimeLedger(thisPage - 1, thisPageSize); 
				}
			})
			
			$("#next").click(function(){					//下一頁，取得此頁頁數後加一
				if(thisPage + 1 < totalPages){
					findTimeLedger(thisPage + 1, thisPageSize);
				}
			})
			
			$("select[name='numOfPage']").change(function(){//更改每頁資料筆數
				thisPageSize = $(this).val();
				//根據換頁前第一筆資料位置，推算換頁後應留在第幾頁(index)
				var changePageIndex = Math.floor((indexOfThisPageFirstData + 1) / thisPageSize);
				findTimeLedger(changePageIndex, thisPageSize);
			})	
		})
	</script>
</body>
</html>