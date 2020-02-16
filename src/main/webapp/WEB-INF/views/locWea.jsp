<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DIFE.com</title>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, , minimum-scale=1, maximum-scale=1">
<!-- 웹폰트 -->
<link rel="stylesheet" type="text/css" href="http://api.typolink.co.kr/css?family=RixGo+L:400" />
<!-- fadeIn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<!-- 기본 링크 -->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/locWea/locWea.css">
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 카카오맵 api -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c1bc92780d9ef9d42ef18dfec57796f1"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	//로그인 로그아웃 전환
	var mem_id = "${mem_id}";

	if (mem_id != '' && mem_id != null) {
		//var login = $("#category-2").find("a:first").html();
		//var logout = $("<a></a>").attr("href","logout").addClass("cl-effect-1").html("LOGOUT");
		//$("#category-2").append(logout);
		$("#sign").attr("href", "logout").html("LOGOUT");
	}
	if (mem_id == '' || mem_id == null) {
		//var login = $("<a></a>").attr("href","signIn").addClass("cl-effect-1").html("LOGIN");
		//$("#category-2").append(login);
		$("#sign").attr("href", "signIn").html("LOGIN");
	}

	// 지도
	function getLocation(position) {
		var latitud = position.coords.latitude;
        var longitude = position.coords.longitude;

        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    	mapOption = { 
	        center: new kakao.maps.LatLng(37.5030637, 127.0242858), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
    	};

		// 지도를 표시할 div와  지도 옵션으로  객체를 생성한다.
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
        // 마커가 표시될 위치
        var markerPosition = new kakao.maps.LatLng(37.5030637, 127.0242858);
        //var markerPosition = new kakao.maps.LatLng(latitud, longitude);

        // 마커를 생성
        var marker = new kakao.maps.Marker({ position:markerPosition });

        marker.setMap(map);
        map.panTo(marker);
	    }
	
	    if(navigator.geolocation) {
	        navigator.geolocation.getCurrentPosition(getLocation, function(error) {
	            consol.log(error.message);    
	        });
	    } else {
	        consol.log("Geolocation을 지원하지 않는 브라우저입니다.");
	    }
		/*	
			// json 사용할 경우
			url:"http://openapi.seoul.go.kr:8088/444d617a4e616962373667537a6364/json/GetParkInfo/1/5/",
			success:function(data){
				var arr = data.GetParkInfo.row;
				
				$.each(arr, function(idx, item){
				var p = $("<p></p>").html(item.PARKING_NAME + "("+item.ADDR+")");
				$("#list").append(p);
			})
		}
	}) 

			// xml 사용할 경우 => JavaScript 키/xml/ 이라고 표기
			url:"http://openapi.seoul.go.kr:8088/444d617a4e616962373667537a6364/xml/GetParkInfo/1/5/",success:function(data){
			// 모든 데이터가 각각 row에 들어있으므로 row로 갖고온다.
			var arr = $(data).find("row");
			//alert(arr.length);
			//결과값  : 5
			$.each(arr, function(idx, item){
				var p = $("<p></p>").html( $(this).find("PARKING_NAME").text() + "," + $(this).find("ADDR").text()).attr("idx",idx);
				$("#list").append(p);

				$(p).click(function(){
					var i = $(this).attr("idx");
					var position = arr[i];

					// 카카오맵api => 지도 생성하기
					// 이동할 위도 경도 위치를 생성합니다 
					// 위도 경도 노드도 문자열 형식으로 나타내기때문에 text()
				    var moveLatLon = new kakao.maps.LatLng($(position).find("LAT").text(), $(position).find("LNG").text());
				    
				    // 지도 중심을 부드럽게 이동시킵니다
				    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
				    map.panTo(moveLatLon);
				});
			});
		}});*/
	})
</script>
</head>
<body>
	<div id="wrap" class="animated fadeIn">
		<!-- header -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- //header -->
			<!-- 지도 -->
			<div id="map" style="width: 100%;height: 500px;"></div>
			<!-- 날씨 -->
			<div id="weather" style="width: 100%;height: 500px;"></div>
		<!-- footer -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- //footer -->
    </div>
</body>
</html>