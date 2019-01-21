<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>       

 <header class="nav-holder make-sticky">
        <div id="navbar" role="navigation" class="navbar navbar-expand-lg">
          <div class="container"><a href="/" class="navbar-brand home">
          	<img src="/img/logo.png" alt="Universal logo" class="d-none d-md-inline-block" width="50">
          	<img src="/img/logo-small.png" alt="Universal logo" class="d-inline-block d-md-none"><span class="sr-only">Universal - go to homepage</span></a>
            <button type="button" data-toggle="collapse" data-target="#navigation" class="navbar-toggler btn-template-outlined"><span class="sr-only">Toggle navigation</span><i class="fa fa-align-justify"></i></button>
            <div id="navigation" class="navbar-collapse collapse">
              <ul class="nav navbar-nav ml-auto">
              	<li class="nav-item"><a href="/">&nbsp&nbsp首頁&nbsp&nbsp<b class="caret"></b></a>
                <li class="nav-item"><a href="/commons/organization/list">公益團體 <b class="caret"></b></a>
                </li>
                <li class="nav-item menu-large"><a href="/commons/domesticVolunteer/list" >志工招募<b class="caret"></b></a>
                </li>
<%--                 <sec:authorize access="hasAnyRole('USER','ORG_USER')"> --%>
              	<li class="nav-item dropdown menu-large" ><a href="#" data-toggle="dropdown" data-hover="dropdown" data-delay="200" class="dropdown-toggle" id='userA'>會員專區 <b class="caret"></b></a>
                  <ul class="dropdown-menu megamenu" style="width:450px;">
                    <li>
                      <div class="row">
                        <div class="col-md-6 col-lg-3">
                          <h5><a href="/user/calendar" >行事曆</a></h5>                      
                          <h5><a href="/user/system-message/list" id="systemMessage">通知</a></h5>
                          <h5><a href="/user/chatMessage/oldMessages/all/list" id="chatMessage">我的訊息</a></h5>
                          <h5><a href="/user/personal-info/list" >我的個人資訊</a></h5>                          
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
                         <h5><a href="/user/myCollection/list" >我的最愛</a></h5>
                          <h5><a href="/user/donation-record/list" >我的捐款</a></h5>     
                        </div>
                      </div>
                    </li>
                  </ul>
                </li>
<%--                 </sec:authorize> --%>
                <li class="nav-item menu-large"><a href="/commons/InternationalVolunteer/list" >國際志工專區<b class="caret"></b></a>                        
                 <li class="nav-item dropdown"><a href="javascript: void(0)" data-toggle="dropdown" class="dropdown-toggle">關於我們<b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li class="dropdown-item"><a href="/commons/aboutUs/aboutTimeBank" class="nav-link">關於TimeBank</a></li>
                    <li class="dropdown-item"><a href="/commons/aboutUs/contactUs" class="nav-link">聯絡我們</a></li>
                  </ul>
                </li>

                <!-- ========== admin dropdown ==================-->
               <sec:authorize access="hasRole('ADMIN')">				
                <li class="nav-item dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle">管理者系統 <b class="caret"></b></a>
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
<!--                     <li class="dropdown-item"><a href="/admin/penaltyVertify/tempPenaltyEntrance" class="nav-link" id="backStage-personalinfo">【使用者】模擬提出檢舉(暫放)</a></li> -->
                    <li class="dropdown-item"><a href="/admin/penaltyVertify/showVertifyList" class="nav-link" id="backStage-personalinfo">審核檢舉／申訴案件</a></li>
                    <li class="dropdown-item"><a href="/admin/donation/chart" class="nav-link" id="backStage-personalinfo">捐款統計(測試中)</a></li>
                  </ul>
                </li>
                </sec:authorize>
                <!-- ========== Contact dropdown end ==================-->
              </ul>
            </div>          
          </div>
        </div>
      </header>
 
 <script>
	//登入後，顯示系統訊息未讀數量
	$(document).ready(function(){
		console.log(location.href);
		var href = location.href
		var com = href.indexOf('commons');
		var now = href.substr(com+8, 5);
		console.log(now);
		if(href.length <= 18){
			$("#navbar .navbar-nav > li > a[href='/']")
			.css("background","rgba(19, 181, 177, 0.9)")
			.css("color"," rgba(240, 240, 240)");
		} else if(now == 'organ'){
			$("#navbar .navbar-nav > li > a[href='/commons/organization/list']")
			.css("background","rgba(19, 181, 177, 0.9)")
			.css("color"," rgba(240, 240, 240)");
		} else if(now == 'domes'){
			$("#navbar .navbar-nav > li > a[href='/commons/domesticVolunteer/list']")
			.css("background","rgba(19, 181, 177, 0.9)")
			.css("color"," rgba(240, 240, 240)");
		} else if(now == 'Inter'){
			$("#navbar .navbar-nav > li > a[href='/commons/InternationalVolunteer/list']")
			.css("background","rgba(19, 181, 177, 0.9)")
			.css("color"," rgba(240, 240, 240)");
		} else if(now == 'about'){
			$("#navbar .navbar-nav > li > a[href='javascript: void(0)']")
			.css("background","rgba(19, 181, 177, 0.9)")
			.css("color"," rgba(240, 240, 240)");
		} else {
			$("#userA")
			.css("background","rgba(19, 181, 177, 0.9)")
			.css("color"," rgba(240, 240, 240)");
		}
	})
	
 	if($("#loginName").html() != undefined){ //$("#loginName")來自commons_t0p-bar
 		checkMailBox();
 	}

	
	function checkMailBox(){
		$.ajax({
			type:"get",
			url:"/system-message/countNotReadMessage",
		}).done(function(notReadMsgNum){
			if(notReadMsgNum > 0){
				$("#systemMessage").html("通知<font size='2' color='red'>("+ notReadMsgNum +")</font>")
			}else{
				$("#systemMessage").html("通知")
			}
			
		})
	}
</script>