<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<style>
*{
	
}
#content{
	margin:10px;
	overflow:auto;
	border:1px solid blue;
	border-radius:3px;
}
#chattedPeopleList,#chatMessageBoxArea{
	float:left;
	border:1px solid gray;
	min-height:500px;
	max-height:800px;
}
#chattedPeopleList{
	width:30%;
	padding-top: 10px;
}
#chatMessageBoxArea{
	width:70%;
}
.item1{
	text-align:center;
	padding:3px;	
}
.item2{
	border-top:1px solid gray;
}
.chatMemberBox{
	border-bottom:1px solid gray;
/* 	border-:1px solid gray; */
	padding:3px;
	height: 58px;
}
.chatMemberBox:hover{
	background-color:#80808075;
}
.imgToken{
	float:left;
	
}
.chat-info{
	width:80%;
	float:right;
}
</style>
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
		<div id="content" style="border:1px solid gray">
			<div id="chattedPeopleList" >
				<div class="item1">
					<div id="title-box" class="item1">我的訊息</div>
					<div id="search-box" class="item1"><input type="text" placeholder="搜尋"/></div>
				</div>
				<div class="item2">
					<c:forEach items="${chatObjectsList}" var="chatMember">
						<div class="chatMemberBox" >
							<div class="imgToken" >
								<img src="/image/user/member/${chatMember.toMemberPic}" style="width:50px;border-radius:50px;"/>
							</div>
							<div class="chat-info">
								<div style="display:inline">${chatMember.toName}</div>
								<fmt:formatDate value="${chatMember.time}" pattern="yyyy-MM-dd" var="lastChatTime"/>
								<div style="display:inline; float:right">${lastChatTime}</div>
								<div >${chatMember.text}</div>
							</div>
							
								
						</div>
					</c:forEach>
				</div>
			</div>
			<div id="chatMessageBoxArea">
			
			</div>
		
		</div>
	
	</div>

	<!-- FOOTER -->
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp" />
	
	<script>
		
	
	</script>
</body>
</html>