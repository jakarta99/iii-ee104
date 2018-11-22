<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Penalty List</title>
</head>
<body>
	<h1>Penalty List</h1>
	<button onclick="javascript:document.location.href='/penalty/add'">Add</button>
	<c:forEach items="${penaltys}" var="penalty">
		<li>
			<button
				onclick="javascript:document.location.href='/penalty/edit?id=${penalty.id}'">Edit</button>
			<button onclick="javascript:document.location.href='/penalty/delete'">Delete</button>
			${penalty.id}
			${penalty.orderListId }
			${penalty.memberId }
			${penalty.description }
		</li>
	</c:forEach>

</body>
</html>