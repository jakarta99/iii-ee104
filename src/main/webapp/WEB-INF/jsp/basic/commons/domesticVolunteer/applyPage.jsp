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
<title>招募申請 | TimeBank</title>
<style>
	#chatButton {
	    border: 1px solid #FFAA33 !important;
	}
	#chatButton:hover, #chatButton:focus{
	    background: #FFAA33;
	}
	.cover {
	    overflow: hidden;
	    position:relative;
	}
	.cover:after {
		position:absolute;
		content:'';
		width:100%;
		height:100%;
		top:0;
		left:0;
		box-shadow:0 0 30px 10px rgba(255,255,255,.7) inset;
     }
	
	.img-fluid {
	    height: 30px;
	}
	.icon-filled {
	    width: 90px;
	    height: 24px;
	    line-height: 24px;
	    background: #13b5b1;
	    color: #fff;
	    text-align: center;
	    border-radius: 5px;
	    font-size: 18px;
	}
	#memberhref{
		color: #FFAA33;
	}
	#memberhref:hover{
	    color:#AA7700;
	    text-decoration: blink;
	}
	.ul-icons .icon-filled {
	    margin-bottom: 3px;
	}

	table img {
 		min-width: 35px !important;
  		max-width: 35px !important;
  		height: 50px;
	}
	.fc-title{	
		letter-spacing:3px;
	}
 	.img{
		width: 90%;
		height: 90%;
		position: absolute;
    	top: 0;
    	bottom: 0;
    	left: 0;
    	border: 0;
    	
    }
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
	 #map {
        height: 400px;
        width: 100%;
     }
 
    </style>
</head>
<body>

 <!-- Top bar-->
      <jsp:include page="../../commons/commons_layout/commons_top-bar.jsp"/>
 	
	  <!-- Navbar -->
      <jsp:include page="../../commons/commons_layout/commons_nav.jsp"/>





<!--        <div id="heading-breadcrumbs"> -->
<!--         <div class="container"> -->
<!--           <div class="row d-flex align-items-center flex-wrap"> -->
<!--             <div class="col-md-7"> -->
<%--               <h1 class="h2" align="center" style=color:brown>${mission.title}</h1> --%>
<!--             </div> -->
<!--             <div class="col-md-5"> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
      <!--heading crumbs-->
      <section style="background: url('/banner/1607281720180.jpg') center center repeat;padding:12rem 0" class="bar background-white relative-positioned">
		<div class="dark-mask"></div>
	    <div class="container">
	         <div class="row d-flex align-items-center flex-wrap">
	             <h1 class="h2"  style="margin:auto;color:#fff;font-size:42px;">志工招募</h1>
	         </div>
	     </div>
	      <div class="container">
	         <div class="row d-flex align-items-center flex-wrap">
	             <div  style="margin:auto;color:#fff;font-size:20px;margin-top:20px">
	                <div class="breadcrumb-item"><a href="/">首頁</a>/<a href="/commons/domesticVolunteer/list">志工招募</a>/志工申請</div>
				</div>
	         </div>
	     </div>
	   </section> 
      
      
      
      
      <div id="content" class="team-member-detail">
        <div class="container">
          <section class="bar">
            <div class="row">
              <div class="col-md-7">
                <div class="heading">
                  <h2>活動介紹</h2>
                </div>
                <p  class="lead">${mission.discription}
				</div>
				 <div class="col-md-5">
				 	<ul class="ul-icons list-unstyled">
				 	<li class="cover">
              			<img  style="width:445px;height:250px;border-radius: 5px;" id="missionImg" alt="" src="/image/user/mission/${mission.missionPicName}" class="img-fluid rounded-square">
					</li>
					<li>
					<div>
						<div style="background:#FFAA33;width:70px;" class="icon-filled">刊登者</div>
						<div style="width:250px;display: inline-block;"><img style="border:0.5px solid white" id="memberImg" alt="" src="/image/user/member/${member.picture}" class="img-fluid rounded-circle"> 
							<a id="memberhref" style="font-size:16px;font-weight: 600;" href="/commons/personal-info/list?memberId=${member.id}">${member.name}</a>
						</div>
						<div style="width:90px;display:inline-block;">
							<button style="margin-left:5px;color:#FFAA33" id="chatButton" class="btn btn-template-outlined">與我聯絡</button>
						</div>
					</div>
					
					</li>
				</ul>
              </div>
            </div>
          <div class="row">
            <div class="col-md-12">
            <div class="heading">
                  <h3>活動資訊</h3>
                </div>
            </div>
            </div>
            <div class="row">
              <div class="col-md-4">
                
				<ul class="ul-icons list-unstyled">
						
					<li>
						<div class="icon-filled">聯絡人</div><span style="font-size:16px">${mission.contactPerson}</span>
					</li>
					<li>
						<div class="icon-filled">聯絡電話</div><span style="font-size:16px">${mission.contactPhone}</span>
					</li>
					<li>
						<div class="icon-filled">聯絡Email</div><span style="font-size:16px">${mission.contactEmail}</span>
					</li>
					<li >
						<div class="icon-filled">活動地點</div><p style="font-size:16px">${mission.county}${mission.district}${mission.address}</p>
					</li>
					<li>
						<div class="icon-filled">起迄時間</div><p style="font-size:16px"><fmt:formatDate pattern="yyyy-MM-dd HH-mm" value="${mission.startDate}"/> ~ <fmt:formatDate pattern="yyyy-MM-dd HH-mm" value="${mission.endDate}"/></p>
					</li>		
				</ul>

              </div>
              <div class="col-md-3">
              	<ul class="ul-icons list-unstyled">
              		<li>
						<div class="icon-filled">服務種類</div><span style="font-size:16px">${mission.serviceType.serviceType}</span>
					</li>
					<li>
						<div class="icon-filled">服務類型</div><span style="font-size:16px">
							<c:if test="${mission.termType == 'L'}"> 
								長期
							</c:if> 
							<c:if test="${mission.termType == 'S'}"> 
								短期
							</c:if>
						</span>	
					</li>
					<li>
						<div class="icon-filled">需求人數</div><span style="font-size:16px">${mission.peopleNeeded}人</span>
					</li>
					<li>
						<div class="icon-filled">活動時數</div><span style="font-size:16px">${mission.timeValue}小時</span>
					</li>
              	</ul>
              
              </div>
              <div class="col-md-5">
<!--      google map  -->
		          <section>
					<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCNASLitmpPiGxtg94A3WqLl8bHHk0lzJM&callback=initMap"></script>

					    <div style="height:210px" id="map"></div>
		          </section> 
              </div>
              <div class="col-md-7 text-center">
					<button onclick="insertOrder(${mission.id})" class="btn btn-template-outlined"><i class="fa fa-plus"></i>我要參加</button>
				</div> 
            </div>
            	   	
          </section>
     
       
            </div>
        </div>
     
	<script>
	var map, geocoder;
	
	var address = "${mission.county}${mission.district}${mission.address}";
    function initMap() {
  	geocoder = new google.maps.Geocoder();
      map = new google.maps.Map(document.getElementById('map'), {
        zoom: 13,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        center : {
			lat : 25.0477505,
			lng : 121.5170599
		},
      });
	  	if(geocoder){
	  		geocoder.geocode({"address": address}, function(results, status) {
    			if(status != google.maps.GeocoderStatus.OK)  {
    				console.log(status)
    				alert("Geocoder Failed: " + status);
    			} else {
    				map.setCenter(results[0].geometry.location);
    				var marker = new google.maps.Marker({
    					map: map,
    					position: results[0].geometry.location,
    					title: address
    				});
    				var popup = new google.maps.InfoWindow({
    					content: address,
    				    position: results[0].geometry.location,
//     				    maxWidth:200,
//     				    pixelOffset: new google.maps.Size(100, -20) 
    				});
    				popup.open(map,marker);
    			}
    		});
	  	}
    }	
	function afterLogin(missionId){
		$.ajax({url:"/user/volunteerRecruitment/insert?missionId="+missionId,
				type:'get',
				dataType:'json',
				success:function(data){
					if(data.status == 'SUCCESS'){
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
							  text: " "+data.messages,//空格不可以刪
							  icon: "error",
							  buttons: false,
							  dangerMode: false,
							})
					}
				}
					
				})
		
	}
	function insertOrder(missionId){
		swal({
			  title: "申請確認",
			  text: "確定申請?",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			}).then((willreject) => {
				if(willreject){
					$.ajax({
						url:"/user/volunteerRecruitment/insert?missionId="+missionId,
						type:'get',
						dataType:'json',
						success:function(data){
							if(data.status == 'SUCCESS'){
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
								  text: " "+data.messages,//空格不可以刪
								  icon: "error",
								  buttons: false,
								  dangerMode: false,
								})
							}
						}
					}).fail(function( jqXHR, textStatus){
						if(jqXHR.status == 200){
							$("#login-modal").addClass("modal fade show");
				    	   	$("#login-modal").css("display","block");
				    	   	$("#login-modal").css("padding-right","17px");
				    	   	$("#action").val("volunteerApply");
						}
					})
					
// 							function( data, textStatus, jqXHR ){
// 							console.log(jqXHR);
// 							console.log(data);
// 							if(data.status == 'SUCCESS'){
// 								swal({
// 								  title: "申請結果",
// 								  text: "申請成功",
// 								  icon: "success",
// 								  buttons: false,
// 								  dangerMode: false,
// 								})
// 							}
// // 							else if(data.status == undefined){
// // 								 window.location.replace("/login")
// // 							} 
// 							else{
								
// 								swal({
// 									  title: "申請失敗",
// 									  text: " "+data.messages,
// 									  icon: "error",
// 									  buttons: false,
// 									  dangerMode: false,
// 									})
// 							}
// 					})
				}else{
					
				}
			})
		}
	
	function startToChat(){
		createChatBox('${mission.member.account}', '${mission.member.name}');		
	
	}
		
	$(document).ready(function() {
		if ('${applying}' == 'Y'){
			afterLogin('${mission.id}');
		}
	})
	

	

	
	
	
	
	</script>



	<jsp:include page="../../commons/commons_layout/commons_footer.jsp"/>
</body>
</html>