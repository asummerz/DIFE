<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>소켓 서버</title>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="css/slick.css" />
    <link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="css/font-awesome.min.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style.css" />

<style type="text/css">
#chat_box {
	
	width: 500px;
	height: 600px;
	border: 2px groove #00A8B3;
	text-align: left;
    font-size: 16px; 
    
    
}
.soso {	
	margin-left: 10px;
    margin-top: 3px;
	text-decoration: none;
	margin-right: 10px;
}

#msgc {
    
	width: 455px;
	height:50px;
	text-align: right;
	border: 2px groove #00A8B3;
	
	 
}
#name {
    text-align: right;
	border: 2px groove #00A8B3;
	
}

#msgc_process {
    position: relative;
	width: 90px;
    left: 430px;
    margin-top: 10px;
}

</style>

</head>
<body>
		
	<div id="chat_box" style="overflow: scroll;"></div>
	ID: &nbsp;<input id="name" class="name" type="text" readonly="readonly" value="${sessionScope.beuid }"><br>
	Text:<input type="text" id="msgc"><br>
	<button onclick="msgc" id="msgc_process" name="msgc_process" title="msgc_process">전송</button><br>
	<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i><a href="#"> 장바구니에 담기</a></button>
	<button class="buy-now-btn"><i class="fa fa-credit-card"></i><a href="#"> 바로 구매하기</a></button>
		
	<!-- 채팅 node.js와 아이피 및 포트 연결 -->
	<script src="http://localhost:82/socket.io/socket.io.js"></script>
	<!-- <script src="http://192.168.1.172:82/socket.io/socket.io.js"></script> -->
	<script src="https://code.jquery.com/jquery-1.11.1.js"></script>
	<script>
		$(document).ready(function() {
			// 채팅 node.js와 아이피 및 포트 연결
			var socket = io("http://localhost:82");
			/* var socket = io("http://192.168.1.172:82"); */
		
			var chat_box = document.getElementById("#chat_box");
			
			//msgc에서 키를 누를떄
			$("#msgc").keydown(function(key) {
				//해당하는 키가 엔터키(13) 일떄
				if (key.keyCode == 13) {
					//msgc_process를 클릭해준다.
					msgc_process.click();
				}
			});
			
			//msgc_process를 클릭할 때
			$("#msgc_process").click(function(e) {
				//소켓에 send_msgc라는 이벤트로 input에 #msgc의 벨류를 담고 보내준다.
				socket.emit("send_msgc", $("#name").val());
				socket.emit("send_msgc", $("#msgc").val());
				//#msgc에 벨류값을 비워준다.
				$("#msgc").val("");
				$("#msgc").focus();
				e.preventDefault();
				chat_box.scrollTop = chat_box.scrollHeight;
			});

			//소켓 서버로 부터 send_msgc를 통해 이벤트를 받을 경우 
			socket.on('send_msgc', function(msgc) {
				//div 태그를 만들어 텍스트를 msgc로 지정을 한뒤 #chat_box에 추가를 시켜준다.
				$('<div class="soso"></div>').text(msgc).appendTo("#chat_box");
				
				
			});
			 socket.on('change name', function(name){
		            $('#name').val(name);
			        $('#msgc').val(msgc);
			      });
			 
			 chat_box.scrollTop = chat_box.scrollHeight; 
			
		});
	</script>
</body>
</html>