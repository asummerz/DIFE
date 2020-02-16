<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
<!-- 기본 css 링크 -->
<link rel="stylesheet" href="css/policy/policy.css">  
</head>
<body>
    <!-- <div id="wrap" class="animated fadeIn"> -->
       <!-- product policy -->
        <div class="product-policy">
            <div class="titleArea">
               <h3>상품결제</h3>
               <p class="move_line"></p>
	           	<p class="info-policy">
	            	- 고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다.<br>
  					&nbsp;&nbsp;확인과정에서 도난 카드의 사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.<br>
					- 무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다.<br>
					- 주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다.   		
	            </p>
            </div>
            <div class="titleArea">
               <h3>배송</h3>
               <p class="move_line"></p>
	           	<p class="info-policy">
	            	- 현재 A/S 서비스에 관련한 부품 교체만 가능하며 추후 대여 제품에 대한 배송서비스도 시행될 예정입니다.		
	            </p>
            </div>
            <div class="titleArea">
               <h3>A/S 안내</h3>
               <p class="move_line"></p>
	           	<p class="info-policy">
	            	- DIFE에서 구매하신 제품들은 출고시 초기불량을 제외한 어떠한 경우에도 무료 A/S는 불가하며, 모든 상품은 유상 A/S 처리가 됩니다. (초기불량 제외)<br>
					- DJI 제품 중 단순 펌웨어 업그레이드의 경우 왕복 택배비용이 발생하며, 부품 교체 등의 비용은 부품비 및 공임비가 추가로 발생 합니다.<br>
					- 입문용 드론 및 기타 제품들의 경우 부품 교체 없이 단순 업무로 해결이 될 때만 왕복 택배 비용이 발생하며, 그 외 부품 교체 등의 비용은 부품비 및 공임비가 발생 합니다.<br>
					- 부품 공급이 원활하지 않은 경우 A/S 기간이 다소 늘어날 수 있습니다. 이점 양지 하시길 바랍니다.
	            </p>
            </div>
            <div class="titleArea">
               <h3>교환 및 반품</h3>
               <p class="move_line"></p>
	           	<p class="info-policy">
	            	<strong>교환 및 반품이 가능한 경우</strong>
	            	<br>
	            		- 상품을 공급 받으신 날로부터 7일 이내 부품 교체 가능 (단, 훼손되어 상품가치가 상실된 경우에는 교환/반품이 불가능합니다.)<br>
						<strong>- 교환 및 반품시 주소 : 서울 마포구 백범로 23 구프라자 3층 / 서울 마포구 신수동 63-14 구프라자 3층</strong><br>
						※ 고객님의 단순변심에 의한 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다. ( 색상 교환 및 기타 )
					<br>
					<br>
	            	<strong>교환 및 반품이 불가능한 경우</strong>
	            	<br>
						- 고객님의 사용 또는 일부 소비에 의하여 재판매가 곤란할 정도로 가치가 감소한 경우 (소비자보호법17조2항 참조)<br>
						※ 구매 후 조종미숙 또는 비행이 부적합한 환경에서의 무리한 비행으로 발생하는 문제에 대하여서는 판매자의 책임이 없음을 알려드립니다.
	            </p>
            </div>
            <div class="titleArea">
               <h3>환불</h3>
               <p class="move_line"></p>
	           	<p class="info-policy">
	            	환불시 반품 확인여부를 확인한 후 3영업일 이내에 결제 금액을 환불해 드립니다.<br>
					신용카드로 결제하신 경우는 신용카드 승인을 취소하여 결제 대금이 청구되지 않게 합니다.<br>
					(단, 신용카드 결제일자에 맞추어 대금이 청구 될수 있으면 이 경우 익월 신용카드 대금청구시 카드사에서 환급처리 됩니다.)
	            </p>
            </div>
        </div>
        <!-- //product policy -->
	
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