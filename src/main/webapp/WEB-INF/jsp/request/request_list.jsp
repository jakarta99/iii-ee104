<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">

<meta charset="UTF-8">
<title>request list</title>
<style>
        fieldset {
            width: 1200px;
            border-radius: 20px;
            padding: 20px;
            margin: 20px;
            border: 3px double #bebebe;
            margin: auto
        }
        .s2{
            text-align: center
        }
    </style>
</head>
<body>
	
	<h1 class="s2">request list</h1>
	<fieldset>
	<button class="btn btn-outline-secondary" onclick="javascript:document.location.href='/request/add'">add</button>
	<table class="table table-hover">
	<thead>
	<tr>
		<th>選項</th>
		<th scope="col">id</th>
		<th scope="col">jobArea</th>
		<th scope="col">jobTitle</th>
		<th scope="col">memberId</th>
		<th scope="col">serviceType</th>
		<th scope="col">termType</th>
		<th scope="col">timeValue</th>
	</tr>
	 </thead>
	
	 <tbody>
	<c:forEach items="${requests}" var="request">
		<tr>
			<td>
			<button class="btn btn-outline-secondary" onclick="javascript:document.location.href='/request/edit?id=${request.id}'">Edit</button>
			<button class="btn btn-outline-secondary" onclick="javascript:document.location.href='/request/delete?id=${request.id}'">Delete</button>
			</td>
			<td>${request.id}</td>
			<td>${request.jobArea}</td>
			<td>${request.jobTitle}</td>
			<td>${request.memberId}</td>
			<td>${request.serviceType}</td>
			<td>${request.termType}</td>
			<td>${request.timeValue}</td>	
		</tr>
	</c:forEach>
	 </tbody>
	</table>
	</fieldset>
</body>

</html>