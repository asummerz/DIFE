<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, , minimum-scale=1, maximum-scale=1">
    <title>DIFE.com</title>
    <!-- 웹폰트 -->
     <!-- 
    <link rel="stylesheet" type="text/css" href="http://api.typolink.co.kr/css?family=RixGo+L:400" />
     -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <!-- fadeIn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
    <!-- 기본 링크 -->
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/admin/admin.css">
    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="css/swiper/swiper.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
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
                        <a href="admin" id="category-1-admin" class="cl-effect-1" >관리자</a>
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