<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Personal Information</title>
<!-- css -->
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp" />
<!-- Javascript files -->
<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />
<!-- 台灣縣市地區選單	 -->
<script src="/js/tw-city-selector.min.js"></script>
<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />
<!-- sweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
	body{
		font-family: "微軟正黑體"
	}
	article{
		width:100%;
	}
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
</style>

</head>
<body>
	<!-- Top bar-->
	<jsp:include page="../../commons/commons_layout/commons_top-bar.jsp"/>
	<!-- Navbar -->
	<jsp:include page="../../commons/commons_layout/commons_nav.jsp"/>
	<div id="heading-breadcrumbs">
    	<div class="container">
        	<div class="row d-flex align-items-center flex-wrap">
            	<div class="col-md-7">
              		<h1 class="h2">我的個人資訊</h1>
            	</div>
<!-- 	            <div class="col-md-5"> -->
<!-- 	              	<ul class="breadcrumb d-flex justify-content-end"> -->
<!-- 	                	<li class="breadcrumb-item"><a href="index.html">Home</a></li> -->
<!-- 	                	<li class="breadcrumb-item"><a href="team.html">Our Team</a></li> -->
<!-- 	                	<li class="breadcrumb-item active">Team Member</li> -->
<!-- 	              	</ul> -->
<!-- 	            </div> -->
        	</div>
        </div>
    </div>
	<!-- Sidebar -->
	<jsp:include page="../user_layout/user_sidebar.jsp"/>
	<section class="bar">
	<div class="container">
    	<div class="row">
            <article>
				<h3>個人資訊</h3>
				<h5>您在 TimeBank中使用的基本資訊</h5>
				<hr>
				<form action="/user/personalInfo/edit" method="post" enctype="multipart/form-data">
					<fieldset>
						<div class="heading">
          					<h3>帳戶資料</h3>
          				</div>
          				<input type="hidden" value="${member.id}" id="id" name="id"> 
						<input type="hidden" value="${member.memberType}" id="memberType" name="memberType">
						<div class="row">
                    		<div class="col-md-6">
                      			<div class="form-group">
									<label for="idPasswordOld">舊密碼:</label>
									<input type="password" value="" id="idPasswordOld" placeholder="請輸入舊密碼" name="password" autofocus autocompelete="off" class="form-control">
		<!-- 							<div><label>(1.不可空白，2.至少8個字最多16個字，3.必須包含字母、數字、特殊符號[~!@#$%^&*])</label></div> -->
									<span id="idspPasswordOld" style='color:red'></span>
								</div>
							</div>
						</div>
						<div class="row">
                    		<div class="col-md-6">
                      			<div class="form-group">
									<label for="idPasswordNew">新密碼:</label>
									<input type="password" value="" id="idPasswordNew" placeholder="請輸入新密碼" name="passwordNew" autofocus autocompelete="off" class="form-control">
									<div><label>(1.不可空白，2.至少8個字最多16個字，3.必須包含字母、數字、特殊符號[~!@#$%^&*])</label></div>
									<span id="idspPasswordNew" style='color:red'></span>
								</div>
							</div>
							<div class="col-md-6">
                      			<div class="form-group">
									<label for="idPasswordCheck">確認新密碼:</label>
									<input type="password" value="" id="idPasswordCheck" placeholder="請再輸入一次新密碼" name="passwordCheck" autofocus autocompelete="off" class="form-control">
									<div><label>(1.不可空白，2.須與密碼相同)</label></div>
									<span id="idspPasswordCheck" style='color:red'></span>
								</div>
							</div>
						</div>
          			</fieldset>
					<fieldset>
						<div class="heading">
							<h3>個人資料</h3>
						</div>
						<div class="row">
                    		<div class="col-md-4">
                      			<div class="form-group">
									<label for="idName">姓名:</label>
									<input type="text" value="${member.name}" id="idName" name="name" autofocus autocompelete="off" class="form-control">
									<div><label>(1.不可空白，2.至少2個字以上，3.必須全部為中文)</label></div>
									<span id="idspName" style='color:red'></span>
								</div>
							</div>
							<fmt:formatDate value="${member.birthDate}" pattern="yyyy/MM/dd" var="birthDate"/>
							<c:choose>
								<c:when test="${member.memberType eq 'P'}">
									<div class="col-md-4">
                      					<div class="form-group">
											<label for="idCertificateIdNumber">身分證字號:</label>
											<input type="text" value="${member.certificateIdNumber}" id="idCertificateIdNumber" name="certificateIdNumber" autofocus autocompelete="off" class="form-control">
											<div><label>(1.不可空白，2.必須符合規則)</label></div>
											<span id="idspCertificateIdNumber" style='color:red'></span>
										</div>
									</div>
									<div class="col-md-4">
                      					<div class="form-group">
											<label for="idDate">出生日期:</label>
											<input type="text" value="${birthDate}" id="idDate" name="birthDate" autofocus autocomplete="off" class="form-control">
											<div><label>(1.不可空白，2.格式為yyyy/MM/dd)</label></div>
											<span id="idspDate" style='color:red'></span>
										</div>
									</div>
								</c:when>
								<c:when test="${member.memberType eq 'O'}">
									<div class="col-md-4">
                      					<div class="form-group">
											<label for="idCertificateIdNumber">統一編號:</label> 
											<input type="text" value="${member.certificateIdNumber}" id="idCertificateIdNumber" name="certificateIdNumber" autofocus autocompelete="off" class="form-control">
											<div><label>(1.不可空白，2.必須符合規則)</label></div>
											<span id="idspCertificateIdNumber" style='color:red'></span>
										</div>
									</div>
									<div class="col-md-4">
                      					<div class="form-group">
											<label for="idDate">創立日期:</label> 
											<input type="text" value="${birthDate}" id="idDate" name="birthDate" autofocus autocomplete="off" class="form-control">
											<div><label>(1.不可空白，2.格式為yyyy/MM/dd)</label></div>
											<span id="idspDate" style='color:red'></span>
										</div>
									</div>
								</c:when>
							</c:choose>
						</div>
						<div class="row">
							<div class="col-md-4">
	                      		<div class="form-group">
									<label for="idEmail">email:</label> 
									<input type="text" value="${member.email}" id="idEmail" name="email" autofocus autocompelete="off" class="form-control">
									<div><label>(1.不可空白)</label></div>
									<span id="idspEmail" style='color:red'></span>
								</div>
							</div>
							<div class="col-md-4">
	                      		<div class="form-group">
									<label for="idTelephone">電話:</label> 
									<input type="text" value="${member.telephone}" id="idTelephone" name="telephone" autofocus autocompelete="off" class="form-control">
									<div><label>(格式需為0X-XXXXXXXX)</label></div>
									<span id="idspTelephone" style='color:red'></span>
								</div>
							</div>
							<div class="col-md-4">
	                      		<div class="form-group">
									<label for="idMobile">手機:</label> 
									<input type="text" value="${member.mobile}" id="idMobile" name="mobile" autofocus autocompelete="off" class="form-control">
									<div><label>(格式需為09XX-XXX-XXX)</label></div>
									<span id="idspMobile" style='color:red'></span>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
	                      		<div class="form-group">		
									<div><label>縣市區域:</label></div>
									<span role="tw-city-selector"></span>
								</div>
							</div>
							<div class="col-md-4">
	                      		<div class="form-group">
									<label>住址:</label>
									<input type="text" value="${member.address}" id="address" name="address" class="form-control">
								</div>
							</div>
							<div class="col-md-4">
	                      		<div class="form-group">
			                        <div><label>圖片:</label></div>
			                        <a href="/image/user/member/${member.picture}" target="_blank">原上傳圖片</a>
			                        <input type="button" class="btn btn-template-outlined" id="changePicture" value="更改照片" class="form-control"/>
                        		</div>
                        	</div>
                        </div>
						<div class="row">
							<div class="col-md-4">
	                      		<div class="form-group">
									<fmt:formatDate value="${member.signUpDate}" pattern="yyyy/MM/dd" var="signUpDate" />
									<label>註冊日期:</label> 
									<input type="text" value="${signUpDate}" id="signUpDate" name="signUpDate" autocomplete="off" readonly class="form-control">
								</div>
							</div>
						</div>
					</fieldset>
					<c:if test="${member.memberType eq 'O' }">
						<fieldset>
							<div class="heading">
								<h3>公司資料</h3>
							</div>
							<div class="row">
								<div class="col-md-4">
	                      			<div class="form-group">
										<label for="idOrgFounder">創辦人:</label> 
										<input type="text" value="${member.orgFounder}" id="idOrgFounder" name="orgFounder" autofocus autocompelete="off" class="form-control">
										<div><label>(1.不可空白，2.至少2個字以上，3.必須全部為中文)</label></div>
										<span id="idspOrgFounder" style='color:red'></span>
									</div>
								</div>
								<div class="col-md-4">
	                      			<div class="form-group">
										<label for="idOrgCeo">執行長:</label>
										<input type="text" value="${member.orgCeo}" id="idOrgCeo" name="orgCeo" autofocus autocompelete="off" class="form-control">
										<div><label>(1.不可空白，2.至少2個字以上，3.必須全部為中文)</label></div>
										<span id="idspOrgCeo" style='color:red'></span>
									</div>
								</div>
								<div class="col-md-4">
	                      			<div class="form-group">
										<label for="idOrgContactPerson">聯絡人:</label>
										<input type="text" value="${member.orgContactPerson}" id="idOrgContactPerson" name="orgContactPerson" autofocus autocompelete="off" class="form-control">
										<div><label>(1.不可空白，2.至少2個字以上，3.必須全部為中文)</label></div>
										<span id="idspOrgContactPerson" style='color:red'></span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4">
	                      			<div class="form-group">
										<label for="idOrgContactPersonTel">聯絡人電話:</label> 
										<input type="text" value="${member.orgContactPersonTel}" id="idOrgContactPersonTel" name="orgContactPersonTel" autofocus autocompelete="off" class="form-control">
										<div><label>(格式需為0X-XXXXXXXX)</label></div>
										<span id="idspOrgContactPersonTel" style='color:red'></span>
									</div>
								</div>
								<div class="col-md-4">
	                      			<div class="form-group">
										<label for="idOrgContactPersonMobile">聯絡人手機:</label>
										<input type="text" value="${member.orgContactPersonMobile}" id="idOrgContactPersonMobile" name="orgContactPersonMobile" autofocus autocompelete="off" class="form-control">
										<div class="remark">(格式需為09XX-XXX-XXX)</div>
										<span id="idspOrgContactPersonMobile" style='color:red'></span>
									</div>
								</div>
								<div class="col-md-4">
	                      			<div class="form-group">
										<label for="idOrgWebsiteLink">網址:</label>
										<input type="url" size="50px" value="${member.orgWebsiteLink}" id="idOrgWebsiteLink" name="orgWebsiteLink" autofocus autocompelete="off" class="form-control">
										<div><label>(必須符合規則)</label></div>
										<span id="idspOrgWebsiteLink" style='color:red'></span>
									</div>
								</div>
							</div>
							<div class="row">
<!-- 								<div class="col-md-3"> -->
<!-- 	                      			<div class="form-group"> -->
<!-- 	                      			</div> -->
<!-- 	                      		</div> -->
								<div class="col-md-6">
	                      			<div class="form-group">
										<label>創立宗旨:</label>
										<textarea rows="5" id="orgFoundPurpose" name="orgFoundPurpose" class="form-control">
											${member.orgFoundPurpose}
										</textarea>
									</div>
								</div>
							</div>
						</fieldset>
					</c:if>
						<fieldset style="border:none">
							<div>
								<input type="button" class="btn btn-template-outlined" id="updateButt" value="儲存"> 
								<span id="error" style='color:red'></span>
							</div>
						</fieldset>
				</form>
			</article>
		</div>
	</div>
	</section>
	<!-- FOOTER -->
	<jsp:include page="../../commons/commons_layout/commons_footer.jsp"/>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
 	<script>
	    document.addEventListener("DOMContentLoaded", function () {
	        document.getElementById("idPasswordOld").addEventListener("keyup", chkPasswordOld);
	    });
	    function chkPasswordOld() {
	        var thePassword = document.getElementById("idPasswordOld").value;
	        var msgChk = document.getElementById("idspPasswordOld");
// 	        var thePasswordLen = thePassword.length;
// 	        var flag1 = false, flag2 = false, flag3 = false;
	        //判斷元素值是否為空白，長度是否大於8
// 	        if (thePassword == ""){
// 	        	msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>不可空白</span>"
// 	        }
	        //如果長度是否大於8，判斷是否包含字母、數字、特殊符號
// 	        else if (thePasswordLen >= 8 && thePasswordLen <= 16) {
// 	            for (var i = 0; i < thePasswordLen; i++) {
// 	                var PasswordChr = thePassword.charAt(i).toUpperCase();//轉換為大寫
// 	                if (PasswordChr >= "A" && PasswordChr <= "Z") {
// 	                    flag1 = true;
// 	                } else if (PasswordChr >= "0" && PasswordChr <= "9") {
// 	                    flag2 = true;
// 	                } else if (PasswordChr == "~" || "!" || "@" || "#" || "$" || "%" || "^" || "&" || "*") {
// 	                    flag3 = true;
// 	                }
// 	                if (flag1 && flag2 && flag3) {
// 	                    break;
// 	                }
// 	            }
// 	            if (flag1 && flag2 && flag3){
	            	$.ajax({
						method:"post",
						dataType: "text",        
						url:"/user/personal-info/changePassword",
						data: {password:$("#idPasswordOld").val()}
					}).done(function(response){
						if(response == "正確"){
							msgChk.innerHTML = "<img src='/img/O.jpg'><span style='color:green'>正確</span>";
						}else{
							msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>密碼輸入錯誤</span>";
						}
					})
// 	            }else{
// 	            	msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>必須包含字母、數字、特殊符號[~!@#$%^&*]</span>"
// 	            }
// 	        }else{
// 	        	msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>至少8個字，最多16個字</span>"
// 	        }
	    }
	    
	    document.addEventListener("DOMContentLoaded", function () {
	        document.getElementById("idPasswordNew").addEventListener("keyup", chkPasswordNew);
	    });
	    function chkPasswordNew() {
	        var thePassword = document.getElementById("idPasswordNew").value;
	        var thePasswordLen = thePassword.length;
	        var flag1 = false, flag2 = false, flag3 = false;
	        //判斷元素值是否為空白，長度是否大於8
	        if (thePassword == ""){
	            document.getElementById("idspPasswordNew").innerHTML =
	                "<img src='/img/X.jpg'><span style='color:red'>不可空白</span>"
	        }
	        //如果長度是否大於8，判斷是否包含字母、數字、特殊符號
	        else if (thePasswordLen >= 8 && thePasswordLen <= 16) {
	            for (var i = 0; i < thePasswordLen; i++) {
	                var PasswordChr = thePassword.charAt(i).toUpperCase();//轉換為大寫
	                if (PasswordChr >= "A" && PasswordChr <= "Z") {
	                    flag1 = true;
	                } else if (PasswordChr >= "0" && PasswordChr <= "9") {
	                    flag2 = true;
	                } else if (PasswordChr == "~" || "!" || "@" || "#" || "$" || "%" || "^" || "&" || "*") {
	                    flag3 = true;
	                }
	                if (flag1 && flag2 && flag3) {
	                    break;
	                }
	            }
	            if (flag1 && flag2 && flag3){
	                document.getElementById("idspPasswordNew").innerHTML =
	                    "<img src='/img/O.jpg'><span style='color:green'>正確</span>"
	            }else{
	                document.getElementById("idspPasswordNew").innerHTML =
	                    "<img src='/img/X.jpg'><span style='color:red'>必須包含字母、數字、特殊符號[~!@#$%^&*]</span>"
	            }
	        }else{
	            document.getElementById("idspPasswordNew").innerHTML =
	                "<img src='/img/X.jpg'><span style='color:red'>至少8個字，最多16個字</span>"
	        }
	    }
	    
	    document.addEventListener("DOMContentLoaded", function () {
	        document.getElementById("idPasswordCheck").addEventListener("keyup", chkPasswordCheck);
	    });
	    function chkPasswordCheck(){
	    	var thePassword = document.getElementById("idPasswordNew").value;
	    	var thePasswordCheck = document.getElementById("idPasswordCheck").value;
	        var msgChk = document.getElementById("idspPasswordCheck")
	        if (thePasswordCheck == ""){
	        	msgChk.innerHTML =
	                "<img src='/img/X.jpg'><span style='color:red'>不可空白</span>"
	        }
	        else {
	        	$.ajax({
					method:"post",
					dataType: "text",        
					url:"/user/personal-info/checkPassword",
					data: {passwordCheck:$("#idPasswordCheck").val(),passwordNew:$("#idPasswordNew").val()}
				}).done(function(response){
					if(response == "正確"){
						msgChk.innerHTML = "<img src='/img/O.jpg'><span style='color:green'>正確</span>";
					}else{
						msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>密碼不一致</span>";
					}
				})
	        }      
	    }
	    
		document.addEventListener("DOMContentLoaded", function () {
	        document.getElementById("idName").addEventListener("keyup", chkName);
	    });
	    function chkName() {
	        var theName = document.getElementById("idName").value;
	        var theNameLen = theName.length;
	        //判斷元素值是否為空白，長度是否大於2
	        if (theName == ""){
	            document.getElementById("idspName").innerHTML =
	                "<img src='/img/X.jpg'><span style='color:red'>不可空白</span>"
	        }
	        //如果長度是否大於2，判斷是否全部為中文字
	        else if (theNameLen >= 2) {
	            for (var i = 0; i < theNameLen; i++) {
	                var NameChr = theName.charCodeAt(i);
	                if (NameChr >= 0x4e00 && NameChr <= 0x9fff) {
	                    document.getElementById("idspName").innerHTML =
	                        "<img src='/img/O.jpg'><span style='color:green'>正確</span>"
	                } else {
	                    document.getElementById("idspName").innerHTML =
	                        "<img src='/img/X.jpg'><span style='color:red'>必須全部為中文字</span>"
	                    break;
	                }
	            }
	        }
	        else{
	            document.getElementById("idspName").innerHTML =
	                "<img src='/img/X.jpg'><span style='color:red'>至少兩個字以上</span>"
	        }
	    }
	    
	    document.addEventListener("DOMContentLoaded", function () {
	        document.getElementById("idCertificateIdNumber").addEventListener("keyup", chkCertificateIdNumber);
	    });
	    function chkCertificateIdNumber(){
	    	var theCertificateIdNumber = document.getElementById("idCertificateIdNumber").value;
	    	var msgChk = document.getElementById("idspCertificateIdNumber");
	        var theCertificateIdNumberLen = theCertificateIdNumber.length;
	        //判斷元素值是否為空白，長度是否大於6
	    	//建立字母分數陣列(A~Z)
	    	var city = new Array(
	    			 1,10,19,28,37,46,55,64,39,73,82, 2,11,
	    			20,48,29,38,47,56,65,74,83,21, 3,12,30
	    			);
	    	//判斷元素值是否為空白
	        if (theCertificateIdNumberLen != ""){
	        	if(${member.memberType eq 'P' }){
		        	// 使用「正規表達式」檢驗格式
		        	if (theCertificateIdNumber.search(/^[A-Z](1|2)\d{8}$/i) == -1) {
		        		msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>請輸入正確身分證字號格式</span>";
		        	}else{
		        		//將字串分割為陣列(IE必需這麼做才不會出錯)
		        		theCertificateIdNumber = theCertificateIdNumber.split('');
		        		//計算總和
		        		var total = city[theCertificateIdNumber[0].charCodeAt(0)-65];
		        		for(var i=1; i<=8; i++){
		        			total += eval(theCertificateIdNumber[i]) * (9 - i);
		        		}
		        		//補上檢查碼(最後一碼)
		        		total += eval(theCertificateIdNumber[9]);
		        		//檢查比對碼(餘數應為0);
		        		if (total%10 == 0){
		        			msgChk.innerHTML = "<img src='/img/O.jpg'><span style='color:green'>正確</span>";
		        		}else{
		        			msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>驗證失敗，請輸入正確身分證字號格式</span>";
		        		}
		        	}
	        	}
	        	if(${member.memberType eq 'O' }){
	        		var invalidList = "00000000,11111111";
	        	    if (/^\d{8}$/.test(theCertificateIdNumber) == false || invalidList.indexOf(theCertificateIdNumber) != -1) {
	        	    	msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>請輸入正確統一編號格式</span>";
	        	    }else{
	        	    	var validateOperator = [1, 2, 1, 2, 1, 2, 4, 1],
	        	        sum = 0,
	        	        calculate = function (product) { // 個位數 + 十位數
	        	            var ones = product % 10,
	        	                tens = (product - ones) / 10;
	        	            return ones + tens;
	        	        };
	        	    	for (var i = 0; i < validateOperator.length; i++) {
	        	        	sum += calculate(theCertificateIdNumber[i] * validateOperator[i]);
	        	    	}
	
	        	    	if (sum % 10 == 0 || (theCertificateIdNumber[6] == "7" && (sum + 1) % 10 == 0)) {
	        	    		msgChk.innerHTML = "<img src='/img/O.jpg'><span style='color:green'>正確</span>";
	        	    	} else {
	        	    		msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>驗證失敗，請輸入正確統一編號格式</span>";
	        	    	}
	        	    }  
	        	}
	        }else{
	        	msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>不可空白</span>"
	        }
	    	
	    }
	    
	    document.addEventListener("DOMContentLoaded", function () {
	        document.getElementById("idDate").addEventListener("keyup", chkDate);
	    });
	    function chkDate() {
	        var strDate = document.getElementById("idDate").value;
	        var msgChk = document.getElementById("idspDate");
	        var re = /^\d{4}\/\d{1,2}\/\d{1,2}$/;
	        var theDate = new Date(strDate);
	        var theYear = theDate.getFullYear();
	        var theMonth = theDate.getMonth() + 1;
	        var theDate = theDate.getDate();
	        var aryDate = strDate.split("/");
	        // alert(aryDate[0]+"-"+aryDate[1]+"-"+aryDate[2]);
	
	        if (strDate != "") {
	            if (re.test(strDate)) {
	                if (aryDate[0] == theYear && aryDate[1] == theMonth && aryDate[2] == theDate){
	                    msgChk.innerHTML = "<img src='/img/O.jpg'><span style='color:green'>正確</span>";
	                }else{
	                    msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>輸入錯誤，請重新輸入</span>";
	                }
	            }else{
	                msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>格式錯誤，請重新輸入</span>";
	            }
	        }else{
	            msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>不可空白</span>";
	        }
	    }
	    
	    document.addEventListener("DOMContentLoaded", function () {
	        document.getElementById("idEmail").addEventListener("keyup", chkEmail);
	    });
	    function chkEmail() {
	    	var strEmail = document.getElementById("idEmail").value;
	        var msgChk = document.getElementById("idspEmail");
	    	//Regular expression Testing
	    	var emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
	    	// ^\w+：@ 之前必須以一個以上的文字&數字開頭，例如 abc
	    	// ((-\w+)：@ 之前可以出現 1 個以上的文字、數字或「-」的組合，例如 -abc-
	    	// (\.\w+))：@ 之前可以出現 1 個以上的文字、數字或「.」的組合，例如 .abc.
	    	// ((-\w+)|(\.\w+))*：以上兩個規則以 or 的關係出現，並且出現 0 次以上 (所以不能 –. 同時出現)
	    	// @：中間一定要出現一個 @
	    	// [A-Za-z0-9]+：@ 之後出現 1 個以上的大小寫英文及數字的組合
	    	// (\.|-)：@ 之後只能出現「.」或是「-」，但這兩個字元不能連續時出現
	    	// ((\.|-)[A-Za-z0-9]+)*：@ 之後出現 0 個以上的「.」或是「-」配上大小寫英文及數字的組合
	    	// \.[A-Za-z]+$/：@ 之後出現 1 個以上的「.」配上大小寫英文及數字的組合，結尾需為大小寫英文
	    	
	    	if (strEmail != "") {
	    		//validate ok or not
	        	if(strEmail.search(emailRule)!= -1){
	        		msgChk.innerHTML = "<img src='/img/O.jpg'><span style='color:green'>正確</span>";
	        	}else{
	        		msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>輸入錯誤，請重新輸入</span>";
	        	}
	    	}else{
	    		msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>不可空白</span>";
	    	}
	    }
	
	    document.addEventListener("DOMContentLoaded", function () {
	        document.getElementById("idTelephone").addEventListener("keyup", chkTelephone);
	    });
	    function chkTelephone(){
	    	var strTelephone = document.getElementById("idTelephone").value;
	        var msgChk = document.getElementById("idspTelephone");
	    	var telephoneReg = /^[0-9]{2}-[0-9]{6,8}$/;
	    	if(telephoneReg.test(strTelephone)){
	    		msgChk.innerHTML = "<img src='/img/O.jpg'><span style='color:green'>正確</span>";
	    	}else{
	    		msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>住家電話號碼不正確，請重新輸入</span>";
	    	}
	    }
	    
	    document.addEventListener("DOMContentLoaded", function () {
	        document.getElementById("idMobile").addEventListener("keyup", chkMobile);
	    });
	    function chkMobile(){
	    	var strMobile = document.getElementById("idMobile").value;
	        var msgChk = document.getElementById("idspMobile");
	    	var mobileReg = /^09[0-9]{2}-[0-9]{3}-[0-9]{3}$/;
	    	if(mobileReg.test(strMobile)){
	    		msgChk.innerHTML = "<img src='/img/O.jpg'><span style='color:green'>正確</span>";
	    	}else{
	    		msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>手機號碼不正確，請重新輸入</span>";
	    	}
	    }
	    
	    if(${member.memberType eq 'O' }){
	    	    
		    document.addEventListener("DOMContentLoaded", function () {
		        document.getElementById("idOrgFounder").addEventListener("keyup", chkOrgFounder);
		    });
		    function chkOrgFounder() {
		        var theName = document.getElementById("idOrgFounder").value;
		        var msgChk = document.getElementById("idspOrgFounder");
		        var theNameLen = theName.length;
		        //判斷元素值是否為空白，長度是否大於2
		        if (theName == ""){
		        	msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>不可空白</span>"
		        }
		        //如果長度是否大於2，判斷是否全部為中文字
		        else if (theNameLen >= 2) {
		            for (var i = 0; i < theNameLen; i++) {
		                var NameChr = theName.charCodeAt(i);
		                if (NameChr >= 0x4e00 && NameChr <= 0x9fff) {
		                	msgChk.innerHTML = "<img src='/img/O.jpg'><span style='color:green'>正確</span>"
		                } else {
		                	msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>必須全部為中文字</span>"
		                	break;
		                }
		            }
		        }
		        else{
		        	msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>至少兩個字以上</span>"
		        }
		    }
		    
		    document.addEventListener("DOMContentLoaded", function () {
		        document.getElementById("idOrgCeo").addEventListener("keyup", chkOrgCeo);
		    });
		    function chkOrgCeo() {
		        var theName = document.getElementById("idOrgCeo").value;
		        var msgChk = document.getElementById("idspOrgCeo");
		        var theNameLen = theName.length;
		        //判斷元素值是否為空白，長度是否大於2
		        if (theName == ""){
		        	msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>不可空白</span>"
		        }
		        //如果長度是否大於2，判斷是否全部為中文字
		        else if (theNameLen >= 2) {
		            for (var i = 0; i < theNameLen; i++) {
		                var NameChr = theName.charCodeAt(i);
		                if (NameChr >= 0x4e00 && NameChr <= 0x9fff) {
		                	msgChk.innerHTML = "<img src='/img/O.jpg'><span style='color:green'>正確</span>"
		                } else {
		                	msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>必須全部為中文字</span>"
		                	break;
		                }
		            }
		        }
		        else{
		        	msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>至少兩個字以上</span>"
		        }
		    }
		    
		    document.addEventListener("DOMContentLoaded", function () {
		        document.getElementById("idOrgContactPerson").addEventListener("keyup", chkOrgContactPerson);
		    });
		    function chkOrgContactPerson() {
		        var theName = document.getElementById("idOrgContactPerson").value;
		        var msgChk = document.getElementById("idspOrgContactPerson");
		        var theNameLen = theName.length;
		        //判斷元素值是否為空白，長度是否大於2
		        if (theName == ""){
		        	msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>不可空白</span>"
		        }
		        //如果長度是否大於2，判斷是否全部為中文字
		        else if (theNameLen >= 2) {
		            for (var i = 0; i < theNameLen; i++) {
		                var NameChr = theName.charCodeAt(i);
		                if (NameChr >= 0x4e00 && NameChr <= 0x9fff) {
		                	msgChk.innerHTML = "<img src='/img/O.jpg'><span style='color:green'>正確</span>"
		                } else {
		                	msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>必須全部為中文字</span>"
		                	break;
		                }
		            }
		        }
		        else{
		        	msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>至少兩個字以上</span>"
		        }
		    }
		    
		    document.addEventListener("DOMContentLoaded", function () {
		        document.getElementById("idOrgContactPersonTel").addEventListener("keyup", chkOrgContactPersonTel);
		    });
		    function chkOrgContactPersonTel(){
		    	var strPhone = document.getElementById("idOrgContactPersonTel").value;
		        var msgChk = document.getElementById("idspOrgContactPersonTel");
		    	var telephoneReg = /^[0-9]{2}-[0-9]{6,8}$/;
		    	if(!telephoneReg.test(strPhone)){
		    		msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>電話號碼不正確，請重新輸入</span>";
		    	}else{
		    		msgChk.innerHTML = "<img src='/img/O.jpg'><span style='color:green'>正確</span>";
		    	}
		    }
		    
		    document.addEventListener("DOMContentLoaded", function () {
		        document.getElementById("idOrgContactPersonMobile").addEventListener("keyup", chkOrgContactPersonMobile);
		    });
		    function chkOrgContactPersonMobile(){
		    	var strPhone = document.getElementById("idOrgContactPersonMobile").value;
		        var msgChk = document.getElementById("idspOrgContactPersonMobile");
		        var mobileReg = /^09[0-9]{2}-[0-9]{3}-[0-9]{3}$/;
		    	if(!mobileReg.test(strPhone)){
		    		msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>電話號碼不正確，請重新輸入</span>";
		    	}else{
		    		msgChk.innerHTML = "<img src='/img/O.jpg'><span style='color:green'>正確</span>";
		    	}
		    }
		    
		    document.addEventListener("DOMContentLoaded", function () {
		        document.getElementById("idOrgWebsiteLink").addEventListener("keyup", chkURL);
		    });
		    function chkURL(){
			    var strUrl = document.getElementById("idOrgWebsiteLink").value;
			    var msgChk = document.getElementById("idspOrgWebsiteLink");
			    var strRegex = "^((https|http|ftp|rtsp|mms)?://)"
		    	   	+ "?(([0-9a-zA-Z_!~*'().&=+$%-]+: )?[0-9a-zA-Z_!~*'().&=+$%-]+@)?" //ftp的user@
		    	   	+ "(([0-9]{1,3}.){3}[0-9]{1,3}" // IP URL- 123.123.123.123
		    	   	+ "|" // allow IP和DOMAIN
			    	+ "([0-9a-zA-Z_!~*'()-]+.)*" // DOMAIN- www.
			    	+ "([0-9a-zA-Z][0-9a-zA-Z-]{0,61})?[0-9a-zA-Z]." // second DOMAIN
			    	+ "[a-z]{2,6})" // first level domain- .com or .museum
			    	+ "(:[0-9]{1,4})?" // port- :80
			    	+ "((/?)|" // a slash isn't required if there is no file name
			    	+ "(/[0-9a-zA-Z_!~*'().;?:@&=+$,%#-]+)+/?)$";
			   	var re = new RegExp(strRegex);
			   	//re.test()
			   	if (re.test(strUrl)){
				    msgChk.innerHTML = "<img src='/img/O.jpg'><span style='color:green'>正確</span>";
			   	}else{
			   		msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>輸入錯誤，請重新輸入</span>";
		       	}
		    }
	    
	    }
	    
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
			$('#idDate').datepicker(datePickerSetting);
// 			$('#signUpDate').datepicker(datePickerSetting);

			$("span[role='tw-city-selector']").attr("data-county-value",'${member.county}');
			$("span[role='tw-city-selector']").attr("data-district-value", '${member.district}');
					
// 			$("input[name='emailVerification'][value="+'${member.emailVerification}' + "]").prop("checked", true);
// 			if ('${member.memberType }' == 'O') {
// 				$("input[name='orgIdConfirmation'][value="+ '${member.orgIdConfirmation}' + "]").prop("checked", true);			
// 			}			
			
			//change picture event
			$("#changePicture").click(function() {
				window.location.replace("/user/personal-info/pic");
			});

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
						swal({
							  title: "SUCCESS",
							  text: "更新成功",
							  icon: "success",
							  button: "確定",
						}).then((result) => {
							if (result) {
								window.location.replace("/user/personal-info/edit");	//讀完導回個人資訊
							}
						});
// 						alert("資料更新成功");
					} else{
						$.each(response.messages, function(idx, message) {
// 							alert("the "+idx+"th ERROR, because "+message);
							if (message =="密碼輸入錯誤"){
								document.getElementById("idspPasswordOld").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>密碼輸入錯誤</span>"
							}
							if (message =="新密碼格式錯誤"){
								document.getElementById("idspPasswordNew").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>新密碼格式錯誤</span>"
							}
							if (message =="密碼不一致"){
								document.getElementById("idspPasswordCheck").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>密碼不一致</span>"
							}
							if (message =="姓名格式錯誤"){
								document.getElementById("idspName").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>姓名格式錯誤</span>"
							}
							if (message =="身分證字號格式錯誤"){
								document.getElementById("idspCertificateIdNumber").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>身分證字號格式錯誤</span>"
							}
							if (message =="統一編號格式錯誤"){
								document.getElementById("idspCertificateIdNumber").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>統一編號格式錯誤</span>"
							}
							if (message =="IdNumber格式錯誤"){
								document.getElementById("idspCertificateIdNumber").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>IdNumber格式錯誤</span>"
							}
							if (message =="出生日期格式錯誤"){
								document.getElementById("idspDate").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>出生日期格式錯誤</span>"
							}
							if (message =="創立日期格式錯誤"){
								document.getElementById("idspDate").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>創立日期格式錯誤</span>"
							}
							if (message =="email格式錯誤"){
								document.getElementById("idspEmail").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>email格式錯誤</span>"
							}
							if (message =="電話格式錯誤"){
								document.getElementById("idspTelephone").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>電話格式錯誤</span>"
							}
							if (message =="手機格式錯誤"){
								document.getElementById("idspMobile").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>手機格式錯誤</span>"
							}
							if (message =="創辦人格式錯誤"){
								document.getElementById("idspOrgFounder").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>創辦人格式錯誤</span>"
							}
							if (message =="執行長格式錯誤"){
								document.getElementById("idspOrgCeo").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>執行長格式錯誤</span>"
							}
							if (message =="聯絡人格式錯誤"){
								document.getElementById("idspOrgContactPerson").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>聯絡人格式錯誤</span>"
							}
							if (message =="聯絡人電話格式錯誤"){
								document.getElementById("idspOrgContactPersonTel").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>聯絡人電話格式錯誤</span>"
							}
							if (message =="聯絡人手機格式錯誤"){
								document.getElementById("idspOrgContactPersonMobile").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>聯絡人手機格式錯誤</span>"
							}
							if (message =="網址格式錯誤"){
								document.getElementById("idspOrgWebsiteLink").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>網址格式錯誤</span>"
							}
							
							if (message == "資料有誤"){
								document.getElementById("error").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>資料填寫有誤</span>"
// 								$("#error").html(message);
								swal({
									  title: "ERROR",
									  text: "更新失敗，資料有誤",
									  icon: "warning",
									  button: "確定",
								})
							}
						});
					}
				});
			})
		})
	</script>
</body>
</html>