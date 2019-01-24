<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign Up Add</title>
<!-- css -->
<jsp:include page="../commons_layout/commons_css_links.jsp" />
<!-- Javascript files -->
<jsp:include page="../commons_layout/commons_js_links.jsp" />
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
	.padding-horizontal {
	    padding: 5px 0px 10px 0px !important;
	}
	.container-1 {
	    width: 72.5%;
	    margin:auto;
		padding:50px;
	}
</style>

</head>
<body>
	<!-- Top bar-->
	<jsp:include page="../commons_layout/commons_top-bar.jsp"/>
	<!-- Navbar -->
	<jsp:include page="../commons_layout/commons_nav.jsp"/>
<!-- 	<div id="heading-breadcrumbs"> -->
<!--     	<div class="container"> -->
<!--         	<div class="row d-flex align-items-center flex-wrap"> -->
<!--             	<div class="col-md-7"> -->
<!--               		<h1 class="h2">建立您的TimeBank帳戶</h1> -->
<!--             	</div> -->
<!-- 	            <div class="col-md-5"> -->
<!-- 	              	<ul class="breadcrumb d-flex justify-content-end"> -->
<!-- 	                	<li class="breadcrumb-item"><a href="/">首頁</a></li> -->
<!-- 	                	<li class="breadcrumb-item"><a href="/commons/sign-up/type">選擇帳戶類型</a></li> -->
<!-- 	                	<li class="breadcrumb-item active">填寫帳戶資訊</li> -->
<!-- 	              	</ul> -->
<!-- 	            </div> -->
<!--         	</div> -->
<!--         </div> -->
<!--     </div> -->
	<section class="bar" style="background-color: #f7f7f7" >
	<div class="container-1" style="border-radius:5px;background-color: #fff;border-radius:3px;box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);">
    	<div class="row">
          	<article>
          		<form id="memberform" class="myform" action="#" method="post" enctype="multipart/form-data">
          			<fieldset>
          				<div class="heading">
          					<h3>帳戶資料</h3>
          				</div>
          				<input type="hidden" value="" id="id" name="id"> 
						<input type="hidden" value="${memberType}" id="memberType" name="memberType">
						<div class="row">
                    		<div class="col-md-6">
                      			<div class="form-group">
									<label for="idAccount" style="font-size:20px">帳號</label>
									<input type="text" value="${param.account}" id="idAccount" placeholder="請輸入帳號" name="account" autofocus autocompelete="off" class="form-control">
									<div><label>(1.不可空白，2.至少6個字以上，3.必須全部為英文或數字)</label></div>
									<span id="idspAccount" style='color:red'>${accountDouble}</span><span id="isDoubleAccount"></span>
								</div>
							</div>
						</div>
						<div class="row">
                    		<div class="col-md-6">
                      			<div class="form-group">
									<label for="idPassword" style="font-size:20px">密碼</label>
									<input type="password"  id="idPassword" placeholder="請輸入密碼" name="password" autofocus autocompelete="off" class="form-control">
									<div><label>(1.不可空白，2.至少8個字最多16個字，3.必須包含字母、數字、特殊符號[~!@#$%^&*])</label></div>
									<span id="idspPassword" style='color:red'></span>
								</div>
							</div>
							<div class="col-md-6">
                      			<div class="form-group">
									<label for="idPasswordCheck" style="font-size:20px">確認密碼</label>
									<input type="password" value="${param.passwordCheck}" id="idPasswordCheck" placeholder="請再輸入一次密碼" name="passwordCheck" autofocus autocompelete="off" class="form-control">
									<div><label>(1.不可空白，2.須與密碼相同)</label></div>
									<span id="idspPasswordCheck" style='color:red'></span>
								</div>
							</div>	
						</div>
          			</fieldset>
					<fieldset style="border:none">
						<div class="col-md-12 text-center">
							<input type="button" class="btn btn-template-outlined" id="submit" value="下一步" />
					        <input type="reset" class="btn btn-template-outlined" id="reset" value="清除重填" />
					        <span id="error" style='color:red'></span>
						</div>
						
						<div class="col-md-12 text-right">
                      		<div class="form-group">
                      			<span class="bg-primary bar padding-horizontal">
									<input type="button" class="btn btn-template-outlined-white" id="allin" value="一鍵帶入"/>
								</span>
							</div>
						</div>
					</fieldset>
          		</form>
          	</article>
        </div>
    </div>
    </section>
	<!-- FOOTER -->
	<jsp:include page="../commons_layout/commons_footer.jsp"/>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
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
        	$.ajax({
				method:"post",
				dataType: "text",        
				url:"/commons/sign-up/checkAccount",
				data: {account:$("#idAccount").val()}
			}).done(function(response){
				if(response == "帳號可使用"){
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
				}else{
					document.getElementById("idspAccount").innerHTML =
                        "<img src='/img/X.jpg'><span style='color:red'>已有此帳號</span>"
				}
			})  
        }
        else{
            document.getElementById("idspAccount").innerHTML =
                "<img src='/img/X.jpg'><span style='color:red'>至少6個字以上</span>"
        }
    }
	
    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("idPassword").addEventListener("keyup", chkPassword);
    });
    function chkPassword() {
        var thePassword = document.getElementById("idPassword").value;
        console.log(thePassword)
        var thePasswordLen = thePassword.length;
        var flag1 = false, flag2 = false, flag3 = false;
        //判斷元素值是否為空白
        if (thePassword == ""){
            document.getElementById("idspPassword").innerHTML =
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
                document.getElementById("idspPassword").innerHTML =
                    "<img src='/img/O.jpg'><span style='color:green'>正確</span>"
            }else{
                document.getElementById("idspPassword").innerHTML =
                    "<img src='/img/X.jpg'><span style='color:red'>必須包含字母、數字、特殊符號[~!@#$%^&*]</span>"
            }
        }else{
            document.getElementById("idspPassword").innerHTML =
                "<img src='/img/X.jpg'><span style='color:red'>至少8個字，最多16個字</span>"
        }
    }
    
    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("idPasswordCheck").addEventListener("keyup", chkPasswordCheck);
    });
    function chkPasswordCheck(){
    	var thePassword = document.getElementById("idPassword").value;
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
				url:"/commons/sign-up/checkPassword",
				data: {passwordCheck:$("#idPasswordCheck").val(),password:$("#idPassword").val()}
			}).done(function(response){
				if(response == "正確"){
					msgChk.innerHTML = "<img src='/img/O.jpg'><span style='color:green'>正確</span>";
				}else{
					msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>密碼不一致</span>";
				}
			})
        }      
    }
    
    	$('#allin').click(function(){
    		if(${memberType eq 'P' }){
	    		$('#idAccount').val('anchor0824');
	    		$('#idPassword').val('asdf123!');
	    		$('#idPasswordCheck').val('asdf123!');
    		}
    		if(${memberType eq 'O' }){
    			$('#idAccount').val('hlccaservice');
	    		$('#idPassword').val('asdf123!');
	    		$('#idPasswordCheck').val('asdf123!');
    		}
    	})	
    
		$(document).ready(function(){
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
// 				alert($("#idPassword").val())
// 				console.log($("#idPassword").val())
				document.getElementById("idspAccount").innerHTML = "" ;
				document.getElementById("idspPassword").innerHTML = "" ;
				document.getElementById("idspPasswordCheck").innerHTML = "" ;
//  				swal({
//  		            icon: "/image/user/member/loading.gif",
//  					button: false,
//  				})
				$('#status').css('display','block');  
	  			$('#status').fadeOut(); // will first fade out the loading animation
	  			
				$.ajax({
					method:"post",
					dataType: "json",        
					url:"/commons/sign-up/insert",
					data: $("#memberform").serialize(),
// 					processData: false,	// jQuery預設會把data轉為query String, 所以要停用
// 					contentType: false	// jQuery預設contentType為'application/x-www-form-urlencoded; charset=UTF-8', 且不用自己設定為'multipart/form-data'
				}).done(function(response){
// 					alert(response.obj);
// 					console.log("status="+response.status);
// 					console.log("messages="+response.messages);
// 					alert($("#idPassword").val())
					if(response.status == "SUCCESS") {
						window.location.replace("/commons/sign-up/edit");	//讀完導至上傳圖檔(成功送驗證信!(再導至login)))
// 						swal({
// 							  title: "SUCCESS",
// 							  text: "資料填寫完成",
// 							  icon: "success",
// 							  button: "確定",
// 						}).then((result) => {
// 							if (result) {
// 								window.location.replace("/commons/sign-up/pic");	//讀完導至上傳圖檔(成功送驗證信!(再導至login)))
// 							}
// 						});
// 						alert("會員新增成功");
// 						window.location.replace("/commons/sign-up/edit");	//edit頁面
					} else {
						$.each(response.messages, function(idx, message){
// 							alert("the "+idx+"th ERROR, because "+message);
							if (message =="帳號格式錯誤"){
								document.getElementById("idspAccount").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>帳號格式錯誤</span>"
// 								$("#idspAccount").html(message);
							}
							if (message =="已有此帳號"){
								document.getElementById("idspAccount").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>已有此帳號</span>"
// 								$("#idspAccount").html(message);
							}
							if (message =="密碼格式錯誤"){
								document.getElementById("idspPassword").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>密碼格式錯誤</span>"
// 								$("#idspPassword").html(message);
							}
							if (message =="密碼不一致"){
								document.getElementById("idspPasswordCheck").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>密碼不一致</span>"
// 								$("#idspPasswordCheck").html(message);
							}
							
							if (message == "資料有誤"){
								document.getElementById("error").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>資料填寫有誤</span>"
// 								$("#error").html(message);
								swal({
									  title: "ERROR",
									  text: "註冊失敗，資料有誤",
									  icon: "warning",
									  button: "確定",
								})
							}								
						})
// 						console.log(response.messages);
// 						$.each(response.messages, function(idx, message) {
// 							alert("the "+idx+"th ERROR, because "+message);
// 							alert("${response.errors.account}");
// 						});
					}						
				})
			})
			
			//reset 清空span
			$("#reset").click(function(){
				document.getElementById("idspAccount").innerHTML = "" ;
				document.getElementById("idspPassword").innerHTML = "" ;
				document.getElementById("idspPasswordCheck").innerHTML = "" ;
// 				document.getElementById("idspName").innerHTML = "" ;
// 				document.getElementById("idspCertificateIdNumber").innerHTML = "" ;
// 				document.getElementById("idspDate").innerHTML = "" ;
// 				document.getElementById("idspEmail").innerHTML = "" ;
// 				document.getElementById("idspTelephone").innerHTML = "" ;
// 				document.getElementById("idspMobile").innerHTML = "" ;
				document.getElementById("error").innerHTML = "" ;
				
// 				if(${memberType eq 'O' }){
// 					document.getElementById("idspOrgFounder").innerHTML = "" ;
// 					document.getElementById("idspOrgCeo").innerHTML = "" ;
// 					document.getElementById("idspOrgContactPerson").innerHTML = "" ;
// 					document.getElementById("idspOrgContactPersonTel").innerHTML = "" ;
// 					document.getElementById("idspOrgContactPersonMobile").innerHTML = "" ;
// 					document.getElementById("idspOrgWebsiteLink").innerHTML = "" ;
// 				}
				
			})
		})
	</script>
</body>
</html>