<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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

<title>Penalty Add</title>
</head>
<body>
	<!-- 加入nav.html(放在static/html) -->
	<jsp:include page="../admin_layout/nav.jsp" />
	<h1 style="padding-top: 2cm">Penalty Add</h1>
	<form>
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
				<input type="text" id="memberId" name="memberId"
					class="form-control" />
			</div>
		</div>
		<div class="form-group row">
			<label for="description" class="col-sm-1 col-form-label">description</label>
			<div class="col-sm-2">
				<input type="text" id="description" name="description"
					class="form-control" />
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
				<input type="text" id="penaltyTimeValue" name="penaltyTimeValue"
					class="form-control" />
			</div>
		</div>
		<input type="button" id="add" value="新增" class="btn btn-primary mb-2" />
	</form>
	<a href="/admin/penalty/list">back to penalty_list</a>
	<script type="text/javascript">
	
		$('#add').click(function(){
			$.ajax({
				url:"/admin/penalty/insert",
				method:"post",
				dataType:"json",
				data:$('form').serialize()
			}).done(function(result){
				alert(result.status);
				window.location.replace("/admin/penalty/list");
			})
		})
		
	</script>
</body>
</html>