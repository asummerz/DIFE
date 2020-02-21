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
<!-- 기본 링크 -->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/support/support.css">
<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="css/swiper/swiper.min.css">
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
		
		//마이페이지 이동
		$("#mypage").click(function(){
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
            <div id="title">
                <img src="img/main/drone_main10.PNG" alt="" id="support-title-img">
            </div>
            <div id="support-title">고객지원</div>
             <div class="container">
                 <div id="support-grid-wrapper">
                     <a href="#"><img src="img/support/email.png" alt=""><h4>이메일</h4></a>
                     <a href="#"><img src="img/support/chat.png" alt=""><h4>온라인 상담</h4></a>
                     <a href="#"><img src="img/support/support.png" alt=""><h4>AS정책</h4></a>
                     <a href="#"><img src="img/support/phone.png" alt=""><h4>전화문의</h4></a>
                 </div>
             </div>
        </div>
        <!-- //contents -->

        <!-- footer -->
       <jsp:include page="footer.jsp"></jsp:include>
        <!-- //footer -->
        
    </div>
    <!-- 헤더 효과 -->
	<script>
		window.onscroll = function() {
			myFunction()
		};

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
	<!-- Swiper JS -->
	<script src="js/swiper/swiper.min.js"></script>
	<!-- Initialize Swiper -->
	<script>
		var swiper = new Swiper('.swiper-container', {
			spaceBetween : 30,
			centeredSlides : true,
			autoplay : {
				delay : 3000,
				disableOnInteraction : false,
			},
			pagination : {
				el : '.swiper-pagination',
				clickable : true,
			},
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
		});
	</script>
</body>
</html>