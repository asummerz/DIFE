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
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/mypage/mypage.css">
    <link rel="stylesheet" href="css/mypage/mypage_orders.css">
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

    	/* 날자를 리스트 보여주기위해 포맷하기위한 function */
    	function date_to_str(format)
		{
		    var year = format.getFullYear();
		    var month = format.getMonth() + 1;
		    if(month<10) month = '0' + month;
		    var date = format.getDate();
		    if(date<10) date = '0' + date;
		    return year + "." + month + "." + date;
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
	 	var month = 12;
		var pageNUM = 1;
		var isEnd = false;
		
		//전체 페이지 출력 메소드
	/* 	function selectAll(search){ */
			search = {"month":month,"pageNUM":pageNUM,"mem_id":mem_id};
			$.ajax({type: "get",
				url:"ordersList.do",
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
						var date = new Date(item.ord_date);
						var ord_date = date_to_str(date);
						var list_div = $('<div></div>').addClass("mypage-orders-list");
						var a = $("<a href=ordersDetail.do?ord_no="+item.ord_no+"&mem_id="+mem_id+"><div class='mypage-orders-title'>["+ord_date+"] &nbsp;주문번호: "+item.ord_no+"&nbsp;&nbsp;/&nbsp; 상세: "+item.ord_amount+" 건<i class='fas fa-angle-right' id='icon'></i></div></a><hr>")
						var info_div=$('<div></div>').addClass("mypage-orders-info");
						var ul=$("<ul></ul>")
						var li =$("<li></li>").html("결제금액&nbsp;&nbsp;&nbsp;"+item.ord_price+"원")
						var li2 =$("<li></li>").html("주문상태&nbsp;&nbsp;&nbsp; 결제완료")
						$(ul).append(li,li2);
						$(info_div).append(ul);
						$(list_div).append(a,info_div);
						$("#mypage-bottom-right").append(list_div);
					}) 
			}})
		/* } */

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
    	//select 클릭시.
		$("#mypage-orders-date").change(function(){
			
			$(".mypage-orders-list").empty();
			pageNUM = 1;
			selectAll(search);
			//val을 변수로 담고 그 변수를 보내준다.
			month =Number($(this).val());
			/* console.log(month);
			console.log(typeof(month)) */
			return false
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
            <div class="container">
               <div  class="mypage-grid">
                <jsp:include page="mypage.jsp"></jsp:include>
                <div id="mypage-bottom" class="mypage-grid-nav">
                    <div id="mypage-bottom-left">
                        <nav>
                            <ul>
                                <li class="mypage-category"><a href="mypage_orders">주문내역<i class="fas fa-angle-right" id="icon"></i></a></li>
                                <li class="mypage-category"><a href="mypage_board">내글관리<i class="fas fa-angle-right" id="icon"></i></a></li>
                                <li class="mypage-category"><a href="mypage_emoney">적립금 및 쿠폰<i class="fas fa-angle-right" id="icon"></i></a></li>
                                <li class="mypage-category"><a href="#">개인정보수정<i class="fas fa-angle-right" id="icon"></i></a></li>
                            </ul>
                        </nav>
                    </div>
                    <div id="mypage-bottom-right">
                       <div id="mypage-orders">
                           <span>주문내역</span>
                           <span>
                               <select name="mypage-orders-date" id="mypage-orders-date">
                                   <option value="1개월">전체</option>
                                   <option value="1개월">1개월</option>
                                   <option value="1개월">3개월</option>
                               </select>
                           </span>
                        </div><hr id="hr">
                  <!--       <div class="mypage-orders-list">
                            <a href="ordersDetail"><div class="mypage-orders-title">[2019.07.14] MAVIC-PRO 외 1건<i class="fas fa-angle-right" id="icon"></i></div></a><hr>
                            <div class="mypage-orders-info">
                                <ul>
                                    <li>주문번호&nbsp;&nbsp;&nbsp; 156928405958</li>
                                    <li>결제금액&nbsp;&nbsp;&nbsp; 55,000 원</li>
                                    <li>주문상태&nbsp;&nbsp;&nbsp; 반납완료</li>
                                </ul>
                            </div>
                        </div>    
                        <div class="mypage-orders-list">
                            <a href="ordersDetail"><div class="mypage-orders-title">[2019.10.14] MAVIC-PRO 외 1건<i class="fas fa-angle-right" id="icon"></i></div></a><hr>
                            <div class="mypage-orders-info">
                                <ul>
                                    <li>주문번호&nbsp;&nbsp;&nbsp; 1569888755958</li>
                                    <li>결제금액&nbsp;&nbsp;&nbsp; 55,000 원</li>
                                    <li>주문상태&nbsp;&nbsp;&nbsp; 대여중</li>
                                </ul>
                            </div>
                        </div> -->
                        
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