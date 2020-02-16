<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="css/board/board.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	
	$("#write").click(function(){
		if(mem_id == null || mem_id == ''){
			alert("로그인을 해주세요.");
			location.href="signIn";
		}else{
			$("#write").attr("href","board_insert");
		}
	})

	$("#select").change(function(){
		var boa_sort = $(this).children("option:selected").text();
		location.href="/board?boa_sort="+boa_sort;
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
			<div id="content1">
				<div class="container">
					<select id="select" name="boa_sort" style="width: 100px; height: 30px;">
						<option>선택하세요</option>
						<option value="전체게시판">전체게시판</option>
						<option value="문의게시판">문의게시판</option>
						<option value="후기게시판">후기게시판</option>
					</select>
					<table class="table table-striped">
						<tr style="font-size: 15px; font-weight: bold;">
							<td>번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>작성일</td>
							<td>조회수</td>
							<!-- <td>답변유무</td> -->
						</tr>
						<c:forEach var="b" items="${list }">
							<tr>
								<td>${b.boa_no }</td>
								<td>
									<%-- <c:if test="${b.boa_level > 0 }">
										<c:forEach begin="1" end="${b.boa_level }">
											&nbsp;&nbsp;
										</c:forEach>
									</c:if> --%>
									<a href="board_detail?boa_no=${b.boa_no }">${b.boa_title }</a>
								</td>
								<td>${b.mem_name }</td>
								<td>${b.regdate }</td>
								<td>${b.boa_view }</td>
							<%-- 	<td>${b.boa_answer }</td> --%>
							</tr>
						</c:forEach>
					</table>
					<a id="write" class="btn btn-default pull-right"
						style="width: 70px; font-size: 15px; background-color: #231F20; color: white">글쓰기</a>
					<div class="text-center">
						<ul class="pagination" style="padding-left: 50px;">
							<li><a href="#">이전</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">다음</a></li>
						</ul>
					</div>
					<div class="navbar-search" id="search">
						<select style="width: 100px; height: 29px;">
							<option>제목</option>
							<option>작성자</option>
							<option>내용</option>
						</select> <input type="text" class="search-query" placeholder="검색어"
							style="width: 350px; height: 29px;">
						<button type="submit"
							style="width: 100px; height: 29px; border-radius: 5px; background-color: #231F20; color: white">검색</button>
					</div>
				</div>
			</div>
			<div id="content2"></div>
			<div id="content3"></div>
		</div>
		<!-- //contents -->

		<!-- footer -->
		<jsp:include page="footer.jsp"></jsp:include>
		<!-- //footer -->
	</div>
</body>
</html>