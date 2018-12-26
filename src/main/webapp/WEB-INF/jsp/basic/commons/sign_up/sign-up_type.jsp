<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign Up Type</title>
<jsp:include page="../../../admin/admin_layout/admin_css_js_links.jsp" />
<!-- css -->
<jsp:include page="../commons_layout/commons_css_links.jsp" />
<style>
	article {
		font-family: 'Righteous', cursive;
		margin-top: 30px;
		margin-bottom: 30px;
		padding: 10px;
	}
	article fieldset {
		width: 800px;
		border-radius: 15px;
		padding: 20px; 
		border: 3px solid rgb(146, 168, 209);
		margin: auto;
	}
	article input{
  		padding-left: 10px;  		   
  		line-height:center; 
	}
	.center{
		text-align: center;
	}
	.myform {
        margin: 8% 11%;
        border-collapse: collapse;
        font-size: 100%;
        line-height: 200%;
    }
    legend{
        font-size:150%;
        color:rgb(193, 186, 177);
    }
</style>

</head>
<body>
	<!-- Top bar-->
	<jsp:include page="../commons_layout/commons_top-bar.jsp"/>
	<!-- Navbar -->
	<jsp:include page="../commons_layout/commons_nav.jsp"/>
	<section class="bar">
	<div class="container">
    	<div class="row">
    		<!-- Sidebar -->
            <jsp:include page="../../user/user_layout/user_sidebar.jsp"/>
          	<article>
          		<h2 class=center>建立您的TimeBank帳戶</h2>
          		<form>
          			<fieldset>
          			<legend>帳戶類型</legend>
          			<div>
          				<input type="button" class="btn btn-primary btn-sm" onclick="javascript:document.location.href='/commons/sign-up/add?memberType=P'" value="新增一般會員"/>
          				<input type="button" class="btn btn-primary btn-sm" onclick="javascript:document.location.href='/commons/sign-up/add?memberType=O'" value="新增公益團體"/>
          			</div>
          			</fieldset>
          		</form>
          	</article>
        </div>
    </div>
    </section>
	<!-- FOOTER -->
<%-- 	<jsp:include page="../commons_layout/commons_footer.jsp"/> --%>
</body>
</html>