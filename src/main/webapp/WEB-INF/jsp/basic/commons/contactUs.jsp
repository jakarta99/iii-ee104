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
								<h2>We are here to help you <button class="btn btn-primary " id="chatButton" >線上即時客服</button></h2>	
							</div>
							<p class="text-sm">Please feel free to contact us, our
								customer service center is working for you 24/7.</p>
							<div class="heading">
								<h3>Contact form</h3>
							</div>
							<form>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="firstname">Firstname</label> <input
												id="firstname" type="text" class="form-control">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="lastname">Lastname</label> <input id="lastname"
												type="text" class="form-control">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="email">Email</label> <input id="email"
												type="text" class="form-control">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="subject">Subject</label> <input id="subject"
												type="text" class="form-control">
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<label for="message">Message</label>
											<textarea id="message" class="form-control"></textarea>
										</div>
									</div>
									<div class="col-md-12 text-center">
										<button type="submit" class="btn btn-template-outlined">
											<i class="fa fa-envelope-o"></i> Send message
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
								13/25 New Avenue<br>New Heaven<br>45Y 73J<br>England<br>
								<strong>Great Britain</strong>
							</p>
							<h3 class="text-uppercase">電話</h3>
							<p class="text-muted text-sm">This number is toll free if
								calling from Great Britain otherwise we advise you to use the
								electronic form of communication.</p>
							<p>
								<strong>02 2548-9561</strong>
							</p>
							<h3 class="text-uppercase">電子郵件</h3>
							<p class="text-muted text-sm">Please feel free to write an
								email to us or to use our electronic ticketing system.</p>
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