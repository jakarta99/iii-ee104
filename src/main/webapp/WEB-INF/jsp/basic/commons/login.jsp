<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登入 | Time Bank </title>
<!-- css -->
<jsp:include page="commons_layout/commons_css_links.jsp"/>
<!-- Javascript files-->
<jsp:include page="commons_layout/commons_js_links.jsp" />


</head>
<body>
	  <!-- Top bar-->
      <jsp:include page="commons_layout/commons_top-bar.jsp"/>
 		<!-- Navbar -->
		<jsp:include page="commons_layout/commons_nav.jsp" />
	<div id="all">  
      <div id="content" >
        <div class="container">
          <div class="row">           
            <div class="col-lg-6" style="margin:auto">
              <div class="box">
                <h2 class="text-uppercase">Login</h2>
                <p class="lead">Already our customer?</p>
                <p class="text-muted"></p>
                <hr>
                <form action="/login" method="post">
                  <div class="form-group">
                    <label for="email">Account</label>
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
                  <div class="text-right"><a href="commons/login-forget/type">忘記密碼</a></div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
   <!-- FOOTER -->
   <jsp:include page="commons_layout/commons_footer.jsp" />
   


</body>
</html>