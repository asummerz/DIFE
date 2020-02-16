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
 <!-- 
    <link rel="stylesheet" type="text/css" href="http://api.typolink.co.kr/css?family=RixGo+L:400" />
     -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<!-- fadeIn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<!-- 기본 css -->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/member/signIn.css">
<!-- 
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.css" rel="stylesheet" id="bootstrap-css">
 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript">
$(function() {
	$("#btn").click(function(){
		var mem_id = $("#mem_id").val();
		var mem_pwd = $("#mem_pwd").val();
		if(mem_id == "") {
			alert("아이디를 입력하세요.");
			return false;
		}
		else if(mem_pwd == "") {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		else
			return true;
	});
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
					<div id="content1">
						<div id="login">
							<h3 class="text-center text-white pt-5"></h3>
							<div class="container-login">
								<div id="login-row"
									class="row justify-content-center align-items-center">
									<div id="login-column" class="col-md-6">
										<div id="login-box" class="col-md-12">
										<!-- 로그인 폼 -->
											<form id="login-form" class="form" action="signIn.do" method="post">
												<h3 class="text-center text-info">로그인</h3>
												<div class="form-group navbar">
													<label for="mem_id" class="text-info1" style="color: white!important;">아이디</label><br> 
														<input type="text" name="mem_id" id="mem_id" class="form-control" placeholder="아이디를 입력하세요." required="required">
												</div>
												<div class="form-group navbar">
													<label for="mem_pwd" class="text-info1" style="color: white!important">비밀번호</label><br> 
														<input type="password" name="mem_pwd" id="mem_pwd" class="form-control" placeholder="비밀번호를 입력하세요." required="required">
												</div>
												<div class="form-group">
													<label for="remember-me" class="text-info2" style="color: white!important; font-size: 13px; float: left;">
														<span>아이디 저장</span>  
														<span>
														    <input id="remember-me" type="checkbox"></span>
													</label><br> 
													<button type="submit" id="btn">로그인</button>
													<div id="found">
														<a href="#"  style="color: white!important; text-decoration: none; font-size: 13px; padding-right: 20px;">아이디 찾기</a>
														<a href="#"  style="color: white!important; text-decoration: none; font-size: 13px;">비밀번호 찾기</a>
													</div>
												</div>
												<div id="register-link" class="text-right">
													<a href="signUp" class="text-info" style="color: white!important">회원가입</a>
												</div>
											</form>
											<!--//로그인 폼 -->
										</div>
									</div>
								</div>
							</div>
						</div>
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
</body>
</html>