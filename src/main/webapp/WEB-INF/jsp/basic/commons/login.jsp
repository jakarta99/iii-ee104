<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登入 | Time Bank </title>
<!-- css -->
<jsp:include page="commons_layout/commons_css_links.jsp"/>
<!-- Javascript files-->
<jsp:include page="commons_layout/commons_js_links.jsp" />


</head>
<body>
	  <!-- Top bar-->
      <jsp:include page="commons_layout/commons_top-bar.jsp"/>
 		<!-- Navbar -->
		<jsp:include page="commons_layout/commons_nav.jsp" />
	<div id="all">  
      <div id="content" >
        <div class="container">
          <div class="row">           
            <div class="col-lg-6" style="margin:auto">
              <div class="box">
                <h2 class="text-uppercase">Login</h2>
                <p class="lead">Already our customer?</p>
                <p class="text-muted"></p>
                <hr>
                <form action="/login" method="post">
                  <div class="form-group">
                    <label for="email">Account</label>
                    <input id="email" type="text" name="username" class="form-control" autofocus>
                  </div>
                  <div class="form-group">
                    <label for="password">Password</label>
                    <input id="password" type="password" name="password" class="form-control">
                  </div>
                     <h6 style="text-align: center;color:blue">${message}</h6>
                  <div class="text-center">
                    <button type="submit" class="btn btn-template-outlined"><i class="fa fa-sign-in"></i> Log in</button>
                  </div>
                  <div class="text-right"><a href="commons/login-forget/type">忘記密碼</a></div>
                </form>
                <div class="text-center">
				    <img src="../../img/facebook.png" onclick="FBLogin()" width="5%" height="5%"/> 
				    <img src="../../img/google.png" onclick="GoogleLogin()" width="5%" height="5%"/>
              	</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
   <!-- FOOTER -->
   <jsp:include page="commons_layout/commons_footer.jsp" />
   
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
//                     let Google_ID = success["El"];
                  	//id
                    console.log(success.El);
                    //email
                    console.log(success.w3.U3);
                    
                    let oauth2Id = success.El;
                    let email = success.w3.U3;
                    window.location.href = "/login/oauth2/google?oauth2Id="+oauth2Id+"&email="+email;
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
                    console.log("userID:" + FB_ID);
                    window.location.href = "/login/oauth2/facebook?oauth2Id="+oauth2Id;
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