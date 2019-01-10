<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Javascript files-->
<jsp:include page="../../commons/commons_layout/commons_js_links.jsp" />

<!-- data table -->
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="/js/dataTable_full_numbers_no_ellipses.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">  
<script src="https://cdn.datatables.net/buttons/1.5.4/js/dataTables.buttons.min.js"></script>	
<script src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
<!-- 台灣縣市地區選單	 -->
<script src="/js/tw-city-selector.min.js"></script>
<!-- date picker -->
<script type="text/javascript" src="/js/datepicker/moment.min.js"></script>
<script type="text/javascript" src="/js/datepicker/bootstrap-datepicker.js"></script>
<script src="/js/datepicker/bootstrap-datepicker.zh-TW.js"></script>
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" />
	
<jsp:include page="../../commons/commons_layout/commons_css_links.jsp"/>
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
       
		<!--查詢 -->
          <div class="panel panel-default sidebar-menu">
          	<div class="panel-heading">
            	<h2 class="h2 panel-title">志工招募</h2>
            </div>
            <div class="panel-body">
            	<form role="search">
                	<div class="input-group">                                        
                    	<div  role="tw-city-selector"></div>                                       
	                    <div class="form-group">
		                    <select  id="serviceTypeDetail" name="serviceTypeDetail" class="form-control">
								<option value="">服務類型</option>
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
						</div>
					
						<div class="form-group">
							<select  id="termType" name="termType" class="form-control">
								<option value="">長短期</option>
								<option value="L">長期</option>
						        <option value="S">短期</option>
							</select>
						</div>
					
	                    <div class="form-group">
	                    	<input type="text" value="" placeholder="請輸入關鍵字" id="title" name="title" class="form-control">
	                    </div>
                    
	                    <span class="input-group-btn">
	                    
	                    	<input  type="button" value="搜尋" id="searchButt" class="btn btn-outline-primary" >               
	                    </span>
                    </div>
                  </form>
                </div>
              </div>
			<!--志工招募清單 -->
            <div>
              <div id="boxbox" class="row">
               </div>
               
               	 <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                    <ul id ="pagebox" class="pagination pagination-lg">
              		</ul>
                  </nav>
                  
            </div>
          </div>
        </div>
      </div>
<jsp:include page="../../commons/commons_layout/commons_footer.jsp"/>
	<script>
	var length=9;
	var page=0;
	var first;
	var last;
	
	$("#searchButt").click(function(){
		list();
	 		
		})

	function list(){
		$.ajax({
			url:"/commons/domesticVolunteer/query?"+$('form').serialize()+"&page="+page+"&length="+length,
			type: "get",
		    dataType : "json",
	        }).done(function(missions){
	        	$("#boxbox").text("");
	        	$("#pagebox").text("");
	        	var totalElements=missions.totalElements;
	        	var totalPages=missions.totalPages;
	        	first=missions.first;
	        	last=missions.last;
	        	page=missions.number;
	        	$.each(missions.content,function(index, mission){
	        		var box="<div class='col-lg-4 col-md-6'>";
	        		 box+="<div class='home-blog-post'>";
	        		 box+="<div class='image' style='text-align:center'><a href='/commons/domesticVolunteer/apply?missionId="+mission.id+"'><img width='300px' height='230px' src=/image/user/mission/"+mission.missionPicName+" alt='...'></a>";
	        		 box+="</div><div class='text'><h4><a href='/commons/domesticVolunteer/apply?missionId="+mission.id+"'>"+ mission.title + "</a></h4>";
	        		 box+="<p class='author-category'>活動時間:"+new Date(mission.startDate).toLocaleDateString()+"</p>";
	        		 box+="<p class='author-category'>活動地點:"+mission.county+mission.district+"</p>";       	
	        		 box+="<p class='author-category'>發布者:"+mission.member.name+"</p>";       	
	        		 box+="</div></div></div>";   
	        		var boxbox=$("#boxbox").append(box); 
	        	})
	        	$("#pagebox").append("<li class='page-item' id='backli'><a name='backa' class='page-link'>«</a></li><li class='page-item' id='nextli'><a name='nexta' class='page-link'>»</a></li>");
	        	for (var index = 1; index <= totalPages ; index++) {
	        		$("#nextli").before("<li id='page"+index+"' class='page-item'><a name='count' id="+index+" class='page-link'>"+index+"</a></li>")
				}
	        		var pageNo = "#page" + (page+1);
	        		$(pageNo).addClass('page-item active');
	        })
			}

	$(document).ready( function () {		
		new TwCitySelector();	
		list();
		
		$("#pagebox").on("click","li>a[name='backa']", function(){
			if(first == false){
				page = page - 1;
				list();
			}
			 $('body,html').animate({
                 scrollTop: 0 }, 1);
		}) 
		
		$("#pagebox").on("click","li>a[name='nexta']", function(){
				if(last == false){
					page = page + 1;
					list();
				}
				 $('body,html').animate({
	                 scrollTop: 0 }, 1);
		 })

    	$("#pagebox").on("click","li>a[name='count']", function(){			
    		page=$(this).text()-1;
    		list();
    		 $('body,html').animate({
                 scrollTop: 0 }, 1);
    	})
	
	})
	</script>
</body>
</html>