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
<jsp:include page="../commons_layout/commons_css_links.jsp" />
<!-- Javascript files -->
<jsp:include page="../commons_layout/commons_js_links.jsp" />
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
	.box {
	    margin: 30px 0;
	}
</style>

</head>
<body>
	<!-- Top bar-->
	<jsp:include page="../commons_layout/commons_top-bar.jsp"/>
	<!-- Navbar -->
	<jsp:include page="../commons_layout/commons_nav.jsp"/>
	<div id="heading-breadcrumbs">
    	<div class="container">
        	<div class="row d-flex align-items-center flex-wrap">
            	<div class="col-md-7">
              		<h1 class="h2">忘記密碼</h1>
            	</div>
	            <div class="col-md-5">
	              	<ul class="breadcrumb d-flex justify-content-end">
	                	<li class="breadcrumb-item"><a href="/">首頁</a></li>
	                	<li class="breadcrumb-item active">變更密碼</li>
	              	</ul>
	            </div>
        	</div>
        </div>
    </div>
	<section>
	<div class="container">
    	<div class="row">
    		<div class="col-lg-6" style="margin:auto">
            	<div class="box">
		            <article>
						<h2 class="text-uppercase">請輸入您的新密碼</h2>
<!-- 		                <p class="lead">您在 TimeBank中使用的基本資訊</p> -->
<!-- 		                <p class="text-muted">帳戶資料</p> -->
		                <hr>
<!-- 						<h3></h3> -->
<!-- 						<h5>您在 TimeBank中使用的基本資訊</h5> -->
<!-- 						<hr> -->
						<form id="forgetpasswordform">
							<fieldset>
<!-- 								<div class="heading"> -->
<!-- 		          					<h3>帳戶資料</h3> -->
<!-- 		          				</div> -->
		          				<input type="hidden" value="${member.id}" id="id" name="id">
								<input type="hidden" value="${member.verificationCode}" id="verificationCode" name="verificationCode">
								<div class="row">
		                    		<div class="col-md-12">
		                      			<div class="form-group">
											<label for="idPasswordNew">新密碼</label>
											<input type="password" value="" id="idPasswordNew" placeholder="請輸入新密碼" name="passwordNew" autofocus autocompelete="off" class="form-control">
											<div><label>(1.不可空白，2.至少8個字最多16個字，3.必須包含字母、數字、特殊符號[~!@#$%^&*])</label></div>
											<span id="idspPasswordNew" style='color:red'></span>
										</div>
									</div>
									<div class="col-md-12">
		                      			<div class="form-group">
											<label for="idPasswordCheck">確認新密碼</label>
											<input type="password" value="" id="idPasswordCheck" placeholder="請再輸入一次新密碼" name="passwordCheck" autofocus autocompelete="off" class="form-control">
											<div><label>(1.不可空白，2.須與密碼相同)</label></div>
											<span id="idspPasswordCheck" style='color:red'></span>
										</div>
									</div>
								</div>
		          			</fieldset>
							<fieldset style="border:none">
								<div class="col-md-12 text-center">
									<button type="button" class="btn btn-template-outlined" id="updateButt"><i class="fa fa-save"></i>儲存</button>
									<span id="error" style='color:red'></span>
								</div>
							</fieldset>
						</form>
					</article>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- FOOTER -->
	<jsp:include page="../commons_layout/commons_footer.jsp"/>
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
 	<script>
	    
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
					url:"/commons/login-forget/checkPassword",
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
	    
		$(document).ready(function() {
			
			//update password
			$("#updateButt").click(function() {
				$.ajax({
					method : "put",
					dataType : "json",
					url : "/commons/login-forget/updatePassword",
					data : $("#forgetpasswordform").serialize(),
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
								window.location.replace("/login");	//讀完導回登入頁面
							}
						});
// 						alert("資料更新成功");
					} else{
						$.each(response.messages, function(idx, message) {
							if (message =="新密碼格式錯誤"){
								document.getElementById("idspPasswordNew").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>新密碼格式錯誤</span>"
							}
							if (message =="密碼不一致"){
								document.getElementById("idspPasswordCheck").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>密碼不一致</span>"
							}
							
							if (message == "資料有誤"){
								document.getElementById("error").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>資料填寫有誤</span>"
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