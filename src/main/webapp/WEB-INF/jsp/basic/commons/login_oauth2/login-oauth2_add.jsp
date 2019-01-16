<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login-oauth2</title>
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
	.padding-horizontal {
	    padding: 5px 0px 10px 0px !important;
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
              		<h1 class="h2">新增TimeBank帳戶所須資訊</h1>
            	</div>
	            <div class="col-md-5">
	              	<ul class="breadcrumb d-flex justify-content-end">
	                	<li class="breadcrumb-item"><a href="/">Home</a></li>
	                	<li class="breadcrumb-item active">Write information</li>
	              	</ul>
	            </div>
        	</div>
        </div>
    </div>
	<section class="bar">
	<div class="container">
    	<div class="row">
    		<div class="col-lg-6" style="margin:auto">
            	<div class="box">
		          	<article>
		          		<h2 class="text-uppercase">帳戶資料</h2>
<!-- 		                <p class="lead">您在 TimeBank中使用的基本資訊</p> -->
<!-- 		                <p class="text-muted">帳戶資料</p> -->
		                <hr>
		          		<form id="memberform">
		          			<fieldset>
		          				<input type="hidden" value="" id="id" name="id">
		          				<input type="text" value="${oauth2Id}" id="oauth2Id" name="oauth2Id">
								<div class="row">
		                    		<div class="col-md-12">
		                      			<div class="form-group">
											<label for="idAccount">帳號:</label>
											<input type="text" value="${param.account}" id="idAccount" placeholder="請輸入帳號" name="account" autofocus autocompelete="off" class="form-control">
											<div><label>(1.不可空白，2.至少6個字以上，3.必須全部為英文或數字)</label></div>
											<span id="idspAccount" style='color:red'>${accountDouble}</span><span id="isDoubleAccount"></span>
										</div>
									</div>
								</div>
								<div class="row">
		                    		<div class="col-md-12">
		                      			<div class="form-group">
											<label for="idMemberType">會員類型:</label>
											<select id="idMemberType" name="memberType" class="form-control">
										        <option value="P">一般會員</option>
										        <option value="O">公益團體</option>
										    </select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
		                      			<div class="form-group">
											<label for="idName">名稱:</label>
											<input type="text" value="${param.name}" id="idName" name="name" autofocus autocompelete="off" class="form-control">
											<div><label>(1.不可空白，2.至少2個字以上，3.必須全部為中文)</label></div>
											<span id="idspName" style='color:red'></span>
										</div>
									</div>	
								</div>
<%-- 								<c:if test="${email eq '' }"> --%>
<!-- 									<div class="row"> -->
<!-- 										<div class="col-md-12"> -->
<!-- 			                      			<div class="form-group"> -->
<!-- 												<label for="idEmail">email:</label>  -->
<%-- 												<input type="text" value="${param.email}" id="idEmail" name="email" autofocus autocompelete="off" class="form-control"> --%>
<!-- 												<div><label>(1.不可空白，2.必須填入確切用戶信箱，以供驗證)</label></div> -->
<!-- 												<span id="idspEmail" style='color:red'></span> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</div> -->
<%-- 								</c:if> --%>
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
				url:"/login/oauth2/checkAccount",
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
                        "<img src='/img/X.jpg'><span style='color:red'>必須全部為中文字</span>";
                    break;
                }
            }
        }
        else{
            document.getElementById("idspName").innerHTML =
                "<img src='/img/X.jpg'><span style='color:red'>至少兩個字以上</span>"
        }
    }
    
//     if(${email eq ''}){
//     	document.addEventListener("DOMContentLoaded", function () {
//             document.getElementById("idEmail").addEventListener("keyup", chkEmail);
//         });
//         function chkEmail() {
//         	var strEmail = document.getElementById("idEmail").value;
//             var msgChk = document.getElementById("idspEmail");
//         	//Regular expression Testing
//         	var emailRule = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
//         	// ^\w+：@ 之前必須以一個以上的文字&數字開頭，例如 abc
//         	// ((-\w+)：@ 之前可以出現 1 個以上的文字、數字或「-」的組合，例如 -abc-
//         	// (\.\w+))：@ 之前可以出現 1 個以上的文字、數字或「.」的組合，例如 .abc.
//         	// ((-\w+)|(\.\w+))*：以上兩個規則以 or 的關係出現，並且出現 0 次以上 (所以不能 –. 同時出現)
//         	// @：中間一定要出現一個 @
//         	// [A-Za-z0-9]+：@ 之後出現 1 個以上的大小寫英文及數字的組合
//         	// (\.|-)：@ 之後只能出現「.」或是「-」，但這兩個字元不能連續時出現
//         	// ((\.|-)[A-Za-z0-9]+)*：@ 之後出現 0 個以上的「.」或是「-」配上大小寫英文及數字的組合
//         	// \.[A-Za-z]+$/：@ 之後出現 1 個以上的「.」配上大小寫英文及數字的組合，結尾需為大小寫英文
        	
//         	if (strEmail != "") {
//         		//validate ok or not
//             	if(strEmail.search(emailRule)!= -1){
//             		msgChk.innerHTML = "<img src='/img/O.jpg'><span style='color:green'>正確</span>";
//             	}else{
//             		msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>輸入錯誤，請重新輸入</span>";
//             	}
//         	}else{
//         		msgChk.innerHTML = "<img src='/img/X.jpg'><span style='color:red'>不可空白</span>";
//         	}
//         }
//     }
    
    	$('#allin').click(function(){
//     		if(${email eq ''}){
//     			$('#idAccount').val('anchor888');
// 	    		$("select[name='memberType']").val('P');
// 	    		$('#idName').val('明家');
// 	    		$('#idEmail').val('xcube.anchor@gmail.com');
//     		}else{
	    		$('#idAccount').val('anchor666');
	    		$("select[name='memberType']").val('P');
	    		$('#idName').val('明家');
//     		}
    	})	
    
		$(document).ready(function(){
			
// 			insert new member
			$("#submit").click(function(){
				
// 	    		if(${email eq ''}){
// 	    			document.getElementById("idspAccount").innerHTML = "" ;
// 					document.getElementById("idspName").innerHTML = "" ;
// 					document.getElementById("idspEmail").innerHTML = "" ;
// 					document.getElementById("error").innerHTML = "" ;
// 	    		}else{
					document.getElementById("idspAccount").innerHTML = "" ;
					document.getElementById("idspName").innerHTML = "" ;
					document.getElementById("error").innerHTML = "" ;
// 	    		}
	  			
				$.ajax({
					method:"post",
					dataType: "json",        
					url:"/login/oauth2/insert",
					data: $("#memberform").serialize(),
				}).done(function(response){
					if(response.status == "SUCCESS") {
						swal({
							  title: "SUCCESS",
							  text: "資料填寫完成",
							  icon: "success",
							  button: "確定",
						}).then((result) => {
							if (result) {
								window.location.replace("/index");	//讀完導至首頁
							}
						});
					} else {
						$.each(response.messages, function(idx, message){
// 							alert("the "+idx+"th ERROR, because "+message);
							if (message =="帳號格式錯誤"){
								document.getElementById("idspAccount").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>帳號格式錯誤</span>"
							}
							if (message =="已有此帳號"){
								document.getElementById("idspAccount").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>已有此帳號</span>"
							}
							if (message =="姓名格式錯誤"){
								document.getElementById("idspName").innerHTML =
					                "<img src='/img/X.jpg'><span style='color:red'>姓名格式錯誤</span>"
							}
// 							if (message =="email格式錯誤"){
// 								document.getElementById("idspEmail").innerHTML =
// 					                "<img src='/img/X.jpg'><span style='color:red'>email格式錯誤</span>"
// 							}
							
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
// 	    		if(${email eq ''}){
// 	    			document.getElementById("idspAccount").innerHTML = "" ;
// 					document.getElementById("idspName").innerHTML = "" ;
// 					document.getElementById("idspEmail").innerHTML = "" ;
// 					document.getElementById("error").innerHTML = "" ;
// 	    		}else{
					document.getElementById("idspAccount").innerHTML = "" ;
					document.getElementById("idspName").innerHTML = "" ;
					document.getElementById("error").innerHTML = "" ;
// 	    		}
			})
		})
	</script>
</body>
</html>