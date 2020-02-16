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
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<!-- fadeIn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<!-- 기본 css -->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/board/board_insert.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript">
$(function(){
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
	
	$("#input-select").change(function(){
		var select_box = $("select[name=boa_sort]").val();
		console.log(select_box);
		if(select_box == '문의게시판'){
			$("#input-star").hide();
		}else{
			$("#input-star").show();
		}
	})
	
	$("#submit-form").click(function(){
		var select_box = $("select[name=boa_sort]").val();
		if(select_box == '게시판선택'){
			alert("게시판을 선택하세요.");
			return false;
		}else if(select_box == '문의게시판'){
			$("#input-star").val("0");
			$("#input-form").submit();
		}
		else{
			var star = $("#input-star").val();
			if(star == null || star == ''){
				alert("평점을 입력하세요.");
				return false;
			}else{
				$("#input-form").submit();
			}
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
			<div id="board-title">게시글 작성</div>
			<div class="container">
			    <div id="board-input">
			        <form action="board_insert" id="input-form" method="post" enctype="multipart/form-data">
                       <select name="boa_sort" id="input-select">
                       		<option value="게시판선택">게시판선택</option>
                           <option value="문의게시판">문의게시판</option>
                           <option value="후기게시판">후기게시판</option>
                       </select>
                       <span id="input-span">
                        <input type="hidden" name="boa_no" value="${boa_no }">
                        <input type="text" id="input-title" name="boa_title" placeholder="제목을 입력해주세요." required="required"><br>
			            <input type="text" id="input-name" value="${mem_name }" readonly="readonly">
			            <input type="password" id="input-pwd" name="boa_pwd" placeholder="암호" required="required">
			            <input type="number" id="input-star" name="boa_rating" placeholder="평점">
			            </span><br>
			            <textarea id="input-text" name="boa_contents" cols="30" rows="10" placeholder="내용을 작성해주세요." required="required"></textarea><br>
			            <input type="file" id="upload" name="upload" style="background-color: #e0e0e0; margin: 5px 20px; width: 94%">
			            <button type="button" id="submit-form" class="input-btn" style="margin-right: 20px;">작성완료</button>
			            <button type="reset" id="reset" class="input-btn">취소</button>
			        </form>
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