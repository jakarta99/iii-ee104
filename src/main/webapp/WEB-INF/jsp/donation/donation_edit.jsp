<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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

<title> edit donation </title>
</head>
<body>
<script src="/js/backstageNav.js"></script>
<br>
<br>
<br>
<h1> edit memberId = ${donation.memberId} donation</h1>
<form action="/donation/update" method="post">
	id<input type="text" value="${donation.id}" id="id" name="id" readonly/><p>
	memberId<input type="text" value="${donation.memberId}" id="memberId" name="memberId" readonly/><p>
	organizationId<input type="text" value="${donation.organizationId}" id="memberId" name="memberId" readonly/><p>
	donateTime<input type="text" value="${donation.donateTime}" id="memberId" name="memberId" readonly/><p>
	donateValue:<input type="text" value="${donation.value}" id="value" name="value"/><p>
	<input  type="submit"/>
</form>
</body>
</html>