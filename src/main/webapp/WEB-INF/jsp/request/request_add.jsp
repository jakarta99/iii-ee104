<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request add</title>
</head>
<body>
	<h1>request add</h1>
	<form action="/request/insert" method="post">
	jobArea:<select id="jobArea" name="jobArea">
        <option value="1">新北市</option>
        <option value="2">台北市</option>
        <option value="3">高雄市</option>
        <option value="4">台中市</option>			
    </select><p>
    jobTitle:<input type="text" value="" id="jobTitle" name="jobTitle"/><p>
    memberId:<input type="text" value="" id="memberId" name="memberId"/><p>
    serviceType:<select id="serviceType" name="serviceType">
        <option value="1">照顧老人</option>
        <option value="2">孩童教育</option>
        <option value="3">環境清潔</option>
        <option value="4">生態保育</option>			
    </select><p>
    termType:<select id="termType" name="termType">
        <option value="1">長期</option>
        <option value="2">短期</option>
    </select><p>
    timeValue:<input type="text" value="" id="timeValue" name="timeValue"/><p>
	<input type="submit"/>
	<input type="reset" />
	</form>
	<button onclick="javascript:document.location.href='/request/list'">回列表頁</button>
</body>
</html>