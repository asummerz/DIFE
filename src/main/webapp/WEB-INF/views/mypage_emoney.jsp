<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, , minimum-scale=1, maximum-scale=1">
    <title>layout</title>
    <!-- 웹폰트 -->
    <link rel="stylesheet" type="text/css" href="http://api.typolink.co.kr/css?family=RixGo+L:400" />
    <!-- fadeIn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/mypage/mypage.css">
    <link rel="stylesheet" href="css/mypage/mypage_emoney.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
    <div id="wrap" class="animated fadeIn">
       <!-- header -->
        <div id="header">
            <div id="header-top">
               <div id="category">
                    <span id="category-1" class="animated fadeInUp">
                        <a href="main"><img src="img/logo/logo_white.png" id="logo"></a>
                        <a href="drone" class="cl-effect-1">드론</a>
                        <a href="pilot" class="cl-effect-1">파일럿</a>
                        <a href="#" class="cl-effect-1">지역 및 날씨</a>
                        <a href="#" class="cl-effect-1">고객지원</a>
                        <a href="#" class="cl-effect-1">커뮤니티</a>
                    </span>
                     <span id="category-2" class="animated fadeInUp">
                        <a href="signIn" class="cl-effect-1">LOGIN</a>
                        <a href="mypage_orders" class="cl-effect-1">MYPAGE</a>
                        <a href="#" class="cl-effect-1">RESERVATION</a>
                   </span>
                </div>
            </div>
            <div id="header-nav"></div>
        </div>
        <!-- //header -->

        <!-- contents -->
        <div id="contents">
            <div class="container">
               <div  class="mypage-grid">
                <div id="mypage-top" class="mypage-top">
                    <div class="mypage-top-nav"><img src="img/pilot/visit_cnt.png" id="mem-img">
                        <span id="mem-name">임수정 님</span>
                    </div>
                    <div class="mypage-top-nav">적립<i class="fas fa-angle-right" id="arrow"></i></div>
                    <div class="mypage-top-nav">쿠폰<i class="fas fa-angle-right" id="arrow"></i></div>
                </div><hr>
                <div id="mypage-bottom" class="mypage-grid-nav">
                    <div id="mypage-bottom-left">
                        <nav>
                            <ul>
                                <li class="mypage-category"><a href="mypage_orders.html">주문내역<i class="fas fa-angle-right" id="icon"></i></a></li>
                                <li class="mypage-category"><a href="#">게시글관리<i class="fas fa-angle-right" id="icon"></i></a></li>
                                <li class="mypage-category"><a href="mypage_emoney.html">적립금 및 쿠폰<i class="fas fa-angle-right" id="icon"></i></a></li>
                                <li class="mypage-category"><a href="#">개인정보수정<i class="fas fa-angle-right" id="icon"></i></a></li>
                            </ul>
                        </nav>
                    </div>
                    <div id="mypage-bottom-right">
                       <div>
                        <div id="mypage-emoney">보유 적립금</div><hr>
                        <div id="emoney">적립금&nbsp;&nbsp;&nbsp;<span id="emoney-amount">1000</span> 원</div>
                         <table class="mypage-table">
                            <thead>
                                <tr>
                                    <th>적립일</th>
                                    <th>적립내용</th>
                                    <th>적립금액</th>
                                </tr>
                            </thead>
                            <tbody>
                               <!-- ajax 이용 -->
                                <tr>
                                    <td>2019/11/11</td>
                                    <td>[구매] 0.5%적립</td>
                                    <td>100 원</td>
                                </tr>
                            </tbody>
                        </table>
                        </div>
                        <div>
                        <div id="mypage-coupon">보유 쿠폰</div><hr>
                        <table class="mypage-table">
                            <thead>
                                <tr>
                                    <th>쿠폰명</th>
                                    <th>할인/적립</th>
                                    <th>사용가능기간</th>
                                    <th>사용여부</th>
                                </tr>
                            </thead>
                            <tbody>
                               <!-- ajax 이용 -->
                                <tr>
                                    <td>고객감사 10%할인 쿠폰</td>
                                    <td>10%</td>
                                    <td>2019/11/11-2019/11/30</td>
                                    <td>미사용</td>
                                </tr>
                                <tr>
                                    <td>고객감사 10%할인 쿠폰</td>
                                    <td>10%</td>
                                    <td>2019/11/11-2019/11/30</td>
                                    <td>미사용</td>
                                </tr>
                            </tbody>
                        </table>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
        <!-- //contents -->

        <!-- footer -->
        <div id="footer">
            <div id="footer-nav"></div>
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