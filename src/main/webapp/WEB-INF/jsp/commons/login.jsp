<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Time Bank Login</title>
<!-- css -->
<jsp:include page="commons_layout/commons_css_links.jsp"/>



</head>
<body>
	  <!-- Top bar-->
      <jsp:include page="commons_layout/commons_top-bar.jsp"/>
 	
	  <!-- Navbar -->
      <jsp:include page="commons_layout/commons_nav.jsp"/>
      

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
      <div id="content">
        <div class="container">
          <div class="row">           
            <div class="col-lg-6">
              <div class="box">
                <h2 class="text-uppercase">Login</h2>
                <p class="lead">Already our customer?</p>
                <p class="text-muted"></p>
                <hr>
                <form action="/login" method="post">
                  <div class="form-group">
                    <label for="email">Email</label>
                    <input id="email" type="text" name="username" class="form-control" autofocus>
                  </div>
                  <div class="form-group">
                    <label for="password">Password</label>
                    <input id="password" type="password" name="password" class="form-control">
                  </div>
                     <h6 style="text-align: center;color:blue">${message}</h6>
                  <div class="text-center">
                    <button type="submit" class="btn btn-template-outlined"><i class="fa fa-sign-in"></i> Log in</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
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
    </div>
    
   <!-- FOOTER -->
   <jsp:include page="commons_layout/commons_footer.jsp" />
   
   <!-- Javascript files-->
   <jsp:include page="commons_layout/commons_js_links.jsp" />

</body>
</html>