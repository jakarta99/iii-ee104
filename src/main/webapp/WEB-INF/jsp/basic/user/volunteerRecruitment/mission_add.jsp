<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- css -->
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp"/>
<!-- Javascript files-->
<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />

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

<meta http-equiv="Content-Type" content="multipart/form-data;charset=utf-8" />

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
	<!-- Top bar-->
	<jsp:include page="../../commons/commons_layout/commons_top-bar.jsp"/>
 	
	<!-- Navbar -->
    <jsp:include page="../../commons/commons_layout/commons_nav.jsp"/>
		<section class="bar">
        	<div class="container">
          	<div class="row">
				<fieldset>
           			<h1 class="s2">mission add(after login)</h1>
           			
           			
           			
	<form id=missionForm action="/user/missionPublish/insert" method="post" enctype="multipart/form-data">
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
    missionPicture:<input type="file" id="missionPicture" name="missionPicture" accept="image/*" class="form-control" />
    </div>  
    
    <div class="form-group">
    <label for="discription">discription:</label>
     <textarea class="form-control"  id="discription" name="discription" rows="3"></textarea>
    </div> 
     <button id="add" class="btn btn-outline-secondary" >提交</button>
     <div class="form-group">
	<input type="reset"  class="btn btn-outline-secondary"/>
	</div>
	</form>
	<button class="btn btn-outline-secondary" onclick="javascript:document.location.href='/admin/mission/list'">回列表頁</button>
	</fieldset>
	
	
          </div>
        </div>
	
	
	  </section>
	  
	  
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp"/>
	<script>
// 	$(function(){
// 		  $("#missionForm").submit(function(e){
// 		    e.preventDefault(); // 停止觸發submit
// 		    console.log("upload");
// 		    var formData = new FormData($("#myForm")[0]); // 使用FormData包裝form表單來傳輸資料
// 		    $.ajax({
// 		      type: "POST",
// 		      url: "upload",
// 		      data:formData,
// 		      cache:false, // 不需要cache
// 		      processData: false, // jQuery預設會把data轉為query String, 所以要停用
// 		      contentType: false, // jQuery預設contentType為'application/x-www-form-urlencoded; charset=UTF-8', 且不用自己設定為'multipart/form-data'
// 		      dataType: 'text',
// 		      success: function (data){
// 		        console.log(data);
// 		      }      
// 		    });
// 		  });
// 		});
	
// 		function addMission() {
// 			var formdata = new FormData($("#missionForm"));  
// 			$.ajax({
// 				data : formdata,
// 				url : "/user/missionPublish/insert",				
// 				type : 'post',
// 				cache:false,
// 				traditional: true,
// 				contentType: false,
// 				processData: false,
// 				success : function(addResult) {
// 					if(addResult.status == "SUCCESS"){
// 						alert("新增編號" + addResult.obj.id + " "+ addResult.status);
// 						document.location.href = "/user/missionPublish/add"
// 					}else{
// 						alert("新增編號" + addResult.obj.id + " " + addResult.status);
// 						alert("FAIL reason:" + addResult.messages);
// 					}
// 				},
// 			})
// 		}
		$(document).ready(function() {
			
			
// 			$('#serviceType').append()
			
						
			new TwCitySelector();
			
			
			
			$('#startDate').datetimepicker({
				dateFormat: "yy/mm/dd",
			    autoclose: true,
			    todayHighlight: true,
			    language: 'zh-TW',
			    startView:"years",
			    minDate: '0',
			    numberOfMonths: 2,
			    stepMinute: 10,
			})
			
			$('#endDate').datetimepicker({
				dateFormat: "yy/mm/dd",
			    autoclose: true,
			    todayHighlight: true,
			    language: 'zh-TW',
			    startView:"years",
			    minDate: '0',
			    numberOfMonths: 2,
			    stepMinute: 10,
			})
			
			
			$("div[role='tw-city-selector']").attr("data-county-value",'${mission.county}');
			$("div[role='tw-city-selector']").attr("data-district-value", '${mission.district}');
			


			
		
		})
		


</script>
</body>

</html>