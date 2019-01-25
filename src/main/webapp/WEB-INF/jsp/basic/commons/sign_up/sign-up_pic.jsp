<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign Up Pic</title>
<!-- css -->
<jsp:include page="../commons_layout/commons_css_links.jsp" />
<!-- Javascript files-->
<jsp:include page="../commons_layout/commons_js_links.jsp" />
<!-- sweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	body{
		font-family: "微軟正黑體"
	}
	.box{
		padding-top: 70px;
	    padding-bottom: 70px;
	}
</style>

</head>
<body>
	<!-- Top bar-->
	<jsp:include page="../commons_layout/commons_top-bar.jsp"/>
	<!-- Navbar -->
	<jsp:include page="../commons_layout/commons_nav.jsp"/>
<!-- 	<div id="heading-breadcrumbs"> -->
<!--     	<div class="container"> -->
<!--         	<div class="row d-flex align-items-center flex-wrap"> -->
<!--             	<div class="col-md-7"> -->
<!--               		<h1 class="h2">上傳照片</h1> -->
<!--             	</div> -->
<!-- 	            <div class="col-md-5"> -->
<!-- 	              	<ul class="breadcrumb d-flex justify-content-end"> -->
<!-- 	                	<li class="breadcrumb-item"><a href="/">首頁</a></li> -->
<!-- 	                	<li class="breadcrumb-item active">上傳帳戶圖片</li> -->
<!-- 	              	</ul> -->
<!-- 	            </div> -->
<!--         	</div> -->
<!--         </div> -->
<!--     </div> -->
	<section>
		<div id="all">
<!--       <div id="heading-breadcrumbs"> -->
<!--         <div class="container"> -->
<!--           <div class="row d-flex align-items-center flex-wrap"> -->
<!--             <div class="col-md-7"> -->
<!--               <h1 class="h2">New Account / Sign In</h1> -->
<!--             </div> -->
<!--             <div class="col-md-5"> -->
<!--               <ul class="breadcrumb d-flex justify-content-end"> -->
<!--                 <li class="breadcrumb-item"><a href="index.html">Home</a></li> -->
<!--                 <li class="breadcrumb-item active">New Account / Sign In</li> -->
<!--               </ul> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
      <div id="content" style="background-color: #f7f7f7" >
        <div class="container">
          <div class="row">           
            <div class="col-lg-6" style="margin:auto">
              <div class="box" style="border-radius:5px;background-color: #fff;border-radius:3px;box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);">
              	<div class="heading">
                <h2 class="text-uppercase">上傳一張您的照片</h2>
                </div>
<!--                 <h5>上傳一張您的照片</h5> -->
<!--                 <hr> -->
                <form id="pictureForm" enctype="multipart/form-data">
                  <div>
					<label for="picture" style="font-size:20px">圖片 </label>
 					<input type="file" id="idPicture" name="picture" accept="image/*" class="form-control">
 					<label class="text-muted" style="font-size:16px">*請選擇圖檔，無圖檔亦可直接送出</label>
 					<hr>
	                <div class="col-md-12 text-center">
                    	<input id="submit" type="button" class="btn btn-template-outlined" value="註冊">
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
   </section>
   <!-- FOOTER -->
   <jsp:include page="../commons_layout/commons_footer.jsp" />
   <script>
   		$("#submit").click(function(){
//    			swal({
// 		        icon: "/image/user/member/loading.gif",
// 				button: false,
// 			})
			$('#status').css('display','block');  
			$('#preloader').css('display','block');  
			$("#preloader").css("background-color","#00000000");  
	  	
	  		var data = new FormData($('#pictureForm')[0]);
			$.ajax({
				type : 'post',
				dataType: "json",        
				url:"/commons/sign-up/storeMemberPic",
				cache: false,
 				data : data,
 				processData: false,
 				contentType: false
			}).done(function(response){
				//alert(response.status);
				if(response.status == "SUCCESS") {
// 					alert("註冊完成");
					$('#status').fadeOut(); // will first fade out the loading animation
			  		$('#preloader').delay(100).fadeOut('slow'); // will fade out the white DIV that covers the website.
			  	    $('body').delay(100).css('overflow','visible');
					swal({
						  title: "SUCCESS",
						  text: "註冊完成",
						  icon: "success",
						  button: "確定",
					}).then((result) => {
						if (result) {
							window.location.replace("/login");	//讀完導至上傳圖檔(成功送驗證信!(再導至login)))
						}
					});
				} else {
					$('#status').fadeOut(); // will first fade out the loading animation
			  		$('#preloader').delay(100).fadeOut('slow'); // will fade out the white DIV that covers the website.
			  	    $('body').delay(100).css('overflow','visible');
					$.each(response.messages, function(idx, message){
						if (message == "資料有誤"){
							swal({
								  title: "ERROR",
								  text: "註冊失敗",
								  icon: "warning",
								  button: "確定",
							})
						}								
					})
				}						
			})
			
	  		
   		})
   </script>
</body>
</html>