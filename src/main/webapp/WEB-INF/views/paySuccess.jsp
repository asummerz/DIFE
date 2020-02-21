<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, , minimum-scale=1, maximum-scale=1">
<title>layout</title>
<!-- 웹폰트 -->
<!-- 
    <link rel="stylesheet" type="text/css" href="http://api.typolink.co.kr/css?family=RixGo+L:400" />
     -->
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
 <!-- 기본 css -->
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/orders/basket.css">
    <link rel="stylesheet" href="css/orders/ordersDetail.css">
<!-- fadeIn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/mypage/mypage.css">
<link rel="stylesheet" href="css/mypage/mypage_emoney.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
	})
</script>
</head>
<body>
<% String sum = request.getParameter("sum"); %>
    <div id="wrap" class="animated fadeIn">
       <!-- header -->
         <jsp:include page="header.jsp"></jsp:include>
        <!-- //header -->

        <!-- contents -->
        <div id="contents">
            <div class="container">
               <div  class="mypage-grid">
                <jsp:include page="mypage.jsp"></jsp:include>
                <div id="mypage-bottom" class="mypage-grid-nav">
                   
                    <div id="mypage-bottom-right">
                       <div class="mypage-bottom-right">
                        <div id="mypage-emoney">결제가 완료되었습니다.</div><hr id="hr">
                        <div id="emoney">총 결제금액&nbsp;&nbsp;&nbsp;<span id="emoney-amount"><%= sum%></span> 원</div>
                         <table class="mypage-table">
                            <thead>
                                <tr>
                                    <th>주문일</th>
                                    <th>주문내용</th>
                                    <th>적립금액</th>
                                </tr>
                            </thead>
                            <tbody>
                               <!-- ajax 이용 -->
                                <tr>
                                    <td>2019/11/13</td>
                                    <td>매빅 PRO-4V 드론</td>
                                    <td><%=sum %> 원</td>
                                </tr>
                            </tbody>
                        </table>
                        </div>
                        
                         <div class="delete-btn-area">
                    <span id="sum_price"></span>				
					<a href="main" id="order" class="a_btn">확인</a>
				</div>
                                                
                    </div>
                </div>
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