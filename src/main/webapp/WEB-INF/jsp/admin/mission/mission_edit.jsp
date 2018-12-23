<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
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
		crossorigin="anonymous"><meta charset="UTF-8">
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
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


			
<title>mission edit</title>
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
        .margintop{
	 		margin-top:70px;
		}
		.county,.district{
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
<fmt:formatDate value="${mission.publishDate }" pattern="yyyy/MM/dd" var="publishDate" />
<fmt:formatDate value="${mission.startDate }" pattern="yyyy/MM/dd HH:mm" var="startDate" />
<fmt:formatDate value="${mission.endDate }" pattern="yyyy/MM/dd HH:mm" var="endDate" />
<div id="navBar" class="margintop"></div>
	
	<h1 class="s2">mission edit</h1>
	
	<form action="/admin/mission/update" method="post">
	<fieldset>
	
	<input type="hidden" value="${mission.id}" id="id" name="id"/>
	<input type="hidden" value="${publishDate}"  id="publishDate" name="publishDate"/>
	
	
	<div>			
		<label>活動縣市:</label> <br>
		<div role="tw-city-selector" ></div>
		<div>
			活動地址:<input type='text'  value='${mission.address}'id='address' name='address' class="form-control"/>
		</div>
	</div>
    
    <div class="form-group">
    title:<input type="text" value="${mission.title}" id="title" name="title" class="form-control"/>
    </div>
   
   <input type="hidden" value="${mission.memberId}" id="memberId" name="memberId"/><p>
   
   
   	<div class="form-group">
    serviceType:<select id="serviceType" name="serviceType" class="form-control"  >
        <c:forEach var="serviceType" items="${serviceType}"> 
			<option value="${serviceType.id}">${serviceType.serviceType}</option> 
		</c:forEach> 			
    </select><p>
    </div>
    
    <div class="form-group">
    termType:<select id="termType" name="termType" class="form-control" >
        <option value="L">長期</option>
        <option value="S">短期</option>
    </select>
    </div>
    
    <div>
		<label>startDate:</label> 
		<input  value="${startDate}" id="startDate" name="startDate" class="form-control" autocomplete="off"><br>
	</div>
						
	<div>
		<label>endDate:</label> 
		<input  value="${endDate}"  id="endDate" name="endDate" class="form-control" autocomplete="off"><br>
	</div>
    
    <div class="form-group">
    timeValue:<input type="text" value="${mission.timeValue}" id="timeValue" name="timeValue" class="form-control"/><p>
	</div>
	
	<div class="form-group">
    peopleNeeded:<input type="text" value="${mission.peopleNeeded}" id="peopleNeeded" name="peopleNeeded" class="form-control"/>
    </div>
    
    <div class="form-group">
    contactPerson:<input type="text" value="${mission.contactPerson}" id="contactPerson" name="contactPerson" class="form-control"/>
    </div>
    
    <div class="form-group">
    contactPhone:<input type="text" value="${mission.contactPhone}" id="contactPhone" name="contactPhone" class="form-control"/>
    </div>
    
    <div class="form-group">
    contactEmail:<input type="email" value="${mission.contactEmail}" id="contactEmail" name="contactEmail" class="form-control"/>
    </div> 
    
    <div class="form-group">
     discription:<input type="text" value="${mission.discription}" id="discription" name="discription" class="form-control"/>
    </div> 
	
	
	
	<div>
	<button type="button" onclick="updateRequest()"
					class="btn btn-outline-secondary">Update</button>
	<input type="reset" class="btn btn-outline-secondary" />
	
	</div>
	<div>
	<input type="button" class="btn btn-outline-secondary" onclick="javascript:document.location.href='/admin/request/list'" value="回列表頁"/>

	</div>
					
	</fieldset>
	</form>
	
	<script>
		jQuery(document).ready(function(){
			
			new TwCitySelector();
			$("div[role='tw-city-selector']").attr("data-county-value",'${mission.county}');
			$("div[role='tw-city-selector']").attr("data-district-value", '${mission.district}');
			
			$('#startDate').datetimepicker({
				dateFormat: "yy/mm/dd",
			    todayHighlight: true,
			    language: 'zh-TW',
			    startView:"years",
			})
			
			$('#endDate').datetimepicker({
				dateFormat: "yy/mm/dd",
			    todayHighlight: true,
			    language: 'zh-TW',
			    startView:"years",
			})
			
// 			$("select[name='termType'][value="+'${mission.termType}' + "]").prop("selected ", true);
// 			alert("${mission.termType}")
			$('#termType').val("${mission.termType}")
			$('#serviceType').val(${mission.serviceType.id})
			
			
			
			
			
			
			
			
			
		});
		
		function updateRequest() {
			$.ajax({
				url : '/admin/mission/update',
				type : 'put',
				data : $('form').serialize(),
				dataType : 'JSON',
				success : function(editResult) {
					if(editResult.status == "SUCCESS"){
						alert("更新編號" + editResult.obj.id + " " + editResult.status);
						document.location.href="/admin/mission/list";
					}else{
						alert("更新編號" + editResult.obj.id + " " + editResult.status);
						alert("失敗原因" + editResult.messages);
					}
	
				},
			})
		}
	</script>

</body>
</html>