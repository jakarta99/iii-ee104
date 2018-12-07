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
<!-- 台灣縣市地區選單	 -->
<script src="/js/tw-city-selector.min.js"></script>
<!-- date picker -->
<script type="text/javascript" src="/js/moment.min.js"></script>
<script type="text/javascript" src="/js/bootstrap-datepicker.js"></script>
<script src="/js/locales/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />


<style>
	 article{
	 	margin-top:70px;
	 }
	 
	 article fieldset {
/* 		width: 500px; */
		border-radius: 20px;
		padding: 20px 20px 0px 20px; 
		border: 3px double #bebebe;
		margin: auto;
		margin-top: 10px; 
		margin-bottom: 20px; 
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
	 /* 	設定縣市地區選擇器的css樣式 */
	.county,.district {
	  padding: 0.375rem 0.75rem;
	  font-size: 1rem;
	  line-height: 1.5;
	  color: #495057;
	  background-color: #fff;
	  background-image: none;
	  background-clip: padding-box;
	  border: 1px solid #ced4da;
	  border-radius: 0.25rem;
	  transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
	}
 
</style>
</head>
<body>

<!-- 	<div id="navBar"></div> -->
<c:import url="/html/nav.html"/>

	<article>
		<input type="button" class="btn btn-primary btn-sm" onclick="javascript:document.location.href='/'" value="回首頁"  />
		<h2>Member List</h2>
		
		<form action="#" >
		<fieldset>
		<legend>Search</legend>
			<div >
				<label>帳號 :</label> 
				<input type="text" value="${param.account }" placeholder="帳號" id="account" name="account"/>
				<label>名字 :</label> 
				<input type="text" value="${param.name }" placeholder="名字" id="name" name="name"/>
				<label>會員類型 :</label> 
				<select  id="memberType" name="memberType">
					<option  value=""></option>
					<option  value="P">一般會員</option>
					<option  value="O">機構會員</option>
				</select>
			</div>
		
			<div >
				<label>出生起始日期:</label> 
				<input type="text" value="${param.birthDateStart }"  id="birthDateStart" name="signUpDateStart" autocomplete="off" />
				<input type="text" value="${param.birthDateEnd }" id="birthDateEnd" name="signUpDateEnd" autocomplete="off"/>	
			</div>
			<div >
				<label>email:</label> 
				<input type="text" 
						value="${param.email }" id="email" name="email">
				<label>Email驗證信確認(Y/N):</label>
				<label>Y</label> 
				<input type="radio" value="Y" name="emailVerification" />
				<label>N</label> 
				<input type="radio" value="N" name="emailVerification" />
			</div>
			<div >	
				<label>手機:</label> 
				<input type="text" 
						value="${param.mobile }" id="mobile" name="mobile">
			</div>
			<div >
				<label>縣市:</label> 
				<div style='display:inline' role="tw-city-selector" ></div>
			</div>
			
			<div >	
				<label>註冊起始日期 :</label> 			
				<input type="text" value="${param.signUpDateStart }"  id="signUpDateStart" name="signUpDateStart" autocomplete="off"/>
				<input type="text" value="${param.signUpDateEnd }" id="signUpDateEnd" name="signUpDateEnd" autocomplete="off"/>
			</div>
			
			<input type="button"  value="搜尋" id="searchButt" />
			</fieldset>
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
			alert("jjj")
			listMember();
			new TwCitySelector();
// 			$("form div").addClass("form-group");
// 			$("form input").addClass("form-control");
			
			
			var datePickerSetting = {
				format : "yyyy/mm/dd",
				autoclose : true,
				todayHighlight : true,
				language : 'zh-TW',
				clearBtn:true,
				startView:2
			};
			
			$('#birthDateStart').datepicker({datePickerSetting});
			$('#birthDateEnd').datepicker({datePickerSetting});
			$('#signUpDateStart').datepicker({datePickerSetting});
			$('#signUpDateEnd').datepicker({datePickerSetting})
			
		
			
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
				$("#memberTableBody").html("");
				$.getJSON("/member/query", $("form").serialize(),function(data){
					$.each(data, function(idx, member){
						var editButt= "<input type='button' class=\"btn btn-primary btn-sm\"  onclick=\"javascript:document.location.href='/member/edit?id="+member.id+"'\" value='修改'  />";
						var deleteButt="<input type='button' class=\"btn btn-primary btn-sm\"  id='deleteButt"+ member.id +"' value='刪除' />"
						$("#memberTableBody").append("<tr id='row"+ member.id +"'><td>"+editButt + deleteButt+"</td></tr>");					
						var memberRow = $("#row"+member.id);
						memberRow.append("<td >"+member.account+"</td>");
						memberRow.append("<td >"+member.name+"</td>");
						memberRow.append("<td >"+member.memberType+"</td>");
						memberRow.append("<td >"+member.email+"</td>");
						memberRow.append("<td >"+member.mobile+"</td>");
						memberRow.append("<td >"+ member.county + member.district + member.address +"</td>");		
						memberRow.append("<td >"+ new Date(member.signUpDate).toLocaleDateString()+"</td>");												
					})
					
				})
		
			
			})
			
		
			
			
			
			
			
		})	
				

	
	
	</script>
	

</body>
</html>