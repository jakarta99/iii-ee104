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
<jsp:include page="../admin_layout/admin_css_js_links.jsp" />
<title> edit donation </title>
<style>
 
	 
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
		<h2 class="text-center text-uppercase text-secondary mb-0">Edit no.${donation.id} donation</h2>
<!--         <hr class="star-dark mb-5"> -->
	</div>

	<form>
	  <fieldset>
<!-- 	    <legend>insert</legend> -->
<!-- 	    <div> -->
<!-- 	    <label>id:</label> -->
<%-- 	    <input type="hidden" value="${donation.id}" id="id" name="id"/> --%>
<!-- 	    </div> -->
	    <div>
	    <label>donator:</label>
	    <input type="text" disabled="disabled" value="${donation.donator.account}" id="donator" name="donator"/>
	    </div>
	    <div>
	    <label>orgDonee:</label>
	    <input type="text" disabled="disabled" value="${donation.orgDonee.account}" id="orgDonee" name="orgDonee"/>
	    </div>
	    <div>
	    <label>value:</label>
	    <input type="text" value="${donation.value}" id="value" name="value"/>
	  	</div>
	  	
	  	<input type="button" onclick="editData()" value="更改" id="updateButt"  class="btn btn-outline-secondary"/>
	  </fieldset>
	</form>
<script>
	function editData(){
		$.ajax({
			method: "post",
			dataType: "json",
			url: "/admin/donation/update",
			data: $("form").serialize(),
			success: function(response){
				
				if(response.status == "SUCCESS"){
					alert("更改成功");
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