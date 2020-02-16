<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DIFE.com</title>
 <!-- 웹폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <!-- fadeIn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
    <!-- 기본 css -->
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/orders/basket.css">
    <!-- 제이쿼리 플러그인 -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <!--  boot -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
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
	var search = $("#search").text();
	$("#search").hide();
	$("#btn_search").click(function(){
		
		$("#search").show();
	})
})
</script>
<style type="text/css">
	/*style.css */
	.btn_grid{
		display:grid;
		grid-template-columns:800px 300px 50px;
		margin-bottom:20px;
		
	}
	.btn_area{
		margin-bottom:20px;
	}
	#wrap {
   text-align: none;
	}
	.container>h2{
		text-align: left;
	}

	.svg-inline--fa.fa-w-16 {
	padding-top:10px;
	padding-bottom:11px;
	
	width:2em;
    height:3em;
	}
	.field{
	text-align:center;
	width:100%;
	padding:5px;
	}
	</style>
 <div id="wrap" class="animated fadeIn">
 		<!-- header -->
       <jsp:include page="header.jsp"></jsp:include>
       <!-- header -->
       <!-- content -->
       <div class="container">
       <h2>이미지 갤러리</h2><hr>
       
       		<div class="btn_grid">
       		<div class="btn_grid1">
       			
       		</div>
       		<div class="btn_grid2">
       			<input type="text" class="field" name="search" id="search">
       		</div>
       		<div><a href="javascript:void(0)" id="btn_search"><i class="fas fa-search"></i></a></div>
       		
       		</div>
       		<div class="row">
       			<div class="col-md-4">
       				<a href="img/drone/D0001.png" class="thumbnail">
       					<p>시티이미지1</p>
       					<img src="img/drone/D0001.png">
       				</a>
       			</div>
       			<div class="col-md-4">
       				<a href="img/drone/D0001.png" class="thumbnail">
       					<p>시티이미지1</p>
       					<img src="img/drone/D0001.png">
       				</a>
       			</div>
       			<div class="col-md-4">
       				<a href="img/drone/D0001.png" class="thumbnail">
       					<p>시티이미지1</p>
       					<img src="img/drone/D0001.png">
       				</a>
       			</div>
       			
       		</div>
       		<div class="row">
       			<div class="col-md-4">
       				<a href="img/drone/D0001.png" class="thumbnail">
       					<p>시티이미지1</p>
       					<img src="img/sns/sns01.png">
       				</a>
       			</div>
       			<div class="col-md-4">
       				<a href="img/drone/D0001.png" class="thumbnail">
       					<p>시티이미지1</p>
       					<img src="img/sns/sns01.png">
       				</a>
       			</div>
       			<div class="col-md-4">
       				<a href="img/drone/D0001.png" class="thumbnail">
       					<p>시티이미지1</p>
       					<img src="img/sns/sns01.png">
       				</a>
       			</div>
       		</div>
       </div> 
       <!-- //content -->
       
       
        <!-- footer -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- //footer -->
 </div>
</body>
</html>