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
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/orders/payment.css">
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
        <!-- 세션 영역        -->
        <div id="content-session">
            <div class="container">
               <div id="content-top"></div>
                <div class="main-session">
                   <p  style="text-align: center; font-size: 25px; font-weight: bold;">결제 내역</p><br>
                <!--테이블 영역 -->
                        <table class="cart_table">
                             <colgroup>
                                 <col width="100px">
                                 <col width="200px">
                                 <col width="80px">
                                 <col width="120px">
                                 <col width="150px">
                                 <col width="200px">
                                 <col width="150px">
                                 <col width="150px">
                                 <col width="100px">
                             </colgroup>
                             
                        <thead>
                            <th scope="col">주문번호</th>
                            <th scope="col">총 주문금액</th>
                            <th scope="col">총 주문수량</th>
                            <th scope="col">결제금액</th>
                            <th scope="col">결제방법</th>
                            <th scope="col">쿠폰</th>
                            <th scope="col">적립금</th>
                            <th scope="col">적립금액</th>
                            <th scope="col">결제일</th>
                        </thead>
                        	<!-- 주문번호 1페이지  -->
                            <tbody style="border-top: 1px solid #000">
                            <td><a href="ordersDetail">OD0001-100001</a></td>
                            <td>200,000</td>
                            <td>1</td>
							<td>180,000</td>
                            <td>카드</td>
                            <td>10%할인 쿠폰</td>
                            <td>결제금액*0.01</td>
                            <td>8,700</td>
                            <td>2019-07-01</td>
                        	</tbody>
                        
                         <!-- 주문번호 2페이지  -->
                            <tbody style="border-top: 1px solid #000">
                            <td><a href="ordersDetail">OD0001-100002</a></td>
                            <td>1,000,000</td>
                            <td>2</td>
							<td>900,000</td>
                            <td>무통장입금</td>
                            <td>10%할인 쿠폰</td>
                            <td>결제금액*0.01</td>
                            <td>12,600</td>
                            <td>2019-09-17</td>
                        	</tbody>
                        
                        <!-- 주문번호 3페이지  -->
                            <tbody style="border-top: 1px solid #000">
                            <td><a href="ordersDetail">OD0001-100005</a></td>
                            <td>250,000</td>
                            <td>1</td>
							<td>237,500</td>
                            <td>카드</td>
                            <td>5%할인 쿠폰</td>
                            <td>결제금액*0.01</td>
                            <td>3,200</td>
                            <td>2019-04-01</td>
                        	</tbody>
                        </table>
                    </div>
                </div>
            </div>
<!--    //table-->
       
          <!--    content_footer-->
       <div id='content_footer'>
            <div class="container" style="color: black">
                
           </div>
       </div>
    </div>
    <!-- //contents -->
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