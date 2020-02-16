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
<link rel="stylesheet" href="css/board/board_detail.css">
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

	//댓글달기
	$("#board-re-btn").click(function(){
		if(mem_id != '' && mem_id != null){
			var board_re = $("#board-re").val();
			$.ajax({type:"post",
					url:"/board_insert",
					data: {"mem_no":"${mem_no}","mem_name":"${mem_name}", "boa_contents":board_re, "boa_no":"${b.boa_no}","boa_sort":"${b.boa_sort}"},
					success:function(data){
						/* var list = eval(data);
						$.each(list, function(idx, item){
							var name = $("<span></span>").html(item.mem_name+"&nbsp;&nbsp;&nbsp;");
							var re = $("<span></span>").html(itme.boa_contents);
							var p = $("<p></p>");
							$(p).append(name, re);
							$("#board-detail-re").append(p);
						}) */
					}})
		}else{
			alert("로그인을 해주세요.");
			location.href="signIn";
		}
	})
	
	$("#delBoard").click(function(){
		var re = confirm("정말로 삭제할까요?");
		if(re == true) {
			var boa_no = $("#boa_no").val();
			location.href="board_delete?boa_no="+${b.boa_no};
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
			<div id="orders-title">게시글 상세보기</div>
			<div class="container">
                <div id="board-detail-href">
                   <%-- <a href="board_insert?boa_no=${b.boa_no }">댓글</a> --%>
                   <a href="board_update?boa_no=${b.boa_no }">수정</a>
                   <a href="#" id="delBoard">삭제</a>
                   <a href="board">목록</a>
                </div>
                <input type="hidden" id="boa_no" value="${b.boa_no }">
                <%-- <input type="hidden" id="mem_id" value="${b.mem_id }"> --%>     
			    <div id="board-wrapper">
			        <div id="board-img" class="board-input">
			            <img src="img/board/${b.boa_fname }" id="board-detail-img">
			        </div>
			        <div id="board-text" class="board-input">
			            <div id="board-detail-title">
			                <span>${boa_title }</span>
			            </div>
			            <div id="board-detail-info">
			                 <span>작성자: ${b.mem_name }&nbsp;&nbsp;&nbsp;&nbsp;</span>
			                 <span>등록일: ${b.regdate }&nbsp;&nbsp;&nbsp;&nbsp;</span>
			                 <span>별점: ${b.boa_rating }</span>
			            </div>
			            <div>
			                <textarea readonly="readonly" id="board-textarea" cols="50" rows="10">${b.boa_contents }</textarea>
			            </div>
			            <div id="board-detail-re">
			            </div>
			            <div style="text-align: center;">
                            <input type="text" id="board-re" placeholder="댓글을 입력해주세요.">
                            <button type="button" id="board-re-btn">댓글 쓰기</button>
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