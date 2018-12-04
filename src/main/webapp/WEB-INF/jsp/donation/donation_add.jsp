<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add donation</title>
</head>
<body>
<h1>add donation</h1>
<form action="/donation/insert" method="post">


memberId<input type="text" value="" id="memberId" name="memberId"/><p>
organizationId<input type="text" value="" id="organizationId" name="organizationId"/><p>
Value<input type="text" value="" id="value" name="value"/><p>
<input type="hidden" value="" id="donateTime" name="donateTime"/><p>
<input type="submit"/>
</form>
<a href="/donation/list">back to list</a>
</body>
</html>