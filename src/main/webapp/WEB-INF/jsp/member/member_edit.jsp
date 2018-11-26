<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Edit</title>
<style>
	input,select{
		margin-bottom:20px;
	}

</style>


</head>
<body>

	<h2>Member Edit</h2>
	<form action="/member/update" method="post">
	
		<h4>Member ${member.id}</h4>
		<input type="text" value="${member.id}" id="id" name="id"/>
		<input type="text" value="${member.memberType}" id="memberType" name="memberType"/><br>
		帳號 :<input type="text" value="${member.loginAccount }" id="loginAccount" name="loginAccount" disabled><br> 
		密碼 :<input type="text" value="${member.password }" id="password" name="password"><br>
		名字 :<input type="text" value="${member.name }" id="name" name="name"><br>
		email: <input type="text" value="${member.email }" id="email" name="email"><br>
		住家電話: <input type="text" value="${member.telephone }" id="telephone" name="telephone"><br>
		手機: <input type="text" value="${member.mobile }" id="mobile" name="mobile"><br>
		居住地區: 
		<select id="area" name="area" >
			<c:forEach items="${areaList}" var="area">
				<option value="${area.id}" >${area.city}</option>
			</c:forEach>
		</select> <br>	
		<c:if test="${member.memberType eq 'O' }">
			創辦人: <input type="text" value="${member.founder }" id="founder" name="founder"><br>
			執行長: <input type="text" value="${member.ceo }" id="ceo" name="ceo"><br>
		</c:if>
		<input type="submit" value="儲存" />
		<input type="button" onclick="javascript:document.location.href='/member/list'" value="回上一頁" />
	</form>
	
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$("option:eq("+ (${member.area} -1) +")").prop("selected",true);
		})
	
	</script>
</body>
</html>