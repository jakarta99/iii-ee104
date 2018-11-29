<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<meta charset="UTF-8">
<title>request edit</title>
 <style>
        fieldset {
            width: 800px;
            border-radius: 20px;
            padding: 20px;
            margin: 20px;
            border: 3px double #bebebe;
            margin: auto
        }
        .s2{
            text-align: center
        }
    </style>

</head>
<body>
	
	<h1 class="s2">request edit</h1>
	
	<form action="/request/update" method="post">
	<fieldset>
	<input type="hidden" value="${request.id}" id="id" name="id"/>
	
	<div class="form-group">
	
	jobArea:<select id="jobArea" name="jobArea" class="form-control">
        <option value="1">台北市</option>
        <option value="2">新北市</option>
        <option value="3">高雄市</option>
        <option value="4">台中市</option>			
    </select><p>
    </div>
    
    <div class="form-group">
    jobTitle:<input type="text" value="${request.jobTitle}" id="jobTitle" name="jobTitle" class="form-control" /><p>
    </div>
   
   <input type="hidden" value="${request.memberId}" id="memberId" name="memberId"/><p>
   
   
   	<div class="form-group">
    serviceType:<select id="serviceType" name="serviceType" class="form-control" >
        <option value="1">照顧老人</option>
        <option value="2">孩童教育</option>
        <option value="3">環境清潔</option>
        <option value="4">生態保育</option>			
    </select><p>
    </div>
    
    <div class="form-group">
    termType:<select id="termType" name="termType" class="form-control">
        <option value="1">長期</option>
        <option value="2">短期</option>
    </select><p>
    </div>
    <div class="form-group">
    timeValue:<input type="text" value="${request.timeValue}" id="timeValue" name="timeValue" class="form-control"/><p>
	</div>
	
	<input type="submit" class="btn btn-outline-secondary"/>
	<input type="reset" class="btn btn-outline-secondary" />
	</fieldset>
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