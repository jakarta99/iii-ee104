<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>

<title>Penalty Add</title>
</head>
<body>

	<h1>Penalty Add</h1>
	<form action="/penalty/insert" method="post">
		<div class="form-group row">
			<label for="orderListId" class="col-sm-1 col-form-label">orderListId</label>
			<div class="col-sm-2">
				<input type="text" id="orderListId" name="orderListId"
					class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<label for="memberId" class="col-sm-1 col-form-label">memberId</label>
			<div class="col-sm-2">
			<input type="text" id="memberId" name="memberId"class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<label for="description" class="col-sm-1 col-form-label">description</label>
			<div class="col-sm-2">
			<input type="text" id="description" name="description"class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<label for="status" class="col-sm-1 col-form-label">status</label> 
			<div class="col-sm-2">
			<select class="form-control" id="status" name="status">
				<option value=1>審核中</option>
				<option value=2>有罪</option>
				<option value=3>無罪</option>
			</select>
			</div>
		</div>
		<div class="form_group row">
			<label for="penaltyTimeValue" class="col-sm-1 col-form-label">penaltyTimeValue</label>
			<div class="col-sm-2">
			<input type="text" id="penaltyTimeValue" name="penaltyTimeValue"class="form-control" />
			</div>
		</div>
			<input type="submit" class="btn btn-primary mb-2" />
	</form>
	<a href="/penalty/list">back to penalty_list</a>
</body>
</html>