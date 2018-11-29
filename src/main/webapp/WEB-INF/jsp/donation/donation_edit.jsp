<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> edit donation </title>
</head>
<body>
<h1> edit memberId = ${donation.memberId} donation</h1>
<form action="/donation/update" method="post">
	<input type="hidden" value="${donation.id}" id="id" name="id"/>
	donateValue:<input type="text" value="${donation.value}" id="value" name="value"/><p>
	<input  type="submit"/>
</form>
</body>
</html>