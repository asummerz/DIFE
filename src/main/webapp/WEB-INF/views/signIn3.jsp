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
		 <jsp:include page="header.jsp"></jsp:include>

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
											<form id="login-form" class="form" action="signIn" method="post">
												<h3 class="text-center text-info">로그인</h3>
												<div class="form-group navbar">
													<label for="mem_id" class="text-info1">아이디</label><br> 
														<input type="text" name="mem_id" id="mem_id" class="form-control" placeholder="아이디를 입력하세요." required="required">
												</div>
												<div class="form-group navbar">
													<label for="mem_pwd" class="text-info1" style="color: #323232!important">비밀번호</label><br> 
														<input type="password" name="mem_pwd" id="mem_pwd" class="form-control" placeholder="비밀번호를 입력하세요." required="required">
												</div>
												<div class="form-group">
													<label for="remember-me" class="text-info2" style="color: #323232!important; font-size: 13px; float: left;">
														<span>아이디 저장</span>  
														<span>
														    <input id="remember-me" type="checkbox"></span>
													</label><br> 
													<button type="submit" id="btn">로그인</button>
													<div id="found">
														<a href="#"  style="color: #323232!important; text-decoration: none; font-size: 13px; padding-right: 20px;">아이디 찾기</a>
														<a href="#"  style="color: #323232!important; text-decoration: none; font-size: 13px;">비밀번호 찾기</a>
													</div>
												</div>
												<div id="register-link" class="text-right">
													<a href="signUp" class="text-info" style="color: #323232!important">회원가입</a>
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
         <jsp:include page="footer.jsp"></jsp:include>
        <!-- //footer -->
		</div>
		
</body>
</html>