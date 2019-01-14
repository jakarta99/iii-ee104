<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>關於我們 | TimeBank</title>
<!-- css -->
<jsp:include page="commons_layout/commons_css_links.jsp" />
<!-- Javascript files-->
<jsp:include page="commons_layout/commons_js_links.jsp" />
<script>
$(document).ready( function () {	
	$("#heading-breadcrumbs>div>div>div.col-md-7>h1").text("關於TimeBank");	
})	

</script>

</head>
<body>
	<!-- Top bar-->
	<jsp:include page="commons_layout/commons_top-bar.jsp" />
	<!-- Navbar -->
	<jsp:include page="commons_layout/commons_nav.jsp" />
	<!-- heading-breadcrumbs -->
	<jsp:include page="commons_layout/commons_heading_breadcrumbs.jsp" />
	
	<div id="all">
		<div id="content">
			<div class="container">
				<section class="bar">
				<div class="row">
					<div class="col-lg-12">
						<div class="heading">
							<h2>About Universal</h2>
						</div>
						<p class="lead">Pellentesque habitant morbi tristique senectus
							et netus et malesuada fames ac turpis egestas. Vestibulum tortor
							quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec
							eu libero sit amet quam egestas semper. Aenean ultricies mi vitae
							est. Mauris placerat eleifend leo.</p>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-8">
						<div id="accordion" role="tablist">
							<div class="card">
								<div id="headingOne" role="tab" class="card-header">
									<h4 class="mb-0 mt-0">
										<a data-toggle="collapse" href="#collapseOne"
											aria-expanded="true" aria-controls="collapseOne">Accordion
											Item No.1</a>
									</h4>
								</div>
								<div id="collapseOne" role="tabpanel"
									aria-labelledby="headingOne" data-parent="#accordion"
									class="collapse show">
									<div class="card-body">
										<div class="row">
											<div class="col-md-4">
												<img src="img/template-easy-customize.png" alt=""
													class="img-fluid">
											</div>
											<div class="col-md-8">
												<p>One morning, when Gregor Samsa woke from troubled
													dreams, he found himself transformed in his bed into a
													horrible vermin. He lay on his armour-like back, and if he
													lifted his head a little he could see his brown belly,
													slightly domed and divided by arches into stiff sections.</p>
												<p>One morning, when Gregor Samsa woke from troubled
													dreams, he found himself transformed in his bed into a
													horrible vermin. He lay on his armour-like back, and if he
													lifted his head a little he could see his brown belly,
													slightly domed and divided by arches into stiff sections.</p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="card">
								<div id="headingTwo" role="tab" class="card-header">
									<h4 class="mb-0 mt-0">
										<a data-toggle="collapse" href="#collapseTwo"
											aria-expanded="false" aria-controls="collapseTwo"
											class="collapsed">Accordion Item No.2</a>
									</h4>
								</div>
								<div id="collapseTwo" role="tabpanel"
									aria-labelledby="headingTwo" data-parent="#accordion"
									class="collapse">
									<div class="card-body">
										<div class="row">
											<div class="col-md-4">
												<img src="img/template-easy-code.png" alt=""
													class="img-fluid">
											</div>
											<div class="col-md-8">
												<p>It showed a lady fitted out with a fur hat and fur
													boa who sat upright, raising a heavy fur muff that covered
													the whole of her lower arm towards the viewer. Gregor then
													turned to look out the window at the dull weather. Drops of
													rain could be heard hitting the pane, which made him feel
													quite sad.</p>
												<p>It showed a lady fitted out with a fur hat and fur
													boa who sat upright, raising a heavy fur muff that covered
													the whole of her lower arm towards the viewer. Gregor then
													turned to look out the window at the dull weather. Drops of
													rain could be heard hitting the pane, which made him feel
													quite sad.</p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="card">
								<div id="headingThree" role="tab" class="card-header">
									<h4 class="mb-0 mt-0">
										<a data-toggle="collapse" href="#collapseThree"
											aria-expanded="false" aria-controls="collapseThree"
											class="collapsed">Accordion Item No.3 A little too small</a>
									</h4>
								</div>
								<div id="collapseThree" role="tabpanel"
									aria-labelledby="headingThree" data-parent="#accordion"
									class="collapse">
									<div class="card-body">
										<p>His room, a proper human room although a little too
											small, lay peacefully between its four familiar walls.</p>
										<p>A collection of textile samples lay spread out on the
											table - Samsa was a travelling salesman - and above it there
											hung a picture that he had recently cut out of an illustrated
											magazine and housed in a nice, gilded frame.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="video">
							<div class="embed-responsive embed-responsive-4by3">
								<iframe src="//www.youtube.com/embed/upZJpGrppJA"
									class="embed-responsive-item"></iframe>
							</div>
						</div>
					</div>
				</div>
				</section>
				<section class="bar mt-0">
				<div class="row">
					<div class="col-md-4">
						<div class="heading">
							<h2>Our skills</h2>
						</div>
						<div style="height: 20px; border-radius: 0; margin-bottom: 20px;"
							class="progress">
							<div role="progressbar" aria-valuenow="90" aria-valuemin="0"
								aria-valuemax="100" style="width: 90%;"
								class="progress-bar bg-primary">SEO</div>
						</div>
						<div style="height: 20px; border-radius: 0; margin-bottom: 20px;"
							class="progress">
							<div role="progressbar" aria-valuenow="85" aria-valuemin="0"
								aria-valuemax="100" style="width: 85%;"
								class="progress-bar bg-primary">Search Engine Marketing</div>
						</div>
						<div style="height: 20px; border-radius: 0; margin-bottom: 20px;"
							class="progress">
							<div role="progressbar" aria-valuenow="100" aria-valuemin="0"
								aria-valuemax="100" style="width: 100%;"
								class="progress-bar bg-primary">Webdesign</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="heading">
							<h2>Our services</h2>
						</div>
						<ul class="ul-icons list-unstyled">
							<li>
								<div class="icon-filled">
									<i class="fa fa-check"></i>
								</div>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
							</li>
							<li>
								<div class="icon-filled">
									<i class="fa fa-check"></i>
								</div>Aliquam tincidunt mauris eu risus.
							</li>
							<li>
								<div class="icon-filled">
									<i class="fa fa-check"></i>
								</div>Vestibulum auctor dapibus neque.
							</li>
						</ul>
					</div>
					<div class="col-md-4">
						<div class="heading">
							<h2>Our values</h2>
						</div>
						<ul class="ul-icons list-unstyled">
							<li>
								<div class="icon-filled">
									<i class="fa fa-check"></i>
								</div>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
							</li>
							<li>
								<div class="icon-filled">
									<i class="fa fa-check"></i>
								</div>Aliquam tincidunt mauris eu risus.
							</li>
							<li>
								<div class="icon-filled">
									<i class="fa fa-check"></i>
								</div>Vestibulum auctor dapibus neque.
							</li>
						</ul>
					</div>
				</div>
				</section>
			</div>
			<section class="bar background-pentagon no-mb">
			<div class="container">
				<div class="row showcase text-center">
					<div class="col-md-3 col-sm-6">
						<div class="item">
							<div class="icon-outlined icon-sm icon-thin">
								<i class="fa fa-align-justify"></i>
							</div>
							<h4>
								<span class="h1 counter">580</span><br> Websites
							</h4>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="item">
							<div class="icon-outlined icon-sm icon-thin">
								<i class="fa fa-users"></i>
							</div>
							<h4>
								<span class="h1 counter">100</span><br>Satisfied Clients
							</h4>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="item">
							<div class="icon-outlined icon-sm icon-thin">
								<i class="fa fa-copy"></i>
							</div>
							<h4>
								<span class="h1 counter">320</span><br>Projects
							</h4>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="item">
							<div class="icon-outlined icon-sm icon-thin">
								<i class="fa fa-font"></i>
							</div>
							<h4>
								<span class="h1 counter">923</span><br>Magazines and
								Brochures
							</h4>
						</div>
					</div>
				</div>
			</div>
			</section>
			<section class="bar no-mb">
			<div class="container">
				<div class="col-md-12">
					<div class="heading">
						<h2>Meet Our Team</h2>
					</div>
					<div class="row text-center">
						<div class="col-md-3">
							<div data-animate="fadeInUp" class="team-member">
								<div class="image">
									<a href="team-member.html"><img src="img/person-1.jpg"
										alt="" class="img-fluid rounded-circle"></a>
								</div>
								<h3>
									<a href="team-member.html">Han Solo</a>
								</h3>
								<p class="role">Founder</p>
								<ul class="social list-inline">
									<li class="list-inline-item"><a href="#"
										class="external facebook"><i class="fa fa-facebook"></i></a></li>
									<li class="list-inline-item"><a href="#"
										class="external gplus"><i class="fa fa-google-plus"></i></a></li>
									<li class="list-inline-item"><a href="#"
										class="external twitter"><i class="fa fa-twitter"></i></a></li>
									<li class="list-inline-item"><a href="#" class="email"><i
											class="fa fa-envelope"></i></a></li>
								</ul>
								<div class="text">
									<p>Pellentesque habitant morbi tristique senectus et netus
										et malesuada fames ac turpis egestas.</p>
								</div>
							</div>
						</div>
						<!-- /.team-member-->
						<div data-animate="fadeInUp" class="col-md-3">
							<div class="team-member">
								<div class="image">
									<a href="team-member.html"><img src="img/person-2.jpg"
										alt="" class="img-fluid rounded-circle"></a>
								</div>
								<h3>
									<a href="team-member.html">Luke Skywalker</a>
								</h3>
								<p class="role">CTO</p>
								<ul class="social list-inline">
									<li class="list-inline-item"><a href="#"
										class="external facebook"><i class="fa fa-facebook"></i></a></li>
									<li class="list-inline-item"><a href="#"
										class="external gplus"><i class="fa fa-google-plus"></i></a></li>
									<li class="list-inline-item"><a href="#"
										class="external twitter"><i class="fa fa-twitter"></i></a></li>
									<li class="list-inline-item"><a href="#" class="email"><i
											class="fa fa-envelope"></i></a></li>
								</ul>
								<div class="text">
									<p>Pellentesque habitant morbi tristique senectus et netus
										et malesuada fames ac turpis egestas.</p>
								</div>
							</div>
						</div>
						<!-- /.team-member-->
						<div data-animate="fadeInUp" class="col-md-3">
							<div class="team-member">
								<div class="image">
									<a href="team-member.html"><img src="img/person-3.png"
										alt="" class="img-fluid rounded-circle"></a>
								</div>
								<h3>
									<a href="team-member.html">Princess Leia</a>
								</h3>
								<p class="role">Team Leader</p>
								<ul class="social list-inline">
									<li class="list-inline-item"><a href="#"
										class="external facebook"><i class="fa fa-facebook"></i></a></li>
									<li class="list-inline-item"><a href="#"
										class="external gplus"><i class="fa fa-google-plus"></i></a></li>
									<li class="list-inline-item"><a href="#"
										class="external twitter"><i class="fa fa-twitter"></i></a></li>
									<li class="list-inline-item"><a href="#" class="email"><i
											class="fa fa-envelope"></i></a></li>
								</ul>
								<div class="text">
									<p>Pellentesque habitant morbi tristique senectus et netus
										et malesuada fames ac turpis egestas.</p>
								</div>
							</div>
						</div>
						<!-- /.team-member-->
						<div data-animate="fadeInUp" class="col-md-3">
							<div class="team-member">
								<div class="image">
									<a href="team-member.html"><img src="img/person-4.jpg"
										alt="" class="img-fluid rounded-circle"></a>
								</div>
								<h3>
									<a href="team-member.html">Jabba Hut</a>
								</h3>
								<p class="role">Lead Developer</p>
								<ul class="social list-inline">
									<li class="list-inline-item"><a href="#"
										class="external facebook"><i class="fa fa-facebook"></i></a></li>
									<li class="list-inline-item"><a href="#"
										class="external gplus"><i class="fa fa-google-plus"></i></a></li>
									<li class="list-inline-item"><a href="#"
										class="external twitter"><i class="fa fa-twitter"></i></a></li>
									<li class="list-inline-item"><a href="#" class="email"><i
											class="fa fa-envelope"></i></a></li>
								</ul>
								<div class="text">
									<p>Pellentesque habitant morbi tristique senectus et netus
										et malesuada fames ac turpis egestas.</p>
								</div>
							</div>
						</div>
					</div>
					<div class="see-more text-center">
						<a href="portfolio-4.html" class="btn btn-template-outlined">See
							all our team members</a>
					</div>
				</div>
			</div>
			</section>
			<section class="bar bg-gray">
			<div class="container">
				<div class="heading text-center">
					<h2>Our Clients</h2>
				</div>
				<ul class="list-unstyled owl-carousel customers no-mb">
					<li class="item"><img src="img/customer-1.png" alt=""
						class="img-fluid"></li>
					<li class="item"><img src="img/customer-2.png" alt=""
						class="img-fluid"></li>
					<li class="item"><img src="img/customer-3.png" alt=""
						class="img-fluid"></li>
					<li class="item"><img src="img/customer-4.png" alt=""
						class="img-fluid"></li>
					<li class="item"><img src="img/customer-5.png" alt=""
						class="img-fluid"></li>
					<li class="item"><img src="img/customer-6.png" alt=""
						class="img-fluid"></li>
				</ul>
			</div>
			</section>
			<section class="bar background-pentagon mb-0">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="heading text-center">
							<h2>Testimonials</h2>
						</div>
						<p class="lead">We have worked with many clients and we always
							like to hear they come out from the cooperation happy and
							satisfied. Have a look what our clients said about us.</p>
						<!-- Carousel Start-->
						<ul class="owl-carousel testimonials list-unstyled equal-height">
							<li class="item">
								<div class="testimonial d-flex flex-wrap">
									<div class="text">
										<p>One morning, when Gregor Samsa woke from troubled
											dreams, he found himself transformed in his bed into a
											horrible vermin. He lay on his armour-like back, and if he
											lifted his head a little he could see his brown belly,
											slightly domed and divided by arches into stiff sections.</p>
									</div>
									<div
										class="bottom d-flex align-items-center justify-content-between align-self-end">
										<div class="icon">
											<i class="fa fa-quote-left"></i>
										</div>
										<div class="testimonial-info d-flex">
											<div class="title">
												<h5>John McIntyre</h5>
												<p>CEO, TransTech</p>
											</div>
											<div class="avatar">
												<img alt="" src="img/person-1.jpg" class="img-fluid">
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="item">
								<div class="testimonial d-flex flex-wrap">
									<div class="text">
										<p>The bedding was hardly able to cover it and seemed
											ready to slide off any moment. His many legs, pitifully thin
											compared with the size of the rest of him, waved about
											helplessly as he looked. "What's happened to me? " he
											thought. It wasn't a dream.</p>
									</div>
									<div
										class="bottom d-flex align-items-center justify-content-between align-self-end">
										<div class="icon">
											<i class="fa fa-quote-left"></i>
										</div>
										<div class="testimonial-info d-flex">
											<div class="title">
												<h5>John McIntyre</h5>
												<p>CEO, TransTech</p>
											</div>
											<div class="avatar">
												<img alt="" src="img/person-2.jpg" class="img-fluid">
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="item">
								<div class="testimonial d-flex flex-wrap">
									<div class="text">
										<p>His room, a proper human room although a little too
											small, lay peacefully between its four familiar walls.</p>
										<p>A collection of textile samples lay spread out on the
											table - Samsa was a travelling salesman - and above it there
											hung a picture that he had recently cut out of an illustrated
											magazine and housed in a nice, gilded frame.</p>
									</div>
									<div
										class="bottom d-flex align-items-center justify-content-between align-self-end">
										<div class="icon">
											<i class="fa fa-quote-left"></i>
										</div>
										<div class="testimonial-info d-flex">
											<div class="title">
												<h5>John McIntyre</h5>
												<p>CEO, TransTech</p>
											</div>
											<div class="avatar">
												<img alt="" src="img/person-3.png" class="img-fluid">
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="item">
								<div class="testimonial d-flex flex-wrap">
									<div class="text">
										<p>It showed a lady fitted out with a fur hat and fur boa
											who sat upright, raising a heavy fur muff that covered the
											whole of her lower arm towards the viewer. Gregor then turned
											to look out the window at the dull weather. Drops of rain
											could be heard hitting the pane, which made him feel quite
											sad.</p>
									</div>
									<div
										class="bottom d-flex align-items-center justify-content-between align-self-end">
										<div class="icon">
											<i class="fa fa-quote-left"></i>
										</div>
										<div class="testimonial-info d-flex">
											<div class="title">
												<h5>John McIntyre</h5>
												<p>CEO, TransTech</p>
											</div>
											<div class="avatar">
												<img alt="" src="img/person-4.jpg" class="img-fluid">
											</div>
										</div>
									</div>
								</div>
							</li>
							<li class="item">
								<div class="testimonial d-flex flex-wrap">
									<div class="text">
										<p>It showed a lady fitted out with a fur hat and fur boa
											who sat upright, raising a heavy fur muff that covered the
											whole of her lower arm towards the viewer. Gregor then turned
											to look out the window at the dull weather. Drops of rain
											could be heard hitting the pane, which made him feel quite
											sad. Gregor then turned to look out the window at the dull
											weather. Drops of rain could be heard hitting the pane, which
											made him feel quite sad.</p>
									</div>
									<div
										class="bottom d-flex align-items-center justify-content-between align-self-end">
										<div class="icon">
											<i class="fa fa-quote-left"></i>
										</div>
										<div class="testimonial-info d-flex">
											<div class="title">
												<h5>John McIntyre</h5>
												<p>CEO, TransTech</p>
											</div>
											<div class="avatar">
												<img alt="" src="img/person-1.jpg" class="img-fluid">
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
						<!-- Carousel End-->
					</div>
				</div>
			</div>
			</section>
		</div>

	</div>



	<!-- FOOTER -->
	<jsp:include page="commons_layout/commons_footer.jsp" />


</body>
</html>