<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>       

 <header class="nav-holder make-sticky">
        <div id="navbar" role="navigation" class="navbar navbar-expand-lg">
          <div class="container"><a href="/" class="navbar-brand home"><img src="/img/logo.png" alt="Universal logo" class="d-none d-md-inline-block" width="50"><img src="/img/logo-small.png" alt="Universal logo" class="d-inline-block d-md-none"><span class="sr-only">Universal - go to homepage</span></a>
            <button type="button" data-toggle="collapse" data-target="#navigation" class="navbar-toggler btn-template-outlined"><span class="sr-only">Toggle navigation</span><i class="fa fa-align-justify"></i></button>
            <div id="navigation" class="navbar-collapse collapse">
              <ul class="nav navbar-nav ml-auto">
                <li class="nav-item"><a href="/commons/organization/list">公益團體 <b class="caret"></b></a>
                </li>
                <li class="nav-item menu-large"><a href="/commons/domesticVolunteer/list" >志工招募<b class="caret"></b></a>
                </li>
                <sec:authorize access="hasAnyRole('USER','ORG_USER')">
              	<li class="nav-item dropdown menu-large" ><a href="#" data-toggle="dropdown" data-hover="dropdown" data-delay="200" class="dropdown-toggle">會員專區 <b class="caret"></b></a>
                  <ul class="dropdown-menu megamenu" style="width:450px;">
                    <li>
                      <div class="row">
                        <div class="col-md-6 col-lg-3">
                           <h5><a href="/user/calendar" >行事曆</a></h5>                      
                          <h5><a href="/system-message/list" id="systemMessage">系統訊息</a></h5>
                          <h5><a href="/user/personal-info/edit" >我的個人資訊</a></h5>                          
                        </div>
                        <div class="col-md-6 col-lg-3">
                          <h5><a href="#" >志工招募</a></h5>
                          <ul class="list-unstyled mb-3">
                            <li class="nav-item"><a href="/user/volunteerRecruitment/list" class="nav-link">招募紀錄</a></li>
                            <li class="nav-item"><a href="/user/missionPublish/add" class="nav-link">刊登任務</a></li>                      
                          </ul>
	                         <h5><a href="#">志工申請</a></h5>
	                          <ul class="list-unstyled mb-3">
	                            <li class="nav-item"><a href="javascript:document.location.href='/user/volunteerApplication/applicationPage'" class="nav-link">申請中</a></li>
	                            <li class="nav-item"><a href="javascript:document.location.href='/user/volunteerRecord/RecordPage'" class="nav-link">服務紀錄</a></li>                          
	                          </ul>
                        </div>
                        <div class="col-md-6 col-lg-3">
                         <h5><a href="/user/transaction-record/list" >我的交易紀錄</a></h5>
                         <h5><a href="#" >我的最愛</a></h5>
                          <h5><a href="/user/donation-record/list" >我的捐款</a></h5>     
                        </div>
                      </div>
                    </li>
                  </ul>
                </li>
                </sec:authorize>
                <li class="nav-item menu-large"><a href="/commons/InternationalVolunteer/list" >國際志工專區<b class="caret"></b></a>                        
                <!-- ========== FULL WIDTH MEGAMENU ==================-->
                <li class="nav-item dropdown menu-large"><a href="#" data-toggle="dropdown" data-hover="dropdown" data-delay="200" class="dropdown-toggle">關於我們 <b class="caret"></b></a>
                  <ul class="dropdown-menu megamenu">
                    <li>
                      <div class="row">
                        <div class="col-md-6 col-lg-3">
                          <h5>Home</h5>
<!--                           <ul class="list-unstyled mb-3"> -->
<!--                             <li class="nav-item"><a href="/" class="nav-link">Option 1: Default Page</a></li> -->
<!--                             <li class="nav-item"><a href="index2.html" class="nav-link">Option 2: Application</a></li> -->
<!--                             <li class="nav-item"><a href="index3.html" class="nav-link">Option 3: Startup</a></li> -->
<!--                             <li class="nav-item"><a href="index4.html" class="nav-link">Option 4: Agency</a></li> -->
<!--                             <li class="nav-item"><a href="index5.html" class="nav-link">Option 5: Portfolio</a></li> -->
<!--                           </ul> -->
                          <h5>About</h5>
<!--                           <ul class="list-unstyled mb-3"> -->
<!--                             <li class="nav-item"><a href="about.html" class="nav-link">About us</a></li> -->
<!--                             <li class="nav-item"><a href="team.html" class="nav-link">Our team</a></li> -->
<!--                             <li class="nav-item"><a href="team-member.html" class="nav-link">Team member</a></li> -->
<!--                             <li class="nav-item"><a href="services.html" class="nav-link">Services</a></li> -->
<!--                           </ul> -->
                          <h5>Marketing</h5>
                          <ul class="list-unstyled mb-3">
                            <li class="nav-item"><a href="packages.html" class="nav-link">Packages</a></li>
                          </ul>
                        </div>
                        <div class="col-md-6 col-lg-3">
                          <h5>Portfolio</h5>
                          <ul class="list-unstyled mb-3">
                            <li class="nav-item"><a href="portfolio-2.html" class="nav-link">2 columns</a></li>
                            <li class="nav-item"><a href="portfolio-no-space-2.html" class="nav-link">2 columns with negative space</a></li>
                            <li class="nav-item"><a href="portfolio-3.html" class="nav-link">3 columns</a></li>
                            <li class="nav-item"><a href="portfolio-no-space-3.html" class="nav-link">3 columns with negative space</a></li>
                            <li class="nav-item"><a href="portfolio-4.html" class="nav-link">4 columns</a></li>
                            <li class="nav-item"><a href="portfolio-no-space-4.html" class="nav-link">4 columns with negative space</a></li>
                            <li class="nav-item"><a href="portfolio-detail.html" class="nav-link">Portfolio - detail</a></li>
                            <li class="nav-item"><a href="portfolio-detail-2.html" class="nav-link">Portfolio - detail 2</a></li>
                          </ul>
                          <h5>User pages</h5>
                          <ul class="list-unstyled mb-3">
                            <li class="nav-item"><a href="customer-register.html" class="nav-link">Register / login</a></li>
                            <li class="nav-item"><a href="customer-orders.html" class="nav-link">Orders history</a></li>
                            <li class="nav-item"><a href="customer-order.html" class="nav-link">Order history detail</a></li>
                            <li class="nav-item"><a href="customer-wishlist.html" class="nav-link">Wishlist</a></li>
                            <li class="nav-item"><a href="customer-account.html" class="nav-link">Customer account / change password</a></li>
                          </ul>
                        </div>
                        <div class="col-md-6 col-lg-3">
                          <h5>Shop</h5>
                          <ul class="list-unstyled mb-3">
                            <li class="nav-item"><a href="shop-category.html" class="nav-link">Category - sidebar right</a></li>
                            <li class="nav-item"><a href="shop-category-left.html" class="nav-link">Category - sidebar left</a></li>
                            <li class="nav-item"><a href="shop-category-full.html" class="nav-link">Category - full width</a></li>
                            <li class="nav-item"><a href="shop-detail.html" class="nav-link">Product detail</a></li>
                          </ul>
                          <h5>Shop - order process</h5>
                          <ul class="list-unstyled mb-3">
                            <li class="nav-item"><a href="shop-basket.html" class="nav-link">Shopping cart</a></li>
                            <li class="nav-item"><a href="shop-checkout1.html" class="nav-link">Checkout - step 1</a></li>
                            <li class="nav-item"><a href="shop-checkout2.html" class="nav-link">Checkout - step 2</a></li>
                            <li class="nav-item"><a href="shop-checkout3.html" class="nav-link">Checkout - step 3</a></li>
                            <li class="nav-item"><a href="shop-checkout4.html" class="nav-link">Checkout - step 4</a></li>
                          </ul>
                        </div>
                        <div class="col-md-6 col-lg-3">
                          <h5>Contact</h5>
                          <ul class="list-unstyled mb-3">
                            <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
                            <li class="nav-item"><a href="contact2.html" class="nav-link">Contact - version 2</a></li>
                            <li class="nav-item"><a href="contact3.html" class="nav-link">Contact - version 3</a></li>
                          </ul>
                          <h5>Pages</h5>
                          <ul class="list-unstyled mb-3">
                            <li class="nav-item"><a href="text.html" class="nav-link">Text page</a></li>
                            <li class="nav-item"><a href="text-left.html" class="nav-link">Text page - left sidebar</a></li>
                            <li class="nav-item"><a href="text-full.html" class="nav-link">Text page - full width</a></li>
                            <li class="nav-item"><a href="faq.html" class="nav-link">FAQ</a></li>
                            <li class="nav-item"><a href="404.html" class="nav-link">404 page</a></li>
                          </ul>
                          <h5>Blog</h5>
                          <ul class="list-unstyled mb-3">
                            <li class="nav-item"><a href="blog.html" class="nav-link">Blog listing big</a></li>
                            <li class="nav-item"><a href="blog-medium.html" class="nav-link">Blog listing medium</a></li>
                            <li class="nav-item"><a href="blog-small.html" class="nav-link">Blog listing small</a></li>
                            <li class="nav-item"><a href="blog-post.html" class="nav-link">Blog Post</a></li>
                          </ul>
                        </div>
                      </div>
                    </li>
                  </ul>
                </li>
<!--                  <li class="nav-item dropdown active"><a href="javascript: void(0)" data-toggle="dropdown" class="dropdown-toggle">常見問題<b class="caret"></b></a> -->
<!--                   <ul class="dropdown-menu"> -->
<!--                     <li class="dropdown-item"><a href="/" class="nav-link">Option 1: Default Page</a></li> -->
<!--                     <li class="dropdown-item"><a href="index2.html" class="nav-link">Option 2: Application</a></li> -->
<!--                     <li class="dropdown-item"><a href="index3.html" class="nav-link">Option 3: Startup</a></li> -->
<!--                     <li class="dropdown-item"><a href="index4.html" class="nav-link">Option 4: Agency</a></li> -->
<!--                     <li class="dropdown-item"><a href="index5.html" class="nav-link">Option 5: Portfolio</a></li> -->
<!--                   </ul> -->
<!--                 </li> -->
                <!-- ========== FULL WIDTH MEGAMENU END ==================-->				
                <!-- ========== admin dropdown ==================-->
                <sec:authorize access="hasRole('ADMIN')">
    
				
                <li class="nav-item dropdown"><a href="javascript: void(0)" data-toggle="dropdown" class="dropdown-toggle">管理者系統 <b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li class="dropdown-item"><a href="/admin/member/list" class="nav-link" id="backStage-member">member</a> </li>
                    <li class="dropdown-item"><a href="/admin/order/list" class="nav-link" id="backStage-order">order</a> </li>
                    <li class="dropdown-item"><a href="/admin/donation/list" class="nav-link" id="backStage-donation">donation</a></li>
                    <li class="dropdown-item"><a href="/admin/request/list" class="nav-link" id="backStage-request">request</a></li>
                    <li class="dropdown-item"><a href="/admin/time-ledger/list" class="nav-link" id="backStage-timeledger">time-ledger</a></li>
                    <li class="dropdown-item"><a href="/admin/penalty/list" class="nav-link" id="backStage-penalty">penalty</a></li>
                    <li class="dropdown-item"><a href="/admin/mission/list" class="nav-link" id="backStage-penalty">mission</a></li>
                    <li class="dropdown-item"><a href="/admin/role/list" class="nav-link" id="backStage-role">role</a></li>
                    <li class="dropdown-item"><a href="/admin/serviceType/list" class="nav-link" id="backStage-role">serviceType</a></li>
                    <li class="dropdown-item"><a href="/admin/penaltyVertify/tempPenaltyEntrance" class="nav-link" id="backStage-personalinfo">【使用者】模擬提出檢舉(暫放)</a></li>
                    <li class="dropdown-item"><a href="/admin/penaltyVertify/showVertifyList" class="nav-link" id="backStage-personalinfo">【管理者】檢舉案件審核</a></li>
                  </ul>
                </li>
                </sec:authorize>
                <!-- ========== Contact dropdown end ==================-->
              </ul>
            </div>
            <div id="search" class="collapse clearfix">
              <form role="search" class="navbar-form">
                <div class="input-group">
                  <input type="text" placeholder="Search" class="form-control"><span class="input-group-btn">
                    <button type="submit" class="btn btn-template-main"><i class="fa fa-search"></i></button></span>
                </div>
              </form>
            </div>
          </div>
        </div>
      </header>
 
 <script>
	//登入後，顯示系統訊息未讀數量
 	if($("#loginName").html() != undefined){ //$("#loginName")來自commons_t0p-bar
 		checkMailBox();
 	}
	
	
	function checkMailBox(){
		$.ajax({
			type:"get",
			url:"/system-message/countNotReadMessage",
		}).done(function(notReadMsgNum){
			if(notReadMsgNum > 0){
				$("#systemMessage").html("系統訊息<font size='2' color='red'>("+ notReadMsgNum +")</font>")
			}else{
				$("#systemMessage").html("系統訊息")
			}
			
		})
	}
</script>