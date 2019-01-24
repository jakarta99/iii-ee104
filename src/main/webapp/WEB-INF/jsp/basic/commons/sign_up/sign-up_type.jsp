<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign Up Type</title>
<!-- css -->
<jsp:include page="../commons_layout/commons_css_links.jsp" />
<!-- Javascript files-->
<jsp:include page="../commons_layout/commons_js_links.jsp" />
<style>
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
<!--               		<h1 class="h2">建立您的TimeBank帳戶</h1> -->
<!--             	</div> -->
<!-- 	            <div class="col-md-5"> -->
<!-- 	              	<ul class="breadcrumb d-flex justify-content-end"> -->
<!-- 	                	<li class="breadcrumb-item"><a href="/">首頁</a></li> -->
<!-- 	                	<li class="breadcrumb-item active">選擇帳戶類型</li> -->
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
                <h2 class="text-uppercase" style='text-align:center'>建立您的TimeBank帳戶</h2>
                <p class="text-muted" style='text-align:center;font-size:20px'>還不是我們的會員?</p>
                <div class="heading">
          			<h3>選擇帳戶類型</h3>
          		</div>
<!--                 <p class="text-muted" style='text-align:center;font-size:20px'>選擇帳戶類型</p> -->
<!--                 <hr> -->
                <form>
                  <div class="text-center">
                    <input type="button" class="btn btn-template-outlined" onclick="javascript:document.location.href='/commons/sign-up/add?memberType=P'" value="一般會員"/>
                    <input type="button" class="btn btn-template-outlined" onclick="javascript:document.location.href='/commons/sign-up/add?memberType=O'" value="公益團體"/>
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
   
</body>
</html>