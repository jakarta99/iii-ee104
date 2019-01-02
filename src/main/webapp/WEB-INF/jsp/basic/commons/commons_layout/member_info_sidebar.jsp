<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="w3-sidebar w3-card-4 w3-animate-left collapse"
	style="width: 300px; height:400px; top: 160px;" id="mySidebar">
	<div class="w3-bar w3-dark-grey">
		<span  class="w3-bar-item" style="padding-top:15px">Content</span>
		<span onclick="w3_close()" class="w3-bar-item w3-button w3-right" 
			title="close Sidebar" style="padding-top:15px;padding-bottom:20px">×</span>
	</div>
	<div class="w3-bar-block">
		<a class="w3-bar-item w3-button" href="javascript:void(0)">行事曆</a>
		<a class="w3-bar-item w3-button" href="javascript:void(0)">系統訊息</a> 
		<a class="w3-bar-item w3-button" href="javascript:void(0)">我的個人資訊</a>
		<div class="w3-dropdown-hover">
			<a class="w3-button" data-toggle="collapse" href="#collapseMission">志工招募 <i class="fa fa-caret-down"></i></a>
			<div class="w3-dropdown-content w3-bar-block w3-card-4 collapse"  id="collapseMission" >
				<a class="w3-bar-item w3-button" href="/user/recruitFinish/list">招募紀錄</a> 
				<a class="w3-bar-item w3-button" href="/user/volunteerRecruitment/add">刊登任務</a> 
			</div>
		</div>
		<div class="w3-dropdown-hover">
			<a class="w3-button" data-toggle="collapse" href="#collapseVolunteerApply">志工申請 <i class="fa fa-caret-down"></i></a>
			<div class="w3-dropdown-content w3-bar-block w3-card-4 collapse" id="collapseVolunteerApply">
				<a class="w3-bar-item w3-button" href="/user/recruitFinish/list">申請中</a> 
				<a class="w3-bar-item w3-button" href="/user/volunteerRecruitment/add">服務紀錄</a> 
			</div>
		</div>
		<a class="w3-bar-item w3-button" href="javascript:void(0)">我的交易紀錄</a>
		<a class="w3-bar-item w3-button" href="javascript:void(0)">我的最愛</a>
		<a class="w3-bar-item w3-button" href="javascript:void(0)">我的捐款</a>
	</div>
</div>


<div id="main" style="margin-left: 0px;">

	<div class="w3-container w3-display-container">
		<button type="button" data-toggle="collapse"  data-target="#mySidebar" id="style-switch-button" class="btn btn-primary hidden-xs hidden-sm collapsed" aria-expanded="false">
			<i class="fa fa-cog fa-2x"></i></button>
<!-- 		<span title="open Sidebar" style="display: inline-block;" id="openNav"  -->
<!-- 			class="w3-button w3-transparent  w3-xlarge" onclick="w3_open()"> -->
<!-- 			<i class="fa fa-cog fa-2x"></i></span> -->
	</div>

</div>


<!-- <script> -->
// 	function w3_open() {
// 		document.getElementById("mySidebar").style.display = "block";
// 	}

// 	function w3_close() {
// 		document.getElementById("mySidebar").style.display = "none";
// 	}
<!-- </script> -->
