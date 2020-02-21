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
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<!-- fadeIn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/mypage/mypage.css">
<link rel="stylesheet" href="css/mypage/mypage_orders.css">
<link rel="stylesheet" href="css/locWea/location.css">

<!-- 제이쿼리 플러그인 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

<script type="text/javascript">
    $(function(){
    	//돋보기 기능 클릭시 실행되는 로직
    	function zoom_btn(id){
    		$("#org_popup_view").attr("src",$("org_img_"+id).attr("src"));
    		$(".bg_black").fadeIn("fast");
    		$(".layer_popup").fadeIn("fast");
    	}
    	
    	function close_btn(){
    		$(".layer_popup").fadeOut("fast");
    		$(".bg_black").fadeOut("fast");
    	}
    	
    	//줌인 줌아웃 기능 추기
    	$(document).ready( function() {
    		$(".org_img_424").hover(
    		    function() {
    		        $(this).animate({ 'zoom': 2.4 }, 400);
    		    },
    		    function() {
    		        $(this).animate({ 'zoom': 1 }, 400);
    		    });
    		});
    	
    	})
    	
    	    			
    </script>
   
</head>
<body>
	<div id="wrap" class="animated fadeIn">
		<!-- header -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- 이미지 돋보기 -->
		<div class="layer_popup">
			<div class="img_orig">
				<img id="org_popup_view" style="width: 500px;"이미지"> <a
					href="#" onclick="close_btn(); return false;" class="close_btn">
				</a>
			</div>
		</div>
		<div class="bg_black"></div>

		<!-- contents -->
		<div id="contents">
			<div class="container">
				<div class="mypage-grid">
					<div id="mypage-top" class="mypage-top"></div>
					<div id="mypage-bottom" class="mypage-grid-nav">
						<div id="mypage-bottom-left">
							<nav>
								<ul>
									<li class="mypage-category"><a href="mypage_orders">서울/경기<i
											class="fas fa-angle-right" id="icon"></i></a></li>
									<li class="mypage-category"><a href="#">강원/충청<i
											class="fas fa-angle-right" id="icon"></i></a></li>
									<li class="mypage-category"><a href="mypage_emoney">전라/경상<i
											class="fas fa-angle-right" id="icon"></i></a></li>
									<li class="mypage-category"><a href="#">제 주<i
											class="fas fa-angle-right" id="icon"></i></a></li>
								</ul>
							</nav>
							<br>
							<img alt="" src="img/location3.png" style="width:200px;"/>
						</div>
						<div id="mypage-bottom-right">
							<div id="mypage-orders">
								<span>추천 비행지역</span> <span> <select
									name="mypage-orders-date" id="mypage-orders-date">
										<option value="1개월">인기순</option>
										<option value="1개월">최신순</option>
										<option value="1개월">제목순</option>
								</select>
								</span>
							</div>
							<hr id="hr">

							<div class="mypage-orders-list" style="padding: 0px 0px;">							
								<div class="mypage-orders-info">
									<form name="fboardlist" id="fboardlist" action="" method="post">
										<div class="list_place" id="updates">
											<div class="li_block"
												style="position: relative; right: 135px;">
												<div class="thumbnail">
													<img id="org_img_424" class="org_img_424"
														src="https://www.enjoydrone.com/data/file/place/2009634417_jkuFqfeB_89981170dfe69065256acf90650d9bd7b902d51b.jpg"
														style="position: relative; left: 10px;">
												</div>
												<div class="txt_area">
													<div class="tit">양천구 신정비행장</div>
													<p class="md_txt">서울특별시 영등포구 문래동5가 31</p>
													<P class="sm_txt">TIP : 비행을 위해 일부 지역만 허가가 된 곳이기 때문에 주의가 필요</p>
													<div class="info_box">
														<div class="link_li">
															<a href="http://map.daum.net/?map_type=TYPE_MAP&q=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C+%EC%98%81%EB%93%B1%ED%8F%AC%EA%B5%AC+%EB%AC%B8%EB%9E%98%EB%8F%995%EA%B0%80+31"
																target="_blank" class=dark_bg>지도보기</a> <a
																href="http://map.daum.net/?map_type=TYPE_MAP&q=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C+%EC%98%81%EB%93%B1%ED%8F%AC%EA%B5%AC+%EB%AC%B8%EB%9E%98%EB%8F%995%EA%B0%80+31&eName=%EC%84%9C%EC%9A%B8%ED%8A%B9%EB%B3%84%EC%8B%9C+%EC%98%81%EB%93%B1%ED%8F%AC%EA%B5%AC+%EB%AC%B8%EB%9E%98%EB%8F%995%EA%B0%80+31"
																target="_blank" class=dark_bg>길찾기</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
							
							<div class="mypage-orders-list" style="padding: 0px 0px;">							
								<div class="mypage-orders-info">
									<form name="fboardlist" id="fboardlist" action="" method="post">
										<div class="list_place" id="updates">
											<div class="li_block"
												style="position: relative; right: 135px;">
												<div class="thumbnail">
													<img id="org_img_424" class="org_img_424"
														src="https://www.enjoydrone.com/data/file/place/2009634417_oUkyG9g3_1c10310a14861e196136faeba65cfeb29f0d30dc.png"
														style="position: relative; left: 10px;">
												</div>
												<div class="txt_area">
													<div class="tit">화성시 서신면 전곡항</div>
													<p class="md_txt">경기도 화성시 서신면 전곡리 979</p>
													<P class="sm_txt">TIP : 수도권 수상레저의 중심지로 유명</p>
													<div class="info_box">
														<div class="link_li">
															<a href="http://map.daum.net/?map_type=TYPE_MAP&q=%EA%B2%BD%EA%B8%B0%EB%8F%84+%ED%99%94%EC%84%B1%EC%8B%9C+%EC%84%9C%EC%8B%A0%EB%A9%B4+%EC%A0%84%EA%B3%A1%EB%A6%AC+979"
																target="_blank" class=dark_bg>지도보기</a> <a
																href="http://map.daum.net/?map_type=TYPE_MAP&q=%EA%B2%BD%EA%B8%B0%EB%8F%84+%ED%99%94%EC%84%B1%EC%8B%9C+%EC%84%9C%EC%8B%A0%EB%A9%B4+%EC%A0%84%EA%B3%A1%EB%A6%AC+979&eName=%EA%B2%BD%EA%B8%B0%EB%8F%84+%ED%99%94%EC%84%B1%EC%8B%9C+%EC%84%9C%EC%8B%A0%EB%A9%B4+%EC%A0%84%EA%B3%A1%EB%A6%AC+979"
																target="_blank" class=dark_bg>길찾기</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
							
							<div class="mypage-orders-list" style="padding: 0px 0px;">							
								<div class="mypage-orders-info">
									<form name="fboardlist" id="fboardlist" action="" method="post">
										<div class="list_place" id="updates">
											<div class="li_block"
												style="position: relative; right: 135px;">
												<div class="thumbnail">
													<img id="org_img_424" class="org_img_424"
														src="https://www.enjoydrone.com/data/file/place/2009634417_zwEralyJ_c258a904cb0cf66500c5523166e4aae8781664c3.jpg"
														style="position: relative; left: 10px;">
												</div>
												<div class="txt_area">
													<div class="tit">서울시 광나루 비행장</div>
													<p class="md_txt">서울시 강동구 천호동 351-1</p>
													<P class="sm_txt">TIP : 수도권에서 사람들이 가장 많이 찾는 비행장중 한곳</p>
													<div class="info_box">
														<div class="link_li">
															<a href="http://map.daum.net/?map_type=TYPE_MAP&q=%EC%84%9C%EC%9A%B8%EC%8B%9C+%EA%B0%95%EB%8F%99%EA%B5%AC+%EC%B2%9C%ED%98%B8%EB%8F%99+351-1"
																target="_blank" class=dark_bg>지도보기</a> <a
																href="http://map.daum.net/?map_type=TYPE_MAP&q=%EC%84%9C%EC%9A%B8%EC%8B%9C+%EA%B0%95%EB%8F%99%EA%B5%AC+%EC%B2%9C%ED%98%B8%EB%8F%99+351-1&eName=%EC%84%9C%EC%9A%B8%EC%8B%9C+%EA%B0%95%EB%8F%99%EA%B5%AC+%EC%B2%9C%ED%98%B8%EB%8F%99+351-1"
																target="_blank" class=dark_bg>길찾기</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
							
							<div class="mypage-orders-list" style="padding: 0px 0px;">							
								<div class="mypage-orders-info">
									<form name="fboardlist" id="fboardlist" action="" method="post">
										<div class="list_place" id="updates">
											<div class="li_block"
												style="position: relative; right: 135px;">
												<div class="thumbnail">
													<img id="org_img_424" class="org_img_424"
														src="https://www.enjoydrone.com/data/file/place/2009634417_wpMoChzx_52bce9065c3b958f8b1b30c6726d4afa88ce721c.jpg"
														style="position: relative; left: 10px;">
												</div>
												<div class="txt_area">
													<div class="tit">포천시 아우라지베개용암 부근</div>
													<p class="md_txt">경기도 포천시 창수면 신흥리 산209-7</p>
													<P class="sm_txt">TIP : 배게처럼 둥글다고 붙혀진 이름 아우라지 용암배게</p>
													<div class="info_box">
														<div class="link_li">
															<a href="http://map.daum.net/?map_type=TYPE_MAP&q=%EA%B2%BD%EA%B8%B0%EB%8F%84+%ED%8F%AC%EC%B2%9C%EC%8B%9C+%EC%B0%BD%EC%88%98%EB%A9%B4+%EC%8B%A0%ED%9D%A5%EB%A6%AC+%EC%82%B0209-7"
																target="_blank" class=dark_bg>지도보기</a> <a
																href="http://map.daum.net/?map_type=TYPE_MAP&q=%EA%B2%BD%EA%B8%B0%EB%8F%84+%ED%8F%AC%EC%B2%9C%EC%8B%9C+%EC%B0%BD%EC%88%98%EB%A9%B4+%EC%8B%A0%ED%9D%A5%EB%A6%AC+%EC%82%B0209-7&eName=%EA%B2%BD%EA%B8%B0%EB%8F%84+%ED%8F%AC%EC%B2%9C%EC%8B%9C+%EC%B0%BD%EC%88%98%EB%A9%B4+%EC%8B%A0%ED%9D%A5%EB%A6%AC+%EC%82%B0209-7"
																target="_blank" class=dark_bg>길찾기</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
							
							<div class="mypage-orders-list" style="padding: 0px 0px;">							
								<div class="mypage-orders-info">
									<form name="fboardlist" id="fboardlist" action="" method="post">
										<div class="list_place" id="updates">
											<div class="li_block"
												style="position: relative; right: 135px;">
												<div class="thumbnail">
													<img id="org_img_424" class="org_img_424"
														src="https://www.enjoydrone.com/data/file/place/2009634417_VOw0Ly7q_42f54cb3e20c902d61cecf731aa0829bf8e16df4.jpg"
														style="position: relative; left: 10px;">
												</div>
												<div class="txt_area">
													<div class="tit">강화군 장화리 해넘이마을</div>
													<p class="md_txt">인천 강화군 화도면 해안남로 2407</p>
													<P class="sm_txt">TIP : 일몰조망지로 표기되어 있을만큼 낙조가 유명한 지역</p>
													<div class="info_box">
														<div class="link_li">
															<a href="http://map.daum.net/?map_type=TYPE_MAP&q=%EC%9D%B8%EC%B2%9C+%EA%B0%95%ED%99%94%EA%B5%B0+%ED%99%94%EB%8F%84%EB%A9%B4+%ED%95%B4%EC%95%88%EB%82%A8%EB%A1%9C+2407"
																target="_blank" class=dark_bg>지도보기</a> <a
																href="https://map.kakao.com/?map_type=TYPE_MAP&q=%EA%B0%95%EC%9B%90+%EC%98%81%EC%9B%94%EA%B5%B0+%EB%AC%B4%EB%A6%89%EB%8F%84%EC%9B%90%EB%A9%B4+%EB%AC%B4%EB%A6%89%EB%B2%95%ED%9D%A5%EB%A1%9C+516&eName=%EA%B0%95%EC%9B%90+%EC%98%81%EC%9B%94%EA%B5%B0+%EB%AC%B4%EB%A6%89%EB%8F%84%EC%9B%90%EB%A9%B4+%EB%AC%B4%EB%A6%89%EB%B2%95%ED%9D%A5%EB%A1%9C+516"
																target="_blank" class=dark_bg>길찾기</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
							    <div class="list_more" id="list_page">
                                 <a class="more_btn" id="more2" onclock="ddList(2)">
                                  ▼
                                  <span id="2">더보기</span>
                                 </a>
                               </div>
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