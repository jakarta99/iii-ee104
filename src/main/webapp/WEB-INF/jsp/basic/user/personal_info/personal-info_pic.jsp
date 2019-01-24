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
	.box {
	    margin: 30px 0;
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
	<section style="background-color: #f7f7f7">
	<div class="container">
    	<div class="row">          
        	<div class="col-lg-6" style="margin:auto">
            	<div class="box" style="border-radius:5px;background-color: #fff;border-radius:3px;box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);">
                	<article>
                	<div class="heading">
                		<h3>上傳一張您的照片</h3>
					</div>
<!-- 					<h5>上傳一張您的照片</h5> -->
<!--                 	<hr> -->
                	<form id="pictureForm" action="/user/personal-info/changeMemberPic" method="post" enctype="multipart/form-data">
	                  	<div>
							<label for="picture" style="font-size:20px">圖片</label>
	 						<input type="file" id="idPicture" name="picture" accept="image/*" class="form-control">
	 						<label class="text-muted" style="font-size:20px">請選擇圖檔，無圖檔亦可直接送出</label>
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
	<script>
	$(document).ready(function() {
		var t = "<a href='/user/personal-info/list' style='font-weight: 700;'>/我的個人資訊</a>/變更照片"			
			$("#webTitle").empty().append("變更照片");
			$("#lastPage").after(t);
	});
	</script>
</body>
</html>