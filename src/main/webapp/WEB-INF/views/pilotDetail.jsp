<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, , minimum-scale=1, maximum-scale=1">
    <title>layout</title>
    <!-- 웹폰트 -->
     <!-- 
    <link rel="stylesheet" type="text/css" href="http://api.typolink.co.kr/css?family=RixGo+L:400" />
     -->
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

});
</script>
</head>
<body>
    <div id="wrap" class="animated fadeIn">
       <!-- header -->
        <div id="header">
            <div id="header-top">
               <div id="category">
                    <span id="category-1" class="animated fadeInUp">
                        <a href="main"><img src="img/logo/logo_white.png" id="logo"></a>
                        <a href="#" class="cl-effect-1">드론</a>
                        <a href="pilot" class="cl-effect-1">파일럿</a>
                        <a href="#" class="cl-effect-1">지역 및 날씨</a>
                        <a href="#" class="cl-effect-1">고객지원</a>
                        <a href="#" class="cl-effect-1">커뮤니티</a>
                    </span>
                     <span id="category-2" class="animated fadeInUp">
                        <a href="signIn" class="cl-effect-1">LOGIN</a>
                        <a href="#" class="cl-effect-1">MYPAGE</a>
                        <a href="basket" class="cl-effect-1">RESERVATION</a>
                   </span>
                </div>
            </div>
            <div id="header-nav"></div>
        </div>
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
								class="datepicker-here" style="width:180px; height: 25px;"/>
                        </div>
                    <a href="#"><button id="pil_btn">파일럿과 상담하기</button></a>
                  </div>
                  </div><hr>
                   <div id="grid">
                   <div id="block2">
                       <ul class="mid1">
                           <li>
                               <dl>
                                   <dd class="info_det" style="color: #a4a4a4;"><i class="far fa-file-alt"></i> 기본 정보</dd>
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
                                   <dd class="info_det" style="color: #a4a4a4;"><i class="far fa-file-alt"></i> 상세 정보</dd>
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
                                   <dd>포트폴리오</dd>
                                   <dd><img src="img/pilot/${info.pil_portfolio }" class="pil-portfolio"></dd>
                               </dl>
                           </li>
                       </ul>
                   </div>
            </div>
        </div>
        <!-- //contents -->

        <!-- footer -->
        <div id="footer">
            <div id="footer-nav">footer-nav</div>
            <div id="footer-info">(주)비트캠프:DIFE
                <div id="footer_info1">
                    <p>서울특별시 마포구 백범로 23 구프라자 3층</p>
                    <p>02-707-1480</p>
                    <p><a href="#">고객센터</a></p>
                    <p><a href="#">이용안내</a></p>
                </div>
            </div>
        </div>
        <!-- //footer -->
    </div>
<script>
window.onscroll = function() {myFunction()};

var header = document.getElementById("header");
var sticky = header.offsetTop;

function myFunction() {
  if (window.pageYOffset > sticky) {
    header.classList.add("sticky");
  } else {
    header.classList.remove("sticky");
  }
}
</script>
</body>
</html>