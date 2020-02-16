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
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<!-- fadeIn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<!-- 기본 css 링크 -->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/member/signUp.css">
<!--
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
	 -->
<!-- 달력 링크 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 
<link rel="stylesheet" href="/resources/demos/style.css">
-->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script>
	        $(function() {
            //모든 datepicker에 대한 공통 옵션 설정
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능                        
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
            });
 
            //input을 datepicker로 선언
            $("#datepicker").datepicker();                    
            $("#datepicker2").datepicker();
            
            //From의 초기값을 오늘 날짜로 설정
            $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
            //To의 초기값을 내일로 설정
            $('#datepicker2').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
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
			<div id="content1">
				<div class="container">
					<div class="row">
						<div class="col-md-8">
							<section>
								<h1 class="entry-title">
									<span style="color: white">회원수정</span>
								</h1>
								
								<form class="form-horizontal" method="post" name="signup"
									id="signup" enctype="multipart/form-data">
									<div class="form-group">
										<label class="control-label col-sm-3">이메일 <span
											class="text-danger">*</span></label>
										<div class="col-md-8 col-sm-9">
											<div class="input-group">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-envelope"></i></span> <input
													type="email" class="form-control" name="mem_email"
													id="emailid" placeholder=" cslim@gmail.com" value="">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-3">아이디<span
											class="text-danger">*</span></label>
										<div class="col-md-5 col-sm-8">
											<input type="text" class="form-control" name="mem_id"
												id="contactnum2" placeholder=" cslim" value="">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-3">비밀번호 <span
											class="text-danger">*</span></label>
										<div class="col-md-5 col-sm-8">
											<div class="input-group">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-lock"></i></span> <input
													type="password" class="form-control" name="password"
													id="password" placeholder=" 1234" value="">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-3">성함 <span
											class="text-danger">*</span></label>
										<div class="col-md-8 col-sm-9">
											<input type="text" class="form-control" name="mem_name"
												id="mem_name" placeholder="임창성" value="">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-3" for="datepicker">생년월일<span
											class="text-danger">*</span></label>
										<div class="col-xs-1">
											<input id="datepicker" type="text" name="mem_birth">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-3">핸드폰 <span
											class="text-danger">*</span></label>
										<div class="col-md-5 col-sm-8">
											<div class="input-group">
												<span class="input-group-addon"><i
													class="glyphicon glyphicon-phone"></i></span> <input type="text"
													class="form-control" name="contactnum" id="contactnum"
													placeholder="010-7123-6450" value="">
											</div>
										</div>
									</div>

									<div class="form-group">
										<label class="control-label col-sm-3" style="margin-left: -290px;">포트폴리오(파일럿)</label>
										<div class="col-md-5 col-sm-8">
											<div class="input-group">
												<span class="input-group-addon" id="file_upload"><i
													class="glyphicon glyphicon-upload"></i></span> <input type="file"
													name="file_nm" id="file_nm" class="form-control upload"
													placeholder="" aria-describedby="file_upload">
											</div>
										</div>
									</div>
								</form>
								 
                                 <div>
								     <a href="admin.html"><button>수정</button></a>
								 </div>
							</section>
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