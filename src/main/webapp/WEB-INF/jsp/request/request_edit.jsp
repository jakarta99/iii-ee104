<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request edit</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<h1>request edit</h1>
	
	<form action="/request/update" method="post">
	<input type="hidden" value="${request.id}" id="id" name="id"/>
	
	
	jobArea:<select id="jobArea" name="jobArea">
        <option value="1">台北市</option>
        <option value="2">新北市</option>
        <option value="3">高雄市</option>
        <option value="4">台中市</option>			
    </select><p>
    jobTitle:<input type="text" value="${request.jobTitle}" id="jobTitle" name="jobTitle"/><p>
   <input type="hidden" value="${request.memberId}" id="memberId" name="memberId"/><p>
    serviceType:<select id="serviceType" name="serviceType" >
        <option value="1">照顧老人</option>
        <option value="2">孩童教育</option>
        <option value="3">環境清潔</option>
        <option value="4">生態保育</option>			
    </select><p>
    termType:<select id="termType" name="termType">
        <option value="1">長期</option>
        <option value="2">短期</option>
    </select><p>
    timeValue:<input type="text" value="${request.timeValue}" id="timeValue" name="timeValue"/><p>
	
	
	<input type="submit"/>
	<input type="reset" />
	</form>
	
		<script type="text/javascript" >
	jQuery(document).ready(function(){
		$('#jobArea').val(${request.jobArea})
		$('#termType').val(${request.termType})
		$('#serviceType').val(${request.serviceType})
		$('#termType').val(${request.termType})
		
	});
	</script>

	
	
	

</body>
</html>