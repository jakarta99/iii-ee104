<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
    <img id="back-to-top"  class="back-to-top" width="20px" src="/img/up-arrow.png"/>
    <script>
	    $(document).ready(function(){
	        $(window).scroll(function () {
	           if ($(this).scrollTop() > 400) {
	              $('#back-to-top').fadeIn();
	           } else {
	              $('#back-to-top').fadeOut();
	           }
	        });
	           // scroll body to 0px on click
	           $('#back-to-top').click(function () {

	               $('body,html').animate({
	                   scrollTop: 0
	               }, 1000);
	               return false;
	           });
	           
	           

// 	         $('.back-to-top').each(function(){
// 	      		$(this).mouseover(function(){
// 	      		$(this).css({ "background-color":"#BFBFBF" , "color":"white" });  
// 	        	//被mouseover(被滑鼠滑過的.demo) 其css的background-color改為#33648B，文字顏色為#FFFFFF 
// 	       		});
	
// 	        	$(this).mouseout(function(){ 
// 	        	$(this).css({ "background-color":"#E8CE0E" , "color":"white"});            
// 	       	 	//被mouseout(被滑鼠移出的.demo) 其css的background-color無設定，文字顏色為#000000 
// 	         	});
// 	       	}) ;


	    })
    
    </script>