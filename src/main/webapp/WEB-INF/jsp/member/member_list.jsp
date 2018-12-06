<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member List</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
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
<!-- date picker -->
<script type="text/javascript" src="/js/moment.min.js"></script>
<script type="text/javascript" src="/js/bootstrap-datepicker.js"></script>
<script src="/js/locales/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />


<style>
	 article{
	 	margin-top:70px;
	 }

	 article td{
	 	text-align:center;
	 }
	 article .btn{
	 	margin-left:10px;
	 }
	 article button{
		 margin:15px;
	 }
 
</style>
</head>
<body>

<!-- 	<div id="navBar"></div> -->
<c:import url="/html/nav.html"/>

	<article>
		<input type="button" class="btn btn-primary btn-sm" onclick="javascript:document.location.href='/'" value="回首頁"  />
		<h2>Member List</h2>
		
		<form action="#">
			<label>名字 :</label> 
			<input type="text" value="${param.name }" placeholder="名字" id="name" name="name"/>
			<label>帳號 :</label> 
			<input type="text" value="${param.account }" placeholder="帳號" id="account" name="account"/>
			<label>註冊起始日期 :</label> 
			<input type="text" value="${param.signUpDateStart }"  id="signUpDateStart" name="signUpDateStart"/>
			<input type="text" value="${param.signUpDateEnd }" id="signUpDateEnd" name="signUpDateEnd"/>
			<input type="submit" value="搜尋" id="searchButt" />
		</form>
		
		<table  class="table table-striped table-bordered">
			<tr>
				<button class="btn btn-primary btn-sm"
					onclick="javascript:document.location.href='/member/add?memberType=P'">新增一般會員</button>
				<button class="btn btn-primary btn-sm"
					onclick="javascript:document.location.href='/member/add?memberType=O'">新增公益團體</button>
			</tr>
	
			<thead>
				<tr>
					<th scope="col">會員編號</th>
					<th scope="col">會員帳號</th>
					<th scope="col">會員姓名</th>
					<th scope="col">會員型態</th>
					<th scope="col">會員信箱</th>
					<th scope="col">會員手機</th>
					<th scope="col">會員居住地址</th>
					<th scope="col">註冊日期</th>
	<!-- 				<th>驗證信確認</th> -->
				
				</tr>
			</thead>
			<tbody id="memberTableBody">
				<!-- 由程式產生出的member清單 -->
				
			</tbody>
		</table>
	</article>
	

	<script>
	
// 		列出會員清單函式
		function listMember(){
			$("#memberTableBody").text("");
			$.getJSON("/member/query",function(data){
				$.each(data, function(idx, member){
					var editButt= "<input type='button' class=\"btn btn-primary btn-sm\"  onclick=\"javascript:document.location.href='/member/edit?id="+member.id+"'\" value='修改'  />";
					var deleteButt="<input type='button' class=\"btn btn-primary btn-sm\" id='deleteButt"+ member.id +"' value='刪除' />"
					$("#memberTableBody").append("<tr id='row"+ member.id +"'><td>"+editButt + deleteButt+"</td></tr>");					
					var memberRow = $("#row"+member.id);
					memberRow.append("<td >"+member.account+"</td>");
					memberRow.append("<td >"+member.name+"</td>");
					memberRow.append("<td >"+member.memberType+"</td>");
					memberRow.append("<td >"+member.email+"</td>");
					memberRow.append("<td >"+member.mobile+"</td>");
					memberRow.append("<td >"+ member.county + member.district + member.address +"</td>");		
					memberRow.append("<td >"+ new Date(member.signUpDate).toLocaleDateString()+"</td>");
// 					memberRow.append("<td >"+ member.signUpDate +"</td>");
											
				})
			})
		}
	
	
		
		$(document).ready(function(){
			$('#signUpDateStart').datepicker({
				format : "yyyy/mm/dd",
				autoclose : true,
				calendarWeeks : true,
				todayHighlight : true,
				language : 'zh-TW',
				clearBtn:true
			})
			$('#signUpDateEnd').datepicker({
						format : "yyyy/mm/dd",
						autoclose : true,
						calendarWeeks : true,
						todayHighlight : true,
						language : 'zh-TW',
						clearBtn:true
					})
			
// 			listMember();
			
			//將deleteButt綁定click事件
			$("#memberTableBody").on("click", "input[value='刪除']", function(){
				var memberId = $(this).attr("id").substring(10);
				$.ajax({
					type: "post",
					dataType: "json",         
					url: "/member/delete",
					data: {"id":memberId}					
				})
				.done(function(data){
					alert(data.msg);
					listMember();
				})			
			})
			
			$("#searchButt").click(function() {
				$("#memberTableBody").text("");
				$.getJSON("/member/query", $("form").serialize(),function(data){
					$.each(data, function(idx, member){
						var editButt= "<input type='button' class=\"btn btn-primary btn-sm\"  onclick=\"javascript:document.location.href='/member/edit?id="+member.id+"'\" value='修改'  />";
						var deleteButt="<input type='button' class=\"btn btn-primary btn-sm\" id='deleteButt"+ member.id +"' value='刪除' />"
						$("#memberTableBody").append("<tr id='row"+ member.id +"'><td>"+editButt + deleteButt+"</td></tr>");					
						var memberRow = $("#row"+member.id);
						memberRow.append("<td >"+member.account+"</td>");
						memberRow.append("<td >"+member.name+"</td>");
						memberRow.append("<td >"+member.memberType+"</td>");
						memberRow.append("<td >"+member.email+"</td>");
						memberRow.append("<td >"+member.mobile+"</td>");
						memberRow.append("<td >"+ member.county + member.district + member.address +"</td>");		
						memberRow.append("<td >"+ new Date(member.signUpDate).toLocaleDateString()+"</td>");
//	 					memberRow.append("<td >"+ member.signUpDate +"</td>");												
					})
				})
			})

			
		
		
			
			
			
			
			
		})	
				

	
	
	</script>
	

</body>
</html>