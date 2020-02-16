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
	alert(mem_id);
	if(mem_id != '' && mem_id != null){
		//var login = $("#category-2").find("a:first").html();
		//var logout = $("<a></a>").attr("href","logout").addClass("cl-effect-1").html("LOGOUT");
		//$("#category-2").append(logout);
		$("#sign").attr("href","logout").html("LOGOUT");
	}
	if(mem_id == '' || mem_id == null){
		//var login = $("<a></a>").attr("href","signIn").addClass("cl-effect-1").html("LOGIN");
		//$("#category-2").append(login);
		$("#sign").attr("href","signIn").html("LOGIN");
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

	/* 시리즈명 및 드론명
	var series_arr = [{'드론파이터':'기본패키지'},
						{'매빅':'2 PRO','PRO','2 엔터프라이즈 유니버셜','2 엔터프라이즈 듀얼','AIR'},
						{'매트리스':'600','600 프로','100','210 RTK'},
						{'비밥':'2 싱글','2+스카이 컨트롤러'},
						{'스파크':'미니'},
						{'인스파이어':'1V2 1인','1V2 2인','1 PRO 1인','1 PRO 2인','2 ZENMUSE X5S 1인','2 ZENMUSE X5S 2인'},
						{'팬텀':'4','4 PRO','3 ADVANCED','3 PROFESSIONAL'},
						{'페트론':'베이직','풀패키지','드라이브 파워패키지','V2 프로','V2 풀패키지','파워패키지','카메라 파워패키지'}
					];	*/

	var price_arr = ['~ 10만원','10 ~ 20만원','20만원 ~'];

	$.ajax({url:"/droAll",success:function(data){
		/*
		$.each(series_arr, function(idx, ser){
			var search_droSer = $("<li></li>").attr({"value":series_arr[idx], "idx":idx}).html(series_arr[idx]);
			$("#hover_dro_01").append(search_droSer);
		})
		*/
		
		/* 검색 카테고리 시리즈명 */
		
		/* 검색 카테고리 가격 */
		$.each(price_arr, function(idx, prc){
			var search_droPrc = $("<li></li>").attr({"value":price_arr[idx], "idx":idx}).html(price_arr[idx]);
			$("#sub_price").append(search_droPrc);
		})
		
		/* 상품 전체 목록 */
		var dro_list = eval(data);
		$.each(dro_list, function(idx, item){
     		//console.log(item.dro_name);
     		var div = $("<div></div>").addClass("item");
			var fname = $("<img/>").attr({"src":"img/drone/"+item.dro_photo,width:"300",height:"450"});
			var dro_info = $("<p></p>").html(item.dro_info);
			var dro_price = $("<p></p>").html(item.dro_price);
			var dro_series = $("<h2></h2>").html(item.dro_series);
     		var block = $("<div></div>").addClass("block");
     		var figure = $("<figure></figure>").addClass("block").attr("id", "block");
     		var figcaption = $("<figcaption></figcaption>");
			var dro_photo = $("<img/>").attr({"alt":item.dro_name, "src":"img/drone/"+item.dro_photo, width:"300", height:"450"}).addClass("dro-list-img");
			var won = $("<i></i>").html(" / ").addClass("fas fa-won-sign");
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
		
    /* 무한스크롤 적용 예정 */     

    /* 카테고리(시리즈명) 마우스 hover */
    $(".hover").mouseleave(function() {
        $(this).removeClass("hover");
    })  
     
     /*	카테고리(시리즈명,가격) 클릭 시 상태유지
     var searchSp = document.getElementById("search1");
     var listSp = document.getElementById("sub-menu"); 
     listSp.style.display = "none";
     searchSp.addEventListener("click",(event){
         if(listSp.style.display == "none"){
             listSp.style.display = "block";
         }
         else{
             listSp.style.display = "none";
         }
     }); */
            
            /*
            // selectRentalDate
            // 대여일 캘린더
            $("#datepicker").dialog({
            	buttons:{
            		submit:function(){
            			var data = $("#header-nav").serialize();
            			$.ajax({url:"selectRentalDate",type:"POST",data:data,success:function(r){
            				alert(r);
            			}});
            		},
            		reset:function(){
            			alert("모두 지움");
            		},
            		cancle:function(){
            			alert("취소");
            		},
            	},
            	modal:false
        });
        $("#calendar").datepicker();
        */
	})
</script>
</head>
<body>
    <div id="wrap" class="animated fadeIn">
       <!-- header -->
        <div id="header">
            <div id="header-top">
               <div id="category">
                    <span id="category-1" class="animated fadeInUp">
                        <a href="main"><img src="img/logo/DIFE_logo3.png" id="logo"></a>
                        <a href="drone" class="cl-effect-1">드론</a>
                        <a href="pilot" class="cl-effect-1">파일럿</a>
                        <a href="#" class="cl-effect-1">지역 및 날씨</a>
                        <a href="#" class="cl-effect-1">고객지원</a>
                        <a href="board" class="cl-effect-1">커뮤니티</a>
                    </span>
                     <span id="category-2" class="animated fadeInUp">
                        <a id="sign" class="cl-effect-1"></a>
                        <a href="mypage_orders" class="cl-effect-1" id="mypage">MYPAGE</a>
                        <a href="basket" class="cl-effect-1">RESERVATION</a>
                   </span>
                </div>
            </div>
            
	        <!-- header-nav -->
	        <div id="header-nav">
	            <ul name="search" class="search">	            
                    <div class="block">
                        <div id="calendar" name="calendar">
                          	 대여일<i class="far fa-calendar-check"></i>&nbsp;&nbsp;
                                <input type="text" data-range="true"
                                            data-multiple-dates-separator=" - " data-language="ko"
                                            class="datepicker-here" style="width:180px; height: 25px;"/>
                        </div>
                    </div>                      	
                    <li name="series" class="search1">시리즈명<i class="fas fa-plane"></i>
                        <div class="sub-menu-1">
                            <ul name="sub_series_01" id="sub-menu">
                            	<c:forEach var="d" items="${list }">
                                	<li id="hover_dro_01" name="hover_dro_01" class="hover-dro">${d.dro_series }<i class="fas fa-angle-right"></i>
                                	</li>
                            	</c:forEach>                                                
                            </ul>
                        </div>
                    </li>                    
                    <li id="price" name="price" class="search1">가격<i class="fas fa-tags"></i>
                        <div class="sub-menu-1">
                            <ul name="sub_price" id="sub_price">
                                <!-- <li class="hover-dro">~ 10만원</li>
                                <li class="hover-dro">10 ~ 20만원</li>
                                <li class="hover-dro">20만원 ~</li> -->
                            </ul>
                        </div>
                    </li>
                    <button id="btnSch">검색</button>
                </ul>
        	</div>
        <!-- //header-nav -->
        </div>
        <!-- //header -->
          
        <!-- contents -->
        <div id="contents">
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
                              <a href="droneDetail.jsp?dro_no=${d.dro_no }"></a>                           
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
			<div id="footer-nav">
				<!-- 드론 비교하는 건 footer-nav에서 만들면 될거 같습니다!! css도 footer-nav 높이 설정하셔서 하시면 될거 같아요. -->
				<div id="compareChatDrone"></div>
			</div>
			<div id="footer-info">
				(주)비트캠프:DIFE
				<div id="footer_info1">
					<p>서울특별시 마포구 백범로 23 구프라자 3층</p>
					<p>02-707-1480</p>
					<p>
						<a href="#">고객센터</a>
					</p>
					<p>
						<a href="#">이용안내</a>
					</p>
				</div>
			</div>
		</div>
		<!-- //footer -->
	</div>
</body>
</html>