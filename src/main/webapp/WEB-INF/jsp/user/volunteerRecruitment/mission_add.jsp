<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" 
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" 
		crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" 
		integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" 
		crossorigin="anonymous"></script>
<link rel="stylesheet" 
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" 
		integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" 
		crossorigin="anonymous">

<!-- 台灣縣市地區選單	 -->
<script src="/js/tw-city-selector.min.js"></script>

<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />

<!-- DateTimePicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/i18n/jquery-ui-timepicker-zh-TW.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.css" rel="stylesheet" />


<title>mission add</title>
<style>
        fieldset {
            width: 600px;
            border-radius: 20px;
            padding: 20px;
            margin: 20px;
            border: 3px double #bebebe;
            margin: auto
        }
        .s2{
            text-align: center
        }
         .margintop{
			 margin-top:70px;
		}
		.county,.district {
	  padding: 0.375rem 0.75rem;
	  font-size: 1rem;
	  line-height: 1.5;
	  color: #495057;
	  background-color: #fff;
	  background-image: none;
	  background-clip: padding-box;
	  border: 1px solid #ced4da;
	  border-radius: 0.25rem;
	  transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
	}

    </style>
</head>
<body>
<div id="navBar" class="margintop"></div>
	<h1 class="s2">mission add</h1>
	<fieldset>
	<form action="/admin/mission/insert" method="post">
	
	
	<div>			
		<label>活動縣市:</label> <br>
		<div role="tw-city-selector" ></div>
		<div>
			活動地址:<input type='text'  value='${param.address}'id='address' name='address' class="form-control"/>
		</div>
	</div>
    
    <div class="form-group">
    title:<input type="text" value="" id="title" name="title" class="form-control"/>
    </div>
    
    
    <div class="form-group">
    serviceType:<select id="serviceType" name="serviceType" class="form-control">
        <c:forEach var="serviceType" items="${serviceType}"> 
			<option value="${serviceType.id}">${serviceType.serviceType}</option> 
		</c:forEach> 
    </select>
    </div>
    
    <div class="form-group">
    termType:<select id="termType" name="termType" class="form-control">
        <option value="L">長期</option>
        <option value="S">短期</option>
    </select>
    </div>
    
    <div>
		<label>startDate:</label> 
		<input  value="" id="startDate" name="startDate" class="form-control"><br>
	</div>
						
	<div>
		<label>endDate:</label> 
		<input  value="" id="endDate" name="endDate" class="form-control"><br>
	</div>
    
    <div class="form-group">
    timeValue:<input type="text" value="" id="timeValue" name="timeValue" class="form-control"/>
     </div>
     
    <div class="form-group">
    peopleNeeded:<input type="text" value="" id="peopleNeeded" name="peopleNeeded" class="form-control"/>
    </div>
    
    <div class="form-group">
    contactPerson:<input type="text" value="" id="contactPerson" name="contactPerson" class="form-control"/>
    </div>
    
    <div class="form-group">
    contactPhone:<input type="text" value="" id="contactPhone" name="contactPhone" class="form-control"/>
    </div>
    
    <div class="form-group">
    contactEmail:<input type="email" value="" id="contactEmail" name="contactEmail" class="form-control"/>
    </div> 
    
    <div class="form-group">
    <label for="discription">discription:</label>
     <textarea class="form-control"  id="discription" name="discription" rows="3"></textarea>
    </div> 
     
     <div class="form-group">
	<button type="button" onclick="addMission()"
					class="btn btn-outline-secondary">提交</button>
	<input type="reset"  class="btn btn-outline-secondary"/>
	</div>
	</form>
	<button class="btn btn-outline-secondary" onclick="javascript:document.location.href='/admin/mission/list'">回列表頁</button>
	</fieldset>
	<script>
		function addMission() {
			$.ajax({
				url : "/admin/mission/insert",				
				type : 'post',
				data : $('form').serialize(),
				dataType : 'JSON',
				success : function(addResult) {
					if(addResult.status == "SUCCESS"){
						alert("新增編號" + addResult.obj.id + " "+ addResult.status);
						document.location.href = "/admin/mission/add"
					}else{
						alert("新增編號" + addResult.obj.id + " " + addResult.status);
						alert("FAIL reason:" + addResult.messages);
					}
				},
			})
		}
		$(document).ready(function() {
			
			
// 			$('#serviceType').append()
			
						
			new TwCitySelector();
			
			
			
			$('#startDate').datetimepicker({
				dateFormat: "yy/mm/dd",
			    autoclose: true,
			    todayHighlight: true,
			    language: 'zh-TW',
			    startView:"years",
			})
			
			$('#endDate').datetimepicker({
				dateFormat: "yy/mm/dd",
			    autoclose: true,
			    todayHighlight: true,
			    language: 'zh-TW',
			    startView:"years",
			})
			
			
			$("div[role='tw-city-selector']").attr("data-county-value",'${mission.county}');
			$("div[role='tw-city-selector']").attr("data-district-value", '${mission.district}');
			


			
		
		})



</script>
</body>

</html>