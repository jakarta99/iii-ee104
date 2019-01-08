<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Personal Information Pic</title>
<!-- css -->
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp" />
<!-- Javascript files -->
<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />
<!-- sweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	body{
		font-family: "微軟正黑體"
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
              		<h1 class="h2">我的個人資訊</h1>
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
        	<div class="col-lg-6" style="margin:auto">
            	<div class="box">
                	<article>
                	<div class="heading">
                		<h3>個人資訊(NEW PIC)</h3>
					</div>
					<h5>上傳一張您的照片</h5>
                	<hr>
                	<form id="pictureForm" action="/user/personal-info/changeMemberPic" method="post" enctype="multipart/form-data">
	                  	<div>
							<label for="picture">圖片 :</label>
	 						<input type="file" id="idPicture" name="picture" accept="image/*" class="form-control">
	 						<label class="text-muted">請選擇圖檔，無圖檔亦可直接送出</label>
		                	<div class="col-md-12 text-center">
	                    		<button type="submit" class="btn btn-template-outlined"><i class="fa fa-plus"></i>上傳</button>
	                    	</div>
	                	</div>
                	</form>
                	</article>
              	</div>
            </div>
      	</div>
   </div>
   </section>
   	<!-- FOOTER -->
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp"/>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>

</body>
</html>