<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Timebank</title>
	<!--     css links -->
    <jsp:include page="basic/commons/commons_layout/commons_css_links.jsp"/>
    <!-- Javascript files-->
    <jsp:include page="basic/commons/commons_layout/commons_js_links.jsp"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<style>
		body{
			font-family: 微軟正黑體;
		}
	</style>
  </head>
  <body>
    <div id="all">
      <!-- Top bar-->
      <jsp:include page="basic/commons/commons_layout/commons_top-bar.jsp"/>
 	
	  <!-- Navbar -->
      <jsp:include page="basic/commons/commons_layout/commons_nav.jsp"/>
      
      
      <!-- Carousel Start-->
			<div class="home-carousel">
<!-- 				<div class="dark-mask"></div> -->
				<div class="homepage owl-carousel" style="padding-top: 0;">
					<div class="item">
						<div class="row" style="margin-left: 0;margin-right: 0;">
							<img
								src="../image/indexPicture/indexPic1.jpg"
								alt="" style="max-width: 100%;">

						</div>
					</div>
					<div class="item">
						<div class="row" style="margin-left: 0;margin-right: 0;">
							<img
								src="../image/indexPicture/indexPic2.jpg"
								alt="" class="ml-auto" style="max-width: 100%;">

						</div>
					</div>
					<div class="item">
						<div class="row" style="margin-left: 0;margin-right: 0;">
							<img
								src="../image/indexPicture/indexPic3.jpg"
								alt="" class="ml-auto" style="max-width: 100%;">

						</div>
					</div>

				</div>
			</div>
			<!-- Carousel End-->
		</section>
      
      
      
      
<!--       <section> -->
<!-- <!--       <section style="background: url('img/photogrid.jpg') center center repeat; background-size: cover;" class="bar background-white relative-positioned"> --> 
<!--         <div class="container"> -->
<!--           Carousel Start -->
<!--           <div class="home-carousel"> -->
<!-- <!--             <div class="dark-mask mask-primary"></div> 濾鏡 --> 
<!--             <div class=""></div> -->
<!--             <div class="container"> -->
<!--               <div class="homepage owl-carousel" style="padding-top:0px"> -->
<!--                 <div class="item"> -->
<!--                   <img src="../image/indexPicture/indexPic1.jpg" alt="" class="ml-auto"> -->
<!-- <!--                   <div class="row"> --> 
<!-- <!--                     <div class="col-md-5 text-right"> --> 
<!-- <!--                       <p><img src="img/logo.png" alt="" class="ml-auto"></p> --> 
<!-- <!--                       <h1>Multipurpose responsive theme</h1> --> 
<!-- <!--                       <p>Business. Corporate. Agency.<br>Portfolio. Blog. E-commerce.</p> --> 
<!-- <!--                     </div> --> 
<!-- <!--                     <div class="col-md-7"><img src="img/template-homepage.png" alt="" class="img-fluid"></div> --> 
<!-- <!--                   </div> --> 
<!--                 </div> -->
<!--                 <div class="item"> -->
<!--                 	<img src="../image/indexPicture/indexPic2.jpg" alt="" class="ml-auto"> -->
<!-- <!--                   <div class="row"> --> 
<!-- <!--                     <div class="col-md-7 text-center"><img src="img/template-mac.png" alt="" class="img-fluid"></div> --> 
<!-- <!--                     <div class="col-md-5"> --> 
<!-- <!--                       <h2>46 HTML pages full of features</h2> --> 
<!-- <!--                       <ul class="list-unstyled"> --> 
<!-- <!--                         <li>Sliders and carousels</li> --> 
<!-- <!--                         <li>4 Header variations</li> --> 
<!-- <!--                         <li>Google maps, Forms, Megamenu, CSS3 Animations and much more</li> --> 
<!-- <!--                         <li>+ 11 extra pages showing template features</li> --> 
<!-- <!--                       </ul> --> 
<!-- <!--                     </div> --> 
<!-- <!--                   </div> --> 
<!--                 </div> -->
<!--                 <div class="item"> -->
<!--                 	<img src="../image/indexPicture/indexPic3.jpg" alt="" class="ml-auto"> -->
<!-- <!--                   <div class="row"> --> 
<!-- <!--                     <div class="col-md-5 text-right"> --> 
<!-- <!--                       <h1>Design</h1> --> 
<!-- <!--                       <ul class="list-unstyled"> --> 
<!-- <!--                         <li>Clean and elegant design</li> --> 
<!-- <!--                         <li>Full width and boxed mode</li> --> 
<!-- <!--                         <li>Easily readable Roboto font and awesome icons</li> --> 
<!-- <!--                         <li>7 preprepared colour variations</li> --> 
<!-- <!--                       </ul> --> 
<!-- <!--                     </div> --> 
<!-- <!--                     <div class="col-md-7"><img src="img/template-easy-customize.png" alt="" class="img-fluid"></div> -->
<!-- <!--                   </div> --> 
<!--                 </div> -->
<!--                 <div class="item"> -->
<!--                   <div class="row"> -->
<!--                     <div class="col-md-7"><img src="img/template-easy-code.png" alt="" class="img-fluid"></div> -->
<!--                     <div class="col-md-5"> -->
<!--                       <h1 style="color: black">Easy to customize</h1> -->
<!--                       <ul class="list-unstyled" style="color: black"> -->
<!--                         <li>7 preprepared colour variations.</li> -->
<!--                         <li>Easily to change fonts</li> -->
<!--                       </ul> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--           Carousel End -->
<!--         </div> -->
<!--       </section> -->
      
      
      
      
      
      
      
<!--       <section class="bar background-white"> -->
<!--         <div class="container text-center"> -->
<!--           <div class="row"> -->
<!--             <div class="col-lg-4 col-md-6"> -->
<!--               <div class="box-simple"> -->
<!--                 <div class="icon-outlined"><i class="fa fa-desktop"></i></div> -->
<!--                 <h3 class="h4">Webdesign</h3> -->
<!--                 <p>Fifth abundantly made Give sixth hath. Cattle creature i be don't them behold green moved fowl Moved life us beast good yielding. Have bring.</p> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="col-lg-4 col-md-6"> -->
<!--               <div class="box-simple"> -->
<!--                 <div class="icon-outlined"><i class="fa fa-print"></i></div> -->
<!--                 <h3 class="h4">Print</h3> -->
<!--                 <p>Advantage old had otherwise sincerity dependent additions. It in adapted natural hastily is justice. Six draw you him full not mean evil. Prepare garrets it expense windows shewing do an.</p> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="col-lg-4 col-md-6"> -->
<!--               <div class="box-simple"> -->
<!--                 <div class="icon-outlined"><i class="fa fa-globe"></i></div> -->
<!--                 <h3 class="h4">SEO and SEM</h3> -->
<!--                 <p>Am terminated it excellence invitation projection as. She graceful shy believed distance use nay. Lively is people so basket ladies window expect.</p> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="row"> -->
<!--             <div class="col-lg-4 col-md-6"> -->
<!--               <div class="box-simple"> -->
<!--                 <div class="icon-outlined"><i class="fa fa-lightbulb-o"></i></div> -->
<!--                 <h3 class="h4">Consulting</h3> -->
<!--                 <p>Fifth abundantly made Give sixth hath. Cattle creature i be don't them behold green moved fowl Moved life us beast good yielding. Have bring.</p> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="col-lg-4 col-md-6"> -->
<!--               <div class="box-simple"> -->
<!--                 <div class="icon-outlined"><i class="fa fa-envelope-o"></i></div> -->
<!--                 <h3 class="h4">Email Marketing</h3> -->
<!--                 <p>Advantage old had otherwise sincerity dependent additions. It in adapted natural hastily is justice. Six draw you him full not mean evil. Prepare garrets it expense windows shewing do an.</p> -->
<!--               </div> -->
<!--             </div> -->
<!--             <div class="col-lg-4 col-md-6"> -->
<!--               <div class="box-simple"> -->
<!--                 <div class="icon-outlined"><i class="fa fa-user"></i></div> -->
<!--                 <h3 class="h4">UX</h3> -->
<!--                 <p>Am terminated it excellence invitation projection as. She graceful shy believed distance use nay. Lively is people so basket ladies window expect.</p> -->
<!--               </div> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--       </section> -->
<!--       <section class="bar background-pentagon no-mb text-md-center"> -->
<!--         <div class="container"> -->
<!--           <div class="heading text-center"> -->
<!--             <h2>Testimonials</h2> -->
<!--           </div> -->
<!--           <p class="lead">We have worked with many clients and we always like to hear they come out from the cooperation happy and satisfied. Have a look what our clients said about us.</p> -->
<!--           Carousel Start -->
<!--           <ul class="owl-carousel testimonials list-unstyled equal-height"> -->
<!--             <li class="item"> -->
<!--               <div class="testimonial d-flex flex-wrap"> -->
<!--                 <div class="text"> -->
<!--                   <p>One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections.</p> -->
<!--                 </div> -->
<!--                 <div class="bottom d-flex align-items-center justify-content-between align-self-end"> -->
<!--                   <div class="icon"><i class="fa fa-quote-left"></i></div> -->
<!--                   <div class="testimonial-info d-flex"> -->
<!--                     <div class="title"> -->
<!--                       <h5>John McIntyre</h5> -->
<!--                       <p>CEO, TransTech</p> -->
<!--                     </div> -->
<!--                     <div class="avatar"><img alt="" src="img/person-1.jpg" class="img-fluid"></div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </li> -->
<!--             <li class="item"> -->
<!--               <div class="testimonial d-flex flex-wrap"> -->
<!--                 <div class="text"> -->
<!--                   <p>The bedding was hardly able to cover it and seemed ready to slide off any moment. His many legs, pitifully thin compared with the size of the rest of him, waved about helplessly as he looked. "What's happened to me? " he thought. It wasn't a dream.</p> -->
<!--                 </div> -->
<!--                 <div class="bottom d-flex align-items-center justify-content-between align-self-end"> -->
<!--                   <div class="icon"><i class="fa fa-quote-left"></i></div> -->
<!--                   <div class="testimonial-info d-flex"> -->
<!--                     <div class="title"> -->
<!--                       <h5>John McIntyre</h5> -->
<!--                       <p>CEO, TransTech</p> -->
<!--                     </div> -->
<!--                     <div class="avatar"><img alt="" src="img/person-2.jpg" class="img-fluid"></div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </li> -->
<!--             <li class="item"> -->
<!--               <div class="testimonial d-flex flex-wrap"> -->
<!--                 <div class="text"> -->
<!--                   <p>His room, a proper human room although a little too small, lay peacefully between its four familiar walls.</p> -->
<!--                   <p>A collection of textile samples lay spread out on the table - Samsa was a travelling salesman - and above it there hung a picture that he had recently cut out of an illustrated magazine and housed in a nice, gilded frame.</p> -->
<!--                 </div> -->
<!--                 <div class="bottom d-flex align-items-center justify-content-between align-self-end"> -->
<!--                   <div class="icon"><i class="fa fa-quote-left"></i></div> -->
<!--                   <div class="testimonial-info d-flex"> -->
<!--                     <div class="title"> -->
<!--                       <h5>John McIntyre</h5> -->
<!--                       <p>CEO, TransTech</p> -->
<!--                     </div> -->
<!--                     <div class="avatar"><img alt="" src="img/person-3.png" class="img-fluid"></div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </li> -->
<!--             <li class="item"> -->
<!--               <div class="testimonial d-flex flex-wrap"> -->
<!--                 <div class="text"> -->
<!--                   <p>It showed a lady fitted out with a fur hat and fur boa who sat upright, raising a heavy fur muff that covered the whole of her lower arm towards the viewer. Gregor then turned to look out the window at the dull weather. Drops of rain could be heard hitting the pane, which made him feel quite sad.</p> -->
<!--                 </div> -->
<!--                 <div class="bottom d-flex align-items-center justify-content-between align-self-end"> -->
<!--                   <div class="icon"><i class="fa fa-quote-left"></i></div> -->
<!--                   <div class="testimonial-info d-flex"> -->
<!--                     <div class="title"> -->
<!--                       <h5>John McIntyre</h5> -->
<!--                       <p>CEO, TransTech</p> -->
<!--                     </div> -->
<!--                     <div class="avatar"><img alt="" src="img/person-4.jpg" class="img-fluid"></div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </li> -->
<!--             <li class="item"> -->
<!--               <div class="testimonial d-flex flex-wrap"> -->
<!--                 <div class="text"> -->
<!--                   <p>It showed a lady fitted out with a fur hat and fur boa who sat upright, raising a heavy fur muff that covered the whole of her lower arm towards the viewer. Gregor then turned to look out the window at the dull weather. Drops of rain could be heard hitting the pane, which made him feel quite sad. Gregor then turned to look out the window at the dull weather. Drops of rain could be heard hitting the pane, which made him feel quite sad.</p> -->
<!--                 </div> -->
<!--                 <div class="bottom d-flex align-items-center justify-content-between align-self-end"> -->
<!--                   <div class="icon"><i class="fa fa-quote-left"></i></div> -->
<!--                   <div class="testimonial-info d-flex"> -->
<!--                     <div class="title"> -->
<!--                       <h5>John McIntyre</h5> -->
<!--                       <p>CEO, TransTech</p> -->
<!--                     </div> -->
<!--                     <div class="avatar"><img alt="" src="img/person-1.jpg" class="img-fluid"></div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </div> -->
<!--             </li> -->
<!--           </ul> -->
<!--           Carousel End -->
<!--         </div> -->
<!--       </section> -->
<!--       <section style="background: url(img/fixed-background-2.jpg) center top no-repeat; background-size: cover;" class="bar no-mb color-white text-center bg-fixed relative-positioned"> -->
<!--         <div class="dark-mask"></div> -->
<!--         <div class="container"> -->
<!--           <div class="icon icon-outlined icon-lg"><i class="fa fa-file-code-o"></i></div> -->
<!--           <h3 class="text-uppercase">Do you want to see more?</h3> -->
<!--           <p class="lead">We have prepared for you more than 40 different HTML pages, including 5 variations of homepage.</p> -->
<!--           <p class="text-center"><a href="index2.html" class="btn btn-template-outlined-white btn-lg">See another homepage</a></p> -->
<!--         </div> -->
<!--       </section> -->
      <section class="bg-white bar">
        <div class="container">
          <div class="heading text-center">
            <h2>媒體報導／案例分享</h2>
          </div>
          	<p> 
			台灣預計在 10 年內邁入「超高齡」社會，高齡照護所需投入的時間與金錢，非單一家庭可輕易承擔，時間銀行應運而生，試圖將社會協作的概念整合進「可兌現」的人力資源庫：讓「舉手之勞」成為另類的存款。
			</p>
			<p> 
			時間銀行可以將時間「存」起來，透過「存取」時數和「提領」服務 2 大步驟，個人提供服務後可以將時數紀錄下來，待之後有需要時，再依自身需求請他人提供相同時數的服務。
			</p>
			<p> 
			透過媒體報導與案例分享，讓我們一起了解時間銀行多元面貌。
			</p>
          <div class="row">
            <div class="col-lg-3">
              <div class="home-blog-post">
                <div class="image"><img src="../image/indexPicture/indexPhoto1.jpg" alt="..." class="img-fluid">
                  <div class="overlay d-flex align-items-center justify-content-center"><a href="https://www.cw.com.tw/article/article.action?id=5089573" class="btn btn-template-outlined-white"><i class="fa fa-chain"> </i> Read More</a></div>
                </div>
                <div class="text">
                  <h4><a href="https://www.cw.com.tw/article/article.action?id=5089573">[媒體報導]讓60歲的照顧80歲的，瑞士「時間銀行」怎麼做 </a></h4>
                  <p class="author-category">By <a href="#">天下雜誌</a> ／ <a href="#">緹琪陳雅婷</a></p>
                  <p class="intro">「時間銀行」的概念近期在台灣掀起熱議，政府單位也開始效仿，新北市也提出了當我們老在一起的「佈老時間銀行」到底什麼是時間銀行，做為實驗先驅的瑞士，為什麼評價正面...</p><a href="https://www.cw.com.tw/article/article.action?id=5089573" class="btn btn-template-outlined">Continue Reading</a>
                </div>
              </div>
            </div>
            <div class="col-lg-3">
              <div class="home-blog-post">
                <div class="image"><img src="../image/indexPicture/indexPhoto2.jpg" alt="..." class="img-fluid">
                  <div class="overlay d-flex align-items-center justify-content-center"><a href="https://www.thenewslens.com/article/105057" class="btn btn-template-outlined-white"><i class="fa fa-chain"> </i> Read More</a></div>
                </div>
                <div class="text">
                  <h4><a href="https://www.thenewslens.com/article/105057">[媒體報導]長照時間銀行：用現在照顧別人的1小時，換老後被照顧的1小時</a></h4>
                  <p class="author-category">By <a href="#">關鍵評論</a> ／ <a href="#">鄭貞茂</a></p>
                  <p class="intro">利用時間銀行，人們可以將自己認為多餘的時間貢獻出去，算是共享經濟的始祖之一，也是無現金社會的體現。此外，時間銀行的優點在於不同技能的分享、強化社區的向心力，以及消耗較少的資源等。...</p><a href="https://www.thenewslens.com/article/105057" class="btn btn-template-outlined">Continue Reading</a>
                </div>
              </div>
            </div>
            <div class="col-lg-3">
              <div class="home-blog-post">
                <div class="image"><img src="../image/indexPicture/indexPhoto3.jpg" alt="..." class="img-fluid">
                  <div class="overlay d-flex align-items-center justify-content-center"><a href="http://www.taiwanroot.org/report.php?id=452" class="btn btn-template-outlined-white"><i class="fa fa-chain"> </i> Read More</a></div>
                </div>
                <div class="text">
                  <h4><a href="http://www.taiwanroot.org/report.php?id=452">[志工分享]村民的笑容中 感受真摯的互動</a></h4>
                  <p class="author-category">By <a href="#">簡郁如 護理師</a></p>
                  <p class="intro">這是我第一次參加義診，先前就一直有想當志工的願望，在網路上蒐尋到相關資訊再經歷幾番激烈的搶名額報名後，這次終於能報名上義診團...聽見村民說「上次剪頭髮就是半年前你們來的時候」，才更深刻體會到偏遠地區的資源需求，這也是為什麼要走入偏鄉的其中理由之一...</p><a href="http://www.taiwanroot.org/report.php?id=452" class="btn btn-template-outlined">Continue Reading</a>
                </div>
              </div>
            </div>
            <div class="col-lg-3">
              <div class="home-blog-post">
                <div class="image"><img src="/image/user/mission/beach.jpg" alt="..." class="img-fluid">
                  <div class="overlay d-flex align-items-center justify-content-center"><a href="https://www.sow.org.tw/faq/iccicc" class="btn btn-template-outlined-white"><i class="fa fa-chain"> </i> Read More</a></div>
                </div>
                <div class="text">
                  <h4><a href="https://www.sow.org.tw/faq/iccicc">[機構分享]臺灣國際淨灘行動 </a></h4>
                  <p class="author-category">By <a href="#">荒野保護協會</a></p>
                  <p class="intro">淨灘，不是停止垃圾汙染的終點，卻是每個人親海、愛海與守護海洋的最佳起點。荒野保護協會致力於逐年減少海洋廢棄物的數量，留給子孫可以赤腳奔跑的潔白沙灘、魚群自在優游的透澈藍海。</p><a href="https://www.sow.org.tw/faq/iccicc" class="btn btn-template-outlined">Continue Reading</a>
                </div>
              </div>
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
            <li class="item"><img src="img/customer-1.png" alt="" class="img-fluid"></li>
            <li class="item"><img src="img/customer-2.png" alt="" class="img-fluid"></li>
            <li class="item"><img src="img/customer-3.png" alt="" class="img-fluid"></li>
            <li class="item"><img src="img/customer-4.png" alt="" class="img-fluid"></li>
            <li class="item"><img src="img/customer-5.png" alt="" class="img-fluid"></li>
            <li class="item"><img src="img/customer-6.png" alt="" class="img-fluid"></li>
          </ul>
        </div>
      </section>
      <!-- FOOTER -->
      <jsp:include page="basic/commons/commons_layout/commons_footer.jsp"/>
      <jsp:include page="basic/commons/commons_layout/back-to-top_button.jsp"/>

    </div>
    
    <script>
    	if ('${emailVerify}'== 'Y'){
    		console.log("emailVerify");
    		swal('恭喜你驗證完成', {
		    	icon: "success",
		    })
    	}
    
    
    </script>
    
   
    
  </body>
</html>