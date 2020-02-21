<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="icon" type="image/png" href="http://example.com/myicon.png"> -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, , minimum-scale=1, maximum-scale=1">
<title>DIFE.com</title>
<!-- css 링크
<link rel="stylesheet" href="css/intro.css"> -->
<!-- 제이쿼리 플러그인 -->
<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
	/* document.getElementById('difeVideo').addEventListener('ended', function(){
		location.href="/main";
	}); */
</script>
</head>
<body>
	<header>
		<h1>
     		<a href="/main"><img alt="메인화면으로 페이지이동" src="img/logo/DIFE_logo1.png" width="180px" style="margin-left: 1350px;"></a>
    	</h1>
	<!-- <video autoplay muted id="difeVideo"> -->
	<video id="difeVideo" playsinline autoplay loop muted>
		<source src="video/intro.mp4" type="video/mp4"/>
		<source src="video/intro.mp4" type="video/webm"/>
	</video>
	<!-- <div class="content">
		<button id="btn" onclick="location.href='/main'">DIFE MAIN</button>
	</div> -->
	</header>
</body>
</html>