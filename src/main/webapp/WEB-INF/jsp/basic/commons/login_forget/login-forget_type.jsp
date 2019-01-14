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
	<div id="heading-breadcrumbs">
    	<div class="container">
        	<div class="row d-flex align-items-center flex-wrap">
            	<div class="col-md-7">
              		<h1 class="h2">忘記密碼</h1>
            	</div>
	            <div class="col-md-5">
	              	<ul class="breadcrumb d-flex justify-content-end">
	                	<li class="breadcrumb-item"><a href="/">Home</a></li>
	                	<li class="breadcrumb-item active">Member type</li>
	              	</ul>
	            </div>
        	</div>
        </div>
    </div>
	<section class="bar">
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
      <div id="content" >
        <div class="container">
          <div class="row">           
            <div class="col-lg-6" style="margin:auto">
              <div class="box">
                <h2 class="text-uppercase">FORGET PASSWORD</h2>
                <p class="lead">Forget your account password?</p>
                <p class="text-muted">Select your member type</p>
                <hr>
                <form>
                  <div class="text-center">
                    <input type="button" class="btn btn-template-outlined" onclick="javascript:document.location.href='/commons/login-forget/check?memberType=P'" value="一般會員"/>
                    <input type="button" class="btn btn-template-outlined" onclick="javascript:document.location.href='/commons/login-forget/check?memberType=O'" value="公益團體"/>
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