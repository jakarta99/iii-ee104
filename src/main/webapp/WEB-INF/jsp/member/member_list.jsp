<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member List</title>
</head>
<body>

	<h2>Member List</h2>
	<button onclick="javascript:document.location.href='/member/add'">insert</button>


	<c:forEach var="member" items="${members}">
		<li>
			<button
				onclick="javascript:document.location.href='/member/edit?id=${member.id}'">Edit</button>
			<button
				onclick="javascript:document.location.href='/member/edit?id=${member.id}'">Delete</button>
			${member.id} ${member.loginAccount}
		</li>

	</c:forEach>
</body>
</html>