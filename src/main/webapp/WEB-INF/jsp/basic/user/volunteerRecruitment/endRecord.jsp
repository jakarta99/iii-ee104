<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
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



<meta charset="UTF-8">
<title>結案紀錄 | TimeBank</title>
<style>
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
	<!--heading crumbs-->
	<jsp:include page="../../commons/commons_layout/commons_heading_breadcrumbs_member_area.jsp" />
	<!-- Sidebar -->
	<jsp:include page="../user_layout/user_sidebar.jsp"/>
     <div id="content" class="team-member-detail">
        <div class="container">
          <section class="bar">
            <div class="row">
              <div class="col-md-7">
                <div class="heading">
                  <h2>活動介紹</h2>
                </div>
                <p align="center" class="lead">${mission.discription}
				</div>
				<div class="col-md-5">
					<ul class="ul-icons list-unstyled">
				 	<li class="cover">
              			<img  style="width:445px;height:250px;border-radius: 5px;" id="missionImg" alt="" src="/image/user/mission/${mission.missionPicName}" class="img-fluid rounded-square">
					</li>
					</ul>
				</div>
            </div>
            <div class="row">
            	<div class="col-md-8">
            		<div class="heading">
                  		<h3>活動資訊</h3>
                	</div>
            	</div>
            </div>
            <div class="row">
              <div class="col-md-4">
                
				<ul class="ul-icons list-unstyled">
						
					<li>
						<div class="icon-filled">聯絡人</div><span style="font-size:18px">${mission.contactPerson}</span>
					</li>
					<li>
						<div class="icon-filled">聯絡電話</div><span style="font-size:18px">${mission.contactPhone}</span>
					</li>
					<li>
						<div class="icon-filled">聯絡信箱</div><span style="font-size:18px">${mission.contactEmail}</span>
					</li>
					<li >
						<div class="icon-filled">活動地點</div><p style="font-size:18px">${mission.county}${mission.district}${mission.address}</p>
					</li>
					<li>
						<div class="icon-filled">起迄時間</div><p style="font-size:18px"><fmt:formatDate pattern="yyyy-MM-dd HH-mm" value="${mission.startDate}"/> ~ <fmt:formatDate pattern="yyyy-MM-dd HH-mm" value="${mission.endDate}"/></p>
					</li>		
				</ul>

              </div>
              <div class="col-md-3">
              	<ul class="ul-icons list-unstyled">
              		<li>
						<div class="icon-filled">服務種類</div><span style="font-size:18px">${mission.serviceType.serviceType}</span>
					</li>
					<li>
						<div class="icon-filled">服務類型</div><span style="font-size:18px">
							<c:if test="${mission.termType == 'L'}"> 
								長期
							</c:if> 
							<c:if test="${mission.termType == 'S'}"> 
								短期
							</c:if>
						</span>	
					</li>
					<li>
						<div class="icon-filled">需求人數</div><span style="font-size:18px">${mission.peopleNeeded}人</span>
					</li>
					<li>
						<div class="icon-filled">活動時數</div><span style="font-size:18px">${mission.timeValue}小時</span>
					</li>
              	</ul>
              
              </div>
              <div class="col-md-5">
              	<section>
					<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCNASLitmpPiGxtg94A3WqLl8bHHk0lzJM&callback=initMap"></script>

					    <div style="height:250px" id="map"></div>
		          </section>
				 <script>
	$(document).ready(function(){
		var t = "<a href='/user/volunteerRecruitment/list' style='font-weight: 700;'>/招募紀錄</a>/結案紀錄"			
		$("#webTitle").empty().append("結案紀錄");
		$("#lastPage").after(t);
	})
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
	</script> 
              </div>
            </div>
            <div class="row">
            	<div class="col-md-12">
            		<div class="heading">
                  		<h3>參與志工</h3>
                	</div>
            	</div>
            </div>
            <div class="row">
              <div class="col-md-7">
              	<ul class="ul-icons list-unstyled">
              	<li>
              		<c:forEach var="order" items="${orders}">
              		
              			<div style="margin-right: 30px;margin-bottom: 10px;display: inline-block;"><img style="border:1px solid black" id="memberImg" alt="" src="/image/user/member/${order.volunteer.picture}" class="img-fluid rounded-circle"> 
							<a style="font-size:16px;font-weight:600;" href="/commons/personal-info/list?memberId=${order.volunteer.id}">${order.volunteer.name}</a>
						</div>
              			
              		
              		</c:forEach>
              	</li>
              	</ul>
              </div>
            </div>
            
          </section>
 			
          
        </div>
      </div>

     




<jsp:include page="../../commons/commons_layout/commons_footer.jsp"/>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
	
	




</body>
</html>