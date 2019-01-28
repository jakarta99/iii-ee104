<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>       
<div id="mySidenav" class="sidenav">
	<div class="content">
			<a style="padding: 12px 8px 12px 32px;font-size:23px;">會員專區</a>
			<a href="javascript:void(0)" class="closebtn"  onclick="closeNav()" style="font-size: 30px; padding: 0px 0px 8px 32px;color:#818181; ">&times;</a>
	</div>
 	 <div id="memberNav"> 
		<a href="/user/calendar" class="h5">行事曆</a>
		<a href="/user/system-message/list" class="h5">通知</a> 
		<a  href="/user/personal-info/list" class="h5">我的個人資訊</a>
		<div>
			<a data-toggle="collapse" href="#collapseMission" class="h5">志工招募 <i class="fa fa-caret-down"></i></a>
			<div class="collapse"  id="collapseMission" >
				<a href="/user/volunteerRecruitment/list" class="h5" style="color: #5a5959;font-size: 17px;">招募紀錄</a> 
				<a href="/user/missionPublish/add" class="h5" style="color: #5a5959;font-size: 17px;">發佈活動</a> 
			</div>
		</div>
	<sec:authorize access="hasAnyRole('USER')">
		<div>
			<a data-toggle="collapse" href="#collapseVolunteerApply" class="h5">志工申請 <i class="fa fa-caret-down"></i></a>
			<div class="collapse" id="collapseVolunteerApply">
				<a href="javascript:document.location.href='/user/volunteerApplication/applicationPage'" class="h5" style="color: #5a5959;font-size: 17px;">進行中的活動</a> 
				<a href="javascript:document.location.href='/user/volunteerRecord/RecordPage'" class="h5" style="color: #5a5959;font-size: 17px;">服務紀錄</a> 
			</div>
		</div>
	</sec:authorize>
		<a href="/user/transaction-record/list" class="h5">我的交易紀錄</a>
		<a href="/user/myCollection/list" class="h5">我的收藏</a>
		<a href="/user/donation-record/list" class="h5">我的捐款</a>
		</div>
</div>

<span style="font-size:30px;cursor:pointer;" onclick="openNav()" id="sideBarButt">
	<button type="button" style="position:fixed;top:280px;z-index:2;"class="btn btn-primary hidden-xs hidden-sm" > 
	<i class="fa fa-cog fa-2x"></i></button>
</span>

<script>
function openNav() {
	document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}


</script>

