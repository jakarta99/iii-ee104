<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>donation list</title>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<style>
        fieldset {
            width: 1200px;
            border-radius: 20px;
            padding: 20px;
            margin: 20px;
            border: 3px double #bebebe;
            margin: auto
        }
       
    </style>
</head>
<body>
<h1>donation list</h1>
	<fieldset>
	<table class="table table-hover">
	
		<tr>
			<th></th>
			<th scope="col">id</th>
			<th scope="col">donationListId</th>
			<th scope="col">memberId</th>
			<th scope="col">donateOrganizationId</th>
			<th scope="col">donateValue</th>
			<th scope="col">donateTime</th>
		</tr>
		<c:forEach var="donation" items="${donations}">
		<tr>
			<td>
				<button class="btn btn-outline-secondary" onclick="javascript:document.location.href='/donation/edit?id=${donation.id}'">Edit</button>
				<button class="btn btn-outline-secondary" onclick="javascript:document.location.href='/donation/delete?id=${donation.id}'">Delete</button>
			</td>
			<td>${donation.id}</td>
			<td>${donation.donationListId}</td>
			<td>${donation.memberId}</td>
			<td>${donation.donateOrganizationId}</td>
			<td>${donation.donateValue}</td>
			<td>${donation.donateTime}</td>
		</tr>
		</c:forEach>
	</table>
	</fieldset>
	<button class="btn btn-outline-secondary" onclick="javascript:document.location.href='/donation/add'">Add</button><p>
</body>
</html>