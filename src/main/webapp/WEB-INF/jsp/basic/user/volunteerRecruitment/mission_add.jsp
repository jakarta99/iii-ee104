<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import='java.util.*' %>
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
<!-- sweet alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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

<title>刊登任務 | TimeBank</title>
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
<!-- 一鍵帶入資料 -->
<%-- <c:set var="testValue" value="<%=new Date()%>" /> --%>
<%-- <fmt:formatDate value="${testValue}" type="" pattern="yyyy/MM/dd" var="testStart" /> --%>
<%-- <fmt:formatDate value="${testValue}" type="" pattern="yyyy/MM/dd" var="testEnd" /> --%>
<!--  -->
<fmt:formatDate value="${mission.publishDate }" pattern="yyyy/MM/dd" var="publishDate" />
<fmt:formatDate value="${mission.startDate }" pattern="yyyy/MM/dd HH:mm" var="startDate" />
<fmt:formatDate value="${mission.endDate }" pattern="yyyy/MM/dd HH:mm" var="endDate" />
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
                        <input value='${mission.title}' id="title" name="title" type="text" class="form-control">
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
                     	<input value='${mission.address}' type='text' id='address' name='address' class="form-control"/>
                     </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-3">
                      <div class="form-group">
                        <label for="startDate">開始日期</label>
                        <input value='${startDate}' id="startDate" name="startDate" class="form-control">
                      </div>
                    </div>     
                    <div class="col-md-3">
                      <div class="form-group">
                        <label for="endDate">結束日期</label>
                        <input value='${endDate}' id="endDate" name="endDate" class="form-control">
                      </div>
                    </div>
                    
                    
                    
    
                    <div class="col-md-2">
                      <div class="form-group">
                        <label for="termType">長短期</label>
                        <select id="termType" name="termType" class="form-control">
					        <option value="S">短期</option>
					        <option value="L">長期</option>
    					</select>
                      </div>
                    </div>
                    <div class="col-md-2">
                      <div class="form-group">
                        <label for="peopleNeeded">需求人數</label>
                        <input value='${mission.peopleNeeded}' type="text" value="" id="peopleNeeded" name="peopleNeeded" class="form-control"/>
                      </div>
                    </div>
                    <div class="col-md-2">
                      <div class="form-group">
                        <label for="timeValue">支付時數</label>
                        <input value='${mission.timeValue}' type="text" id="timeValue" name="timeValue" class="form-control"/>
                      </div>
                    </div>   
                  </div>
                  <div class="row">
                    <div class="col-md-6 col-lg-3">
                      <div class="form-group">
                        <label for="contactPerson">聯絡人</label>
                        <input value='${mission.contactPerson}' type="text" id="contactPerson" name="contactPerson" class="form-control"/>
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                      <div class="form-group">
                        <label for="contactPhone">聯絡電話</label>
                        <input value='${mission.contactPhone}' id="contactPhone" name="contactPhone" type="text" class="form-control">
                      </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                      <div class="form-group">
                        <label for="email">聯絡Email</label>
                        <input value='${mission.contactEmail}' type="email" id="contactEmail" name="contactEmail" class="form-control"/>
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
                        <textarea class="form-control"  id="discription" name="discription" rows="3">${mission.discription}</textarea>
                      </div>
                    </div>
                    <div class="col-md-11 text-center">
                      <button id="insertMission" type="submit" class="btn btn-template-outlined"><i class="fa fa-plus"></i>刊登活動</button>
                    </div>
                    <div class="col-md-1">
                    	<span id="setValue" class="btn btn-template-outlined"><i class="fa fa-plus"></i>一鍵帶入</span>
                    </div>
                  </div>
                </form>
              </div>
          </div>
        </div>
	 </section>
	  
	  
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp"/>
	<script>
	
// 		$('#insertMission').click(function(){
// 			swal({
// 				  title: "刊登確認",
// 				  text: "確定刊登?",
// 				  icon: "warning",
// 				  buttons: true,
// 				  dangerMode: true,
// 				}).then((willreject) => {
// 					if(willreject){
// 						$.post("/user/missionPublish/insert",{"missionId":missionId},
// 							function(data){
// 								
// 						})
// 					}else{
						
// 					}
// 				})	
// 		})
		
	
		$('#setValue').click(function(){
			$('#title').val("友夢不老-助爺奶圓夢");
			$('#serviceType').val("3");
			$("select[name='county']").val('台北市');
			$("select[name='district']>option").val("南港區");
			$("select[name='district']>option").text("南港區");
			$('#address').val("忠孝東路6段484號B1");
			$('#startDate').val('2019/01/10 00:00');
			$('#endDate').val('2019/01/12 00:00');
			$('#termType').val('S');
			$('#peopleNeeded').val('2');
			$('#timeValue').val("8");
			$('#contactPerson').val('蔡明珠');
			$('#contactPhone').val('02-66171885');
			$('#contactEmail').val('juliantsai@canlove.org.tw');
			$('#discription').val(
"曾經是老師的小林奶奶快80歲了，她最大的夢想，就是再一次回到校園，聽到孩子們的說一聲: 「小林老師好!」或許你也聽過這些老人話?『老人攏沒路用，攏沒人管 ！』『一個人很孤單、很苦…』『全身都是病啦，死一死算了。』一次用夢想再點燃希望的行動，肯愛協會正在關心離家的弱勢老人，讓有夢的老人有「夢」有活力陪伴離家老人找到生活的意義，身心的健康及好好活的動力。--我們想和你一起--");
		})
	
		$(document).ready(function() {
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
			});
			
			$('#endDate').datetimepicker({
				dateFormat: "yy/mm/dd",
			    autoclose: true,
			    todayHighlight: true,
			    language: 'zh-TW',
			    startView:"years",
			    minDate: '0',
			    numberOfMonths: 2,
			    stepMinute: 10,
			});

			$("div[role='tw-city-selector']").attr("data-county-value",'${mission.county}');
			$("div[role='tw-city-selector']").attr("data-district-value", '${mission.district}');
			
		
			
			if(${not empty response.messages}){
					swal({
					  title: "刊登失敗",
					  text: '${response.messages}',
					  icon: "error",
					  buttons: false,
					  dangerMode: false,
					})
				}else if('${res}' == 'SUCCESS'){
					swal({
						title: "刊登結果",	
						text: "刊登成功",
						icon:"success",
						buttons: false,
						dangerMode: false,
					})
				}
		})
		

</script>
</body>

</html>