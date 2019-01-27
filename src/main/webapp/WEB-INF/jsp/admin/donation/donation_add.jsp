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
	<jsp:include page="../admin_layout/admin_css_js_links.jsp" />
<title>Add donation</title>

<style>
	 article{
	 	margin-top:70px;
	 }
	 
	 fieldset {
 		border-radius: 20px; 
 		padding: 20px 20px 0px 20px;  
/*  		border: 3px double #bebebe;  */
		background-color:#ffeecc;
		margin: auto; 
 		margin-top: 10px;  
 		margin-bottom: 20px;  
 		width: 1000px;
	}

	 
	 
	 legend{
	 	color:#2c3e50;
	 	font-size: 30px;
	 }
	 
 
</style>


</head>
<body>
<jsp:include page="../admin_layout/nav.jsp" />
<div class="container" style="margin-top: 140px">
		<h2 class="text-center text-uppercase text-secondary mb-0">Add Donation</h2>
<!--         <hr class="star-dark mb-5"> -->
	</div>

	<form>
	  <fieldset>
<!-- 	    <legend>insert</legend> -->
		<div>
	    <label>donator:</label>
	    <input type="text" value="" id="donator" name="donator"/>
	    </div>
	    
	    <div>
	    <label>orgDonee:</label>
	    <input type="text" value="" id="orgDonee" name="orgDonee"/>
	    </div>
	    
	    <div>
	    <label>value:</label>
	    <input type="text" value="" id="value" name="value"/>
	    </div>
	    
	    <div>
	  	<input type="button" onclick="addData()" value="新增" id="addButt" class="btn btn-outline-secondary"/>
	  	</div>
	  	<a href="/admin/donation/list">back to list</a>
	  </fieldset>
	</form>

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