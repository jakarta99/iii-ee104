<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Penalty Edit</title>
</head>
<body>
<%@ include file="nav.jsp" %>

	<h1 style="padding-top:2cm">Penalty Edit</h1>
	<h4>edit no.${penalty.id} penalty list</h4>
	
	<form action="/penalty/update" method="post">
		<input type="hidden" value="${penalty.id}" id="id" name="id"/>
				<div class="form-group row">
			<label for="status" class="col-sm-1 col-form-label">status</label> 
			<div class="col-sm-2">
			<select class="form-control" id="status" name="status" value="${penalty.status}">
				<option value=1>審核中</option>
				<option value=2>有罪</option>
				<option value=3>無罪</option>
			</select>
			</div>
		</div>
		<div class="form_group row">
			<label for="penaltyTimeValue" class="col-sm-1 col-form-label">penaltyTimeValue</label>
			<div class="col-sm-2">
			<input type="text" id="penaltyTimeValue" name="penaltyTimeValue"class="form-control" value="${penalty.penaltyTimeValue}"/>
			</div>
		</div>
<%-- 		懲罰時間:<input type="text" value="${penalty.penaltyTimeValue}" id="penaltyTimeValue" name="penaltyTimeValue"><p> --%>
<%-- 		處理進度:<input type="text" value="${penalty.status}" id="status" name="status"><p> --%>
		<input type="submit" class="btn btn-primary">
	</form>

<a href="/penalty/list">back to penalty_list</a>
</body>
</html>