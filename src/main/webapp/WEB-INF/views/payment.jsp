<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, , minimum-scale=1, maximum-scale=1">
<title>DIFE.com</title>
<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<!-- fadeIn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<!-- 기본 링크 -->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/orders/payment.css">
<!-- 제이쿼리 플러그인 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
	})
</script>
</head>
<body>
    <div id="wrap" class="animated fadeIn">
       <!-- header -->

        <jsp:include page="header.jsp"></jsp:include>

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
         <jsp:include page="footer.jsp"></jsp:include>
        <!-- //footer -->
    </div>

</body>
</html>