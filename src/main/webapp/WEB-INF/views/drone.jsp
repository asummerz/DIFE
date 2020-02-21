<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, , minimum-scale=1, maximum-scale=1">
<title>DIFE.com</title>
<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<!-- fadeIn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<!-- 기본 링크 -->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/drone/drone.css">
<!-- 제이쿼리 플러그인 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="css/datepicker/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="js/datepicker/datepicker.js"></script>
<!-- Include language -->
<script src="js/datepicker/i18n/datepicker-ko.js"></script>
<!-- fontawesome -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript">
$(function() {
	//로그인 로그아웃 전환
	var mem_id = "${mem_id}";
	if(mem_id != '' && mem_id != null){
		$("#sign").attr("href","logout").html("LOGOUT");
		$("#mypage").show();
	}

	if(mem_id == '' || mem_id == null){
		$("#sign").attr("href","signIn").html("LOGIN");
		$("#mypage").hide();
	}
	
	//마이페이지 이동
	$("#mypage").click(function(){
		console.log("클릭");
		//var mem_id = "${mem_id}";
		if(mem_id == null || mem_id == ''){
			alert("로그인을 해주세요.");
			location.href="signIn";
		}else{
			$("#mypage").attr("href","mypage_orders");
		}
	})
		var series_arr = [
			'선택','MAVIC','PHANTOM','SPARK','INSPIRE','BEBOP','PETRONE','DRONE FIGHTER','MATRICE'
		];
		var price_arr = [
			/* '10만원 이하','10만원 ~ 20만원','20만원 이상' */
			'선택','1000원이하','1000원~2000원','2000원 이상'
		];
		// 시리즈명
		$.each(series_arr, function(idx, ser){
			var search_droSer = $("<option></option>").attr({"id":"hover_dro_01", "name":"hover_dro_01", "value":series_arr[idx], "idx":idx}).addClass("hover-dro").html(series_arr[idx]);
			var icon = $("<i></i>").addClass("fas fa-angle-right");
			$(search_droSer).append(icon);
			$("#sub-menu-s").append(search_droSer);
		})
		// 가격
		$.each(price_arr, function(idx, prc){
			var search_droPrc = $("<option></option>").attr({"id":"hover_dro_02", "name":"hover_dro_02", "value":idx, "idx":idx}).html(price_arr[idx]).addClass("hover-dro").html(price_arr[idx]);
			var icon = $("<i></i>").addClass("fas fa-angle-right");
			$(search_droPrc).append(icon);
			$("#sub-menu-p").append(search_droPrc);
		})
	
	
	var search = "";
		var pageNUM = 1;
		var isEnd = false;
	/* 검색 카테고리 활성화 */	
	function sel_dro(search){
		search = {"price":$("#sub-menu-p").val(), "series":$("#sub-menu-s").val(), "pageNUM":pageNUM};
	$.ajax({url:"/droAll",
		data:search,
		dataType: "json",
		contentType:"application/json;charset=UTF-8",
		success:function(data){
		var len = data.length;
		//셀렉된 데이터의 길이가 5보다 작으면 무한스크롤을 정지시킨다.
		if(len < 8){
			isEnd = true;
		}else{
			isEnd = false;
		}
		var date = $(".datepicker-here").val();
		var array = date.split(" - ");
		var con_start = array[0];
		var con_end = array[1];
		
		var dro_list = eval(data);
		$.each(dro_list, function(idx, item){
     		var div = $("<div></div>").addClass("item");
			var fname = $("<img/>").attr({"src":"img/drone/"+item.dro_photo, width:"300", height:"450"});
			var dro_info = $("<p></p>").html(item.dro_info);
			var dro_price = $("<p></p>").html(item.dro_price);
			var dro_series = $("<h2></h2>").html(item.dro_series);
     		var block = $("<div></div>").addClass("block");
     		var figure = $("<figure></figure>").addClass("block").attr("id", "block");
     		var figcaption = $("<figcaption></figcaption>");
			var dro_photo = $("<img/>").attr({"alt":item.dro_name, "src":"img/drone/"+item.dro_photo, width:"300", height:"450"}).addClass("dro-list-img");
			var won = $("<i></i>").html(" / ").addClass("fas fa-won-sign");
			var line = $("<span></span>").html(" / ");
			var won = $("<i></i>").attr({"font-size":"20px"}).addClass("fas fa-won-sign");
			var dro_price = $("<span></span>").html(item.dro_price);
			var dro_info = $("<p></p>").addClass("dro-list-info").attr("id","dro_info").html(item.dro_info);
			var heading = $("<div></div>").addClass("heading");
			var dro_series = $("<span></span>").addClass("dro-list-series").attr("id","dro_series").html(item.dro_series);
			var md = $("<div></div>").attr("id","dro-md").html(item.dro_series_md);
			var h2 = $("<h2></h2>").append(dro_series, md);
			var a = $("<a></a>").attr("href","droneDetail?dro_no="+item.dro_no);
			
			$(heading).append(h2);
			$(dro_info).append(won, dro_price);
			$(figcaption).append(dro_info, heading);
			$(figure).append(dro_photo, figcaption, a);
			$(block).append(figure);

			$("#drone-grid").append(block);
		})
			
	}})
}
	// 캘린더
	// 오늘날짜 구하기
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	var day = date.getDate();
	
	if((day+"").length < 2){
		day = "0"+day;
	}
	var getToday = year+"/"+month+"/"+day;
	/* ajax end */
	sel_dro(search)
		//무한스크롤
		$(window).scroll(function(){
			var maxHeight = $(document).height();
			var currentScroll = $(window).scrollTop() + $(window).height();
			
			if(currentScroll+50 > maxHeight){
				if(isEnd == true){
		    		return;
		    	}else{
		    		pageNUM++;
		    		sel_dro(search);
		    	}
			}
		})
		//버튼 search
		$("#btnSch").click(function(){
			//datepicker값 가져오기
			var date = $(".datepicker-here").val();
			var array = date.split(" - ");
			var con_start = array[0];
			var con_end = array[1];
			console.log(search);
			$("#drone-grid").empty();
    		pageNUM = 1;
    		sel_dro(search);
    		//페이지가 다시 로딩되는 것을 방지한다.
    		return false;
			
			if (date == null || date == "") {
				alert("날짜를 선택해주세요.");
			}
			else{
				if(getToday > con_start){
					alert("지난 날짜입니다.\n다시 선택해주세요.");
					$(".datepicker-here").val("");
				}
			}
		})
	    /* 챗봇형식으로 상품비교 */
	    $(function() {
	  		var INDEX = 0; "C:/Users/choi/Desktop/Microsoft Edge.lnk"
	  		$("#chat-submit").click(function(e) {
			    e.preventDefault();
			    var msg = $("#chat-input").val(); 
			    if(msg.trim() == ''){
			      return false;
		    }
	    	generate_message(msg, 'self');
	    	var buttons = [
		        {
		          name: 'Existing User',
		          value: 'existing'
		        },
		        {
		          name: 'New User',
		          value: 'new'
		        }
	      	];
	    	setTimeout(function() {      
	      		generate_message(msg, 'user');  
	    		}, 1000)
	  		})
	  
	  		function generate_message(msg, type) {
			    INDEX++;
			    var str="";
			    str += "<div id='cm-msg-"+INDEX+"' class=\"chat-msg "+type+"\">";
			    str += "          <span class=\"msg-avatar\">";
			    //str += "            <img src=\"https:\/\/image.crisp.im\/avatar\/operator\/196af8cc-f6ad-4ef7-afd1-c45d5231387c\/240\/?1483361727745\">";
			    str += "          <\/span>";
			    str += "          <div class=\"cm-msg-text\">";
			    str += msg;
			    str += "          <\/div>";
			    str += "        <\/div>";
			    $(".chat-logs").append(str);
			    $("#cm-msg-"+INDEX).hide().fadeIn(300);
			    if(type == 'self'){
			     	$("#chat-input").val(''); 
			    }    
	    		$(".chat-logs").stop().animate({ scrollTop: $(".chat-logs")[0].scrollHeight}, 1000);    
			}  
	  
	  		function generate_button_message(msg, buttons){    
		    /* Buttons should be object array 
		      [
		        {
		          name: 'Existing User',
		          value: 'existing'
		        },
		        {
		          name: 'New User',
		          value: 'new'
		        }
		      ]
		    */
		    INDEX++;
		    var btn_obj = buttons.map(function(button) {
		       return  "              <li class=\"button\"><a href=\"javascript:;\" class=\"btn btn-primary chat-btn\" chat-value=\""+button.value+"\">"+button.name+"<\/a><\/li>";
		    }).join('');
		    var str="";
		    str += "<div id='cm-msg-"+INDEX+"' class=\"chat-msg user\">";
		    str += "          <span class=\"msg-avatar\">";
		    //str += "            <img src=\"https:\/\/image.crisp.im\/avatar\/operator\/196af8cc-f6ad-4ef7-afd1-c45d5231387c\/240\/?1483361727745\">";
		    str += "          <\/span>";
		    str += "          <div class=\"cm-msg-text\">";
		    str += msg;
		    str += "          <\/div>";
		    str += "          <div class=\"cm-msg-button\">";
		    str += "            <ul>";   
		    str += btn_obj;
		    str += "            <\/ul>";
		    str += "          <\/div>";
		    str += "        <\/div>";
		    $(".chat-logs").append(str);
		    $("#cm-msg-"+INDEX).hide().fadeIn(300);   
		    $(".chat-logs").stop().animate({ scrollTop: $(".chat-logs")[0].scrollHeight}, 1000);
		    $("#chat-input").attr("disabled", true);
		  }
	  
		  $(document).delegate(".chat-btn", "click", function() {
		    var value = $(this).attr("chat-value");
		    var name = $(this).html();
		    $("#chat-input").attr("disabled", false);
		    generate_message(name, 'self');
		  })
	  
		  $("#chat-circle").click(function() {    
		    $("#chat-circle").toggle('scale');
		    $(".chat-box").toggle('scale');
		  })
		  
		  $(".chat-box-toggle").click(function() {
		    $("#chat-circle").toggle('scale');
		    $(".chat-box").toggle('scale');
		  })
		})

		/* 검색 고정 */
		$("#datepicker").val($("#hidden-datepicker").val());
		$("#sub-menu").val($("#hidden-series").val());
		$("#sub_price").val($("#hidden-price").val());
	})
</script>
</head>
<body>
    <div id="wrap" class="animated fadeIn">
       <!-- header -->
        <div id="header">
        	<!-- header-top -->
            <div id="header-top">
               <div id="category">
                    <span id="category-1" class="animated fadeInUp">
                        <a href="main"><img src="img/logo/DIFE_logo3.png" id="logo"></a>
                        <a href="drone" class="cl-effect-1">드론</a>
                        <a href="pilot" class="cl-effect-1">파일럿</a>
                        <a href="location" class="cl-effect-1">비행정보</a>
                        <a href="support" class="cl-effect-1">고객지원</a>
                        <a href="board" class="cl-effect-1">커뮤니티</a>
                    </span>
                     <span id="category-2" class="animated fadeInUp">
                        <a id="sign" class="cl-effect-1"></a>
                        <a class="cl-effect-1" id="mypage">MYPAGE</a>
                        <a href="basket" class="cl-effect-1"><i class="fas fa-shopping-basket"></i></a>
                   </span>
                </div>
            </div>
            <!-- header-top end -->
            
	        <!-- header-nav -->
	        <div id="header-nav">
	            <ul name="search" class="search">	            
                    <div class="block">
                        <div id="calendar" name="calendar">대여일
                          	 <i class="far fa-calendar-check"></i>&nbsp;&nbsp;
                             <input type="text" data-range="true" data-multiple-dates-separator=" - " data-language="ko" class="datepicker-here"
                              placeholder="대여일, 반납일을 선택하세요." name="datepicker" id="datepicker" style="width:250px; height: 30px;"/>
                        </div>
                    </div>                      	
                    <!-- 제이쿼리 사용 -->
                    <form action="drone" id="drone-nav">
	                   	<span id="dro-search">
	                    	<span id="series" name="series" class="search1">시리즈명<i class="fas fa-plane"></i>
	                        	<select name="sub_series_01" id="sub-menu-s">
	                        	</select>
	                            <!-- <ul name="sub_series_01" id="sub-menu"></ul> -->
	                    	</span>
	                    </span>
	                    <!-- 제이쿼리 사용 -->
	                    <span id="dro-search">
	                        <span id="price" name="price" class="search1">가격<i class="fas fa-tags"></i>
	                            <select name="sub_series_02" id="sub-menu-p">
	                        	</select>
	                            <!-- <ul name="sub_price" id="sub_price"></ul> -->
	                        </span>
	                    </span>
                    </form>
                    <!-- 검색버튼 -->
                    <button id="btnSch">검색</button>
                </ul>
        	</div>
        	<!-- //header-nav -->
        </div>
        <!-- //header -->
          
        <!-- contents -->
        <div id="contents">
        	<!-- container -->
        	<div class="container">
				<div id="drone-grid">
					<!-- 드론 정렬 
					<c:forEach var="d" items="${list }">
	                <div class="block">
                        <figure id="block" class="block">
                            <img id="dro_photo" class="dro-list-img" src="img/drone/${d.dro_photo }" alt="${d.dro_name }"/>
                              <figcaption>
                              <p id="dro_info" class="dro-list-info">${d.dro_info }<span> / ${d.dro_price }<i class="fas fa-won-sign"></i></span></p>          
                                <div class="heading">
                                  <h2><span id="dro_series" class="dro-list-series">${d.dro_series }</span>
                                  <p id="dro-md">${d.dro_series_md }</p>
                                  </h2>
                                </div>
                              </figcaption>
                              <a href="droneDetail?dro_no=${d.dro_no }"></a>                           
                        </figure> 
	                </div>
	                </c:forEach>
	                -->
	              </div>
			</div>
            <!-- //container -->
		</div>
		<!-- //contents -->
		
		<!-- footer -->
		<div id="footer">
			<!-- footer-nav -->
			<div id="footer-nav">
				<!-- compareChatDrone -->
				<div id="compareChatDrone">
	  				<!-- body -->
					<div id="body"> 
						<!-- chat-circle -->
						<img id="chat-circle" class="btn btn-raised alt="챗봇아이콘" src="img/chatbot.png">
	        				<div id="chat-overlay">
	        				</div>
						</div>
	        				<div id="chat-overlay"></div>
			    			<!-- <i class="fas fa-hat-wizard">speaker_phone</i> -->
						<!-- chat-circle end -->
						
						<!-- chat-box -->
	  					<div class="chat-box">
	  						<!-- chat-box-header -->
		    				<div class="chat-box-header">
		      					2개의 상품을 비교해보세요!
		      					<span class="chat-box-toggle">
		      						<i class="material-icons">X</i>
		      					</span>
		      					<br>
		      					Drag onto this space :D
		    				</div>
		    				<!-- chat-box-header end -->
		    				
		    				<!-- chat-box-body -->
		    				<div class="chat-box-body">
		      					<div class="chat-box-overlay"></div>
	      						<div class="chat-logs"></div>
	      						<!-- chat-log -->
		    				</div>
		    				<!-- chat-box-body end -->
		    				
		    				<!-- chat-input -->
		    				<div class="chat-input">      
		      					<form>
		        					<input type="text" id="chat-input" placeholder="이곳에 드론을 드래그하여 스펙을 확인하세요~"/>
		      						<button type="submit" class="chat-submit" id="chat-submit"><i class="material-icons">비교</i></button>
		      					</form>      
		    				</div>
		    				<!-- chat-input end -->
	  					</div>
	  					<!-- chat-box end -->
					</div>
					<!-- body end -->
				</div>
				<!-- compareChatDrone end -->
			</div>
			<!-- footer-nav end -->
			
			<!-- footer-info -->
			<div id="footer-info">
				(주)비트캠프:DIFE
				<div id="footer_info1">
					<p>서울특별시 마포구 백범로 23 구프라자 3층</p>
					<p>02-707-1480</p>
					<p><a href="https://github.com/kim-jiseon/FINAL_DIFE.git">GIT</a></p>
					<p><a href="#">고객센터</a></p>
					<p><a href="#">이용안내</a></p>
				</div>
			</div>
			<!-- footer-info end -->
		</div>
		<!-- //footer -->
		
	</div>
	<!-- //wrap -->
	<input type="hidden" value="${datepicker }" id="hidden-datepicker">
	<input type="hidden" value="${sub_series_01 }" id="hidden-series">
	<input type="hidden" value="${sub_price }" id="hidden-price">
</body>
</html>