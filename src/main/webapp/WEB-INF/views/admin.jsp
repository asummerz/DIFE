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
<!-- 기본 링크 -->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/admin/admin.css">
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
			console.log("클릭");
			//var mem_id = "${mem_id}";
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
        
       <div id="contents">
       
        <!-- contents -->
        <div class="container">
             
               
            <div id="content-top">
                <!-- contents-search 회원검색 -->
                <div id="contents-search">
                     <select style="width: 80px; height: 29.5px"> 
                            <option>ID</option>
                            <option>이름</option>
                            <option>이메일</option>
                        </select>
                        <input type="text" style="width: 200px; height: 25px;">
                        <button type="submit" style="width: 80px; height: 30px; border-radius: 5px; background-color: #231F20; color: white">검색</button>
                </div>
                <!-- //contents-search 회원검색 -->
                
            </div>
            
            <!-- content-center 회원정보 -->
            <div id="content-center">
                <div id="content-center-center">
                      
                       <div id="content-center-center-top">
                           <p style="text-align: right">총 회원수: &nbsp; ${admin }명</p><br>
                           
                            <!-- 탭메뉴 만들기 -->
                            <dl>
                               <dt>회원 관리</dt>
                               <dd>
                                  <table class="table-info">
                                  <colgroup>
                                      <col width="150px">
                                      <col width="150px">
                                      <col width="150px">
                                      <col width="100px">
                                      <col width="200px">
                                  </colgroup>
                              
                                  <thead>
                                      <th scope="col"><input type="checkbox"></th>
                                      <th scope="col">ID</th>
                                      <th scope="col">NAME</th>
                                      <th scope="col">AGE</th>
                                      <th scope="col">E-MAIL</th>
                                   </thead>

								<tbody class="member-info">
								
								</tbody>
                                   
                                   </table>
                               </dd>

                               <dt>게시판 관리</dt>
                               <dd class="hidden">
                                 <table class="table-board">
                                  <colgroup>
                                      <col width="100px">
                                      <col width="100px">
                                      <col width="200px">
                                      <col width="150px">
                                      <col width="200px">
                                      <col width="100px">
                                      <col width="200px">
                                  </colgroup>
                              
                                  <thead>
                                      <th scope="col"><input type="checkbox"></th>
                                      <th scope="col">번호</th>
                                      <th scope="col">제목</th>
                                      <th scope="col">작성자</th>
                                      <th scope="col">작성일</th>
                                      <th scope="col">조회수</th>
                                      <th scope="col">답변유무</th>
                                   </thead>
                                   
                                   <tbody class="board-info">
								
									</tbody>

                                   </table>
                               </dd>
                               
                               <dt>기타</dt>
                               <dd class="hidden">
                                  뭐 아무거나
                               </dd>
                            </dl>
                            <!-- //탭메뉴 만들기 -->
                            
                           
                               
                                                                                     

                       </div>
                       
                       <div id="content-center-center-button">
                           <span id="content-bottom-update">
                            <a href="admin_update"><button type="submit" style="margin-right: 10px;">수정</button></a>
                            <button type="submit">삭제</button>
                           </span>
                       
                           <span id="content-bottom-count">
                               
                       			<ul class="pagination" style="padding-left: 50px;">
                            	<a href="#">이전</a>
	                            <a href="#">1</a>
	                            <a href="#">2</a>
	                            <a href="#">3</a>
	                            <a href="#">4</a>
	                            <a href="#">5</a>
	                            <a href="#">다음</a>
                        		</ul>
                           </span>
                       </div>
                </div>
            </div>
       
        </div>
        </div>
        <!-- //contents -->
 x
        <!-- footer -->
         <jsp:include page="footer.jsp"></jsp:include>
        <!-- //footer -->
    </div>
       <!-- Swiper JS -->
    <script src="js/swiper/swiper.min.js"></script>
     <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  </script>
   
    
    <!-- 탭 메뉴 스크립트 -->
    <script>
        var $menuEle = $('dt'); // 탭메뉴를 변수에 지정
        $menuEle.click(function() { // 탭메뉴 클릭 이벤트
        $('dd').addClass('hidden');
        $(this).next().removeClass('hidden');
        })
    </script>
    <!-- //탭 메뉴 스크립트 -->
    
    <!-- admin 페이지 회원 List -->
    <script>
    	$(function(){
    		$.ajax({url:"AdminList", success:function(data){
    			var list = eval(data);
    			$.each(list, function(idx, item){
    				var tr = $("<tr></tr>");
    				var td = $("<td></td>");
    				var input = $("<input/>").attr("type", "checkbox");
    				var check = $(td).append(input);
    				var id = $("<td></td>").html(item.mem_id);
    				var name = $("<td></td>").html(item.mem_name);
    				var age = $("<td></td>").html(item.mem_birth);
    				var email = $("<td></td>").html(item.mem_email);
    				
    				$(tr).append(check,id,name,age,email);
    				$(".member-info").append(tr);
    			});
    		}}) 		
    	});
    </script>
    <!-- //admin 페이지 회원 List -->
    
    <!-- admin 페이지 게시판 List -->
    <script>
    	$(function(){
    		$.ajax({url:"BoardList", success:function(data){
    			var list = eval(data);
    			$.each(list, function(idx, item){
    				var tr = $("<tr></tr>");
    				var td = $("<td></td>");
    				var input = $("<input/>").attr("type", "checkbox");
    				var check = $(td).append(input);
    				var no = $("<td></td>").html(item.boa_no);
    				var title = $("<td></td>").html(item.boa_title);
    				var first = $("<td></td>").html(item.first);
    				var regdate = $("<td></td>").html(item.boa_regdate);
    				var view = $("<td></td>").html(item.boa_view);
    				var answer = $("<td></td>").html(item.boa_answer);
    				
    				$(tr).append(check,no,title,first,regdate,view,answer);
    				$(".board-info").append(tr);
    			});
    		}}) 		
    	});
    </script>
    <!-- //admin 페이지 게시판 List -->
</body>
</html>