<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- css -->
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp"/>

<!-- Javascript files-->
<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />

<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<!-- sweet alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">  
				
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



<meta charset="UTF-8">
<title>mission Detail</title>
<style>

	 	
        fieldset {
            width: 100%;
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
              <h1 class="h2" align="center" style=color:brown>${mission.title}</h1>
            </div>
            <div class="col-md-5">
              <ul class="breadcrumb d-flex justify-content-end">
                <li class="breadcrumb-item"><a href="index.html">首頁</a></li>
                <li class="breadcrumb-item"><a href="team.html">志工招募</a></li>
                <li class="breadcrumb-item active">招募申請</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div id="content" class="team-member-detail">
        <div class="container">
          <section class="bar">
            <div class="row">
              <div class="col-md-12">
                <div class="heading">
                  <h2>活動介紹</h2>
                </div>
                <p align="center" class="lead">${mission.discription}
				</div>
            </div>
            <div class="row">
              <div class="col-md-8">
                <div class="heading">
                  <h3>活動資訊</h3>
                </div>
				<ul class="ul-icons list-unstyled">
					<li>
						<div class="icon-filled"></div>活動地點:${mission.county}${mission.district}${mission.address}
					</li>
					<li>
						<div class="icon-filled"></div>服務種類:${mission.serviceType.serviceType}
					</li>
					<li>
						<div class="icon-filled"></div>服務類型:
							<c:if test="${mission.termType == 'L'}"> 
								長期
							</c:if> 
							<c:if test="${mission.termType == 'S'}"> 
								短期
							</c:if>
					</li>
					<li>
						<div class="icon-filled"></div>起迄時間:<fmt:formatDate pattern="yyyy-MM-dd HH-mm" value="${mission.startDate}"/> ~ <fmt:formatDate pattern="yyyy-MM-dd HH-mm" value="${mission.endDate}"/>
					</li>
					<li>
						<div class="icon-filled"></div>需求人數:${mission.peopleNeeded}人
					</li>
					<li>
						<div class="icon-filled"></div>活動時數:${mission.timeValue}小時
					</li>
					<li>
						<div class="icon-filled"></div>聯絡人:${mission.contactPerson}
					</li>
					<li>
						<div class="icon-filled"></div>聯絡電話:${mission.contactPhone}
					</li>
					<li>
						<div class="icon-filled"></div>聯絡Email:  ${mission.contactEmail}
					</li>
				</ul>
				<div class="col-md-12 text-center">
					<button onclick="insertOrder(${mission.id})" class="btn btn-template-outlined"><i class="fa fa-plus"></i>我要參加</button>
				</div>
              </div>
              <div class="col-md-4"><img id="missionImg" alt="" src="/image/user/mission/${mission.missionPicName}" class="img-fluid rounded-circle"></div>
            	
            	
            	
            	
            	
            	<table>
            		<tr>
            			<td>會員名稱:${member.name}</td>
            		</tr>
            		<tr>
            			<td>會員名稱:</td>
            		</tr>
            		<tr>
            			<td>會員名稱:${member.name}</td>
            		</tr>
            		<tr>
            			<td>會員名稱:${member.name}</td>
            		</tr>         	
            	</table>
            </div>
          </section>
 
        </div>
	 </div>



<jsp:include page="../../commons/commons_layout/commons_footer.jsp"/>
	<script>
	function insertOrder(missionId){
		swal({
			  title: "申請確認",
			  text: "確定申請?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			}).then((willreject) => {
				if(willreject){
					$.get("/user/volunteerRecruitment/insert",{"missionId":missionId},
						function(data){
							if(data.messages == '申請成功'){
								swal({
								  title: "申請結果",
								  text: "申請成功",
								  icon: "success",
								  buttons: false,
								  dangerMode: false,
								})
							}else{
								swal({
									  title: "申請失敗",
									  text: " " + data.messages,
									  icon: "error",
									  buttons: false,
									  dangerMode: false,
									})
							}
					})
				}else{
					
				}
				
			})
// 				if(wullreject){
// 					$.get(
// 						"/user/volunteerRecruitment/insert",
// 						{"missionId":missionId},
// 						function(data){
// 							if(data.messages == '申請成功'){
// 								swal({
// 									  title: "申請結果",
// 									  text: "申請成功",
// 									  icon: "sucess",
// 									  buttons: false,
// 									  dangerMode: false,
// 									})
// 							}else{
// 								swal({
// 									  title: "申請結果",
// 									  text: "申請失敗",
// 									  icon: "error",
// 									  buttons: false,
// 									  dangerMode: false,
// 									})
// 							}
							
// 						}
// 					)
// 				}
// 			}	
	}
	
	
	</script>




</body>
</html>