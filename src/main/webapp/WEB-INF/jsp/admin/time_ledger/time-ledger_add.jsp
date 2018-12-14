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
	width: 800px;
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
	<h1 class="center">TimeLedger Add</h1>

	<form action="/admin/time-ledger/insert" method="post">
		<fieldset>
			<!-- id:<input type="text" value="" id="id" name="id"/> -->
			<div class="form-group">
				memberId:<input type="text" value="" id="memberId" name="memberId"
					class="form-control" />
			</div>
			<!-- 			<div class="form-group"> transactionTime:-->
			<input type="hidden" value="" id="transactionTime"
				name="transactionTime" class="form-control" />
			<!-- 			</div> -->
			<!-- 			<div class="form-group"> description:-->
			<input type="hidden" value="" id="description" name="description"
				class="form-control" />
			<!-- 			</div> -->
			<div class="form-group">
				depositValue:<input type="text" value="" id="depositValue"
					name="depositValue" class="form-control" />
			</div>
			<div class="form-group">
				withdrawalValue:<input type="text" value="" id="withdrawalValue"
					name="withdrawalValue" class="form-control" />
			</div>
			<!-- 			<div class="form-group"> balanceValue:-->
			<input type="hidden" value="" id="balanceValue" name="balanceValue"
				class="form-control" />
			<!-- 			</div> -->
			<div class="form-group">
				<button type="button" onclick="addTimeLedger()"
					class="btn btn-outline-secondary">Add</button>
				<input type="reset" class="btn btn-outline-secondary" />
			</div>
			<div>
				<a href='/admin/time-ledger/list'><i
					class="fas fa-arrow-alt-circle-left"></i>back to TimeLedger List</a>
			</div>
		</fieldset>
	</form>
	<script>
		function addTimeLedger() {
			$.ajax({
				url : '/admin/time-ledger/insert',
				type : 'post',
				data : $('form').serialize(),
				dataType : 'json',
				success : function(addResult) {
// 					alert(addResult);
// 					document.location.href = "/time-ledger/add";
					if(addResult.status == "SUCCESS"){
						alert("add no." + addResult.obj.id + " timeLedger - STATUS : " + addResult.status);
						document.location.href="/admin/time-ledger/add";
					}else{
						alert("add no." + addResult.obj.id + " timeLedger - STATUS : " + addResult.status);
						alert("FAIL reason:" + addResult.messages);
					}
				},
			})
		}
		
		$(document).ready(function() {
// 			$.get("/html/nav.html",function(data){
// 				$("#navBar").html(data);
// 			});
		})
	</script>
</body>
</html>