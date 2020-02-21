<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="icon" type="image/png" href="http://example.com/myicon.png"> -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, , minimum-scale=1, maximum-scale=1">
<title>DIFE.com</title>
<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<!-- <link rel="stylesheet" type="text/css" href="http://api.typolink.co.kr/css?family=RixGo+L:400" /> -->
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
   	// 장바구니 담기
	$("#btnBasket").click(function(){
		
		
		//datepicker값 가져오기
		var date = $(".datepicker-here").val();
		var array = date.split(" - ");
		var con_start = array[0];
		var con_end = array[1];
		var start = con_start.replace('/',"");
		var end = con_end.replace('/',"");
		start = start.replace('/',"").substring(6,8);
		end =end.replace('/',"").substring(6,8);
		if(start.substring(0,1)==="0")
			{
				start.replace("0","");
			}
		if(end.substring(0,1)==="0")
		{
			start.replace("0","");
		}
		var ren_date = (Number(end) - Number(start))
		// 장바구니 페이지에 담을 값
		var dro_no = "${dtInfo.dro_no}";
		var ren_no = "${dtInfo.ren_no}";
		var pos_amount = $("#operA").val();
		var bas_price = "${dtInfo.dro_price}"
		var data = {"bas_amount" : pos_amount,"bas_price" : bas_price,"bas_rental" : con_start, "bas_return":con_end,"mem_id":mem_id,"dro_no":dro_no,"ren_day":ren_date}
		// 오늘날짜 구하기
		var new_date = new Date();
		var year = new_date.getFullYear();
		var month = new_date.getMonth()+1;
		var day = new_date.getDate();
		
		if((day+"").length < 2){
			day = "0"+day;
		}
		var getToday = year+"/"+month+"/"+day;
		
		if(mem_id == null || mem_id == ''){
   			alert("로그인을 해주세요.");
   			location.href="/signIn";
   		}
   		else{
			$("#mypage").attr("href","mypage_orders");
			if (date == null || date == "") {
				alert("날짜를 선택해주세요.");
			}
			else{
				if(getToday > con_start){
					alert("지난 날짜입니다.\n다시 선택해주세요.");
					$(".datepicker-here").val("");
				}
				if(ren_no == null || ren_no == ''){
					alert("대여점을 선택하세요.");
				}
				if(pos_amount == null || pos_amount == ''){
					alert("수량을 선택하세요.");
				}
			}
		}
			
		$.ajax({url:"/droBasket", traditional:true, contentType:'application/json', data:data, success:function(data){	
   	   		location.href="/basket";
   	 	}})
   	})	
   	// 주문하기
		$("#btnOrder").click(function(){
			if(mem_id == null || mem_id == ''){
   	   			alert("로그인을 해주세요.");
   	   			location.href="/signIn";
   	   		}
   	   		else{
   				$("#mypage").attr("href","mypage_orders");
   			}

		//datepicker값 가져오기
		var date = $(".datepicker-here").val();
		var array = date.split(" - ");
		var con_start = array[0];
		var con_end = array[1];
		var start = con_start.replace('/',"");
		var end = con_end.replace('/',"");
		start = start.replace('/',"").substring(6,8);
		end =end.replace('/',"").substring(6,8);
		if(start.substring(0,1)==="0")
			{
				start.replace("0","");
			}
		if(end.substring(0,1)==="0")
		{
			start.replace("0","");
		}
		var ren_date = (Number(end) - Number(start))
		
		
		start = Number(start)
		end = Number(end)
		// 장바구니 페이지에 담을 값
		var dro_no = "${dtInfo.dro_no}";
		var ren_no = "${dtInfo.ren_no}";
		var pos_amount = $("#operA").val();
		var bas_price = "${dtInfo.dro_price}"
		var data = {"det_amount" : pos_amount,"ord_price" : bas_price,"det_rental" : con_start, "det_return":con_end,"mem_id":mem_id,"dro_no":dro_no,"ren_day":ren_date}
   	   	
		$.ajax({url:"/droOrder", traditional:true, contentType:'application/json', data:data, success:function(data){	
   	   		 location.href="/orders";
   	 	}})
   	})	
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
	      
		<div class="container">
	       <!-- content1 -->
			<div class="content1">
				<!-- grid -->
				<div class="grid">
					<!-- block1 -->
					<div id="block1">
						<ul>
							<li>
								<li id="border" class="img">
									<img class="scale" src="img/drone/${dtInfo.dro_conphoto_01 }" width="450" height="490">
								</li>
                            </li>
                        </ul>
					</div>
					<!-- block1 end -->
					<!-- block2 -->
					<div id="block2">
						<ul style="color: black; font-size: 20px;">
							<li name="droD_name"><p>드론명 : <strong>${dtInfo.dro_name }</strong></p></li>
							<hr>	
							<li name="droD_price"><p>가격 : <strong>${dtInfo.dro_price }원</strong></p></li>
							<hr>
							<li name="droD_series"><p>시리즈명 : <strong>${dtInfo.dro_series }</strong></p></li>
							<li name="droD_made"><p>제조사명 : <strong>${dtInfo.dro_made }</strong></p></li>
						</ul><hr>
						
						<!-- 캘린더 선택 시 위에 대여일과 반납일을 선택하세요. 문구뜨도록 설정하기 -->
						<!-- 캘린더 -->	
						<!-- search -->
		                <ul class="search">
		                    <div class="block">
		                        <div id="calendar" name="calendar">
		                          	 대여일&nbsp;&nbsp;
		                        	<input type="text" data-range="true" data-multiple-dates-separator=" - " data-language="ko"
		                            		class="datepicker-here" placeholder="대여일 ~ 반납일 선택" style="width:180px; height: 25px;"/>               
		                        </div>
		                    </div>
		                </ul><hr>
		                <!-- search end -->
		                
						<!-- 제이쿼리 사용 -->
						<ul>
							<li>
								<p>대여점&nbsp;&nbsp;
									<span id="opr">
										<select id="operR" name="operR" style="width: 150px; height: 30px;"></select>
									</span>
								</p>
							</li>
						</ul>
						<!-- 제이쿼리 사용 -->
						<ul>
							<li>
								<p>수&nbsp;&nbsp;량&nbsp;&nbsp;							 
									<span id="opa">
										<select id="operA" name="operA" style="width: 150px; height: 30px;"></select>
									</span>
								</p>
							</li>
						</ul><hr>
						
						<!-- 주문하기 버튼 -->
						<li>
							<a href="javascript:void(0)">						
								<button id="btnOrder" type="button" class="btn btn-outline-dark btn-sm" style="width: 150px; height: 30px;">
									<strong>주문하기</strong>
								</button>
							</a>
						</li>
						<!-- 주문하기 버튼 end -->
						
						<!-- 장바구니 버튼 -->
						<li>
							<!-- 버튼 클릭 시 해당페이지로 자동이동하지 않도록 설정 -->
	                       	<a href="javascript:void(0)">
		                       	<button id="btnBasket" type="button" class="btn btn-outline-dark btn-sm" style="width: 150px; height: 30px;">
		                       		<strong>장바구니 담기</strong>                               
	                            </button>
                            </a>
                            <!-- * modal 추가 예정 -->
                        </li>
                        <!-- 장바구니 버튼 end -->
                        
                        <!-- 쇼핑계속하기 버튼 -->
						<li>
							<a href="drone?dro_no=${dtInfo.dro_no }">
								<button type="button" class="btn btn-outline-dark btn-sm" style="width: 150px; height: 30px;">
									<strong>쇼핑 계속하기</strong>
								</button>
							</a>
						</li>
						<!-- 쇼핑계속하기 버튼 end -->
					</div>
					<!-- block2 end -->		
				</div>
				<!-- grid end -->
			</div>
			<!-- content1 end -->
			
			<!-- content2 -->
			<!-- 드론 상세 정보 -->
			<div class="content2">
				<div class="block">
					<img id="dro_conphoto_02" class="dro-dt-img" src="img/drone/${dtInfo.dro_conphoto_02 }">
				</div>
			</div>
			<!-- content2 end -->
			
			<!-- 상품 정책 -->
       		<jsp:include page="productPolicy.jsp"></jsp:include>
	        <!-- //product policy -->
			
			<!-- 질문, 후기게시판 불러오는지? -->
			
		</div>
		<!-- container end -->
	</div>
	<!-- //contents -->
		
			<!-- footer -->
      		<jsp:include page="footer.jsp"></jsp:include>
	        <!-- //footer -->
    </div>
  </body>
</html>