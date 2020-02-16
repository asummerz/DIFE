<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, , minimum-scale=1, maximum-scale=1">
<title>DIFE.com</title>
<!-- 웹폰트 -->
<link rel="stylesheet" type="text/css" href="http://api.typolink.co.kr/css?family=RixGo+L:400" />
<!-- fadeIn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<!-- 기본 css 링크 -->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/drone/droneDetail.css">
<!-- 제이쿼리 플러그인 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 달력 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="css/datepicker/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="js/datepicker/datepicker.js"></script>
<!-- Include language -->
<script src="js/datepicker/i18n/datepicker-ko.js"></script>
<!-- 아이콘 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<script type="text/javascript">
$(function() {
	//로그인 로그아웃 전환
	var mem_id = "${mem_id}";
	
	if(mem_id != '' && mem_id != null){
		//var login = $("#category-2").find("a:first").html();
		//var logout = $("<a></a>").attr("href","logout").addClass("cl-effect-1").html("LOGOUT");
		//$("#category-2").append(logout);
		$("#sign").attr("href","logout").html("LOGOUT");
	}
	if(mem_id == '' || mem_id == null){
		//var login = $("<a></a>").attr("href","signIn").addClass("cl-effect-1").html("LOGIN");
		//$("#category-2").append(login);
		$("#sign").attr("href","signIn").html("LOGIN");
	}
	
	/* 마우스 hover 시 확대 효과 */
    var scale = $('.scale');
    var zoom = scale.data('zoom');
    
    $('.img').on('mousemove',magnify).prepend('<div class="magnifier"></div>').children('.magnifier').css({
        "backgroun":"url('"+scale.attr('src')+"')no-repeat","background-size":scale.width()*zoom+"px "+scale.height()*zoom+"px"
    });
    /*
    var magnifier = $('.magnifier');
    function magnify(e){
        // 마우스 위치에서 .magnify의 위치를 차감해 컨테이너에 대한 마우스 좌표를 얻는다.
        var mouseX = e.pageX - $(this).offset().left;
        var mouseY = e.pageY - $(this).offset().top;
        // 컨테이너 밖으로 마우스가 벗어나면 돋보기를 없앤다.
        if(mouseX < $(this).width() && mouseY < $(this).height() && mouseX > 0 && mouseY > 0){
            magnifier.fadeIn(100);
        }
        else{
            magnifier.fadeOut(100);
        }
        
        // 돋보기가 존재할 때
        if(magnifier.is(":visible")){
            // 마우스 좌표 확대될 이미지 좌표를 일치시킨다.
            var rx = -(mouseX * zoom - magnifier.width() /2 );
            var ry = -(mouseY * zoom - magnifier.height() /2 );

          //돋보기를 마우스 위치에 따라 움직인다.
          //돋보기의 width, height 절반을 마우스 좌표에서 차감해 마우스와 돋보기 위치를 일치시킨다.
          var px = mouseX - magnifier.width() / 2;
          var py = mouseY - magnifier.height() / 2;

          //적용
          magnifier.css({
            left: px,
            top: py,
            backgroundPosition: rx + "px " + ry + "px"
          });
        }
      }
    
    const body = document.querySelector("body");
const modal = document.querySelector(".modal");
const modalButton = document.querySelector(".modal-button");
const closeButton = document.querySelector(".close-button");
const scrollDown = document.querySelector(".scroll-down");
let isOpened = false;

const openModal = () => {
  modal.classList.add("is-open");
  body.style.overflow = "hidden";
};

const closeModal = () => {
  modal.classList.remove("is-open");
  body.style.overflow = "initial";
};

window.addEventListener("scroll", () => {
  if (window.scrollY > window.innerHeight / 3 && !isOpened) {
    isOpened = true;
    scrollDown.style.display = "none";
    openModal();
  }
});

modalButton.addEventListener("click", openModal);
closeButton.addEventListener("click", closeModal);

document.onkeydown = evt => {
  evt = evt || window.event;
  evt.keyCode === 27 ? closeModal() : false;
};
*/

});
</script>
</head>
<body>
	<div id="wrap" class="animated fadeIn">
    	<!-- header -->
    	<jsp:include page="header.jsp"></jsp:include>
        <!-- //header -->
		
		<!-- 드론 상세 상단 -->
		<div id="contents">
	       <!--상품 상세경로 <section class="index-section">
	           <div class="section-container">
	               <ul class="index-ul">
	                   <li class="index-li-item">
	                       <a href="main.html">메인</a>
	                   </li>
                        <li class="index-li-item">
                           ::before
	                       <a href="drone.html">드론</a>
	                   </li>
	                   <li class="index-li-item">
                           ::before
	                       "매빅2프로"
	                   </li>
	               </ul>
	           </div>
	       </section>-->
	       <div id="header-nav">
			<div class="content1">
				<div class="grid">
					<div id="block1">
						<ul>
							<li>
								<li id="border" class="img">
									<img class="scale" src="img/drone/D0001.png" width="450" height="490">
								</li>
                            </li>
                        </ul>
					</div>
					
					<div id="block2">
						<ul style="color: black; font-size: 20px;">
							<li name="droD_name"><p>드론명 : <strong>매빅PRO</strong></p></li>
							<hr>	
							<li name="droD_price"><p>가격 : <strong>200,000원</strong></p></li>
							<hr>
							<li name="droD_series"><p>시리즈명 : <strong>MAVIC</strong></p></li>
							<li name="droD_made"><p>제조사명 : <strong>DJI</strong></p></li>
							<hr>
						<!-- 캘린더 선택 시 위에 대여일과 반납일을 선택하세요. 문구뜨도록 설정하기 -->
						<!-- 캘린더 -->	
		                <ul class="search">
		                    <div class="block">
		                        <div id="calendar" name="calendar">
		                          	 대여일<i class="fa fa-calendar-check-o" aria-hidden="true"></i>&nbsp;&nbsp;
		                        	<input type="text" data-range="true" data-multiple-dates-separator=" - " data-language="ko"
		                            class="datepicker-here" style="width:180px; height: 25px;"/>               
		                        </div>
		                    </div>
		                </ul>
							<hr>
							<li name="droD_ren"><p>대여점 : 
								<span id="opr">
									<select id="operR" name="operR" style="width: 150px; height: 30px;">
										<option value="R0001">파주점</option>
										<option value="R0002">잠실점</option>
										<option value="R0003">서귀포점</option>
										<option value="R0004">해운대점</option>
										<option value="R0005">둔산점</option>
										<option value="R0006">강릉점</option>
										<option value="R0007">부산점</option>
										<option value="R0008">대구점</option>
										<option value="R0009">울산점</option>
										<option value="R0010">여수점</option>
										<option value="R0011">목포점</option>
										<option value="R0012">오산점</option>
										<option value="R0013">속초점</option>
										<option value="R0014">포항점</option>
										<option value="R0015">김포점</option>
									</select>
								</span>
							</p></li>
							<li name="droD_amount"><p>수    량 :							 
								<span id="opa">
									<select id="operA" name="operA" style="width: 150px; height: 30px;">
										<option value="amt1">1</option>
										<option value="amt2">2</option>
										<option value="amt3">3</option>
										<option value="amt4">4</option>
										<option value="amt5">5</option>
										<option value="amt0">6개 이상(별도 문의)</option>
										<!-- 5개 이상 옵션선택 시 대여수량 따로 기재 or 문의글 남기도록 유도? -->
									</select>
								</span>
							</p></li>
							<hr>
							
							<!-- 캘린더 -->						
							<!--<div id="form-group1">
                                 <span class="control-label" for="datepicker"><strong style="color: white;">대여일 : </strong><span class="text-danger">*</span>
                                 <!-- <div class="col-xs-1"> -->
                                     <!-- <input id="datepicker1" type="text" name="mem_birth">
                                 <!-- </div> --> 
                                <!-- </span> 
                            </div> -->
                                 
							<!--<div id="form-group2">
                                 <span class="control-label" for="datepicker"><strong style="color: white;">반납일 : </strong><span class="text-danger">*</span>
                                 <!-- <div class="col-xs-1"> --> 
                                    <!-- <input id="datepicker2" type="text" name="mem_birth">
                                 <!-- </div> --> 
                                <!-- </span> 
                            </div> 
							
                            <!--  
                            <li>							
							<div>
								<span id="calendar" class="search1"><strong>대여일 : </strong></span>
								<input type="text" id="datepicker1" style="width: 150px; height: 30px;">
	               				<script src="pikaday.js"></script>
	                   			<script>
	                       			var picker = new Pikaday({ field: document.getElementById('datepicker') });
	                       		</script>
	                       	</div>	
                       		</li>
							<li>       							
							<div>
								<span id="calendar" class="search1"><strong>반납일 : </strong></span>
								<input type="text" id="datepicker2" style="width: 150px; height: 30px;">
	               				<script src="pikaday.js"></script>
	                   			<script>
	                       			var picker = new Pikaday({ field: document.getElementById('datepicker') });
	                       		</script>
	                       	</div>
                       		</li>
                       		-->
                       		 
							<li>						
							<a href="payment.html">
								<button type="button" class="btn btn-outline-dark btn-sm" style="width: 150px; height: 30px;"><strong>주문하기</strong></button>
							</a>
							</li>
							<li>
							<!-- * modal : 다른 소스로 변경할 예정 -->
							<!-- 장바구니 담기 클릭시 모달 -->	                                             
	                       <!--    <div class="scroll-down">SCROLL DOWN
  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
  <path d="M16 3C8.832031 3 3 8.832031 3 16s5.832031 13 13 13 13-5.832031 13-13S23.167969 3 16 3zm0 2c6.085938 0 11 4.914063 11 11 0 6.085938-4.914062 11-11 11-6.085937 0-11-4.914062-11-11C5 9.914063 9.914063 5 16 5zm-1 4v10.28125l-4-4-1.40625 1.4375L16 23.125l6.40625-6.40625L21 15.28125l-4 4V9z"/> 
</svg></div>
<div class="container"></div>

<div class="modal">
  <div class="modal-container">
    <div class="modal-left">
      <h1 class="modal-title">장바구니 담기 완료 ◀:D</h1>
      <p class="modal-desc">장바구니로 이동하시겠습니까?</p>
      
      <div class="modal-buttons">
        <button class="input-button-1">예</button>
        <button class="input-button-2">아니오</button>
      </div>  
    </div>
    <div class="modal-right">
      <img src="https://images.unsplash.com/photo-1512486130939-2c4f79935e4f?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=dfd2ec5a01006fd8c4d7592a381d3776&auto=format&fit=crop&w=1000&q=80" alt="장바구니 담기 성공">
    </div>
    <button class="icon-button close-button">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50">
    <path d="M 25 3 C 12.86158 3 3 12.86158 3 25 C 3 37.13842 12.86158 47 25 47 C 37.13842 47 47 37.13842 47 25 C 47 12.86158 37.13842 3 25 3 z M 25 5 C 36.05754 5 45 13.94246 45 25 C 45 36.05754 36.05754 45 25 45 C 13.94246 45 5 36.05754 5 25 C 5 13.94246 13.94246 5 25 5 z M 16.990234 15.990234 A 1.0001 1.0001 0 0 0 16.292969 17.707031 L 23.585938 25 L 16.292969 32.292969 A 1.0001 1.0001 0 1 0 17.707031 33.707031 L 25 26.414062 L 32.292969 33.707031 A 1.0001 1.0001 0 1 0 33.707031 32.292969 L 26.414062 25 L 33.707031 17.707031 A 1.0001 1.0001 0 0 0 32.980469 15.990234 A 1.0001 1.0001 0 0 0 32.292969 16.292969 L 25 23.585938 L 17.707031 16.292969 A 1.0001 1.0001 0 0 0 16.990234 15.990234 z"></path>
</svg>
      </button>
  </div>
  <button class="modal-button">Click here to login</button>
</div> -->
	                       <button id="btnBasket" type="button" class="btn btn-outline-dark btn-sm" style="width: 150px; height: 30px;"><strong>장바구니 담기</strong>                               
                            </button>
                            <!-- * modal 추가 예정 
                            <script>
                                $("#btnBasket").click(function(){
                                    alert("장바구니에 담았어요!")
                                });   
                            </script> -->
							                                                                  
	                        </li>
							<li>
							<a href="drone.jsp">
								<button type="button" class="btn btn-outline-dark btn-sm" style="width: 150px; height: 30px;"><strong>쇼핑 계속하기</strong></button>
							</a>
							</li>
						</ul>
					</div>		
				</div>
			</div>
			<hr>

			<!-- 드론 상세 정보 -->
			<div class="content2">
				<div class="block">
					<img src="img/drone/D0019_dt.png">
				</div>
			</div>
			
			<!-- 상품 정책 -->
       		<jsp:include page="productPolicy.jsp"></jsp:include>
	        <!-- //product policy -->
			
			<!-- 질문, 후기게시판 불러오는지? -->
		
			<!-- footer -->
      		<jsp:include page="footer.jsp"></jsp:include>
	        <!-- //footer -->
	    </div>
    </div>
  </body>
</html>