<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>錯誤 | TimeBank</title>
<!-- css -->
<jsp:include page="commons_layout/commons_css_links.jsp" />
<!-- Javascript files-->
<jsp:include page="commons_layout/commons_js_links.jsp" />
</head>
<body>
	<!-- Top bar-->
	<jsp:include page="commons_layout/commons_top-bar.jsp" />
	<!-- Navbar -->
	<jsp:include page="commons_layout/commons_nav.jsp" />
   
     <div id="content">
        <div class="container">
          <div id="error-page" class="col-md-8 mx-auto text-center">
            <div class="box">
              <p class="text-center"><a href="/"><img src="/img/logohomepage.png" style="width:250px"></a></p>
              <h3>很抱歉 - 您沒有權限進入此頁面</h3>
              <p class="buttons"><a href="/" class="btn btn-template-outlined"><i class="fa fa-home"></i> 按此導回首頁</a></p>
            </div>
          </div>
        </div>
      </div>
    
    
    
    <!-- FOOTER -->
	<jsp:include page="commons_layout/commons_footer.jsp" />
    
</body>
</html>