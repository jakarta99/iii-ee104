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
	<h4>Member ${member.id}</h4>
	<form action="/member/update" method="post" >
		<input type="hidden" value="${member.id}" id="id" name="id"/>
		<input type="hidden" value="${member.memberType}" id="memberType" name="memberType"/><br>
		帳號 :<input type="text" value="${member.loginAccount }" id="loginAccount" name="loginAccount" disabled><br> 
		密碼 :<input type="text" value="${member.password }" id="password" name="password"><br>
		名字 :<input type="text" value="${member.name }" id="name" name="name"><br>
		email: <input type="text" value="${member.email }" id="email" name="email"><br>
		住家電話: <input type="text" value="${member.telephone }" id="telephone" name="telephone"><br>
		手機: <input type="text" value="${member.mobile }" id="mobile" name="mobile"><br>
		居住地區: 
		<select id="area" name="city" >
			<c:forEach items="${areaList}" var="area">
				<option value="${area.id}" >${area.city}</option>
			</c:forEach>
		</select> <br>	
		
		email驗證信確認(Y/N): 
<!-- 		Y <input type="radio" value="Y" name="emailVerification" /> -->
<!-- 		N <input type="radio" value="N" name="emailVerification" /><br> -->
		<c:choose >
			<c:when test="${member.emailVerification eq 'Y'}">
				Y <input type="radio" value="Y" name="emailVerification" checked/>
				N <input type="radio" value="N" name="emailVerification" /><br>
			</c:when>
			<c:when test="${member.emailVerification eq 'N'}">
				Y <input type="radio" value="Y" name="emailVerification" />
				N <input type="radio" value="N" name="emailVerification" checked /><br>
			</c:when>			
		</c:choose>
		
		
<%-- 		<input type="text" value="${member.emailVerification }" id="emailVerification" name="emailVerification"><br>		 --%>
		註冊日期: <input type="text" value="${member.signUpDate }" id="signUpDate" name="signUpDate" disabled><br>
		<c:if test="${member.memberType eq 'O' }">
			創辦人: <input type="text" value="${member.orgFounder }" id="orgFounder" name="orgFounder"><br>
			執行長: <input type="text" value="${member.orgCeo }" id="orgCeo" name="orgCeo"><br>
			
			機構身分驗證 (Y/N): 
<!-- 			Y <input type="radio" value="Y" name="orgIDConfirmation" /> -->
<!-- 			N <input type="radio" value="N" name="orgIDConfirmation" /><br> -->
			<c:choose >
				<c:when test="${member.emailVerification eq 'Y'}">
					Y <input type="radio" value="Y" name="orgIDConfirmation" checked/>
					N <input type="radio" value="N" name="orgIDConfirmation" /><br>
				</c:when>
				<c:when test="${member.emailVerification eq 'N'}">
					Y <input type="radio" value="Y" name="orgIDConfirmation" />
					N <input type="radio" value="N" name="orgIDConfirmation" checked/><br>
				</c:when>			
			</c:choose>		
			
		</c:if>
		<input type="submit" value="儲存" />
		<input type="button" onclick="javascript:document.location.href='/member/list'" value="回上一頁" />
	</form>
	
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$("option[value='"+ ${member.city} +"']").prop("selected",true);
// 			alert(${member.emailVerification})
// 			$("input[name='emailVerification'][value='"+${member.emailVerification}+"']").prop("checked",true);	
// 			$("input[name='orgIDConfirmation'][value='"+${member.orgIDConfirmation}+"']").prop("checked",true);	

				
			
		})
	
	</script>
</body>
</html>