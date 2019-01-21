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
         	 <h1 class="h2"  style="margin:auto;color:#fff;font-size:42px;">關於TimeBank</h1>
         </div>
       </div>
    </section> 
    
	<div id="all">
		<div id="content">
			<div class="container">
				<section class="bar">
				<div class="row">
					<div class="col-lg-12">
						<div class="heading">
							<h2>關於TimeBank時間銀行</h2>
						</div>
						<p class="lead">時間就是金錢，錢存在銀行，因應需要隨時提領，以備不時之需。<br>
										時間，也可以存著以後再用嗎？<br>

						TimeBank是一個公益平台。需要志工的公益機構可透過TimeBank刊登志工需求，想為社會貢獻的朋友，也可在TimeBank申請成為志工。透過提供服務，志工可得到志工時數，時數會被保存下來，在未來有需要時，志工即可提領時數換取志工服務。
	
						不論是想要加入志工行列或是需要志工服務，都可以透過'TimeBank這一座愛的橋樑得到所需的服務。
					</p>
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
			</div>
			
		</div>

	</div>



	<!-- FOOTER -->
	<jsp:include page="commons_layout/commons_footer.jsp" />


</body>
</html>