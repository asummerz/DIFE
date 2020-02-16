<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, , minimum-scale=1, maximum-scale=1">
<title>DIFE.com</title>
<!-- 웹폰트 -->
<link rel="stylesheet" type="text/css" href="http://api.typolink.co.kr/css?family=RixGo+L:400" />
<!-- fadeIn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<!-- 기본 css 링크 -->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/drone/droneDetail.css">
<!-- 제이쿼리 플러그인 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 달력 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="css/datepicker/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="js/datepicker/datepicker.js"></script>
<!-- Include language -->
<script src="js/datepicker/i18n/datepicker-ko.js"></script>
<!-- 아이콘 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<script type="text/javascript">
$(function() {
	//로그인 로그아웃 전환
	var mem_id = "${mem_id}";
	
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
	
    /* 대여점 및 수량 목록 불러오기 */
    var rental_arr = [
    	'선택','잠실','서귀포','해운대','둔산','강릉','부산','대구','울산','여수','목포','오산','속초','포항','김포'
    ];
	var amount_arr = [
		'선택','1','2','3','4','5개 이상(별도 문의)'
	];
	
   	// 대여점
   	$.each(rental_arr,function(idx, ren){
   		var search_droRen = $("<option></option>").attr({"value":rental_arr[idx], "idx":idx}).html(rental_arr[idx]);
   		$("#operR").append(search_droRen);
   	})
   	// 수량
   	$.each(amount_arr, function(idx, amt){
   		var search_droAmt = $("<option></option>").attr({"value":amount_arr[idx], "idx":idx}).html(amount_arr[idx]);
   		$("#operA").append(search_droAmt);
   	})
   	
   	/* 주문 및 장바구니 : 로그인 후 가능 */
   	$("#btnOrder").click(function(){
   		console.log("드론 주문하기");
   		if(mem_id == null || mem_id == ''){
   			alert("로그인을 해주세요.");
   			location.href("signIn");
   		}else{
			$("#mypage").attr("href","mypage_orders");
		}
   	})
   	$("#btnBasket").click(function(){
   		console.log("드론 장바구니에 추가");
   		if(mem_id == null || mem_id == ''){
   			alert("로그인을 해주세요.");
   			location.href("signIn");
   		}else{
			$("#mypage").attr("href","mypage_orders");
		}
   	})
   	
   	/* 상세정보 불러오기
   	$.ajax({url:"/droDtCon", success:function(data){
   		var dro_arr = eval(data);
   		$.each(dro_arr, function(idx, item){
   			var div_01 = $("<div></div>").attr("id", "block1");
   			var ul_01 = $("<ul></ul>");
   			var li_01 = $("<li></li>").addClass("img").attr("id", "border");
   			var img_01 = $("<img/>").attr({"alt":item.dro_conphoto_01, "src":"img/drone/"+item.dro_conphoto_01, width:"450", height:"490"}).addClass("scale");
   			var div_02 = $("<div></div>").attr("id", "block2");
   			//var ul_02 = $("<ul></ul>").attr({color:"black" font-size:"20px"});
   			var li_02 = $("<li></li>");
   			var name = $("<p></p>").html(item.dro_name);
   			var hr = $("<hr>");
   			var price = $("<p></p>").html(item.dro_price);
   			var series = $("<p></p>").html(item.dro_series);
   			var made = $("<p></p>").html(item.dro_made);
   			
   			var ul_03 = $("<ul></ul>").addClass("search");
   			var div_03 = $("<div></div>").addClass("block");
   			var div_04 = $("<div></div>").attr("id", "calendar");
   			
   			var ul_02 = $("<ul></ul>").attr({color:"black", font-size:"20px"}).append(li_02, name, hr, li_02, price, hr, li_02, series, li_02, made);
   			$(block2).append(ul_02);
   		})
   	}}) */
})
</script>
</head>
<body>
	<div id="wrap" class="animated fadeIn">
    	<!-- header -->
    	<jsp:include page="header.jsp"></jsp:include>
        <!-- //header -->
		
		<!-- 드론 상세 상단 -->
		<div id="contents">
	       <!--상품 상세경로 <section class="index-section">
	           <div class="section-container">
	               <ul class="index-ul">
	                   <li class="index-li-item">
	                       <a href="main.html">메인</a>
	                   </li>
                        <li class="index-li-item">
                           ::before
	                       <a href="drone.html">드론</a>
	                   </li>
	                   <li class="index-li-item">
                           ::before
	                       "매빅2프로"
	                   </li>
	               </ul>
	           </div>
	       </section>-->
	       <div id="header-nav">
	       <div class="container">
			<div class="content1">
				<div class="grid">
					<div id="block1">
						<ul>
							<li>
								<li id="border" class="img">
									<img class="scale" src="img/drone/${dtInfo.dro_conphoto_01 }" width="450" height="490">
								</li>
                            </li>
                        </ul>
					</div>
					<div id="block2">
						<ul style="color: black; font-size: 20px;">
							<li name="droD_name"><p>드론명 : <strong>${dtInfo.dro_name }</strong></p></li>
							<hr>	
							<li name="droD_price"><p>가격 : <strong>${dtInfo.dro_price }원</strong></p></li>
							<hr>
							<li name="droD_series"><p>시리즈명 : <strong>${dtInfo.dro_series }</strong></p></li>
							<li name="droD_made"><p>제조사명 : <strong>${dtInfo.dro_made }</strong></p></li>
						</ul>	
						<hr>
						<!-- 캘린더 선택 시 위에 대여일과 반납일을 선택하세요. 문구뜨도록 설정하기 -->
						<!-- 캘린더 -->	
		                <ul class="search">
		                    <div class="block">
		                        <div id="calendar" name="calendar">
		                          	 대여일<i class="fa fa-calendar-check-o" aria-hidden="true"></i>&nbsp;&nbsp;
		                        	<input type="text" data-range="true" data-multiple-dates-separator=" - " data-language="ko"
		                            class="datepicker-here" placeholder="   대여일 ~ 반납일 선택" style="width:180px; height: 25px;"/>               
		                        </div>
		                    </div>
		                </ul>
						<hr>
						<!-- 제이쿼리 사용 -->
						<ul>
							<li><p>대여점 : 
								<span id="opr">
									<select id="operR" name="operR" style="width: 150px; height: 30px;">
									</select>
								</span>
								</p>
							</li>
						</ul>
						<!-- 제이쿼리 사용 -->
						<ul>
							<li><p>수    량 :							 
								<span id="opa">
									<select id="operA" name="operA" style="width: 150px; height: 30px;">
									</select>
								</span>
							</p>
							</li>
						</ul>
						<hr>
						<li>
							<a href="payment?dro_no=${dtInfo.dro_no }">						
							<button id="btnOrder" type="button" class="btn btn-outline-dark btn-sm" style="width: 150px; height: 30px;">
								<strong>주문하기</strong>
							</button>
							</a>
						</li>
						<li>
	                       	<a href="basket?dro_no=${dtInfo.dro_no }">
	                       	<button id="btnBasket" type="button" class="btn btn-outline-dark btn-sm" style="width: 150px; height: 30px;"><strong>장바구니 담기</strong>                               
                            </button>
                            </a>
                            <!-- * modal 추가 예정 -->
                        </li>
						<li>
							<a href="drone?dro_no=${dtInfo.dro_no }">
								<button type="button" class="btn btn-outline-dark btn-sm" style="width: 150px; height: 30px;"><strong>쇼핑 계속하기</strong>
								</button>
							</a>
						</li>
					</div>		
				</div>
			</div>
			</div>
			</div>
			
			<!-- 드론 상세 정보 -->
			<div class="content2">
				<div class="block">
					<img id="dro_conphoto_02" class="dro-dt-img" src="img/drone/${dtInfo.dro_conphoto_02 }">
				</div>
			</div> 
			
			<!-- 상품 정책 -->
       		<jsp:include page="productPolicy.jsp"></jsp:include>
	        <!-- //product policy -->
			
			<!-- 질문, 후기게시판 불러오는지? -->
		
			<!-- footer -->
      		<jsp:include page="footer.jsp"></jsp:include>
	        <!-- //footer -->
	    
	    
    </div>
    </div>
  </body>
</html>