<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- css -->
<jsp:include page="../commons_layout/commons_css_links.jsp" />
<!-- Javascript files-->
<jsp:include page="../commons_layout/commons_js_links.jsp" />

<style>
.home-carousel .owl-carousel {
	width: 1903px;
	height: 546px;
}

.row {
	margin-left: 0;
	margin-right: 0;
}
</style>

</head>
<body>


	<div id="all">
		<!-- Top bar-->
		<jsp:include page="../commons_layout/commons_top-bar.jsp" />
		<!-- Navbar -->
		<jsp:include page="../commons_layout/commons_nav.jsp" />

		<section>
			<!-- 			style="background: url('https://media.goeco.org/_media/media/422/11924_1903_546.jpg') center center repeat; background-size: cover;" -->
			<!-- 			class="bar background-white relative-positioned"> -->
			<!-- Carousel Start-->
			<div class="home-carousel">
				<div class="dark-mask"></div>
				<div class="homepage owl-carousel" style="padding-top: 0;">
					<div class="item">
						<div class="row">
							<img
								src="https://media.goeco.org/_media/media/422/11924_1903_546.jpg"
								alt="">
							<div class="carousel-caption d-none d-md-block">

								<div class="col-md-8 ">
									<!-- 								<img src="img/template-easy-code.png" alt="" class="img-fluid"> -->
								</div>
								<div class="col-md-4">
									<h1>Easy to customize</h1>
									<ul class="list-unstyled">
										<li>7 preprepared colour variations.</li>
										<li>Easily to change fonts</li>
									</ul>
								</div>
							</div>

						</div>
					</div>
					<div class="item">
						<div class="row">
							<img
								src="https://media.goeco.org/_media/media/422/11945_1903_546.jpg"
								alt="" class="ml-auto">

						</div>
					</div>
					<div class="item">
						<div class="row">
							<img
								src="https://media.goeco.org/_media/media/422/11950_1903_546.jpg"
								alt="" class="ml-auto">

						</div>
					</div>
					<div class="item">
						<div class="row">
							<div class="col-md-7">
								<img src="img/template-easy-code.png" alt="" class="img-fluid">
							</div>
							<div class="col-md-5">
								<h1>Easy to customize</h1>
								<ul class="list-unstyled">
									<li>7 preprepared colour variations.</li>
									<li>Easily to change fonts</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Carousel End-->
		</section>
		<section class="bar background-pentagon no-mb">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<h1>Selection</h1>
						<form action="#" method="post">
							<div class="form-group">
								想去哪裡當志工呢
								<select id="destinationRegion" 
									name="destinationRegion" class="form-control">
									<option>非洲</option>
									<option>亞洲</option>
									<option>中美洲</option>
									<option>歐洲</option>
									<option>南美洲</option>
									<option>北美洲</option>
									
									
								</select>
							</div>
<!-- 							<div class="form-group"> -->
								時間
								<select id="destinationDate" 
									name="destinationDate" class="form-control">
									<option></option>
									
								</select>
<!-- 							</div> -->
							<div class="text-center">
								<button type="submit" class="btn btn-template-outlined">
									<i class="fa fa-search"></i> search
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>


	</div>

	<!-- FOOTER -->
	<%-- 		<jsp:include page="../commons_layout/commons_footer.jsp" /> --%>
	<jsp:include page="../commons_layout/back-to-top_button.jsp" />




</body>
</html>