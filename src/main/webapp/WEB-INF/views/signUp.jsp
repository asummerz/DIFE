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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript">
$(function(){
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9]{4,12}$/;
	// 비밀번호 정규식
	var pwJ = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/; 
	// 이름 정규식
	var nameJ = /^[가-힣]{2,6}$/;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	var birthJ = false;

	$("#submit").hide();
	// 아이디 중복확인
	$("#mem_id").blur(function(){
		if($("#mem_id").val()=="") {
			$("#id_check").text("아이디를 입력하세요.");
			$("#id_check").css("color","red");
		}
		else if(idJ.test($("#mem_id").val())!=true) {
			$("#id_check").text("4~12자의 영문, 숫자만 사용 가능합니다.");
			$("#id_check").css("color","red");
		}
		else if($("#mem_id").val()!="") {
			var mem_id = $("#mem_id").val();

			$.ajax({
				url:"${pageContext.request.contextPath}/member/idCheck?mem_id="+mem_id,
				type:"get",
				success : function(data) {

					if(data == 1) {
						$("#id_check").text("중복된 아이디입니다.");
							$("#id_check").css("color", "red");
							$("#signup").attr("disabled", true);
					}
					else {
						if(idJ.test(mem_id)) {
							$("#id_check").text("사용가능한 아이디 입니다.");
							$("#id_check").css("color", "white");
							$("#signup").attr("disabled", false);
						}
						else if(mem_id=="") {
							$("#id_check").text("아이디를 입력해주세요");
							$("#id_check").css("color","red");
							$("#signup").attr("disabled", true);
						}
						else {
							$("#id_check").text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
							$("#id_check").css("color", red);
							$("#signup").attr("disabled", true);
						}
					}
				}
			});
		}
	});

	$("form").on("submit", function(){
		var arr = new Array(8).fill(false);
		
		// 이메일 정규식
		if(mailJ.test($("#mem_email").val())) {
			console.log(phoneJ.test($("#mem_email").val()));
			arr[0] = true;
		}
		else {
			arr[0] = false;
			alert("이메일을 확인하세요.");
			return false;
		}
		
		// 아이디 정규식
		if(idJ.test($("#mem_id").val())) {
			arr[1] = true;
		}
		else {
			arr[1] = false;
			alert("아이디를 확인하세요.");
			return false;
		}
		
		// 비밀번호가 같은 경우 && 비밀번호 정규식
		if(($("#mem_pwd").val()==($("#mem_pwd_check").val()))
			&& pwJ.test($("#mem_pwd").val())) {
			arr[2] = true;
		}
		else {
			arr[2] = false;
			alert("비밀번호를 확인하세요.");
			return false;
		}
		
		// 이름 정규식
		if(nameJ.test($("#mem_name").val())) {
			arr[3] = true;
		}
		else {
			arr[3] = false;
			alert("이름을 확인하세요.");
			return false;
		}
		
		// 생년월일 정규식
		if(birthJ) {
			console.log(birthJ);
			arr[4] = true;
		}
		else {
			arr[4] = false;
			alert("생년월일을 확인하세요.");
			return false;
		}
		
		// 성별 확인
		if(signup.mem_gender[0].cheked==false && member.mem_gender[1].checked==false) {
			arr[5] = false;
			alert("성별을 확인하세요.");
			return false;
		}
		else {
			arr[5] = true;
		}
		
		// 휴대폰번호 정규식
		if(phoneJ.test($("#mem_tel").val())) {
			console.log(phoneJ.test($("#mem_tel").val()));
			arr[6] = true;
		}
		else {
			arr[6] = false;
			alert("휴대폰 번호를 확인하세요.");
			return false;
		}
		
		// 파일
		if(($("#mem_fname").val() == "" || $("#mem_fname").val() == null)) {
			arr[7] = true;
			return true;
		}
		
		// 전체 유효성 검사
		var validAll = true;
		for(var i = 0; i < arr.length; i++)	{
			if(arr[i] == false) {
				validAll = false;
			}
		}

		if(validAll == true) {
			alert("회원가입에 성공했습니다.");
		}
		else {
			alert("정보를 다시 확인하세요.");
		}
	});
	
	$("#mem_email").blur(function(){
		if(mailJ.test($(this).val())) {
			$("#email_check").text("");
		}
		else {
			$("#email_check").text("이메일 양식을 확인해주세요.");
			$("#email_check").css("color", "red");
		}
	});
	
	$("#mem_id").blur(function(){
		if(idJ.test($("#mem_id").val())) {
			console.log("true");
			$("#id_check").text("");
		}
		else {
			console.log("false");
			$("#id_check").text("5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
			$("#id_check").css("color", "red");
		}
	});
	$("#mem_pwd").blur(function(){
		if(pwJ.test($("#mem_pwd").val())) {
			console.log("true");
			$("#pwd_check").text("");
		}
		else {
			console.log("false");
			$("#pwd_check").text("숫자, 문자, 특수문자 조합으로 8자 이상 입력하셔야 합니다.");
			$("#pwd_check").css("color", "red");
		}
	});
	$("#mem_pwd_check").blur(function(){
		if($("#mem_pwd").val() != $(this).val()) {
			$("#repwd_check").text("비밀번호가 일치하지 않습니다.");
			$("#repwd_check").css("color", "red");
		}
		else {
			$("#repwd_check").text("");
		}
	})
	$("#mem_name").blur(function(){
		if(nameJ.test($(this).val())) {
			console.log(nameJ.test($(this).val()));
			$("#name_check").text("");
		}
		else {
			$("#name_check").text("한글 2~4자 이내로 입력하세요.(특수기호, 공백 사용 불가)");
			$("#name_check").css("color","red");
		}
	});
	
	// 생년월일 유효성 검사
	$("#mem_birth").blur(function(){
		var dateStr = $(this).val();
		var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지(연)
		var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자(월)
		var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자(일)
		var today = new Date(); // 날짜 변수 선언
		var yearNow = today.getFullYear(); // 올해 연도 가져옴
		
		if(dateStr.length <= 8) {
			// 연도의 경우 1990보다 작거나 yearNow보다 크다면 false를 반환
			if(year > yearNow || year < 1900) {
				$("#birth_check").text("생년월일을 확인해주세요.");
				$("#birth_check").css("color", "red");
			}
			else if(month < 1 || month > 12) {
				$("#birth_check").text("생년월일을 확인해주세요.");
				$("#birth_check").css("color", "red");
			}
			else if(day < 1 || day > 31) {
				$("#birth_check").text("생년월일을 확인해주세요");
				$("#birth_check").css("color", "red");
			}
			else if((month == 4 || month == 6 || month == 9 || month == 11) && day ==31) {
				$("#birth_check").text("생년월일을 확인해주세요.");
				$("#birth_check").css("color", "red");
			}
			else if(month ==2) {
				var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
				if(day > 29 || (day == 29 && !isleap)) {
					$("#birth_check").text("생년월일을 확인해주세요.");
					$("#birth_check").css("color", "red");
				}
			}
			else {
					$("#birth_check").text("");
					birthJ = true;
				}
			}
				// 입력된 생년월일이 8자 초과할때
			else {
				$("#birth_check").text("생년월일을 확인해주세요.");
				$("#birth_check").css("color", "red");
			}
		});		
		// 휴대전화
	$("#mem_tel").blur(function(){
		if(phoneJ.test($(this).val())) {
			console.log(nameJ.test($(this).val()));
			$("#tel_check").text("");
		}
		else {
			$("#tel_check").text("휴대폰 번호를 확인해주세요.");
			$("#tel_check").css("color", "red");
		}
	});
		
	var authNumber;
	$("#sendAuth").click(function(){
		var data = {tel:$("#mem_tel").val()};
		$.post("sendAuthNumber", data, function(data){
			authNumber = data;
		});
	});
	$("#btnAuth").click(function(){
		var checkAuth = $("#checkAuth").val();
		if(authNumber == checkAuth) {
			$("#mem_tel").val($("#mem_tel").val());
			$("#msg").html("인증되었습니다.");
			$("#submit").show();
		}
		else {
			$("#msg").html("인증에 실패하였습니다.")
			$("#submit").hide();
		}
	});

	$("#submit").click(function(){
		var check = $('input:checkbox[id="agree"]').is(':checked');
		if(check == false) {
			alert("약관에 동의하셔야 합니다.");
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
						<a href="#" class="cl-effect-1">RESERVATION</a>
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
									<span style="color: white">회원가입</span>
								</h1>
								
								<form action="signUp.do" class="form-horizontal" method="post" id="signup" enctype="multipart/form-data" role="form">
									<div class="form-group">
										<label class="control-label col-sm-3">이메일 
											<span class="text-danger">*</span>
										</label>
										<div class="col-md-8 col-sm-9">
											 <input type="email" class="form-control" name="mem_email" id="mem_email" placeholder="이메일을 입력하세요." required="required">
											 <div class="check_font" id="email_check"></div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-3">아이디
											<span class="text-danger">*</span>
										</label>
										<div class="col-md-5 col-sm-8">
											<input type="text" class="form-control" name="mem_id" id="mem_id" placeholder="아이디를 입력하세요." required="required">
											<div class="check_font" id="id_check"></div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-3" style="margin-left: -340px;">비밀번호 
											<span class="text-danger">*</span>
										</label>
										<div class="col-md-5 col-sm-8">
											<input type="password" class="form-control" name="mem_pwd" id="mem_pwd" placeholder="비밀번호를 입력하세요." required="required">
											<div class="check_font" id="pwd_check"></div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-3" style="margin-left: -305px;">비밀번호 확인 
											<span class="text-danger">*</span>
										</label>
										<div class="col-md-5 col-sm-8">
											<input type="password" class="form-control" name="mem_pwd_check" id="mem_pwd_check" placeholder="비밀번호를 다시 입력하세요." required="required">
											<div class="check_font" id="repwd_check"></div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-3" style="margin-left: -365px;">성함 
											<span class="text-danger">*</span>
										</label>
										<div class="col-md-8 col-sm-9">
											<input type="text" class="form-control" name="mem_name" id="mem_name" placeholder="성함을 입력하세요." required="required">
											<div class="check_font" id="name_check"></div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-3" style="margin-left: -340px;">생년월일
											<span class="text-danger">*</span>
										</label>
										<div class="col-xs-1">
											<input type="text" class="form-control" name="mem_birth" id="mem_birth" placeholder="ex)19901111" required="required">
											<div class="check_font" id="birth_check"></div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-3" style="margin-left: -360px;">성별 
											<span class="text-danger">*</span>
										</label>
										<div class="col-md-3 col-sm-3" id="gender">
											<label style="color: white; padding-right: 10px;"> 
											    <input name="mem_gender" type="radio" value="Male"> 남성
											</label>     
											<label style="color: white;">
												<input name="mem_gender" type="radio" value="Female"> 여성
											</label>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-3">핸드폰 
											<span class="text-danger">*</span>
										</label>
										<div class="col-md-5 col-sm-8">
											<input type="text" class="form-control" name="mem_tel" id="mem_tel" placeholder="'-'제외" required="required">
											<button id="sendAuth" type="button">인증번호 전송</button>
											<div class="check_font" id="tel_check"></div>
											
											<div class="col-md-5 col-sm-8">
                                               <input type="text" id="checkAuth" class="form-control" placeholder="인증번호를 입력하세요.">
                                               <button id="btnAuth" type="button">확인</button>
                                            </div>
										</div>
										<p id="msg"></p>
									</div>
									
									<div class="form-group">
										<label class="control-label col-sm-3" style="margin-left: -285px;">포트폴리오(파일럿)</label>
										<div class="col-md-5 col-sm-8">
											<input type="file" name="upload" id="upload" class="form-control upload">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-sm-3" style="margin-left: 20px;">이용약관 및 개인정보 보호정책을 읽었으며 이에 동의합니다.
											<span class="text-danger">*</span>
										</label>
											<input type="checkBox" class="form-control" id="agree">
											<button id="btnAgree" onclick="popup()" type="button">약관보기</button>
									</div>
									<div class="form-group">
										<div class="col-xs-offset-2 col-xs-8">
											<button id="submit" type="submit">회원가입</button>
										</div>
									</div>
								</form>
							</section>
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
	<script type="text/javascript">
		function popup() {
			var _width = '1000';
		    var _height = '750';
		 
		    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
		    var _left = Math.ceil(( window.screen.width - _width )/2);
		    var _top = Math.ceil(( window.screen.width - _height )/2); 
		 
		    window.open('policy.do', 'policy', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top );
		}
	</script>
</body>
</html>