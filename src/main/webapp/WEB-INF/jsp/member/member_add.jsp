<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Add</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Bootstrap core CSS -->
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
<!-- 台灣縣市地區選單	 -->
<script src="/js/tw-city-selector.min.js"></script>




<style>
	 article{
	 	margin-top:70px;
	 }
	article input,select,label{ 
 		margin-bottom:20px;
 		margin-left:15px; 
	} 
	
</style>

</head>
<body>
<!-- 	<div id="navBar"></div> -->
	<c:import url="/html/nav.html"/>
	<article>
		<input type="button" class="btn btn-primary btn-sm" onclick="javascript:document.location.href='/member/list'" value="回會員列表"  />
		<h2>Member Add</h2>
		<form action="" method="post">	
			<input type="hidden" value="" id="id" name="id"/>
			<input type="hidden" value="${memberType}" id="memberType" name="memberType"/><br>
			<label>帳號 :</label> 
			<input type="text" value="${param.account }" id="account" name="account" ><br> 
			<label>密碼 :</label> 
			<input type="password" value="${param.password }" id="password" name="password"><br>
			<label>名字 :</label> 
			<input type="text" value="${param.name }" id="name" name="name"><br>
			<c:choose>
				<c:when test="${memberType eq 'P'}">					
					<label>身分證字號 :</label> 
					<input type="text" value="${param.certificateIdNumber }" id="certificateIdNumber" name="certificateIdNumber"><br>
<!-- 					<label>出生日期:</label>  -->
<%-- 					<input type="text" value="${param.birthDate }" id="birthDate" name="birthDate"><br>  --%>
							
				</c:when>
				<c:when test="${memberType eq 'O'}">
					<label>統一編號 :</label> 
					<input type="text" value="${param.certificateIdNumber }" id="certificateIdNumber" name="certificateIdNumber"><br>
<!-- 					<label>創立日期:</label>  -->
<%-- 					<input type="date" value="${param.birthDate }" id="birthDate" name="birthDate"><br> --%>
							
				</c:when>
			</c:choose>
			
			
			<label>email:</label> 
			<input type="email" value="${param.email }" id="email" name="email"><br>
			<label>住家電話:</label> 
			<input type="text" value="${param.telephone }" id="telephone" name="telephone"><br>
			<label>手機:</label> 
			<input type="text" value="${param.mobile }" id="mobile" name="mobile"><br>
			<label>住址:</label>
			<div role="tw-city-selector">
			</div>
			<input type='text' value='${param.address}' id='address' name='address' /><br>
		
			<c:if test="${memberType eq 'O' }">
				<label>創辦人:</label> 
				<input type="text" value="${param.orgFounder }" id="orgFounder" name="orgFounder"><br>
				<label>執行長:</label> 
				<input type="text" value="${param.orgCeo }" id="orgCeo" name="orgCeo"><br>
				<label>聯絡人:</label> 
				<input type="text" value="${param.orgContactPerson }" id="orgContactPerson" name="orgContactPerson"><br>
				<label>聯絡人電話:</label> 
				<input type="text" value="${param.orgContactPersonTel }" id="orgContactPersonTel" name="orgContactPersonTel"><br>
				<label>聯絡人手機:</label> 
				<input type="text" value="${param.orgContactPersonMobile }" id="orgContactPersonMobile" name="orgContactPersonMobile"><br>
				
				<label>網址:</label> 
				<input type="url" value="${param.orgWebsiteLink }" id="orgWebsiteLink" name="orgWebsiteLink"><br>
				<label>創立宗旨:</label> 
				<textarea  rows="4" cols="30"  id="orgFoundPurpose" name="orgFoundPurpose">${param.orgFoundPurpose}</textarea><br>
				
				
			</c:if>
			
			<input type="button" class="btn btn-primary btn-sm" value="確定送出" />
			<input type="reset" class="btn btn-primary btn-sm" value="清除重填" />
			
		</form>
	
	</article>
	
	<script>
		$(document).ready(function(){
			//add nav.html
// 			$.get("/html/nav.html",function(data){
// 				$("#navBar").html(data);
// 			});
			
			
			new TwCitySelector();	
			
// 			insert new member
			$("input[type='button'][value='確定送出']").click(function(){
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

		
		})
		
		
	</script>
	

	


</body>
</html>