<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member List</title>
<style>

	 td{
	 	text-align:center;
	 }
	 button{
		 margin:5px;
	 }
 
</style>
</head>
<body>
	<input type="button" onclick="javascript:document.location.href='/'" value="回首頁" />
	<h2>Member List</h2>
	<table border="1" >
		<tr>
			<button
				onclick="javascript:document.location.href='/member/add?memberType=P'">新增一般會員</button>
			<button
				onclick="javascript:document.location.href='/member/add?memberType=O'">新增公益團體</button>
		</tr>

		<thead>
			<tr>
				<th>會員編號</th>
				<th>會員帳號</th>
				<th>會員姓名</th>
				<th>會員型態</th>
				<th>會員信箱</th>
				<th>會員手機</th>
				<th>註冊日期</th>
<!-- 				<th>驗證信確認</th> -->
			
			</tr>
		</thead>
		<tbody id="memberTableBody">
			<!-- 由程式產生出的member清單 -->
			
		</tbody>
	</table>
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
	
// 		列出會員清單函式
		function listMember(){
			$("#memberTableBody").text("");
			$.getJSON("/member/query",function(data){
				$.each(data, function(idx, member){
					var editButt= "<button onclick=\"javascript:document.location.href='/member/edit?id="+member.id+"'\">修改</button>";
					var deleteButt="<input type='button' id='deleteButt"+ member.id +"' value='刪除' />"
					$("#memberTableBody").append("<tr id='row"+ member.id +"'><td>"+editButt + deleteButt+"</td></tr>");					
					var memberRow = $("#row"+member.id);
					memberRow.append("<td width='150px' >"+member.loginAccount+"</td>");
					memberRow.append("<td width='150px' >"+member.name+"</td>");
					memberRow.append("<td width='150px' >"+member.memberType+"</td>");
					memberRow.append("<td width='150px' >"+member.email+"</td>");
					memberRow.append("<td width='150px' >"+member.mobile+"</td>");
					memberRow.append("<td width='150px' >"+ new Date(member.signUpDate).toLocaleDateString()+"</td>");
											
				})
			})
		}
	
	
		
		$(document).ready(function(){
			listMember();
			
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


			
			
			
			
			
		})	
				

	
	
	</script>
	

</body>
</html>