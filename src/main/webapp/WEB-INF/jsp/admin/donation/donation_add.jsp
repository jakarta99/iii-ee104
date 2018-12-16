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
<title>add donation</title>
</head>
<body>
<jsp:include page="../admin_layout/nav.jsp" />

<h1>add donation</h1>
	<form>
	  <fieldset>
	    <legend>insert</legend>
	
	    <label>memberId:</label>
	    <input type="text" value="" id="memberId" name="memberId"/>
	    <label>organizationId:</label>
	    <input type="text" value="" id="organizationId" name="organizationId"/>
	    <label>value:</label>
	    <input type="text" value="" id="value" name="value"/>
	  	<input type="button" onclick="addData()" value="新增" id="addButt" />
	  </fieldset>
	</form>
<a href="/admin/donation/list">back to list</a>
<script>
	function addData(){
		$.ajax({
			method: "post",
			dataType: "json",
			url: "/admin/donation/insert",
			data: $("form").serialize(),
			success: function(response){
				
				if(response.status == "SUCCESS"){
					alert("新增成功");
				}else{
					$.each(response.message, function(idx, message){
						alert(message);
					});
				}
				window.location.replace("/admin/donation/list");
			}
		})
	}
</script>
</body>
</html>