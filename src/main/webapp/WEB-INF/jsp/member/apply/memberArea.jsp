<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Timebank</title>
    <jsp:include page="commons/commons_layout/commons_css_links.jsp"/>
  </head>
<body>
	 <!-- Top bar-->
      <jsp:include page="commons/commons_layout/commons_top-bar.jsp"/>	
	  <!-- Navbar -->
      <jsp:include page="commons/commons_layout/commons_nav.jsp"/>
      <li class="nav-item dropdown active"><a href="javascript: void(0)" data-toggle="dropdown" class="dropdown-toggle">志工活動 <b class="caret"></b></a>
	      <ul class="dropdown-menu">
		      <li class="dropdown-item"><a href="" class="nav-link">Option 1: Default Page</a></li>
		      <li class="dropdown-item"><a href="" class="nav-link">Option 2: Application</a></li>
	      </ul>
      </li>
</body>
</html>