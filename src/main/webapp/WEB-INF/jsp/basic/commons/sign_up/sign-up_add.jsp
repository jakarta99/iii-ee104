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
          		<input type="button" class="btn btn-primary btn-sm" onclick="javascript:document.location.href='/commons/sign-up/type'" value="回前頁">  
<%--           		<form class="myform" action="#" method="get" enctype="multipart/form-data"> --%>
<!-- 	                <fieldset> -->
<!-- 	                	<legend>Form Check</legend> -->
<!-- 	                    <div class="block"> -->
<!-- 	                    	<label for="idName">姓名 :</label> -->
<!-- 	                    	<input type="text" id="idName" placeholder="宋明家" size="30" autofocus autocompelete="off"> -->
<!-- 	                        <span id="idspName"></span><br/> -->
<!-- 	                        <div class="remark">(1.不可空白，2.至少兩個字以上，3.必須全部為中文字)</div> -->
<!-- 	                    </div> -->
<!-- 	                    <div class="block"> -->
<!-- 	                    	<label for="idPwd">密碼 :</label> -->
<!-- 	                    	<input type="password" id="idPwd" placeholder="請輸入密碼" size="30" autofocus autocompelete="off"> -->
<!-- 	                        <span id="idspPwd"></span><br/> -->
<!-- 	                        <div class="remark">(1.不可空白，2.至少6個字且必須包含字母、數字、特殊符號[!@#$%^&*])</div> -->
<!-- 	                    </div> -->
<!-- 	                    <div class="block"> -->
<!-- 	                        <label for="idDate">日期 :</label> -->
<!-- 	                        <input type="text" id="idDate" placeholder="ex:2000/2/29" size="30" autofocus autocompelete="off"> -->
<!-- 	                        <span id="idspDate"></span><br/> -->
<!-- 	                        <div class="remark">格式:西元年/月/日 yyyy/MM/dd</div> -->
<!-- 	                    </div> -->
<!-- 	         		</fieldset> -->
<%--         		</form> --%>
          		
          		<form class="myform" action="#" method="post" enctype="multipart/form-data">
          			<fieldset>
          				<legend>帳戶資料</legend>
          				<input type="hidden" value="" id="id" name="id"> 
						<input type="hidden" value="${memberType}" id="memberType" name="memberType">
						<div class="block">
							<label for="idAccount">帳號:</label>
							<input type="text" value="${param.account}" id="idAccount" placeholder="請輸入帳號" name="account" autofocus autocompelete="off">
							<span id="idspAccount">${errors.account}</span>
							<div class="remark">(1.不可空白，2.至少六個字以上，3.必須全部為英文或數字)</div>
						</div>
						<div class="block">
							<label for="idPassword">密碼:</label>
							<input type="text" value="${param.password}" id="idPassword" placeholder="請輸入密碼" name="password" autofocus autocompelete="off">
							<span id="idspPassword">${errors.password}</span>
							<div class="remark">(1.不可空白，2.至少6個字且必須包含字母、數字、特殊符號[!@#$%^&*])</div>
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
	document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("idAccount").addEventListener("keyup", chkAccount);
    });
    function chkAccount() {
        var theAccount = document.getElementById("idAccount").value;
        var theAccountLen = theAccount.length;
        //判斷元素值是否為空白，長度是否大於6
        if (theAccount == ""){
            document.getElementById("idspAccount").innerHTML =
                "<img src='/img/X.jpg'><span style='color:red'>不可空白</span>"
        }
        //如果長度是否大於6，判斷是否全部為英文或數字
        else if (theAccountLen >= 6) {
            for (var i = 0; i < theAccountLen; i++) {
            	var AccountChr = theAccount.charAt(i).toUpperCase();//轉換為大寫
                if (AccountChr >= "A" && AccountChr <= "Z" || AccountChr >= "0" && AccountChr <= "9") {
                    document.getElementById("idspAccount").innerHTML =
                        "<img src='/img/O.jpg'><span style='color:green'>正確</span>"
                } else {
                    document.getElementById("idspAccount").innerHTML =
                        "<img src='/img/X.jpg'><span style='color:red'>必須全部為英文或數字</span>"
                }
            }
        }
        else{
            document.getElementById("idspAccount").innerHTML =
                "<img src='/img/X.jpg'><span style='color:red'>至少六個字以上</span>"
        }
    }
	
    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("idPassword").addEventListener("keyup", chkPassword);
    });
    function chkPassword() {
        var thePassword = document.getElementById("idPassword").value;
        var thePasswordLen = thePassword.length;
        var flag1 = false, flag2 = false, flag3 = false;
        //判斷元素值是否為空白，長度是否大於6
        if (thePassword == ""){
            document.getElementById("idspPassword").innerHTML =
                "<img src='/img/X.jpg'><span style='color:red'>不可空白</span>"
        }
        //如果長度是否大於6，判斷是否包含字母、數字、特殊符號
        else if (thePasswordLen >= 6) {
            for (var i = 0; i < thePasswordLen; i++) {
                var PasswordChr = thePassword.charAt(i).toUpperCase();//轉換為大寫
                if (PasswordChr >= "A" && PasswordChr <= "Z") {
                    flag1 = true;
                } else if (PasswordChr >= "0" && PasswordChr <= "9") {
                    flag2 = true;
                } else if (PasswordChr == "!" || "@" || "#" || "$" || "%" || "^" || "&" || "*") {
                    flag3 = true;
                }
                if (flag1 && flag2 && flag3) {
                    break;
                }
            }
            if (flag1 && flag2 && flag3){
                document.getElementById("idspPassword").innerHTML =
                    "<img src='/img/O.jpg'><span style='color:green'>正確</span>"
            }else{
                document.getElementById("idspPassword").innerHTML =
                    "<img src='/img/X.jpg'><span style='color:red'>必須包含字母、數字、特殊符號[!@#$%^&*]</span>"
            }
        }else{
            document.getElementById("idspPassword").innerHTML =
                "<img src='/img/X.jpg'><span style='color:red'>至少6個字</span>"
        }
    }
    
// 	document.addEventListener("DOMContentLoaded", function () {
//         document.getElementById("idName").addEventListener("keyup", chkName);
//     });
//     function chkName() {
//         var theName = document.getElementById("idName").value;
//         var theNameLen = theName.length;
//         //判斷元素值是否為空白，長度是否大於2
//         if (theName == ""){
//             document.getElementById("idspName").innerHTML =
//                 "<img src='/img/X.jpg'><span style='color:red'>不可空白</span>"
//         }
//         //如果長度是否大於2，判斷是否全部為中文字
//         else if (theNameLen >= 2) {
//             for (var i = 0; i < theNameLen; i++) {
//                 var NameChr = theName.charCodeAt(i);
//                 if (NameChr >= 0x4e00 && NameChr <= 0x9fff) {
//                     document.getElementById("idspName").innerHTML =
//                         "<img src='/img/O.jpg'><span style='color:green'>正確</span>"
//                 } else {
//                     document.getElementById("idspName").innerHTML =
//                         "<img src='/img/X.jpg'><span style='color:red'>必須全部為中文字</span>"
//                 }
//             }
//         }
//         else{
//             document.getElementById("idspName").innerHTML =
//                 "<img src='/img/X.jpg'><span style='color:red'>至少兩個字以上</span>"
//         }
//     }
    
//     document.addEventListener("DOMContentLoaded", function () {
//         document.getElementById("idDate").addEventListener("blur", chkDate);
//     });
//     function chkDate() {
//         var strDate = document.getElementById("idDate").value;
//         var msgChk = document.getElementById("idspDate");
//         var re = /^\d{4}\/\d{1,2}\/\d{1,2}$/;
//         var theDate = new Date(strDate);
//         var theYear = theDate.getFullYear();
//         var theMonth = theDate.getMonth() + 1;
//         var theDate = theDate.getDate();
//         var aryDate = strDate.split("/");
//         // alert(aryDate[0]+"-"+aryDate[1]+"-"+aryDate[2]);

//         if (strDate != "") {
//             if (re.test(strDate)) {
//                 if (aryDate[0] == theYear && aryDate[1] == theMonth && aryDate[2] == theDate){
//                     msgChk.innerHTML = "<img src='/img/O.jpg'><span style='color:green'>正確</span>";
//                 }else{
//                     msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>輸入錯誤，請重新輸入</span>";
//                 }
//             }else{
//                 msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>格式錯誤，請重新輸入</span>";
//             }
//         }else{
//             msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>不可空白</span>";
//         }
//     }
    
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
							alert("${errors}");
						});
					}						
				})
			})
		})
	</script>
</body>
</html>