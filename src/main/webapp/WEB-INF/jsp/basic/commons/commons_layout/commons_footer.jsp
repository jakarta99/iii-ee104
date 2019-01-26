<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<!-- BEGAIN PRELOADER -->
	<div id="preloader">	
		<div id="status"><img  src="/gif/Spin-1.4s-69px.gif"></div>
	</div>
	<!-- END PRELOADER -->
      <footer class="main-footer">
        <div class="container">
          <div class="row">
            <div class="col-lg-4">
              <h4 class="h6">關於我們</h4>
              <p>TimeBank 是一座愛的橋樑，當您投入志願服務，您所累積的時數便被保存下來，當您有需求時，可以在時間銀行管理中心交換到所需的互助和照顧服務。
若您想轉贈時數，也能讓家人、親友使用，或是由我們為您媒合需要的人!
              </p>
            </div>
            <div class="col-lg-4">
              <h4 class="h6">聯繫方式</h4>
              <p style="font-size:16px" ><strong>地址</strong><br>台北市 大安區 復興南路一段390號2樓<br><strong>E-mail:</strong><br>brian@gmail.com</p>
              <hr class="d-block d-lg-none">
            </div>
            <div class="col-lg-4">
            	<h4 class="h6">相關訊息</h4>
            	<p><a href="https://vol.mohw.gov.tw/vol2/">志願服務資訊網(志工專用)</a></p>
            	<p><a href="https://vols.mohw.gov.tw/">志願服務資訊整合系統(運用單位用)</a></p>
            	
            	
            	
            </div>
          </div>
        </div>
        <div class="copyrights">
          <div class="container">
            <div class="row">
              <div class="col-lg-4 text-center-md">
                <p>&copy; 2018. EEIT104 / TimeBank</p>
              </div>
              <div class="col-lg-8 text-right text-center-md">
                <p>Template design by <a href="https://bootstrapious.com/free-templates">Bootstrapious Templates </a></p>
                <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
              </div>
            </div>
          </div>
        </div>
     </footer>    
     <jsp:include page="loginModal.jsp" />
     <jsp:include page="../../user/chatRoom/chattingBox.jsp"/>
     
     
     <script>
 	
	  	$(document).ready(function() { // makes sure the whole site is loaded
// 	  	    $("#status").css("display","block");  
// 	  		$('#status').fadeOut(); // will first fade out the loading animation
	  		$('#preloader').delay(100).fadeOut('slow'); // will fade out the white DIV that covers the website.
	  	  	$('body').delay(100).css('overflow','visible');  
	  	})
     
     </script>