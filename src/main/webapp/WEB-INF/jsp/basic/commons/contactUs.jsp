<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
             <h1 class="h2"  style="margin:auto;">聯絡我們</h1>
         </div>
       </div>
    </section> 
	
	<div class="all">
		<div id="content">
			<div id="contact" class="container">
				<div class="row">
					<div class="col-lg-8">
						<section class="bar">
							<div class="heading">
								<h2>我們是來幫助你的 <button class="btn btn-primary " id="chatButton" >線上即時客服</button></h2>	
							</div>
							<p class="text-sm">請隨時與我們聯繫，我們的客戶服務中心正在為您服務</p>
							<div class="heading">
								<h3>聯繫表</h3>
							</div>
							<form>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="firstname">名字</label> <input
												id="firstname" type="text" class="form-control">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="lastname">姓</label> <input id="lastname"
												type="text" class="form-control">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="email">信箱</label> <input id="email"
												type="text" class="form-control">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="subject">主題</label> <input id="subject"
												type="text" class="form-control">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="message">訊息</label>
											<textarea id="message" class="form-control"></textarea>
										</div>
									</div>
									<div class="col-md-12 text-center">
										<button type="submit" class="btn btn-template-outlined">
											<i class="fa fa-envelope-o"></i> 發送
										</button>
									</div>
								</div>
							</form>
						</section>
					</div>
					<div class="col-lg-4">
						<section class="bar mb-0">
							<h3 class="text-uppercase">地址</h3>
							<p class="text-sm">
								390號2樓 復興南路一段<br>大安區<br>台北市<br>台灣<br>
								<strong>Roy8787</strong>
							</p>
							<h3 class="text-uppercase">電話</h3>
							<p class="text-muted text-sm">如果從台灣打電話，這個號碼是免費的，否則我們建議您使用電子形式的通訊。</p>
							<p>
								<strong>02 2548-9561</strong>
							</p>
							<h3 class="text-uppercase">電子郵件</h3>
							<p class="text-muted text-sm">請隨時給我們發電子郵件或使用您的電子信箱系統。</p>
							<ul class="text-sm">
								<li><strong><a href="mailto:">timeBank452196@gmail.com</a></strong></li>
							</ul>
						</section>
					</div>
				</div>
			</div>
			<div id="map"></div>
		</div>

	</div>
	




	<!-- FOOTER -->
	<jsp:include page="commons_layout/commons_footer.jsp" />

</body>
</html>