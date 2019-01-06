<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
 <div class="top-bar">
        <div class="container">
          <div class="row d-flex align-items-center">
            <div class="col-md-6 d-md-block d-none">
              <p>志工媒合平台</p>
            </div>
            <div class="col-md-6">
              <div class="d-flex justify-content-md-end justify-content-between">
                <ul class="list-inline contact-info d-block d-md-none">
                  <li class="list-inline-item"><a href="#"><i class="fa fa-phone"></i></a></li>
                  <li class="list-inline-item"><a href="#"><i class="fa fa-envelope"></i></a></li>
                </ul>
                
                <!-- sign in & sign out -->
                <div class="login">       
	               	<sec:authorize  access="!isAuthenticated()">         	
	               	 <a href="/login"  class="login-btn">
	                	<i class="fa fa-sign-in"></i>
	                	<span class="d-none d-md-inline-block">Sign In</span>
	                 </a>
				  	<a href="/commons/sign-up/type" class="signup-btn">
                		<i class="fa fa-user"></i><span class="d-none d-md-inline-block">Sign Up</span>
                	</a>
	                </sec:authorize>	                
					<sec:authorize  access="isAuthenticated()">

						<span class="d-none d-md-inline-block" id="loginName"> 
							Welcome Back, <sec:authentication property="name"/>&nbsp&nbsp&nbsp
						</span>					
						<!-- logout method:get -->
						<a href="/logout" class="logout-btn">
	                		<i class="fa fa-sign-in"></i>
	                		<span class="d-none d-md-inline-block">Sign Out</span>
		                </a>
	        
	                </sec:authorize>
               </div>
                <ul class="social-custom list-inline">
                  <li class="list-inline-item"><a href="#"><i class="fa fa-facebook"></i></a></li>
                  <li class="list-inline-item"><a href="#"><i class="fa fa-google-plus"></i></a></li>
                  <li class="list-inline-item"><a href="#"><i class="fa fa-twitter"></i></a></li>
                  <li class="list-inline-item"><a href="#"><i class="fa fa-envelope"></i></a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>