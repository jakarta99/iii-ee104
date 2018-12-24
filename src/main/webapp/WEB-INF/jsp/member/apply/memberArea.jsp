<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Time Bank User</title>
<!-- css -->
<jsp:include page="commons_layout/commons_css_links.jsp"/>

<body>
	 <!-- Top bar-->
      <jsp:include page="commons/commons_layout/commons_top-bar.jsp"/>	
	  <!-- Navbar -->
      <jsp:include page="commons/commons_layout/commons_nav.jsp"/>
      <li class="nav-item dropdown active"><a href="javascript: void(0)" data-toggle="dropdown" class="dropdown-toggle">志工活動 <b class="caret"></b></a>
	      <ul class="dropdown-menu">
		      <li class="dropdown-item"><a href="" class="nav-link">申請中</a></li>
		      <li class="dropdown-item"><a href="" class="nav-link">服務紀錄</a></li>
	      </ul>
      </li>
   
   <!-- FOOTER -->
   <jsp:include page="commons_layout/commons_footer.jsp" />  
   <!-- Javascript files-->
   <jsp:include page="commons_layout/commons_js_links.jsp" />
</body>
</html>