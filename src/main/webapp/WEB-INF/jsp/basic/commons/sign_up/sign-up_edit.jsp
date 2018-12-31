<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
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
<link href="https://fonts.googleapis.com/css?family=Righteous" rel="stylesheet">

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
    .block {
        width: 650px;
        border-bottom: 2px solid rgb(247, 202, 201);
        margin: 20px;
    }
    .remark {
        color: rgb(193, 186, 177);
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
          		<input type="button" class="btn btn-primary btn-sm" onclick="javascript:document.location.href='/commons/sign-up/add'" value="回前頁">  
   		
          		<form class="myform" action="#" method="post" enctype="multipart/form-data">
          			<fieldset>	
						<legend>個人資料</legend>
						<div class="block">
							<label for="idName">姓名:</label>
							<input type="text" value="${param.name}" id="idName" name="name" autofocus autocompelete="off">
							<span id="idspName"></span>
							<div class="remark">(1.不可空白，2.至少2個字以上，3.必須全部為中文)</div>
						</div>
						<c:choose>
							<c:when test="${memberType eq 'P'}">
								<div class="block">
									<label for="idCertificateIdNumber">身分證字號:</label>
									<input type="text" value="${param.certificateIdNumber}" id="idCertificateIdNumber" name="certificateIdNumber" autofocus autocompelete="off">
									<span id="idspCertificateIdNumber"></span>
									<div class="remark">(1.不可空白，2.必須符合規則)</div>
								</div>
								<div class="block">
									<label for="idDate">出生日期:</label>
									<input type="text" value="${param.date}" id="idDate" name="date" autofocus autocomplete="off">
									<span id="idspDate"></span>
									<div class="remark">(1.不可空白，2.格式為yyyy/MM/dd)</div>
								</div>
							</c:when>
							<c:when test="${memberType eq 'O'}">
								<div class="block">
									<label for="idCertificateIdNumber">統一編號:</label> 
									<input type="text" value="${param.certificateIdNumber}" id="idCertificateIdNumber" name="certificateIdNumber" autofocus autocompelete="off">
									<span id="idspCertificateIdNumber"></span>
									<div class="remark">(1.不可空白，2.必須符合規則)</div>
								</div>
								<div class="block">
									<label for="idDate">創立日期:</label> 
									<input type="text" value="${param.date}" id="idDate" name="date" autocomplete="off">
									<span id="idspDate"></span>
									<div class="remark">(1.不可空白，2.格式為yyyy/MM/dd)</div>
								</div>
							</c:when>
						</c:choose>
						<div class="block">
							<label for="idEmail">email:</label> 
							<input type="text" value="${param.email}" id="idEmail" name="email" autofocus autocompelete="off">
							<span id="idspEmail"></span>
							<div class="remark">(1.不可空白，2.必須填入確切用戶信箱，以供驗證)</div>
						</div>
						<div class="block">
							<label for="idTelephone">住家電話:</label> 
							<input type="text" value="${param.telephone}" id="idTelephone" name="telephone" autofocus autocompelete="off">
							<span id="idspTelephone"></span>
							<div class="remark">(格式需為0X-XXXXXXXX)</div>
						</div>
						<div class="block">
							<label for="idMobile">手機:</label> 
							<input type="text" value="${param.mobile}" id="idMobile" name="mobile" autofocus autocompelete="off">
							<span id="idspMobile"></span>
							<div class="remark">(格式需為09XX-XXX-XXX)</div>
						</div>
						<div class="block">			
							<label>住址:</label>
							<span role="tw-city-selector" ></span>
							<input type="text" value="${param.address}" id="address" name="address">
						</div>
					</fieldset>
					<c:if test="${memberType eq 'O' }">
						<fieldset>
							<legend>公司資料</legend>
							<div class="block">
								<label for="idOrgFounder">創辦人:</label> 
								<input type="text" value="${param.orgFounder}" id="idOrgFounder" name="orgFounder" autofocus autocompelete="off">
								<span id="idspOrgFounder"></span>
								<div class="remark">(1.不可空白，2.至少2個字以上，3.必須全部為中文)</div>
							</div>
							<div class="block">
								<label for="idOrgCeo">執行長:</label>
								<input type="text" value="${param.orgCeo}" id="idOrgCeo" name="orgCeo" autofocus autocompelete="off">
								<span id="idspOrgCeo"></span>
								<div class="remark">(1.不可空白，2.至少2個字以上，3.必須全部為中文)</div>
							</div>
							<div class="block">
								<label for="idOrgContactPerson">聯絡人:</label>
								<input type="text" value="${param.orgContactPerson}" id="idOrgContactPerson" name="orgContactPerson" autofocus autocompelete="off">
								<span id="idspOrgContactPerson"></span>
								<div class="remark">(1.不可空白，2.至少2個字以上，3.必須全部為中文)</div>
							</div>
							<div class="block">
								<label for="idOrgContactPersonPhone">聯絡人電話:</label> 
								<input type="text" value="${param.orgContactPersonPhone}" id="idOrgContactPersonPhone" name="orgContactPersonPhone" autofocus autocompelete="off">
								<span id="idspOrgContactPersonPhone"></span>
								<div class="remark">(格式需為09XX-XXX-XXX或為0X-XXXXXXXX)</div>
							</div>
							<div class="block">
								<label for="idOrgWebsiteLink">網址:</label>
								<input type="url" size="50px" value="${param.orgWebsiteLink}" id="idOrgWebsiteLink" name="orgWebsiteLink" autofocus autocompelete="off">
								<span id="idspOrgWebsiteLink"></span>
								<div class="remark">(必須符合規則)</div>
							</div>
							<div class="block">
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
        	// 使用「正規表達式」檢驗格式
        	if (theCertificateIdNumber.search(/^[A-Z](1|2)\d{8}$/i) == -1) {
        		msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>格式錯誤，請重新輸入</span>";
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
        			msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>輸入錯誤，請重新輸入</span>";
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
                }
            }
        }
        else{
        	msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>至少兩個字以上</span>"
        }
    }
    
    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("idOrgContactPersonPhone").addEventListener("keyup", chkPhone);
    });
    function chkPhone(){
    	var strPhone = document.getElementById("idOrgContactPersonPhone").value;
        var msgChk = document.getElementById("idspOrgContactPersonPhone");
        var mobileReg = /^09[0-9]{2}-[0-9]{3}-[0-9]{3}$/;
    	var telephoneReg = /^[0-9]{2}-[0-9]{6,8}$/;
    	if(!mobileReg.test(strPhone) && !telephoneReg.test(strPhone)){
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
    
		$(document).ready(function(){
// 			$("form div").addClass("form-group");
// 			$("form input").addClass("form-control");
// 			$("form textarea").addClass("form-control");
			new TwCitySelector();	
			$('#idDate').datepicker({
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
					method:"put",
					dataType: "json",        
					url:"/commons/sign-up/update",
					data: $("form").serialize()
				}).done(function(response){
// 					alert(response.obj);
// 					console.log("status="+response.status);
// 					console.log("message="+response.message);
					
					if(response.status == "SUCCESS") {
						alert("會員資料輸入成功");
// 						window.location.replace("/commons/sign-up/update");	//驗證信頁面
					} else {
						$.each(response.messages, function(idx, message){
							alert("the "+idx+"th ERROR, because "+message);
// 							$("#idspAccount").html(message);
						})
// 						console.log(response.messages);
// 						$.each(response.messages, function(idx, message) {
// 							alert("the "+idx+"th ERROR, because "+message);
// 							alert("${response.errors.account}");
// 						});
					}						
				})
			})
		})
	</script>
</body>
</html>