<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Edit</title>
</head>
<body>

	<h2>Member Edit</h2>
	<form action="/member/edit" method="post">
		<h4>Member ${member.id}</h4>
		Account <input type="text" value="${member.loginAccount }"
			id="loginAccount" name="loginAccount"> Password <input
			type="text" value="${member.password }" id="password" name="password">
		Account <input type="text" value="${member.loginAccount }"
			id="loginAccount" name="loginAccount">

	</form>
</body>
</html>