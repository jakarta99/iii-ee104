<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>       
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的訊息 | TimeBank</title>
<!-- css -->
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp" />
<!-- Javascript files-->
<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />

<script>
$(document).ready( function () {	
	$("#heading-breadcrumbs>div>div>div.col-md-7>h1").text("我的訊息");
})	


</script>
</head>
<body>
	<!-- Top bar-->
	<jsp:include page="../../commons/commons_layout/commons_top-bar.jsp" />
	<!-- Navbar -->
	<jsp:include page="../../commons/commons_layout/commons_nav.jsp" />
	<!-- heading-breadcrumbs -->
	<jsp:include page="../../commons/commons_layout/commons_heading_breadcrumbs.jsp" />
	
	<sec:authentication property="name" var="userAccount"/>
	
	<div id="all">
		<div id="content">
			<div id="chattedPeopleList">
				
				
			
			</div>
			<div id="chatMessageBoxArea"></div>
		
		</div>
	
	</div>
	
	<c:forEach items="${chatMessagesHistory}" var="messages" >
		<script>
			if ('${messages.toAccount}' == '${userAccount}' ){	
				var targetBlock = $("<div></div>");
				var targetAccount = "<p>${messages.fromAccount}</p>";
				var targetPicture = "<img src='/image/user/member/${messages.fromMemberPic}'/>";
				targetBlock.append(targetPicture+targetAccount)	;
				$("#chattedPeopleList").append(targetBlock);
			} else if ('${messages.fromAccount}' == '${userAccount}'){						
// 				var targetBlock = $("<div></div>");
				var targetAccount = "<p>${messages.toAccount}</p>";
				var targetPicture = "<img src='/image/user/member/${messages.toMemberPic}'/>";
				targetBlock.append(targetPicture+targetAccount)	;
				$("#chattedPeopleList").append(targetBlock);
			}
						
						
		</script>
	</c:forEach>
	


	<!-- FOOTER -->
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp" />
</body>
</html>