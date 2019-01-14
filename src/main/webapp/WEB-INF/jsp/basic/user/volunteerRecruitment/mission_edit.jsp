<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Javascript files-->
<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />
<!-- sweet alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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


			
<title>任務編輯 | TimeBank</title>
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
<fmt:formatDate value="${mission.startDate}" pattern="yyyy/MM/dd HH:mm" var="startDate" />
<fmt:formatDate value="${mission.endDate}" pattern="yyyy/MM/dd HH:mm" var="endDate" />
	<!-- Top bar-->
	<jsp:include page="../../commons/commons_layout/commons_top-bar.jsp"/>
 	
	<!-- Navbar -->
    <jsp:include page="../../commons/commons_layout/commons_nav.jsp"/>
    
    <div id="heading-breadcrumbs">
        <div class="container">
          <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
              <h1 class="h2">編輯活動</h1>
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
                <form id="missionForm" action="/user/volunteerRecruitment/update" method="post" enctype="multipart/form-data">
					<input type="hidden" value="${mission.id}" id="id" name="id"/>
				   	<input type="hidden" value="${mission.member.id}" id="member" name="member"/><p>
					<input type="hidden" value="${publishDate}"  id="publishDate" name="publishDate"/>
					<input type="hidden" value="${mission.approvedQuantity}"  id="approvedQuantity" name="approvedQuantity"/>
					<input type="hidden" value="${mission.missionstatus}"  id="missionstatus" name="missionstatus"/>
                  
                  <div class="row">
                    <div class="col-md-3">
                      <div class="form-group">
                        <label for="title">活動標題</label>
                        <input type="text" value="${mission.title}" id="title" name="title" class="form-control"/>
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
                     	<input type='text'  value='${mission.address}'id='address' name='address' class="form-control"/>
                     </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-3">
                      <div class="form-group">
                        <label for="startDate">開始日期</label>
                        <input value="${startDate}" id="startDate" name="startDate" class="form-control">
                      </div>
                    </div>     
                    <div class="col-md-3">
                      <div class="form-group">
                        <label for="endDate">結束日期</label>
                        <input value="${endDate}" id="endDate" name="endDate" class="form-control">
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
                        <input type="text" value="${mission.peopleNeeded}" id="peopleNeeded" name="peopleNeeded" class="form-control"/>
                      </div>
                    </div>
                    <div class="col-md-2">
                      <div class="form-group">
                        <label for="timeValue">支付時數</label>
                        <input type="text" value="${mission.timeValue}" id="timeValue" name="timeValue" class="form-control"/>
                      </div>
                    </div>   
                  </div>
                  <div class="row">
                    <div class="col-md-6 col-lg-3">
                      <div class="form-group">
                        <label for="contactPerson">聯絡人</label>
                        <input type="text" value="${mission.contactPerson}" id="contactPerson" name="contactPerson" class="form-control"/>
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                      <div class="form-group">
                        <label for="contactPhone">聯絡電話</label>
                        <input id="contactPhone" value="${mission.contactPhone}" name="contactPhone" type="text" class="form-control">
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                      <div class="form-group">
                        <label for="email">聯絡Email</label>
                        <input type="email" value="${mission.contactEmail}" id="contactEmail" name="contactEmail" class="form-control"/>
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                      <div class="form-group">
                        <label for="missionPicture">活動宣傳圖</label>
                        <a  href="/image/user/mission/${mission.missionPicName}" target="_blank">原上傳圖片</a>
                        <input type="text"  id="missionPicName" name="missionPicName" hidden=true class="form-control" />
                        <input type="file"  id="missionPicture" name="missionPicture" accept="image/*" class="form-control" />
                      </div>
                    </div>
                    <div class="col-md-3">
                      <div class="form-group"> 
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="discription">活動詳細文字敘述</label>
                        <textarea class="form-control"  id="discription" name="discription" rows="3">${mission.discription}</textarea>
                      </div>
                    </div>
                    <div class="col-md-12 text-center">
                      <button type="submit" id="updateButton" class="btn btn-template-outlined"><i class="fa fa-save"></i>更新活動</button>
                    </div>
                  </div>
                </form>
              </div>
          </div>
        </div>
	 </section>
	  
	  
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp"/>

	
	<script>
	
	
		var missionPicName = '${mission.missionPicName}';
	
		if($("#missionPicture").val() == ''){
			$("#missionPicName").val(missionPicName);
		}
		
		
		if(missionPicName.length == 0){
			$("#missionPicName").html("");
			$("#missionPicName").prop("hidden", true);
		}
	
	
	
	
		$(document).ready(function(){
			
			new TwCitySelector();
			$("div[role='tw-city-selector']").attr("data-county-value",'${mission.county}');
			$("div[role='tw-city-selector']").attr("data-district-value", '${mission.district}');
			
			$('#startDate').datetimepicker({
				dateFormat: "yy/mm/dd",
			    todayHighlight: true,
			    language: 'zh-TW',
			    startView:"years",
			    minDate: '0',
			    numberOfMonths: 2,
			    stepMinute: 10,
			    
			})
			
			$('#endDate').datetimepicker({
				dateFormat: "yy/mm/dd",
			    todayHighlight: true,
			    language: 'zh-TW',
			    startView:"years",
			    minDate: '0',
			    numberOfMonths: 2,
			    stepMinute: 10,
			})
			
// 			$("select[name='termType'][value="+'${mission.termType}' + "]").prop("selected ", true);
// 			alert("${mission.termType}")
			$('#termType').val("${mission.termType}")
			$('#serviceType').val(${mission.serviceType.id})
			

		if(${not empty response}){
			if('${response}' == 'SUCCESS'){
				swal({
					title: "更新結果",	
					text: "更新成功",
					icon:"success",
					buttons: false,
					dangerMode: false,
				})
			}else{
				swal({
					  title: "更新失敗",
					  text: '${response}',
					  icon: "error",
					  buttons: false,
					  dangerMode: false,
					})
			}
		}
			
			
			
			
			
			
		});
		
// 		function updateRequest() {
// 			$.ajax({
// 				url : '/user/volunteerRecruitment/update',
// 				type : 'post',
// 				data : $('form').serialize(),
// 				dataType : 'JSON',
// 				success : function(editResult) {
// 					if(editResult.status == "SUCCESS"){
// 						alert("更新編號" + editResult.obj.id + " " + editResult.status);
// 						document.location.href="/user/volunteerRecruitment/list";
// 					}else{
// 						alert("更新編號" + editResult.obj.id + " " + editResult.status);
// 						alert("失敗原因" + editResult.messages);
// 					}
	
// 				},
// 			})
// 		}
	</script>

</body>
</html>