<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="css/pilot/pilot.css">
<!-- 제이쿼리 플러그인 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
		 
		//지역 검색
		var arr = [ '선택', '서울', '인천', '경기', '세종', '강원', '대구', '대전', '광주', '울산', '부산', '제주' ];
		$.each(arr, function(idx, loc) {
			var search_loc = $("<option></option>").attr({
				"value" : arr[idx],
				"idx" : idx
			}).html(arr[idx]);
			$("#pil-location").append(search_loc);
		})

		var search = "";
		var pageNUM = 1;
		var isEnd = false;
		
		//전체 페이지 출력 메소드
		function selectAll(search){
			search = {"category":$("#pil-category").val(), "location":$("#pil-location").val(), "pageNUM":pageNUM};
			$.ajax({type: "get",
				url:"selectPil_list",
				data: search,
				dataType: "json",
				contentType:"application/json;charset=UTF-8",
				success:function(data){
					var len = data.length;
					//셀렉된 데이터의 길이가 5보다 작으면 무한스크롤을 정지시킨다.
					if(len < 5){
						isEnd = true;
					}else{
						isEnd = false;
					}
					$.each(data, function(idx, item){
						var li = $("<li></li>");
						var ul = $("<ul></ul>").addClass("pil-list");
						
						var img = $("<img/>").addClass("pil-list-img").attr("src","img/pilot/"+item.pil_photo);
						var title = $("<a></a>").html(item.pil_title).attr({"href":"pilotDetail?info="+item.list_no,"id":"pil-list-title"});
						
						var name = $("<dd></dd>").html("강사명: "+item.mem_name).attr("id","pil-name").addClass("pil-list-info");
						var loc = $("<dd></dd>").html("지역: "+item.pil_locInfo).attr("id","pil-loc").addClass("pil-list-info");
						var info = $("<dd></dd>").html("강의 정보: "+item.pil_info).attr("id","pil-info").addClass("pil-list-info");
						var star = $("<dd></dd>").html("별점: "+item.pil_star+".0").attr("id","pil-star").addClass("pil-list-info");
						var dd_img = $("<dd></dd>").append(img);
						var dd_title = $("<dd></dd>").addClass("pil-list-title").append(title);
						
						$(li).append(dd_img, dd_title, name, loc, info, star);
						$(ul).append(li);
						$(".pilot-container").append(ul);
					})
			}})
		}

    	//전체 페이지 출력
		selectAll(search);
	    		
		//무한스크롤
		$(window).scroll(function(){
			var maxHeight = $(document).height();
			var currentScroll = $(window).scrollTop() + $(window).height();
			
			if(currentScroll+50 > maxHeight){
				if(isEnd == true){
		    		return;
		    	}else{
		    		pageNUM++;
		    		selectAll(search);
		    	}
			}
		})
    	
		//검색버튼 클릭시
     	$("#pil-search-btn").click(function(){
    		$(".pilot-container").empty();
    		pageNUM = 1;
    		selectAll(search);
    		//페이지가 다시 로딩되는 것을 방지한다.
    		return false;
	    })
})
</script>
</head>
<body>
    <div id="wrap" class="animated fadeIn">
       <!-- header -->
        <div id="header">
             <div id="header-top">
               <div id="category">
                    <span id="category-1" class="animated fadeInUp">
                        <a href="main"><img src="img/logo/DIFE_logo3.png" id="logo"></a>
                        <a href="drone" class="cl-effect-1">드론</a>
                        <a href="pilot" class="cl-effect-1">파일럿</a>
                        <a href="location" class="cl-effect-1">비행정보</a>
                        <a href="support" class="cl-effect-1">고객지원</a>
                        <a href="board" class="cl-effect-1">커뮤니티</a>
                    </span>
                     <span id="category-2" class="animated fadeInUp">
                        <a id="sign" class="cl-effect-1"></a>
                        <a class="cl-effect-1" id="mypage">MYPAGE</a>
                        <a href="basket" class="cl-effect-1"><i class="fas fa-shopping-basket"></i></a>
                   </span>
                </div>
            </div>
            <div id="header-nav">
            <form action="pilot" id="pilot-nav">
               <span id="pil-search">
              	 <span>카테고리</span>
                    <select name="category" id="pil-category">
                    	<option value="2">선택</option>
                        <option value="1">촬영</option>
                        <option value="0">교육</option>
                    </select>
                    <!-- 제이쿼리 사용 -->
                    <span>지역</span>
                    <select name="location" id="pil-location">
                    </select>
                    <button id="pil-search-btn">검색</button>
                </span>
                
                </form>
            </div>
        </div>
        <!-- //header -->

        <!-- contents -->
        <div id="contents">
            <div class="container">
                <div class="pilot-container">
                <!-- 
             	<c:forEach var="p" items="${list }">
	             	<ul class="pil-list">
	                    <li>
	                            <dd><img class="pil-list-img" src="img/pilot/${p.pil_photo }" ></dd>
	                            <dd class="pil-list-title"><a href="pilotDetail?info=${p.list_no }" id="pil-list-title">${p.pil_title }</a></dd>
	                            <dd class="pil-list-info" id="pil-name">강사명:&nbsp; ${p.mem_name }</dd>
	                            <dd class="pil-list-info" id="pil-loc">지역:&nbsp; ${p.pil_locInfo }</dd>
	                            <dd class="pil-list-info" id="pil-info">강의 정보:&nbsp; ${p.pil_info }</dd>
	                            <dd class="pil-list-info" id="pil-star">별점:&nbsp; ${p.pil_star }.0</dd>
	                    </li>
	                </ul>
             	</c:forEach>
             	 -->
                 </div>
                 
                 <!-- 페이징처리 
                 <div id="pilot-paging">
                     <span class="inner_paging">
              			${page }
                     </span>
                 </div>
                 -->
                 <!-- //페이징처리 -->
            </div>
        </div>
        <!-- //contents -->

        <!-- footer -->
         <jsp:include page="footer.jsp"></jsp:include>
        <!-- //footer -->
    </div>
<script>
window.onscroll = function() {myFunction()};

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