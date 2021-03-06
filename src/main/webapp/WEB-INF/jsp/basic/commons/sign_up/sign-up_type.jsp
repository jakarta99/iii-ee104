<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign Up Type</title>
<!-- css -->
<jsp:include page="../commons_layout/commons_css_links.jsp" />
<!-- Javascript files-->
<jsp:include page="../commons_layout/commons_js_links.jsp" />
<style>
	.myMOUSE{ cursor: pointer; }
	.box{    
		padding-top: 40px;
	    padding-bottom: 40px;
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
<!-- 	                	<li class="breadcrumb-item active">選擇帳戶類型</li> -->
<!-- 	              	</ul> -->
<!-- 	            </div> -->
<!--         	</div> -->
<!--         </div> -->
<!--     </div> -->
	<section>
		<div id="all">  
<!--       <div id="heading-breadcrumbs"> -->
<!--         <div class="container"> -->
<!--           <div class="row d-flex align-items-center flex-wrap"> -->
<!--             <div class="col-md-7"> -->
<!--               <h1 class="h2">New Account / Sign In</h1> -->
<!--             </div> -->
<!--             <div class="col-md-5"> -->
<!--               <ul class="breadcrumb d-flex justify-content-end"> -->
<!--                 <li class="breadcrumb-item"><a href="index.html">Home</a></li> -->
<!--                 <li class="breadcrumb-item active">New Account / Sign In</li> -->
<!--               </ul> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
      <div id="content" style="background-color: #f7f7f7" >
        <div class="container">
          <div class="row">           
            <div class="col-lg-6" style="margin:auto">
              <div class="box" style="border-radius:5px;background-color: #fff;border-radius:3px;box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.1);">
                <h2 class="text-uppercase" style='text-align:center'>建立您的TimeBank帳戶</h2>
                <p class="text-muted" style='text-align:center;font-size:20px'>還不是我們的會員?</p>
                <div class="heading">
          			<h3>選擇帳戶類型</h3>
          		</div>
<!--                 <p class="text-muted" style='text-align:center;font-size:20px'>選擇帳戶類型</p> -->
<!--                 <hr> -->
                <form>
                  <div class="text-center">
                    <input type="button" class="btn btn-template-outlined" onclick="javascript:document.location.href='/commons/sign-up/add?memberType=P'" value="一般會員"/>
                    <input type="button" class="btn btn-template-outlined" onclick="javascript:document.location.href='/commons/sign-up/add?memberType=O'" value="公益團體"/>
                  	<hr>
                  </div>
                </form>
                <div class="text-center">
				    <img src="../../img/facebook.png" class="myMOUSE" onclick="FBLogin()" width="50%"/><br/>
				    <img src="../../img/google.png" class="myMOUSE" onclick="GoogleLogin()" width="50%"/>
              	</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
   </section>
   <!-- FOOTER -->
   <jsp:include page="../commons_layout/commons_footer.jsp" />
   
   <!--Google登入-->
    <script async defer src="https://apis.google.com/js/api.js" onload="this.onload=function(){};HandleGoogleApiLibrary()"
            onreadystatechange="if (this.readyState === 'complete') this.onload()"></script>
    <script type="text/javascript">
//         進入 https://console.developers.google.com/，找「憑證」頁籤(記得先選對專案)，即可找到用戶端ID
        let Google_appId = "1087090692205-5vudvov1cgbcj4nrvhtshe15m3c883ih.apps.googleusercontent.com"; 
        // Called when Google Javascript API Javascript is loaded
        function HandleGoogleApiLibrary() {
            // Load "client" & "auth2" libraries
            gapi.load('client:auth2', {
                callback: function () {
                    // Initialize client & auth libraries
                    gapi.client.init({
                        clientId: Google_appId,
                        scope: 'https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/plus.me'
                    }).then(
                        function (success) {
                            // Google Libraries are initialized successfully
                            // You can now make API calls 
                            console.log("Google Libraries are initialized successfully");
                        },
                        function (error) {
                            // Error occurred
                            console.log(error);// to find the reason 
                        }
                    );
                },
                onerror: function () {
                    // Failed to load libraries
                    console.log("Failed to load libraries");
                }
            });
        }
		
        function GoogleLogin() {
        	// API call for Google login  
            gapi.auth2.getAuthInstance().signIn().then(
                function (success) {
                	// Login API call is successful 
                    console.log(success);

                    let oauth2Id = success.El;
                    let email = success.w3.U3;
                    let name = success.w3.ig;
                  	//id
                    console.log(oauth2Id);
                    //email
                    console.log(email);
                    //name
                    console.log(name);
                    	
                    $.ajax({
                    	method:"post",
    					dataType: "json",        
    					url:"/login/oauth2/google",
    					data: {name:name,email:email,oauth2Id:oauth2Id}
                    }).done(function(member){
                    	$("#loginContainer").css("display","none");
//                     	 alert(member.account + "," + member.password + "," +member.name + "," + member.email + "," + member.oauth2Id);
                    	 if (member.account != null){	//表示資料庫已有這個member
//                     		alert("I'm member !!!");
                         	$("#username").val(member.account);
                         	$("#password").val(member.oauth2Id);
                         	$("#loginForm").submit();
                         } else{	//表示資料庫沒有這個member，須insert 
//                         	alert("I'm NEW !!!");
                        	//使用ajax :insert
                        	$.ajax({
		                    	method:"post",
		    					dataType: "json",        
		    					url:"/login/oauth2/insert",
		    					data: {member:member}
		                    }).done(function(resp){
		                    	console.log(resp);
	                        	$("#username").val(resp.obj.account);
	                         	$("#password").val(resp.obj.oauth2Id);
	                         	$("#loginForm").submit();
		                    });    	 
                         }
                    });      
                },
                function (error) {
                    // Error occurred
                    // console.log(error) to find the reason
                    console.log(error);
                }
            );
        }
    </script>
<!--Google登入 end-->

<!-- fb登入 begin -->
   <script type="text/javascript">
        //應用程式編號，進入 https://developers.facebook.com/apps/ 即可看到
        let FB_appID = "292815438073541";

        // Load the Facebook Javascript SDK asynchronously
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "https://connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

        window.fbAsyncInit = function () {
            FB.init({
                appId: FB_appID,//FB appID
                cookie: true,  // enable cookies to allow the server to access the session
                
                xfbml: true,  // parse social plugins on this page
                version: 'v3.0' // use graph api version
            });
        };

        //使用自己客製化的按鈕來登入
        function FBLogin() {
            
            FB.login(function (response) {
                //debug用
                console.log(response);
                if (response.status === 'connected') {
                    //user已登入FB
                    //抓userID
                    let oauth2Id = response["authResponse"]["userID"];
                    console.log("userID:" + oauth2Id);
                    $.ajax({
                    	method:"post",
    					dataType: "json",        
    					url:"/login/oauth2/facebook",
    					data: {oauth2Id:oauth2Id}
                    }).done(function(member){
                    	$("#loginContainer").css("display","none");
//                     	 alert(member.account + "," + member.password + "," +member.name + "," + member.email + "," + member.oauth2Id);
                    	 if (member.account != null){	//表示資料庫已有這個member
//                     		alert("I'm member !!!");
                         	$("#username").val(member.account);
                         	$("#password").val(member.oauth2Id);
                         	$("#loginForm").submit();
                         } else{	//表示資料庫沒有這個member，須insert 
//                         	alert("I'm NEW !!!");
                        	//使用ajax :insert
                        	$.ajax({
		                    	method:"post",
		    					dataType: "json",        
		    					url:"/login/oauth2/insert",
		    					data: {member:member}
		                    }).done(function(resp){
		                    	console.log(resp);
	                        	$("#username").val(resp.obj.account);
	                         	$("#password").val(resp.obj.oauth2Id);
	                         	$("#loginForm").submit();
		                    });    	 
                         }
                    });
                } else {
                    // user FB取消授權
                    alert("Facebook帳號無法登入");
                }
            }, { scope: 'public_profile,email' });
        }
    </script>
<!--fb登入 end-->
   
</body>
</html>