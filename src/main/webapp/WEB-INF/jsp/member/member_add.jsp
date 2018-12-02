<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Add</title>
<!-- Bootstrap core CSS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
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




<style>
	input, select{
		margin-bottom:20px;
	}
</style>

</head>
<body>
	<h2>Member Add</h2>
	<form action="" method="post">	
		<input type="hidden" value="" id="id" name="id"/>
		<input type="hidden" value="${memberType}" id="memberType" name="memberType"/><br>
		帳號 : <input type="text" value="${param.loginAccount }" id="loginAccount" name="loginAccount" ><br> 
		密碼 : <input type="text" value="${param.password }" id="password" name="password"><br>
		名字 : <input type="text" value="${param.name }" id="name" name="name"><br>
		email: <input type="text" value="${param.email }" id="email" name="email"><br>
		住家電話: <input type="text" value="${param.telephone }" id="telephone" name="telephone"><br>
		手機: <input type="text" value="${param.mobile }" id="mobile" name="mobile"><br>
		居住地區: 
		<select id="area" name="city">
			<c:forEach items="${areaList}" var="area">
				<option value="${area.id}" >${area.city}</option>
			</c:forEach>
		</select><br>
		
		<c:if test="${memberType eq 'O' }">
			創辦人: <input type="text" value="${param.orgFounder }" id="orgFounder" name="orgFounder"><br>
			執行長: <input type="text" value="${param.orgCeo }" id="orgCeo" name="orgCeo"><br>
		</c:if>
		
		<input type="button" class="btn btn-primary btn-sm" value="確定送出" />
		<input type="reset" class="btn btn-primary btn-sm" value="清除重填" />
		
	</form>
	

	
	<script>
		$("input[type='button']").click(function(){
			$.ajax({
				method:"post",
				dataType: "json",        
				url:"/member/insert",
				data: $("form").serialize()
			}).done(function(data){
				alert(data.msg);
				window.location.replace("/member/list");
			})
		})
	</script>
	

	


</body>
</html>