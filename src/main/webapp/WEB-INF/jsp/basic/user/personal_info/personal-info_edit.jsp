<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Personal Information</title>
<jsp:include page="../../../admin/admin_layout/admin_css_js_links.jsp" />
<!-- css -->
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp" />
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
		display: 
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
	<jsp:include page="../../commons/commons_layout/commons_top-bar.jsp"/>
	<!-- Navbar -->
	<jsp:include page="../../commons/commons_layout/commons_nav.jsp"/>
	<div class="container">
    	<div class="row">
            <!-- Sidebar -->
            <jsp:include page="../user_layout/user_sidebar.jsp"/>
            <article>
				<h2 class=center>個人資訊</h2>
				<div class=center>您在 TimeBank中使用的基本資訊</div>
				<form action="#" method="post">
					<fieldset>
					<legend>個人資料</legend>
						<input type="hidden" value="${member.id}" id="id" name="id" /> 
						<input type="hidden" value="${member.memberType}" id="memberType" name="memberType" />
						<div>
							<label>帳號 :</label>
							<input  type="text" value="${member.account}" id="account" name="account" readonly style="background-color:#DDDDDD" ><br>
						</div><hr>
						<div>
							<label>密碼 :</label>
							<input type="text" value="${member.password}" id="password" name="password"><br>
						</div><hr>
						<div>
							<label>名字 :</label>
							<input type="text" value="${member.name}" id="name" name="name"><br>
						</div><hr>
						<fmt:formatDate value="${member.birthDate}" pattern="yyyy/MM/dd" var="birthDate" />
						<c:choose>
							<c:when test="${member.memberType eq 'P'}">
								<div>
									<label>身分證字號 :</label>
									<input type="text" value="${member.certificateIdNumber}" id="certificateIdNumber" name="certificateIdNumber"><br>
								</div><hr>
								<div>
									<label>出生日期:</label>
									<input type="text" value="${birthDate}" id="birthDate" name="birthDate" autocomplete="off"><br>
								</div><hr>
							</c:when>
							<c:when test="${member.memberType eq 'O'}">
								<div>
									<label>統一編號 :</label> 
									<input type="text" value="${member.certificateIdNumber}" id="certificateIdNumber" name="certificateIdNumber"><br>
								</div><hr>
								<div>
									<label>創立日期:</label> 
									<input type="text" value="${birthDate}" id="birthDate" name="birthDate" autocomplete="off"><br>
								</div><hr>
							</c:when>
						</c:choose>
						<div>
							<label>email:</label> 
							<input type="text" value="${member.email}" id="email" name="email"><br>
						</div><hr>
						<div>
							<label>住家電話:</label> 
							<input type="text" value="${member.telephone}" id="telephone" name="telephone"><br>
						</div><hr>
						<div>
							<label>手機:</label> 
							<input type="text" value="${member.mobile}" id="mobile" name="mobile"><br>
						</div><hr>
						<div>			
							<label>住址:</label>
							<span role="tw-city-selector"></span>
							<input type="text" value="${member.address}" id="address" name="address"><br>
						</div><hr>
						<div>
							<fmt:formatDate value="${member.signUpDate}" pattern="yyyy/MM/dd" var="signUpDate" />
							<label>註冊日期:</label> 
							<input type="text" value="${signUpDate}" id="signUpDate" name="signUpDate" autocomplete="off"><br>
						</div>
					</fieldset>
					<fieldset>
					<legend>驗證資訊</legend>
						<div>
							<label>Email驗證信確認(Y/N):</label>
							<label>Y</label> 
							<input type="radio" value="Y" name="emailVerification">
							<label>N</label> 
							<input type="radio" value="N" name="emailVerification"><br>
						</div><hr>
						<c:if test="${member.memberType eq 'O' }">
							<div>
								<label>機構身分驗證 (Y/N): </label>
									<label>Y</label> 
									<input type="radio" value="Y" name="orgIdConfirmation">
									<label>N</label> 
									<input type="radio" value="N" name="orgIdConfirmation"><br>								
							</div>
						</c:if>	
					</fieldset>
						<c:if test="${member.memberType eq 'O' }">
						<fieldset>	
						<legend>其他資訊</legend>
							<div >
								<label>創辦人:</label> 
								<input type="text" value="${member.orgFounder}" id="orgFounder" name="orgFounder"><br>
							</div><hr>
							<div>
								<label>執行長:</label>
								<input type="text" value="${member.orgCeo}" id="orgCeo" name="orgCeo"><br>
							</div><hr>
							<div>
								<label>聯絡人:</label>
								<input type="text" value="${member.orgContactPerson}" id="orgContactPerson" name="orgContactPerson"><br>
							</div><hr>
							<div>
								<label>聯絡人電話:</label> 
								<input type="text" value="${member.orgContactPersonTel}" id="orgContactPersonTel" name="orgContactPersonTel"><br>
							</div><hr>
							<div>
								<label>聯絡人手機:</label>
								<input type="text" value="${member.orgContactPersonMobile}" id="orgContactPersonMobile" name="orgContactPersonMobile"><br>
							</div><hr>
							<div>
								<label>網址:</label>
								<input type="url" size="50px" value="${member.orgWebsiteLink}" id="orgWebsiteLink" name="orgWebsiteLink"><br>
							</div><hr>
							<div>
								<label>創立宗旨:</label>
								<textarea rows="5" cols="50" id="orgFoundPurpose" name="orgFoundPurpose">
									${member.orgFoundPurpose}
								</textarea><br>
							</div>
							</fieldset>
						</c:if>
						<fieldset style="border:none">
							<div>
								<input type="button" class="btn btn-primary btn-sm" id="updateButt" value="儲存"> 
							</div>
						</fieldset>
				</form>
			</article>
          </div>
        </div>
	
	
 	<script>
		$(document).ready(function() {
// 			$("form div").addClass("form-group");
// 			$("form input").addClass("form-control");
// 			$("form textarea").addClass("form-control");
			new TwCitySelector();

			var datePickerSetting = {
				format : "yyyy/mm/dd",
				autoclose : true,
				todayHighlight : true,
				language : 'zh-TW',	
				endDate:"0d",
			};
			$('#birthDate').datepicker(datePickerSetting);
			$('#signUpDate').datepicker(datePickerSetting);

			$("div[role='tw-city-selector']").attr("data-county-value",'${member.county}');
			$("div[role='tw-city-selector']").attr("data-district-value", '${member.district}');
					
			$("input[name='emailVerification'][value="+'${member.emailVerification}' + "]").prop("checked", true);
			if ('${member.memberType }' == 'O') {
				$("input[name='orgIdConfirmation'][value="+ '${member.orgIdConfirmation}' + "]").prop("checked", true);			
			}			
					
			//update member info. event
			$("#updateButt").click(function() {
				$.ajax({
					method : "put",
					dataType : "json",
					url : "/user/personal-info/update",
					data : $("form").serialize(),
				}).done(function(response) {
// 					alert(response.obj);							
					if (response.status =='SUCCESS'){
						alert("資料更新成功");
					} else{
						$.each(response.messages, function(idx, message) {
							alert("the "+idx+"th ERROR, because "+message);
						});
					}
				});
			})
		})
	</script>

</body>
</html>