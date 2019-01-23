<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>聯絡我們 | TimeBank</title>
<!-- css -->
<jsp:include page="commons_layout/commons_css_links.jsp" />
<!-- Javascript files-->
<jsp:include page="commons_layout/commons_js_links.jsp" />
<style>
.btn-primary:hover{
	background-color:#10a9a5;
	border-color:#10a9a5;
}
#chatAdmin{
	margin-left:40px;
}

</style>


<script>

function startToChat(){
	createChatBox("royadmin1112","TimeBank時間銀行")	
}
</script>

</head>
<body>
	<!-- Top bar-->
	<jsp:include page="commons_layout/commons_top-bar.jsp" />
	<!-- Navbar -->
	<jsp:include page="commons_layout/commons_nav.jsp" />
	<!-- heading-breadcrumbs -->
	<section style="background: url('/banner/1607281719580.jpg') center center repeat;padding:12rem 0" class="bar background-white relative-positioned">
		<div class="dark-mask "></div>
       	<div class="container">
         <div class="row d-flex align-items-center flex-wrap">
             <h1 class="h2"  style="margin:auto;color:#fff;font-size:42px;">聯絡我們</h1>
         </div>
       </div>
    </section> 
	 <div id="content">
        <div id="contact" class="container">
          <div class="row">
            <div class="col-lg-8">
              <section class="bar">
                <div class="heading">
                  <h2>由我們來幫助您</h2>
                </div>
               	<p>若您有任何問題，歡迎留下聯絡資料，
					<sec:authorize access="hasAnyRole('USER','ORG_USER')">
					或是使用線上客服，
					</sec:authorize>	
					我們將盡快為您處理，謝謝！
				</p>
                <div class="heading">
                  <h3>聯絡表單</h3>
                </div>
                <form>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="firstname">姓名</label>
                        <input id="firstname" type="text" class="form-control">
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="email">信箱</label>
                        <input id="email" type="text" class="form-control">
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="subject">主旨</label>
                        <input id="subject" type="text" class="form-control">
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="message">內容</label>
                        <textarea id="message" class="form-control"></textarea>
                      </div>
                    </div>
                    <div class="col-md-12 text-center">
                      <button type="submit" class="btn btn-template-outlined"><i class="fa fa-envelope-o"></i> 送出</button>
                    </div>
                  </div>
                </form>
              </section>
            </div>
            
            <div class="col-lg-4">
            	<section class="bar mb-0">
					<h3 class="text-uppercase">客服信箱</h3>
					<p><strong><a href="mailto:">timeBank452196@gmail.com</a></strong></p>
					<h3 class="text-uppercase">客服電話</h3>
					<p class="text-muted text-sm">如果從台灣打電話，這個號碼是免費的，否則我們建議您使用電子形式的通訊。</p>
					<p><strong>(02)2708-2995</strong></p>
					<h3 class="text-uppercase">線上客服</h3>
					<p class="text-muted text-sm"></p>
					<p><button class="btn btn-primary " id="chatButton" >線上即時客服</button></p>
				</section>
            </div>
          </div>
        </div>
      </div>

	<!-- FOOTER -->
	<jsp:include page="commons_layout/commons_footer.jsp" />

</body>
</html>