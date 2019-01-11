<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Personal Information</title>
<!-- css -->
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp" />
<!-- Javascript files -->
<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />
<!-- 台灣縣市地區選單	 -->
<script src="/js/tw-city-selector.min.js"></script>
<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />
<!-- sweetAlert -->
<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->

<style>
	body{
		font-family: "微軟正黑體"
	}
	article{
		width:100%;
	}
/* 	.county,.district { */
/* 	  	padding: 0.375rem 0.75rem; */
/* 	  	font-size: 1rem; */
/* 		line-height: 1.5; */
/* 		color: #495057; */
/* 		background-color: #fff; */
/* 		background-image: none; */
/* 		background-clip: padding-box; */
/* 		border: 1px solid #ced4da; */
/* 		border-radius: 0.25rem; */
/* 		transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s; */
/* 	}  */
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
              		<h1 class="h2">${member.name} 用戶資訊</h1>
            	</div>
<!-- 	            <div class="col-md-5"> -->
<!-- 	              	<ul class="breadcrumb d-flex justify-content-end"> -->
<!-- 	                	<li class="breadcrumb-item"><a href="index.html">Home</a></li> -->
<!-- 	                	<li class="breadcrumb-item"><a href="team.html">Our Team</a></li> -->
<!-- 	                	<li class="breadcrumb-item active">Team Member</li> -->
<!-- 	              	</ul> -->
<!-- 	            </div> -->
        	</div>
        </div>
    </div>
	<!-- Sidebar -->
	<jsp:include page="../user_layout/user_sidebar.jsp"/>
	<section class="bar">
	<div class="container">
    	<div class="row">
            <article>
            	<div class="row">
                    <div class="col-md-4">
                      	<div class="form-group">
                      		<div class="heading">
								<h3>基本介紹</h3>
							</div>
                      	</div>
                    </div>
                    <div class="col-md-4">
                      	<div class="form-group">
                      		<c:if test="${member.memberType eq 'O' }">
								<div class="heading">
									<h3>機構介紹</h3>
								</div>
							</c:if>
                      	</div>
                    </div>
                </div>
				<div class="row">
                    <div class="col-md-4">
                      	<div class="form-group">
                      		<ul class="ul-icons list-unstyled">
                      			<li>
									<div class="icon-filled"></div>名稱  : ${member.name}
								</li>
								<fmt:formatDate value="${member.birthDate}" pattern="yyyy/MM/dd" var="birthDate"/>
								<li>
									<c:choose>
										<c:when test="${member.memberType eq 'P'}">
											<div class="icon-filled"></div>出生日期  : ${member.birthDate}
										</c:when>
										<c:when test="${member.memberType eq 'O'}">
											<div class="icon-filled"></div>創立日期  : ${member.birthDate}
										</c:when>
									</c:choose>
								</li>			
								<li>
									<div class="icon-filled"></div>Email : ${member.email}
								</li>
								<li>
									<div class="icon-filled"></div>室內電話  : ${member.telephone}
								</li>
								<li>
									<div class="icon-filled"></div>手機  : ${member.mobile}
								</li>
								<li>
									<div class="icon-filled"></div>地址  : ${member.county}${member.district}${member.address}
								</li>
							</ul>
						</div>
					</div>
					<div class="col-md-4">
		            	<div class="form-group">		
							<c:if test="${member.memberType eq 'O' }">
								<ul class="ul-icons list-unstyled">
									<li>
										<div class="icon-filled"></div>創辦人  : ${member.orgFounder}
									</li>
									<li>
										<div class="icon-filled"></div>執行長  : ${member.orgCeo}
									</li>
									<li>
										<div class="icon-filled"></div>聯絡人  : ${member.orgContactPerson}
									</li>
									<li>
										<div class="icon-filled"></div>聯絡人電話  : ${member.orgContactPersonTel}
									</li>
									<li>
										<div class="icon-filled"></div>聯絡人手機  : ${member.orgContactPersonMobile}
									</li>
									<li>
										<div class="icon-filled"></div>網址  : ${member.orgWebsiteLink}
									</li>
									<li>
										<div class="icon-filled"></div>創立宗旨  : ${member.orgFoundPurpose}
									</li>
								</ul>
							</c:if>
						</div>
	                </div>
	                <div class="col-md-4">
	                	<div class="form-group">
	                		<img style="width:300px;height:270px" id="picture" alt="" src="/image/user/member/${member.picture}" class="img-fluid rounded-circle">
	                	</div>
	                </div>
	        	</div>
			</article>
		</div>
	</div>
	</section>
	<!-- FOOTER -->
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp"/>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
 	<script>    
			//edit pesonal-info event
// 			$("#edit").click(function() {
// 				window.location.replace("/user/personal-info/edit");
// 			});

			$(document).ready(function(){
 
			})
	</script>
</body>
</html>