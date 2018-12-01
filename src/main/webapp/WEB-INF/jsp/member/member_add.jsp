<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Add</title>
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
		
		<input type="button" value="確定送出" />
		<input type="reset" value="清除重填" />
		
	</form>
	

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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