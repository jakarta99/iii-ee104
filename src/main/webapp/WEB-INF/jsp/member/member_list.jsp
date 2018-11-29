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
	<table border="1">
		<tr>
			<button
				onclick="javascript:document.location.href='/member/add?memberType=P'">一般會員註冊</button>
			<button
				onclick="javascript:document.location.href='/member/add?memberType=O'">公益團體註冊</button>
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
		<tbody>
			<c:forEach var="member" items="${members}">

				<tr id="row${member.id}">
					<td width="150px">
						<button
							onclick="javascript:document.location.href='/member/edit?id=${member.id}'">Edit</button>
						<button
							class="delete"
							onclick="javascript:document.location.href='/member/delete?id=${member.id}'">Delete</button>
					</td>
					<%-- 				<td width="20px">${member.id}</td> --%>
					<td width="150px" class="loginAccount">${member.loginAccount}</td>
					<td width="100px" class="name">${member.name}</td>
					<td width="100px" class="memberType">${member.memberType}</td>
					<td width="200px" class="email">${member.email}</td>
					<td width="200px" class="mobile">${member.mobile}</td>
					<td width="200px" class="signUpDate">${member.signUpDate}</td>
<%-- 					<td width="50px" class="emailVerification">${member.emailVerification}</td> --%>
					

					
				</tr>
			</c:forEach>
		</tbody>
	</table>
	

</body>
</html>