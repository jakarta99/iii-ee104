<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TimeLedger List</title>
</head>
<body>


 <h1> TimeLedger List </h1>

<button onclick="javascript:document.location.href='/timeLedger/add'">Add</button>
<c:forEach items="${timeLedgers}" var="timeLedger">
<li>
<button onclick="javascript:document.location.href='/timeLedger/edit?id=${timeLedger.id}'">Edit</button>
<button onclick="javascript:document.location.href='/timeLedger/delete'">Delete</button>
${timeLedger.id }</li>
</c:forEach>
</body>
</html>