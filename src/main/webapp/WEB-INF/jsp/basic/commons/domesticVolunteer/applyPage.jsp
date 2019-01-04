<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- css -->
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp"/>

<!-- Javascript files-->
<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />

<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>


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
              <h1 class="h2">${mission.title}</h1>
            </div>
            <div class="col-md-5">
              <ul class="breadcrumb d-flex justify-content-end">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item"><a href="team.html">Our Team</a></li>
                <li class="breadcrumb-item active">Team Member</li>
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
                <p class="lead">${mission.discription}</p>
              </div>
            </div>
            <div class="row">
              <div class="col-md-8">
                <div class="heading">
                  <h3>活動資訊</h3>
                </div>
                <ul class="ul-icons list-unstyled">
                  <li>
                    <div class="icon-filled"></div>服務種類:${mission.serviceType.serviceType}
                  </li>
                  <li>
                    <div class="icon-filled"></div>服務類型:
                  </li>
                  <li>
                    <div class="icon-filled"></div>起迄時間:${mission.startDate} ~ ${mission.endDate}
                  </li>
                  <li>
                    <div class="icon-filled"></div>需求人數:${mission.peopleNeeded}
                  </li>
                  <li>
                    <div class="icon-filled"></div>活動時數:${mission.timeValue}
                  </li>
                  <li>
                    <div class="icon-filled"></div>聯絡人:${mission.contactPerson}
                  </li>
                  <li>
                    <div class="icon-filled"></div>聯絡電話:${mission.contactPhone}
                  </li>
                </ul>
              </div>
              <div class="col-md-4"><img id="missionImg" alt="" src="../../img/${mission.missionPicName}" class="img-fluid rounded-circle"></div>
            </div>
          </section>
          <section class="bar pt-0">
            <div class="row">
              <div class="col-md-4">
                <div class="heading">
                  <h3>Get in touch with Han</h3>
                </div>
                <ul class="social list-inline">
                  <li class="list-inline-item"><a href="#" class="external facebook"><i class="fa fa-facebook"></i></a></li>
                  <li class="list-inline-item"><a href="#" class="external gplus"><i class="fa fa-google-plus"></i></a></li>
                  <li class="list-inline-item"><a href="#" class="external twitter"><i class="fa fa-twitter"></i></a></li>
                  <li class="list-inline-item"><a href="#" class="email"><i class="fa fa-envelope"></i></a></li>
                </ul>
              </div>
              <div class="col-md-4">
                <div class="heading">
                  <h3>Han's presentations</h3>
                </div>
                <ul class="ul-icons list-unstyled">
                  <li>
                    <div class="icon-filled"><i class="fa fa-check"></i></div><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</a>
                  </li>
                  <li>
                    <div class="icon-filled"><i class="fa fa-check"></i></div><a href="#">Aliquam tincidunt mauris eu risus.</a>
                  </li>
                  <li>
                    <div class="icon-filled"><i class="fa fa-check"></i></div><a href="#">Vestibulum auctor dapibus neque.</a>
                  </li>
                </ul>
              </div>
              <div class="col-md-4">
                <div class="heading">
                  <h3>Han's articles</h3>
                </div>
                <ul class="ul-icons list-unstyled">
                  <li>
                    <div class="icon-filled"><i class="fa fa-check"></i></div><a href="#">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</a>
                  </li>
                  <li>
                    <div class="icon-filled"><i class="fa fa-check"></i></div><a href="#">Aliquam tincidunt mauris eu risus.</a>
                  </li>
                  <li>
                    <div class="icon-filled"><i class="fa fa-check"></i></div><a href="#">Vestibulum auctor dapibus neque.</a>
                  </li>
                </ul>
              </div>
            </div>
          </section>
        </div>
        <section class="bar bg-gray">
          <div class="container">
            <div class="row">
              <div class="col-md-12">
                <div class="heading text-center">
                  <h2>Clients Han is taking care of</h2>
                </div>
                <ul class="list-unstyled owl-carousel customers no-mb">
                  <li class="item"><img src="img/customer-1.png" alt="" class="img-fluid"></li>
                  <li class="item"><img src="img/customer-2.png" alt="" class="img-fluid"></li>
                  <li class="item"><img src="img/customer-3.png" alt="" class="img-fluid"></li>
                  <li class="item"><img src="img/customer-4.png" alt="" class="img-fluid"></li>
                  <li class="item"><img src="img/customer-5.png" alt="" class="img-fluid"></li>
                  <li class="item"><img src="img/customer-6.png" alt="" class="img-fluid"></li>
                </ul>
              </div>
            </div>
          </div>
        </section>
      </div>
      <!-- GET IT-->
      <div class="get-it">
        <div class="container">
          <div class="row">
            <div class="col-lg-8 text-center p-3">
              <h3>Do you want cool website like this one?</h3>
            </div>
            <div class="col-lg-4 text-center p-3">   <a href="#" class="btn btn-template-outlined-white">Buy this template now</a></div>
          </div>
        </div>
      </div>




<jsp:include page="../../commons/commons_layout/commons_footer.jsp"/>
	<script>
	$(document).ready(function () {
		
		
		
		
	})
	
	
	
	
	</script>




</body>
</html>