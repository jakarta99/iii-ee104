<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Edit</title>
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
 	input,select{ 
 		margin-bottom:20px; 
	} 
</style>


</head>
<body>
<!-- 使用AJAX -->
	<h2>Member Edit</h2>
	<h4>Member ${member.id}</h4>
	<form action="#" method="post" >
		<input type="hidden" value="${member.id}" id="id" name="id"/>
		<input type="hidden" value="${member.memberType}" id="memberType" name="memberType"/><br>
		<label>帳號 :</label>
		<input type="text" value="${member.loginAccount }" id="loginAccount" name="loginAccount" disabled><br> 
		<label>密碼 :</label>
		<input type="text" value="${member.password }" id="password" name="password"><br>
		<label>名字 :</label>
		<input type="text" value="${member.name }" id="name" name="name"><br>
		<label>email:</label>
		<input type="text" value="${member.email }" id="email" name="email"><br>
		<label>住家電話:</label>
		<input type="text" value="${member.telephone }" id="telephone" name="telephone"><br>
		<label>手機:</label> 
		<input type="text" value="${member.mobile }" id="mobile" name="mobile"><br>
		<label>居住地區:</label>
		<select id="area" name="city" >
			<c:forEach items="${areaList}" var="area">
				<option value="${area.id}" >${area.city}</option>
			</c:forEach>
		</select> <br>	
		<label>email驗證信確認(Y/N):</label> 
		<label>Y</label> <input type="radio" value="Y" name="emailVerification" />
		<label>N</label> <input type="radio" value="N" name="emailVerification" /><br>

		<label>註冊日期:</label> 
		<input type="text" value="${member.signUpDate }" id="signUpDate" name="signUpDate" disabled><br>
		<c:if test="${member.memberType eq 'O' }">
			<label>創辦人:</label> 
			<input type="text" value="${member.orgFounder }" id="orgFounder" name="orgFounder"><br>
			<label>執行長: </label>
			<input type="text" value="${member.orgCeo }" id="orgCeo" name="orgCeo"><br>
			<label>機構身分驗證 (Y/N): </label>
			<label>Y</label> 
			<input type="radio" value="Y" name="orgIDConfirmation" />
			<label>N</label>
			<input type="radio" value="N" name="orgIDConfirmation" /><br>

		</c:if>
		<input type="button" class="btn btn-primary btn-sm" id="updateButt" value="儲存" />
		<input type="button" class="btn btn-primary btn-sm" onclick="javascript:document.location.href='/member/list'" value="回上一頁" />
	</form>
	
	
	
	
	<script>
		$(document).ready(function(){
			$("option[value='"+ ${member.city} +"']").prop("selected",true);
			$("input[name='emailVerification'][value="+ '${member.emailVerification}' +"]").prop("checked",true);
			if ('${member.memberType }'=='O'){
				$("input[name='orgIdConfirmation'][value="+'${member.orgIdConfirmation}' +"]").prop("checked",true);					
			}
			
				
			$("#updateButt").click(function(){
				$.ajax({
					  method: "put",
					  dataType: "json",         
					  url: "/member/update",
					  data: $("form").serialize(),
					})
					  .done(function(data){
							$.each(data, function(key, value){
								if (key == 'msg'){
									alert(value);
// 								} else if (key == 'memberInfo'){
// 									$("input[name='id']").val(value.id);
// 									$("input[name='memberType']").val(value.memberType);
// 									$("input[name='loginAccount']").val(value.loginAccount);
// 									$("input[name='password']").val(value.password);
// 									$("input[name='name']").val(value.name);
// 									$("input[name='email']").val(value.email);
// 									$("input[name='telephone']").val(value.telephone);
// 									$("input[name='mobile']").val(value.mobile);		
								}
							})
					  });	
				
				
// 				$.getJSON("/member/update",$("form").serialize(),function(data){
//					$.each(data, function(key, value){
//						if (key == 'msg'){
//							alert(value);							
//						}	
//					})
//				})
		
			})
			
			
			
			
			
			
			
			
		})
	
	</script>
</body>
</html>