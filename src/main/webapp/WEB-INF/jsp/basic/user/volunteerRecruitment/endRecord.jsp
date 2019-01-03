<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>mission list(login)</title>
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
              <h1 class="h2">${mission.title}結案紀錄</h1>
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
                <p class="lead">${mission.discription }</p>
              </div>
            </div>
            <div class="row">
              <div class="col-md-8">
                <p>Satisfied conveying an dependent contented he gentleman agreeable do be. Warrant private blushes removed an in equally totally if. Delivered dejection necessary objection do mr prevailed. Mr feeling do chiefly cordial in do. Water timed folly right aware if oh truth. Imprudence attachment him his for sympathize. Large above be to means. Dashwood do provided stronger is. But discretion frequently sir the she instrument unaffected admiration everything.</p>
                <p>Abilities forfeited situation extremely my to he resembled. Old had conviction discretion understood put principles you. Match means keeps round one her quick. She forming two comfort invited. Yet she income effect edward. Entire desire way design few. Mrs sentiments led solicitude estimating friendship fat. Meant those event is weeks state it to or. Boy but has folly charm there its. Its fact ten spot drew.</p>
                <p>So feel been kept be at gate. Be september it extensive oh concluded of certainty. In read most gate at body held it ever no. Talking justice welcome message inquiry in started of am me. Led own hearted highest visited lasting sir through compass his. Guest tiled he quick by so these trees am. It announcing alteration at surrounded comparison.</p>
                <div class="heading">
                  <h3>Han's main responsibilities are</h3>
                </div>
                <ul class="ul-icons list-unstyled">
                  <li>
                    <div class="icon-filled"><i class="fa fa-check"></i></div>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
                  </li>
                  <li>
                    <div class="icon-filled"><i class="fa fa-check"></i></div>Aliquam tincidunt mauris eu risus.
                  </li>
                  <li>
                    <div class="icon-filled"><i class="fa fa-check"></i></div>Vestibulum auctor dapibus neque.
                  </li>
                </ul>
              </div>
              <div class="col-md-4"><img alt="" src="/img/detailsquare.jpg" class="img-fluid rounded-circle"></div>
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
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
	<script type="text/javascript">
	
	
	
	
	</script>




</body>
</html>