<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
    
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<a class="navbar-brand" href="#">Navbar</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExampleDefault"
			aria-controls="navbarsExampleDefault" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarsExampleDefault">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="/">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
				<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="http://example.com"
					id="dropdown01" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">TIMEBANK BackStage</a>
					<div class="dropdown-menu" aria-labelledby="dropdown01">
						<a class="dropdown-item" href="/admin/member/list" id="backStage-member">member</a> 
						<a	class="dropdown-item" href="/admin/order/list" id="backStage-order">order</a> 
						<a	class="dropdown-item" href="/admin/donation/list" id="backStage-donation">donation</a>
						<a	class="dropdown-item" href="/admin/mission/list" id="backStage-mission">mission</a>
						<a	class="dropdown-item" href="/admin/time-ledger/list" id="backStage-timeledger">time-ledger</a>
						<a	class="dropdown-item" href="/admin/penalty/list" id="backStage-penalty">penalty</a>
						<a	class="dropdown-item" href="/admin/role/list" id="backStage-role">role</a>	
						<a	class="dropdown-item" href="/admin/securityUser/list" id="backStage-role">securityUser</a>						
					</div></li>
			</ul>
			<a href='<c:url value="/logout"/>' class="nav-link">
	             <i class="fa fa-sign-in"></i>
	             <span class="d-none d-md-inline-block">登出</span>
	        </a>

<!-- 			<form class="form-inline my-2 my-lg-0"> -->
<!-- 				<input class="form-control mr-sm-2" type="text" placeholder="Search" -->
<!-- 					aria-label="Search"> -->
<!-- 				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button> -->
<!-- 			</form> -->
		</div>
	</nav>
