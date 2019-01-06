<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Javascript files-->
<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />

<!-- data table -->
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="/js/dataTable_full_numbers_no_ellipses.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">  
<script src="https://cdn.datatables.net/buttons/1.5.4/js/dataTables.buttons.min.js"></script>	
<script src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
<!-- 台灣縣市地區選單	 -->
<script src="/js/tw-city-selector.min.js"></script>
<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />
	
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp"/>
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
    
    <div id="heading-breadcrumbs">
        <div class="container">
          <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
              <h1 class="h2">刊登任務</h1>
            </div>
          </div>
        </div>
      </div>
		<section class="bar">
        	<div class="container">
          	<div class="row">
          	<div class="bo3">
                <div class="heading">
                  <h3 class="text-uppercase">活動詳細</h3>
                </div>
                <form id="missionForm" action="/user/missionPublish/insert" method="post" enctype="multipart/form-data">
                  <div class="row">
                    <div class="col-md-3">
                      <div class="form-group">
                        <label for="title">活動標題</label>
                        <input id="title" name="title" type="text" class="form-control">
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="form-group">
                        <label for="serviceType">活動類型</label>
                        <select id="serviceType" name="serviceType" class="form-control">
					        <c:forEach var="serviceType" items="${serviceType}"> 
								<option value="${serviceType.id}">${serviceType.serviceType}</option> 
							</c:forEach> 
						</select>
                      </div>
                    </div>
                    <div class="col-md-3">
                     <div class="form-group">
                     	<label>活動地點</label>
                     	<div role="tw-city-selector" ></div>
                     </div>
                    </div>
                     <div class="col-md-3">
                     	<div class="form-group">
                      	<label for="address">地址</label>
                     	<input type='text' id='address' name='address' class="form-control"/>
                     </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-3">
                      <div class="form-group">
                        <label for="startDate">開始日期</label>
                        <input id="startDate" name="startDate" class="form-control">
                      </div>
                    </div>     
                    <div class="col-md-3">
                      <div class="form-group">
                        <label for="endDate">結束日期</label>
                        <input id="endDate" name="endDate" class="form-control">
                      </div>
                    </div>
                    
                    
                    
    
                    <div class="col-md-2">
                      <div class="form-group">
                        <label for="termType">長短期</label>
                        <select id="termType" name="termType" class="form-control">
					        <option value="L">長期</option>
					        <option value="S">短期</option>
    					</select>
                      </div>
                    </div>
                    <div class="col-md-2">
                      <div class="form-group">
                        <label for="peopleNeeded">需求人數</label>
                        <input type="text" value="" id="peopleNeeded" name="peopleNeeded" class="form-control"/>
                      </div>
                    </div>
                    <div class="col-md-2">
                      <div class="form-group">
                        <label for="timeValue">支付時數</label>
                        <input type="text" id="timeValue" name="timeValue" class="form-control"/>
                      </div>
                    </div>   
                  </div>
                  <div class="row">
                    <div class="col-md-6 col-lg-3">
                      <div class="form-group">
                        <label for="contactPerson">聯絡人</label>
                        <input type="text" id="contactPerson" name="contactPerson" class="form-control"/>
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                      <div class="form-group">
                        <label for="contactPhone">聯絡電話</label>
                        <input id="contactPhone" name="contactPhone" type="text" class="form-control">
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                      <div class="form-group">
                        <label for="email">聯絡Email</label>
                        <input type="email" id="contactEmail" name="contactEmail" class="form-control"/>
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                      <div class="form-group">
                        <label for="missionPicture">活動宣傳圖</label>
                        <input type="file" id="missionPicture" name="missionPicture" accept="image/*" class="form-control" />
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="form-group"> 
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="discription">活動詳細文字敘述</label>
                        <textarea class="form-control"  id="discription" name="discription" rows="3"></textarea>
                      </div>
                    </div>
                    <div class="col-md-12 text-center">
                      <button type="submit" class="btn btn-template-outlined"><i class="fa fa-plus"></i>刊登活動</button>
                    </div>
                  </div>
                </form>
              </div>
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