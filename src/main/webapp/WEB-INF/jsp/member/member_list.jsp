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
	<input type="button" onclick="javascript:document.location.href=''" value="回首頁" />
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
				<th>Member ID</th>
				<th>Login Account</th>
				<th>Name</th>
				<th>Member type</th>
				<th>telephone</th>
				<th>mobile</th>
				<th>area</th>
<!-- 				<th>founder</th> -->
<!-- 				<th>ceo</th> -->
			</tr>
		</thead>
		<tbody>
			<c:forEach var="member" items="${members}">

				<tr>
					<td width="120px"><button
							onclick="javascript:document.location.href='/member/edit?id=${member.id}'">Edit</button>
						<button
							onclick="javascript:document.location.href='/member/delete?id=${member.id}'">Delete</button></td>
					<%-- 				<td width="20px">${member.id}</td> --%>
					<td width="100px">${member.loginAccount}</td>
					<td width="100px">${member.name}</td>
					<td width="200px">${member.memberType}</td>
					<td width="200px">${member.telephone}</td>
					<td width="200px">${member.mobile}</td>
					<td width="200px">${member.area}</td>
<%-- 					<c:if test="${member.type eq 'O' }"> --%>
<%-- 						<td width="200px">${member.founder}</td> --%>
<%-- 						<td width="200px">${member.ceo}</td> --%>
<%-- 					</c:if> --%>
					
				</tr>
			</c:forEach>
		</tbody>


	</table>

</body>
</html>
