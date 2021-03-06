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
<jsp:include page="commons_layout/commons_css_links.jsp" />
<!-- Javascript files -->
<jsp:include page="commons_layout/commons_js_links.jsp" />
<!-- 台灣縣市地區選單	 -->
<script src="/js/tw-city-selector.min.js"></script>
<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />

<style>
	body{
		font-family: "微軟正黑體"
	}
	article{
		width:100%;
	}
</style>

</head>
<body>
	<!-- Top bar-->
	<jsp:include page="commons_layout/commons_top-bar.jsp"/>
	<!-- Navbar -->
	<jsp:include page="commons_layout/commons_nav.jsp"/>
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
            	<div class="breadcrumb-item"><a href="/">首頁</a>/<a href="/commons/domesticVolunteer/list">志工招募</a>/${member.name}</div>
			</div>
        </div>
    </div>
   	</section> 
<!-- 	<div id="heading-breadcrumbs"> -->
<!--     	<div class="container"> -->
<!--         	<div class="row d-flex align-items-center flex-wrap"> -->
<!--             	<div class="col-md-7"> -->
<%--               		<h1 class="h2">${member.name}</h1> --%>
<!--             	</div> -->
<!-- 	            <div class="col-md-5"> -->
<!-- 	              	<ul class="breadcrumb d-flex justify-content-end"> -->
<!-- 	                	<li class="breadcrumb-item"><a href="/">Home</a></li> -->
<!-- 	                	<li class="breadcrumb-item active">Member Information</li> -->
<!-- 	              	</ul> -->
<!-- 	            </div> -->
<!--         	</div> -->
<!--         </div> -->
<!--     </div> -->
	<section class="bar">
	<div class="container">
    	<div class="row">
            <article>
            	<div class="row">
                    <div class="col-md-9">
                      	<div class="form-group">
                      		<div class="heading">
								<h3>基本介紹</h3>
							</div>
						</div>
						<div class="row">
						<div class="col-md-6">
		                    <div class="form-group">
		                      	<ul class="ul-icons list-unstyled">
									<fmt:formatDate value="${member.birthDate}" pattern="yyyy/MM/dd" var="birthDate"/>
									<li>
										<c:choose>
											<c:when test="${member.memberType eq 'P'}">
												<div class="icon-filled"></div><span style="font-size:20px">出生日期  : <span id="date"></span></span>
											</c:when>
											<c:when test="${member.memberType eq 'O'}">
												<div class="icon-filled"></div><span style="font-size:20px">創立日期  : <span id="date"></span></span>
											</c:when>
										</c:choose>
									</li>			
									<li>
										<div class="icon-filled"></div><span style="font-size:20px">Email : ${member.email}</span>
									</li>
									<li>
										<div class="icon-filled"></div><span style="font-size:20px">地址  : ${member.county}${member.district}${member.address}</span>
									</li>
								</ul>
							</div>
						</div>
						<div class="col-md-6">
			                <div class="form-group">
			                    <ul class="ul-icons list-unstyled">
									<li>
										<div class="icon-filled"></div><span style="font-size:20px">手機  : ${member.mobile}</span>
									</li>
									<li>
										<div class="icon-filled"></div><span style="font-size:20px">室內電話  : ${member.telephone}</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
					</div>
                    <div class="col-md-3 text-center">
                    	<div>
	                		<img style="width:250px;height:225px" id="picture" alt="" src="/image/user/member/${member.picture}" class="img-fluid rounded-circle">
	                	</div><br/>
	                	<button id="chatButton" class="btn btn-template-outlined">與我聯絡</button>
                    </div>
                </div>
				<div class="row">
                    <div class="col-md-9">
                      	<div class="form-group">
                      		<c:if test="${member.memberType eq 'O' }">
								<div class="heading">
									<h3>機構介紹</h3>
								</div>
				            	<div class="row">
									<div class="col-md-6">
						            	<div class="form-group">		
											<ul class="ul-icons list-unstyled">
												<li>
													<div class="icon-filled"></div><span style="font-size:20px">創辦人  : ${member.orgFounder}</span>
												</li>
												<li>
													<div class="icon-filled"></div><span style="font-size:20px">執行長  : ${member.orgCeo}</span>
												</li>
												<li>
													<div class="icon-filled"></div><span style="font-size:20px">網址  : ${member.orgWebsiteLink}</span>
												</li>
											</ul>
										</div>
									</div>	
									<div class="col-md-6">
						            	<div class="form-group">		
											<ul class="ul-icons list-unstyled">
												<li>
													<div class="icon-filled"></div><span style="font-size:20px">聯絡人  : ${member.orgContactPerson}</span>
												</li>
												<li>
													<div class="icon-filled"></div><span style="font-size:20px">聯絡人手機  : ${member.orgContactPersonMobile}</span>
												</li>
												<li>
													<div class="icon-filled"></div><span style="font-size:20px">聯絡人電話  : ${member.orgContactPersonTel}</span>
												</li>
											</ul>
										</div>
					                </div>
				        		</div>
							</c:if>
                      	</div>
                    </div>
                    <div class="col-md-12">
                      	<div class="form-group">
                      		<c:if test="${member.memberType eq 'O' }">
                      			<ul class="ul-icons list-unstyled">
                      				<li>
										<div class="icon-filled"></div><span style="font-size:20px">創立宗旨  : </span><div style="font-size:20px">${member.orgFoundPurpose}</div>
									</li>
								</ul>
							</c:if>
						</div>
                    </div>
                </div>
			</article>
		</div>
	</div>
	</section>
	<!-- FOOTER -->
	<jsp:include page="commons_layout/commons_footer.jsp"/>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
 	<script>
	 	function startToChat(){
			createChatBox('${member.account}', '${member.name}');		
		
		}
		$(document).ready(function(){
			var date = '${member.birthDate}'
			var d = new Date(date).Format('yyyy-MM-dd')
			$("#date").html(d)
		})
		Date.prototype.Format = function (fmt) {
			var o = {
			      "M+": this.getMonth() + 1, //月份
			      "d+": this.getDate(), //日
			      "h+": this.getHours(), //小时
			      "m+": this.getMinutes(), //分
			      "s+": this.getSeconds(), //秒
			      "q+": Math.floor((this.getMonth() + 3) / 3), //季度
			      "S": this.getMilliseconds() //毫秒
			};
			if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
				for (var k in o)
			        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
			    return fmt;
		};
	</script>
</body>
</html>