<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>       
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的訊息 | TimeBank</title>
<!-- css -->
<%-- <jsp:include page="../../commons/commons_layout/commons_css_links.jsp" /> --%>
<!-- Javascript files-->
<jsp:include page="../admin_layout/admin_css_js_links.jsp" />
<link rel="stylesheet" href="/css/chatAll.css">
<link rel="stylesheet" href="/css/chat.css">
<script>
	var connected=false;
	
	
	$(document).ready(function(){	
		var toAccount = $("#chattedPeopleList > div.item2> div.item2-2 > div:nth-child(1) > div.chat-info> div:nth-child(1)").attr("id");
		console.log("toAccount="+toAccount);			
		if (toAccount != undefined){
			getChatMessages(toAccount);	
			
		}	
		connect();
		$("#chattedPeopleList > div.item2> div.item2-2 > div:nth-child(1)").css("background","#aba8a875");
	})


</script>
</head>
<body>
	<!-- Top bar-->
<%-- 	<jsp:include page="../../commons/commons_layout/commons_top-bar.jsp" /> --%>
	<!-- Navbar -->
<%-- 	<jsp:include page="../../commons/commons_layout/commons_nav.jsp" /> --%>
	
	<sec:authentication property="name" var="userAccount"/>

			
	<div id="all">
		<div id="content" style="border:1px solid gray;	height: 83%; ">
			<div id="chattedPeopleList" >
				<div>
					<div  class="item1">
						<div id="title-box">我的訊息</div>
					</div>
				</div>
				<div class="item2">
					<div class="item2-1">
						<div id="search-box"  ><input type="text" style="width:100%;text-align:center;padding:3px 0px" placeholder="搜尋"/></div>
					</div>
					<div class="item2-2" id="chatMemberBoxList">
						<c:forEach items="${chatObjectsList}" var="chatMember">
							<div class="chatMemberBox" id="chatMemberBox${chatMember.toAccount}">
								<div class="imgToken" >							
									<img src="/image/user/member/${chatMember.toMemberPic}" style="width:50px;border-radius:50px;"/>
								</div>
								<div class="chat-info">
									<div style="display:inline" id="${chatMember.toAccount}">${chatMember.toName}</div>	
									<fmt:formatDate value="${chatMember.time}" pattern="yyyy-MM-dd" var="lastChatTime"/>
									<div style="display:inline; float:right">${lastChatTime}</div>
									<div style="overflow: hidden;padding-right:40px">${chatMember.text}</div>
								</div>									
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div id="chatMessageBoxArea">
<!-- 				<div id="connect"> -->
<!-- 					<div id="chatterName" class="item1"></div> -->
<!-- 					<img style="display:none" /> -->
<!-- 				</div> -->
<!-- 				<div id="box+toAccount" class="box-chatPage"> -->
<!-- 					<p id="response+toAccount"></p>			 -->
<!-- 				</div> -->
<!-- 				<div style="margin: 10px 0px 5px 0px;"> -->
<!-- 					<input type="text"  id="text+toAccount" class="text-chatPage" placeholder="輸入訊息" /> -->
<!-- 					<input type="button" id="sendButton" class="sendButton-chatPage" onclick="sendText()" value="傳送">  -->
<!-- 				</div> -->
			</div>
		</div>
	
	</div>
	
	<!-- chattingBox -->
	<jsp:include page="../../basic/user/chatRoom/webSocketFunctions.jsp"></jsp:include>

	
	<script type="text/javascript">

		//取得與最後聊天對象的所有對話
		function getChatMessages(toAccount) {
			$("#chatMessageBoxArea").html("");
			var chatBox = '<div id="connect'+toAccount+'"><div id="chatterName" class="item1"></div><img style="display:none" /></div>';
			chatBox+='<div id="box'+toAccount+'" class="box-chatPage">';
			chatBox += '<p id="response'+toAccount+'"></p></div>';
			chatBox += '<div style="margin: 10px 0px 5px 0px;">';
			chatBox += '<input type="text"  id="text'+toAccount+'" class="text-chatPage" placeholder="輸入訊息" />';
			chatBox += '<button id="sendButton" class="sendButton-chatPage" onclick="sendText(\''+toAccount+'\')" >傳送</button>';
			chatBox += '</div></div>';
			$("#chatMessageBoxArea").append(chatBox);

			$.ajax({
				url:"/admin/chatMessage/messages/onePerson/query",
				type: "post",
				data: {"toAccount":toAccount, "fromAccount":"${userAccount}"},
			    dataType : "json",	
	        }).done(function(mapObj){
	        	$('#response'+toAccount).html("");    
	        	//從回傳的物件中取得聊天室雙方資訊
	        	toPic=mapObj.toMemberPic;
	        	fromPic=mapObj.fromMemberPic;	        	
	        	fillChatListIntoResponseBox(toAccount,mapObj.toMemberPic, mapObj.chatList);
	        	$("#chatterName").text(mapObj.toMemberName);
	        	$("#connect"+toAccount+" img").attr("src","/image/user/member/"+mapObj.toMemberPic);
		    	$('#box'+toAccount).animate({ scrollTop: $("#response"+toAccount).height() }, 1);    	    	 	
	    	 	$("#text"+toAccount).val("");  	    	
	       });		
		}
		
		
		//搜尋資料庫此使用者是否有新訊息，並改變MemberBox順序
		function changeMemberBoxOrder(){
			$.ajax({
				url:"/admin/chatMessage/messages/all/chatObject",
				dataType:"json",
			}).done(function(data){
				console.log(data)
				$("#chatMemberBoxList").html("");
				$.each(data, function(idx, obj){
					var m = new Date(obj.time);
					var dateTime = m.getFullYear()+"-"+m.getMonth()+"-"+m.getDate();
					var chatMemberBox = '<div class="chatMemberBox" id="chatMemberBox'+obj.toAccount+'">';
					chatMemberBox +='<div class="imgToken" >'; 
					chatMemberBox +='<img src="/image/user/member/'+obj.toMemberPic+'" style="width:50px;border-radius:100px;"/>'; 
					chatMemberBox +='</div><div class="chat-info">'; 
					chatMemberBox +='<div style="display:inline" id="'+obj.toAccount+'">'+obj.toName+'</div>';
					chatMemberBox +='<div style="display:inline; float:right">'+dateTime+'</div>'; 
					chatMemberBox += '<div style="overflow: hidden;padding-right:40px">'+obj.text+'</div>';
					chatMemberBox += '</div></div>';	
					$("#chatMemberBoxList").append(chatMemberBox);					
				})
				$("#chattedPeopleList > div.item2> div.item2-2 > div:nth-child(1)").css("background","#80808075");
			})
		}
		
		
		function sendText(toAccount){
			sendMessage(toAccount,"N")
			if($("#chattedPeopleList > div.item2> div.item2-2 > div:nth-child(1) > div.chat-info> div:nth-child(1)").attr("id") != toAccount){
				//需改變MemberBox順序
				console.log("change box order")
				changeMemberBoxOrder();
				
			}
		}


		
		function showMessageOutput(chatMessage) {	
			console.log(chatMessage)
			var fromAccount = chatMessage.fromAccount;
			console.log("fromAccount="+fromAccount)
			var toMemberPic = $("#connect"+fromAccount +" img").attr("src");
			if (chatMessage.readAlready == "Y"){
				$("#readAlready"+fromAccount).remove();
				$('#response'+fromAccount).append($("<p class='p1-from readAlready' id='readAlready"+fromAccount+"' ><img src='/img/success.png' /></p>"));	 
			} else {
				var toMemberPic = $("#connect"+fromAccount +" img").attr("src");
				console.log("toMemberPic")
				console.log(toMemberPic)
				var m = new Date(chatMessage.time);
				var dateTime = m.getHours() + ":" + m.getUTCMinutes();		
			 	var p = $("<p></p>");
			 	$(p).css("wordWrap","break-word");
			 	var toImg = "<img src='"+ toMemberPic +"' class='userImg' />";
			 	var msgSpan = "<p class='msgSpan'>"+chatMessage.text+"</p>";
			 	var dateTimeSpan ="<p class='dateTimeSpan'>"+dateTime+"</p>"; 	 ;
			 	$(p).addClass("p1-to");
			 	$(p).append(toImg + msgSpan + dateTimeSpan);
				$('#response'+fromAccount).append(p);    	
			}
			$('#box'+fromAccount).animate({ scrollTop: $("#response"+fromAccount).height() }, 1);
			
			//此頁面若是有新訊息，可能需改變MemberBox順序
			changeMemberBoxOrder();
		}
	
		//點擊聊天對象，chatBox內容改變為與新聊天對象的對話
		$(".item2").on("click",".chatMemberBox",function(){
			var toAccount= $(this).find(">:nth-child(2)>:first-child").attr("id");
			getChatMessages(toAccount);
		})
		
		

			
	</script>
	
	

	

</body>
</html>