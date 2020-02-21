<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- 기본 css -->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/pilot/pilotDetail.css">
<!-- 제이쿼리 플러그인 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<!-- datepicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="css/datepicker/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="js/datepicker/datepicker.js"></script>
<!-- Include language -->
<script src="js/datepicker/i18n/datepicker-ko.js"></script>
<script type="text/javascript">
$(function(){
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
	
	//오늘날짜 구하기
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	var day = date.getDate();
	
	if((day+"").length < 2){
		day = "0"+day;
	}
	var getToday = year+"/"+month+"/"+day;

	//파일럿과 상담하기 버튼 활성화
	$("#pil_btn").click(function(){
		//datepicker값 가져오기
		var date = $(".datepicker-here").val();
		var array = date.split(" - ");
		var con_start = array[0];
		var con_end = array[1];
		
		var list_no = "${info.list_no}";
		var con_sort = "${info.pil_cateInfo}";
		var con_loc = "${info.pil_locInfo}";
		
		//로그인 및 날짜 선택
		if (mem_id == '' || mem_id == null) {
			alert("로그인을 해주세요.");
			location.href="/signIn";
		} else {
			if (date == null || date == "") {
				alert("날짜를 선택해주세요.");
			}
			else{
				if(getToday > con_start){
					alert("지난 날짜입니다.\n다시 선택해주세요.");
					$(".datepicker-here").val("");
				}else if(getToday == con_start){
					alert("당일 예약 상담은 불가합니다.");
					$(".datepicker-here").val("");
				}else{
					var pop = window.open(
							"/pilot_popup?startDate="+con_start+"&endDate="+con_end+"&list_no="+list_no+"&con_sort="+con_sort+"&con_loc="+con_loc,
							"pop",
							"width = 760, height = 600");
					$(".datepicker-here").val("");
				}
			}
		}
	})
});
</script>
</head>
<body>
    <div id="wrap" class="animated fadeIn">
       <!-- header -->
         <jsp:include page="header.jsp"></jsp:include>
        <!-- //header -->

        <!-- contents -->
        <div id="contents">
              <div class="container">
               <div id="grid2">
                <div id="block1">
                    <ul class="top">
                        <li>
                            <dl>
                               <img src="img/pilot/${info.pil_photo}">
                                <dd class="pil-name">${info.mem_name} 강사</dd>
                                <dd id="pil-title">${info.pil_title}</dd>
                                <dd>경력:&nbsp; ${info.pil_career}년</dd>
                                <dd>지역:&nbsp; ${info.pil_locInfo}</dd>
                                <dd>한줄 소개:&nbsp; ${info.pil_info}</dd>
                            </dl>
                        </li>
                    </ul>
                </div>
                  <div id="block5">
                       <div id="calendar">
                        교육 및 촬영일&nbsp;&nbsp;
                            <input type="text" data-range="true"
								data-multiple-dates-separator=" - " data-language="ko"
								class="datepicker-here" style="width:200px; height: 25px;"/>
                        </div>
                    <button id="pil_btn">파일럿과 상담하기</button>
                  </div>
                  </div><hr>
                   <div id="grid">
                   <div id="block2">
                       <ul class="mid1">
                           <li>
                               <dl>
                                   <dd class="info_det"><i class="far fa-file-alt"></i> 기본 정보</dd>
                                   <dd class="pil-information">경력:&nbsp; ${info.pil_career }년</dd>
                                   <dd class="pil-information">지역:&nbsp; ${info.pil_locInfo}</dd>
                                   <dd class="pil-information">연락 가능 시간:&nbsp; ${info.pil_contact }</dd>
                                   <dd></dd>
                               </dl>
                           </li>
                       </ul>
                   </div>
                   <div id="block3">
                       <ul class="mid1">
                           <li>
                               <dl>
                                   <dd class="info_det"><i class="far fa-file-alt"></i> 상세 정보</dd>
                                   <dd class="pil-information">자격증:&nbsp; ${info.pil_qualification }</dd>
                                   <dd class="pil-information">보유드론:&nbsp; ${info.pil_drone }</dd>
                                   <dd></dd>
                               </dl>
                           </li>
                       </ul>
                   </div>
               </div>
                   <div id="block4">
                       <ul>
                           <li>
                               <dl>
                                   <dd class="info_det">포트폴리오</dd>
                                   <iframe class="youtube_frame" width="620" height="366" src="https://www.youtube.com/embed/dMuGxhZU5zg" 
                                   frameborder="0" aloowfullscreen></iframe>
                             <!--      <dd><img src="img/pilot/${info.pil_portfolio }" class="pil-portfolio"></dd>  --> 
                                   <dd class="info_det" id="pil-intro">강사 소개</dd>
                                   <dd class="pil-information">${info.pil_intro }</dd>
                                   <dd class="info_det" id="pil-intro">강의 정보</dd>
                                   <dd class="pil-information">${info.pil_detInfo }</dd>
                               </dl>
                           </li>
                       </ul>
                   </div>
            	</div>
        	</div>
        <!-- //contents -->

        <!-- footer -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- //footer -->
    </div>
</body>
</html>