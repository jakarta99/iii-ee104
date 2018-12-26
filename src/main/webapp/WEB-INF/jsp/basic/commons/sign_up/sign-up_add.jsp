<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign Up Add</title>

<jsp:include page="../../../admin/admin_layout/admin_css_js_links.jsp" />
<!-- css -->
<jsp:include page="../commons_layout/commons_css_links.jsp" />

<!-- 台灣縣市地區選單	 -->
<script src="/js/tw-city-selector.min.js"></script>
<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />

<style>
	article {
		margin-top: 30px;
		margin-bottom: 30px;
		padding: 10px;
	}
	article fieldset {
		width: 800px;
		border-radius: 20px;
		padding: 20px; 
		border: 2px solid #bebebe;
		margin: auto;
	}
	article input, select, label {
  		padding-left: 10px;  		   
  		line-height:center; 
	}
/* 	設定縣市地區選擇器的css樣式 */
	.county,.district {
	  padding: 0.375rem 0.75rem;
	  font-size: 1rem;
	  line-height: 1.5;
	  color: #495057;
	  background-color: #fff;
	  background-image: none;
	  background-clip: padding-box;
	  border: 1px solid #ced4da;
	  border-radius: 0.25rem;
	  transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
	}
	.center{
		text-align: center;
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
          		<input type="button" class="btn btn-primary btn-sm" onclick="javascript:document.location.href='/commons/sign-up/type'" value="回前頁">  
          		<form action="#" method="post">
          			<fieldset>
          				<legend>帳戶資料</legend>
          				<input type="hidden" value="" id="id" name="id"> 
						<input type="hidden" value="${memberType}" id="memberType" name="memberType">
						<div>
							<label>帳號:</label>
							<input type="text" value="${param.account}" id="account" name="account">
						</div><hr>
						<div>
							<label>密碼:</label>
							<input type="text" value="${param.password}" id="password" name="password">
						</div>
          			</fieldset>
          			<fieldset>	
						<legend>個人資料</legend>
						<div>
							<label>名稱:</label>
							<input type="text" value="${param.name}" id="name" name="name">
						</div><hr>
						<c:choose>
							<c:when test="${memberType eq 'P'}">
								<div>
									<label>身分證字號:</label>
									<input type="text" value="${param.certificateIdNumber}" id="certificateIdNumber" name="certificateIdNumber">
								</div><hr>
								<div>
									<label>出生日期:</label>
									<input type="text" value="${param.birthDate}" id="birthDate" name="birthDate" autocomplete="off">
								</div><hr>
							</c:when>
							<c:when test="${memberType eq 'O'}">
								<div>
									<label>統一編號:</label> 
									<input type="text" value="${param.certificateIdNumber}" id="certificateIdNumber" name="certificateIdNumber">
								</div><hr>
								<div>
									<label>創立日期:</label> 
									<input type="text" value="${param.birthDate}" id="birthDate" name="birthDate" autocomplete="off">
								</div><hr>
							</c:when>
						</c:choose>
						<div>
							<label>email:</label> 
							<input type="text" value="${param.email}" id="email" name="email">
						</div><hr>
						<div>
							<label>住家電話:</label> 
							<input type="text" value="${param.telephone}" id="telephone" name="telephone">
						</div><hr>
						<div>
							<label>手機:</label> 
							<input type="text" value="${param.mobile}" id="mobile" name="mobile">
						</div><hr>
						<div>			
							<label>住址:</label>
							<span role="tw-city-selector" ></span>
							<input type="text" value="${param.address}" id="address" name="address">
						</div>
					</fieldset>
					<c:if test="${memberType eq 'O' }">
						<fieldset>
							<legend>公司資料</legend>
							<div>
								<label>創辦人:</label> 
								<input type="text" value="${param.orgFounder}" id="orgFounder" name="orgFounder">
							</div><hr>
							<div>
								<label>執行長:</label>
								<input type="text" value="${param.orgCeo}" id="orgCeo" name="orgCeo">
							</div><hr>
							<div>
								<label>聯絡人:</label>
								<input type="text" value="${param.orgContactPerson}" id="orgContactPerson" name="orgContactPerson">
							</div><hr>
							<div>
								<label>聯絡人電話:</label> 
								<input type="text" value="${param.orgContactPersonTel}" id="orgContactPersonTel" name="orgContactPersonTel">
							</div><hr>
							<div>
								<label>聯絡人手機:</label>
								<input type="text" value="${param.orgContactPersonMobile}" id="orgContactPersonMobile" name="orgContactPersonMobile">
							</div><hr>
							<div>
								<label>網址:</label>
								<input type="url" size="50px" value="${param.orgWebsiteLink}" id="orgWebsiteLink" name="orgWebsiteLink">
							</div><hr>
							<div>
								<label>創立宗旨:</label>
								<textarea rows="5" cols="50" id="orgFoundPurpose" name="orgFoundPurpose">
									${member.orgFoundPurpose}
								</textarea>
							</div>
						</fieldset>
					</c:if>
					<fieldset style="border:none">
						<div>
							<input type="button" class="btn btn-primary btn-sm" id="submit" value="確定送出" />
					        <input type="reset" class="btn btn-primary btn-sm" value="清除重填" />
						</div>
					</fieldset>
          		</form>
          	</article>
        </div>
    </div>
    </section>
	<!-- FOOTER -->
<%-- 	<jsp:include page="../commons_layout/commons_footer.jsp"/> --%>
	
	<script>
		$(document).ready(function(){
// 			$("form div").addClass("form-group");
// 			$("form input").addClass("form-control");
// 			$("form textarea").addClass("form-control");
			new TwCitySelector();	
			$('#birthDate').datepicker({
			    format: "yyyy/mm/dd",
			    autoclose: true,
			    todayHighlight: true,
			    language: 'zh-TW',
			    startView:"years",
			    endDate:"0d"
			})
			
// 			insert new member
			$("#submit").click(function(){
				$.ajax({
					method:"post",
					dataType: "json",        
					url:"/commons/sign-up/insert",
					data: $("form").serialize()
				}).done(function(response){
// 					alert(response.obj);
// 					console.log("status="+response.status);
// 					console.log("message="+response.message);
					
					if(response.status == "SUCCESS") {
						alert("會員新增成功");
// 						window.location.replace("/admin/member/list");	//驗證信頁面
					} else {
						$.each(response.messages, function(idx, message) {
							alert("the "+idx+"th ERROR, because "+message);
						});
					}						
				})
			})
		})
	</script>
</body>
</html>