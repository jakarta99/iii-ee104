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
<!-- sweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
	body{
		font-family: "微軟正黑體"
	}
	article{
		width:100%;
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
	                	<li class="breadcrumb-item"><a href="/">Home</a></li>
	                	<li class="breadcrumb-item"><a href="/commons/login-forget/type">Member type</a></li>
						<li class="breadcrumb-item active">Forget Password</li>
	              	</ul>
	            </div>
        	</div>
        </div>
    </div>
	<section class="bar">
	<div class="container">
    	<div class="row">
          	<article>
          		<form>
          			<fieldset>
          				<div class="row">
                    		<div class="col-md-6">
                      			<div class="form-group">
			          				<div class="heading">
			          					<h3>帳戶資料</h3>
			          				</div>
			          			</div>
			          		</div>
			          		<div class="col-md-6">
                      			<div class="form-group">
			          				<div class="heading">
			          					<h3>個人資料</h3>
			          				</div>
			          			</div>
			          		</div>
			          	</div>
          				<input type="hidden" value="" id="id" name="id"> 
						<input type="hidden" value="${memberType}" id="memberType" name="memberType">
						<div class="row">
							<div class="col-md-6">
								<div class="row">
		                    		<div class="col-md-10">
		                      			<div class="form-group">
											<label for="idAccount">帳號:</label>
											<input type="text" value="${param.account}" id="idAccount" placeholder="請輸入帳號" name="account" autofocus autocompelete="off" class="form-control">
											<span id="idspAccount" style='color:red'></span>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="row">
									<c:choose>
										<c:when test="${memberType eq 'P'}">
											<div class="col-md-10">
		                      					<div class="form-group">
													<label for="idCertificateIdNumber">身分證字號:</label>
													<input type="text" value="${param.certificateIdNumber}" id="idCertificateIdNumber" placeholder="請輸入您的身分證字號" name="certificateIdNumber" autofocus class="form-control">
													<span id="idspCertificateIdNumber" style='color:red'></span>
												</div>
											</div>
										</c:when>
										<c:when test="${memberType eq 'O'}">
											<div class="col-md-10">
		                      					<div class="form-group">
													<label for="idCertificateIdNumber">統一編號:</label> 
													<input type="text" value="${param.certificateIdNumber}" id="idCertificateIdNumber" placeholder="請輸入帳戶的統一編號" name="certificateIdNumber" autofocus class="form-control">
													<span id="idspCertificateIdNumber" style='color:red'></span>
												</div>
											</div>
										</c:when>
									</c:choose>
								</div>
							</div>
						</div>
          			</fieldset>
					<fieldset style="border:none">
						<div class="col-md-12 text-center">
							<input type="button" class="btn btn-template-outlined" id="submit" value="確定送出" />
					        <input type="reset" class="btn btn-template-outlined" id="reset" value="清除重填" />
						</div>
					    <div class="col-md-12 text-center" id="error" style='color:red'></div>
						<div class="col-md-12 text-right">
                      		<div class="form-group">
								<input type="button" class="btn btn-template-outlined" id="allin" value="一鍵帶入"/>
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

		$('#allin').click(function(){
			if(${memberType eq 'P' }){
	    		$('#idAccount').val('anchor0824');
			   	$('#idCertificateIdNumber').val('A123456789');
			}
			if(${memberType eq 'O' }){
				$('#idAccount').val('hlccaservice');
			   	$('#idCertificateIdNumber').val('22099131');
			}
		})	
	
		$(document).ready(function(){
			$("#submit").click(function(){
				document.getElementById("idspAccount").innerHTML = "" ;
				document.getElementById("idspCertificateIdNumber").innerHTML = "" ;
				document.getElementById("error").innerHTML = "" ;
 				swal({
 		            icon: "/image/user/member/loading.gif",
 					button: false,
 				})
				$.ajax({
					method:"post",
					dataType:"json",        
					url:"/commons/login-forget/mailNewPassword",
					data:{account:$("#idAccount").val(),certificateIdNumber:$("#idCertificateIdNumber").val()}
				}).done(function(response){
// 					alert(response.obj);
// 					console.log("status="+response.status);
// 					console.log("messages="+response.messages);
// 					alert($("#idPassword").val())
					if(response.status == "SUCCESS") {
						swal({
							  title: "SUCCESS",
							  text: "新密碼已mail至您的信箱",
							  icon: "success",
							  button: "確定",
						}).then((result) => {
							if (result) {
								window.location.replace("/login");
							}
						});
					} else {
						$.each(response.messages, function(idx, message){
							if (message =="沒有此帳號"){
								document.getElementById("idspAccount").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>沒有此帳號</span>"
							}
							if (message =="身分證字號輸入錯誤"){
								document.getElementById("idspCertificateIdNumber").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>身分證字號輸入錯誤</span>"
							}
							if (message =="統一編號輸入錯誤"){
								document.getElementById("idspCertificateIdNumber").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>統一編號輸入錯誤</span>"
							}
// 							if (message =="IdNumber輸入錯誤"){
// 								document.getElementById("idspCertificateIdNumber").innerHTML =
// 					                "<img src='/img/X.jpg'><span style='color:red'>IdNumber輸入錯誤</span>"
// 							}
							if (message == "資料有誤"){
								document.getElementById("error").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>資料填寫有誤</span>"
								swal({
									  title: "ERROR",
									  text: "驗證失敗，資料有誤",
									  icon: "warning",
									  button: "確定",
								})
							}								
						})
					}						
				})
			})
			
			//reset 清空span
			$("#reset").click(function(){
				document.getElementById("idspAccount").innerHTML = "" ;
				document.getElementById("idspCertificateIdNumber").innerHTML = "" ;
				document.getElementById("error").innerHTML = "" ;
			})
		})
	</script>
</body>
</html>