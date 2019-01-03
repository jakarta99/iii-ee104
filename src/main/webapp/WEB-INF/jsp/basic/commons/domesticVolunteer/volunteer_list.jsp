<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- css -->
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp"/>

<!-- Javascript files-->
<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />

<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>


<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">  
				
<!-- 台灣縣市地區選單	 -->
<script src="/js/tw-city-selector.min.js"></script>
<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />

<!-- DateTimePicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/i18n/jquery-ui-timepicker-zh-TW.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.6.3/jquery-ui-timepicker-addon.min.css" rel="stylesheet" />




<meta charset="UTF-8">
<title>mission list(login)</title>
<style>

	 	
        fieldset {
            width: 100%;
            border-radius: 20px;
            padding: 20px;
            margin: 20px;
            border: 3px double #bebebe;
            margin: auto
        }
        .s2{
            text-align: center
        }
        .margintop{
			 margin-top:70px;
		}
		.county,.district {
	  padding: 0.375rem 0.75rem;
	  font-size: 1rem;
	  line-height: 1.5;
	  color: #495057;
	  background-color: #fff;
	  background-image: none;
	  background-clip: padding-box;
	  border: 1px solid #ced4da;
	  border-radius: 0.25rem;
	  transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
	}
 
    </style>
</head>
<body>

 <!-- Top bar-->
      <jsp:include page="../../commons/commons_layout/commons_top-bar.jsp"/>
 	
	  <!-- Navbar -->
      <jsp:include page="../../commons/commons_layout/commons_nav.jsp"/>
       <div id="heading-breadcrumbs" class="border-top-0 border-bottom-0">
        <div class="container">
          <div class="row d-flex align-items-center flex-wrap">
            <div class="col-md-7">
              <h1 class="h2">志工招募</h1>
            </div>
            <div class="col-md-5">
              <ul class="breadcrumb d-flex justify-content-end">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item active">Blog Listing: Small</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div id="content">
        <div class="container">
          <div class="row bar">
          
          
          
          
          <form>
	<fieldset>
		<legend>基本查詢</legend>
			<div class="form-group mx-sm-3 mb-3">
				<div class="form-group mx-sm-3 mb-3">
					<label>縣市:</label> 	
					<div role="tw-city-selector"></div>
				</div>
			<label>會員類型 :</label> 
				<select  id="serviceTypeDetail" name="serviceTypeDetail">
					<option value="">選擇服務類型</option>
					<option value="婦幼關懷">婦幼關懷</option>
			        <option value="身心障礙">身心障礙</option>
			        <option value="老人服務">老人服務</option>
			        <option value="社會服務">社會服務</option>
			        <option value="動物保護">動物保護</option>
			        <option value="國際救援">國際救援</option>
			        <option value="環境保護">環境保護</option>
			        <option value="文教藝術">文教藝術</option>
			        <option value="醫療服務">醫療服務</option>
			        <option value="宗教信仰">宗教信仰</option>
				</select>
				
			<label>長短期 :</label> 
				<select  id="termType" name="termType">
					<option value="">選擇長短期</option>
					<option value="L">長期</option>
			        <option value="S">短期</option>
				</select>
				
				
			<label>開始日期:</label>
			<input type="text"  id="startDate" name="startDate" autocomplete="off"/>
			<label>結束日期:</label>
			<input type="text"  id="endDate" name="endDate" autocomplete="off"/>
			
			
			<input type="button" value="搜尋" id="searchButt" />
			<div>
			
			<a class="btn btn-outline-secondary" data-toggle="collapse" href="#collapse" role="button" aria-expanded="false" aria-controls="collapseExample">
			進階查詢:
  			</a>
  			</div> 
			<div class="collapse" id="collapse">
			
			<label>時數 :</label> 
			<input type="text" value="" placeholder="timeValue" id="timeValue" name="timeValue"/>
			
			<label>活動名稱 :</label> 
			<input type="text" value="" placeholder="title" id="title" name="title"/>
			
			
			<label>missionStatus :</label> 
			<input type="hidden" value="" placeholder="missionstatus" id="missionstatus" name="missionstatus"/>
			
			
			</div>
			</div>
			</fieldset>
		</form>
          
          
                
          
          
            <!-- LEFT COLUMN _________________________________________________________-->
            <div>
              <div id="boxbox" class="row">
<!--                 <div class="col-lg-4 col-md-6"> -->
<!--                   <div class="home-blog-post"> -->
<!--                     <div class="image"><img src="/img/portfolio-4.jpg" alt="..." class="img-fluid"> -->
<!--                       <div class="overlay d-flex align-items-center justify-content-center"><a href="blog-post.html" class="btn btn-template-outlined-white"><i class="fa fa-chain"> </i> Read More</a></div> -->
<!--                     </div> -->
<!--                     <div class="text"> -->
<!--                       <h4><a href="blog-post.html">125542</a></h4> -->
<!--                       <p class="author-category">By <a href="#">John Snow</a> in <a href="blog.html">Webdesign</a></p> -->
<!--                       <p class="intro">Fifth abundantly made Give sixth hath. Cattle creature i be don't them behold green moved fowl Moved life us beast good yielding. Have bring.</p><a href="blog-post.html" class="btn btn-template-outlined">Continue Reading</a> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                  </div> -->
               </div>
               
               
               	 <nav aria-label="Page navigation example">
                      <ul class="pagination pagination-lg">
                        <li class="page-item"><a href="#" class="page-link">«</a></li>
                        <li class="page-item"><a href="#" class="page-link">1</a></li>
                        <li class="page-item"><a href="#" class="page-link">»</a></li>
                      </ul>
                  </nav>
            </div>
          </div>
        </div>
      </div>
     



<jsp:include page="../../commons/commons_layout/commons_footer.jsp"/>
	
	
	
	
	<script>
	$(document).ready( function () {
		
		
		
	
		
	
	$.ajax({
		url:"/commons/domesticVolunteer/query",
		type: "get",
	    dataType : "json",
        }).done(function(missions){
        	console.log(missions.pageable);
        	$.each(missions.content,function(index, mission){
        		var box1="<div class='col-lg-4 col-md-6'>";
        		var box2="<div class='home-blog-post'>";
        		var box3="<div class='image'><img src=../../img/"+mission.missionPicName+" alt='...' class='img-fluid' width='300' height='150'>";
        		var box4="<div class='overlay d-flex align-items-center justify-content-center'><a href='/commons/domesticVolunteer/apply?missionId="+mission.id+"' class='btn btn-template-outlined-white'><i class='fa fa-chain'> </i> Read More</a></div>";
        		var box5="</div><div class='text'><h4><a href='blog-post.html'>"+ mission.title + "</a></h4>";
        		var box6="<p class='author-category'>活動時間:"+new Date(mission.startDate).toLocaleDateString()+"</p>";
        		var box7="<p class='author-category'>活動地點:"+mission.county+mission.district+"</p>";
        		var box8="<p class='intro'>"+mission.discription+"</p><a href='blog-post.html' class='btn btn-template-outlined'>Continue Reading</a>";        	
        		var box9="</div></div></div>";        		
        		var boxbox=$("#boxbox").append([box1+box2+box3+box4+box5+box6+box7+box8+box9]);         		
        		
        	})
        	
        })
	
	})
	</script>




</body>
</html>