<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, , minimum-scale=1, maximum-scale=1">
<title>layout</title>
<!-- 웹폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<!-- fadeIn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/orders/orders.css">
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
		//로그인 로그아웃 end

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
		
		/* 날자를 포맷하기위한 function */
    	function date_to_str(format)
		{
		    var year = format.getFullYear();
		    var month = format.getMonth() + 1;
		    if(month<10) month = '0' + month;
		    var date = format.getDate();
		    if(date<10) date = '0' + date;
		    return year + "-" + month + "-" + date;
		}
		/* 주문번호 날자 뽑기 */
		function orders_date(ord_date){
			
			  	var year = ord_date.getFullYear();
			    var month = ord_date.getMonth() + 1;
			    if(month<10) month = '0' + month;
			    var date = ord_date.getDate();
			    if(date<10) date = '0' + date;
			    return year+""+month+""+date;
		}
		/*총금액 처리를 위한 변수  */
   	 	var sum= 0;
		var ord_no='';
	 	var mem_point= 0;
	 	var reserve_fund=0;
	 	var list_count=0;
		/*list를 처리하는 function*/
        function getList(){ 
        	$.ajax({url:"/ordersDetailList.do",async : false,data:{"mem_id":mem_id},dataType:"json",success:function(data){
        		
     			$("#table_content").empty();
     			if(mem_id == '' || mem_id == null){
     				var result = confirm("로그인이 필요합니다.");
     				if(result){
     				    location.href="/signIn";
     				}else{
     				    location.href="/main";
     				}
    			}
     			var i = 1;
	    		$.each(data,function(idx,item){
	    			var rental = new Date(item.det_rental);
	    			var re_date = new Date(item.det_return);
	    			var ord_date = new Date(item.ord_date);
	    			var ord_no_str = orders_date(ord_date)+"";
	    			 ord_no_str +="P0000"+i;
	    			if(idx === 0)
	    				{
	    					ord_no =  item.ord_no;
	    					mem_point = Number(item.mem_point);
	    				}
	    			tr=$("<tr></tr>");
	    			var td1=$("<td></td>").html(ord_no_str);  
	    			var td2=$("<td></td>");
	    			var td3;
	    			var td4;
	    			var td5;
	    			var td6;
	    			var product_img;
	    			var p1;
	    			var p2;
	    			var p3;
	    			var p4;
	    			var p5;
	    			var p6;
	    			rental = date_to_str(rental);
	    			re_date=date_to_str(re_date);
	    			/* sum 할인률 및 하단 정보 관련 처리 */
	    			sum +=Number(item.det_price);
	    			reserve_fund += Number(item.point);
	    			/*  */
	    			if(item.dro_name !== null)
	    				{
	    					
	    					product_img=$("<img/>").attr({"src":"img/drone/"+item.dro_photo,"width":"62","height":"68"});
	    					$(td2).append(product_img);
	    					p1=$("<p></p>").html(item.dro_name+"/"+item.dro_series);
	    					p2=$("<p></p>").html("대여일:"+rental+"  "+"반납일:"+re_date);
	    					td3=$("<td></td>");
	    					$(td3).append(p1,p2);
	    					td4=$("<td></td>");
	    					p3 = $("<p></p>").html(item.det_price);
	    					$(td4).append(p3);
	    					p4= $("<p></p>").html(item.det_amount);
	    					td5=$("<td></td>");
	    					$(td5).append(p4);
	    					td6=$("<td></td>");
	    					p5=$("<p></p>").html(item.det_price);
	    					p6=$("<p></p>").html(item.point);
	    					$(td6).append(p5,p6);
	    				}
	    			else
	    				{
	    				product_img=$("<img/>").attr({"src":"img/"+item.pil_portphoto,"width":"62","height":"68"});
    					$(td2).append(product_img);
    					p1=$("<p></p>").html(item.mem_name+"/"+item.pil_career+"년");
    					p2=$("<p></p>").html("대여일:"+rental+"  "+"반납일:"+re_date);
    					td3=$("<td></td>");
    					$(td3).append(p1,p2);
    					td4=$("<td></td>");
    					p3 = $("<p></p>").html(item.det_price);
    					$(td4).append(p3);
    					p4= $("<p></p>").html(item.det_amount);
    					td5=$("<td></td>");
    					$(td5).append(p4);
    					td6=$("<td></td>");
    					p5=$("<p></p>").html(item.det_price);
    					p6=$("<p></p>").html(item.point);
    					$(td6).append(p5,p6);
	    				}
	    			$(tr).append(td1,td2,td3,td4,td5,td6);
	    			$("#table_content").append(tr);
	    			i++;
	    			list_count++;
	    			}); 
	    		/* foreach종료 */
	    	}})
    	/*ajax 종료  */
    	    }    
			/* getList종료 */
			getList();
			/* sum값*/
			$("#pay_sum").html("총금액&nbsp;&nbsp;"+sum+"원");
			//체크 됐을때 값 전달 이벤트..
			$(".agree").click(function(){
		   	 		 chk = $(this).is(":checked");//.attr('checked');
		   	 		 $("#agree_select").html("동의를 확인해주세요.");
		   	         if(chk) {
		   	        	$("#agree_select").hide();
		   	        
		   	     
		   	        	
		   	        	$("#order").click(function(){
		   	        		/* 결제페이지로 sum값 전달 */
		   	        		$.ajax({url:"/delBasket.do",data:{"mem_id":mem_id},success:function(data){
		   	        		console.log(data)
		   	   				console.log(typeof(data))
		   	        			if(data == "1")
		   	        				{	
		   	        					location.href="payKG?sum="+sum;
		   	        				}
		   	        		}})
		   	        		
		   	        	});
		   	         }
		   	         else {
		   	        	$("#agree_select").show(); 	
		   	         }
			})
			//orderscancle
			$("#orderCancle").click(function(){
				alert(ord_no)
				 $.ajax({url:"/delJumun.do",data:{"mem_id":mem_id,"ord_no":ord_no,"list_count":list_count},success:function(data){
					if(data=="1")
						{
							location.href("/main");
						}
				
				}}); 
			})
   	 	});
			/*function  */

		
    			
     		
	
</script>
</head>
<body>

    <div id="wrap" class="animated fadeIn">

          <!-- header -->

        <jsp:include page="header.jsp"></jsp:include>
        <!-- //header -->

        <!-- contents -->
     <!-- 컨텐츠 영역 -->
    <div id="contents">
        <!-- 세션 영역        -->
        <div id="content-session">
        	<div id="title">
                <img src="img/main/drone_main10.PNG" id="support-title-img">
            </div>
            <div id="orders-title">주문하기</div>
            <div class="container">
                <div class='main-session'>
                  
                <!--테이블 영역      -->
                        <table class='cart_table'>
                             <colgroup>
                                 <col width='150px'>
                                 <col width="100px">
                                 <col width="300px">
                                 <col width='100px'>
                                 <col width='250px'>
                                 <col width='200px'>
                             </colgroup>
                        <thead>
                            <th scope="col">주문번호</th>
                            <th scope="col"></th>
                            <th scope="col">상품명</th>
                            <th scope="col">판매가</th>
                            <th scope="col">수량</th>
                            <th scope="col">주문금액<br/></th>
                        </thead>
                         <tbody id="table_content">
                      		</tbody>
                    </table>
              
                
                    
                </div>
            </div>
        </div>
<!--    //table-->
       
          <!--    content_footer-->
       <div id='content_footer'>
            <div class="container">
<!--                 <span>결제 방식</span><br> -->
<!--
                <div class="">
                   <span>결제 수단</span>
                    <input type="radio" class="payment" checked="checked" name="payment"><label>카드</label>
                    <input type="radio" class="payment"  name="payment"><label>무통장</label>
                    <input type="radio" class="payment"  name="payment"><label>카카오페이</label>
                </div>
                <div>
                <span>총 주문금액</span>
                </div>
-->
                <ul class="payment_container" >
                    <!-- <li>
                    <span>결제 수단</span>
                        <input type="radio" class="payment" checked="checked" name="payment"><label style="padding: 0px 10px;">카드</label>
                        <input type="radio" class="payment"  name="payment"><label style="padding: 0px 10px;">무통장</label>
                        <input type="radio" class="payment"  name="payment"><label style="padding: 0px 10px;">카카오페이</label>
                    </li> -->
                    
                    <li class="payment_style" style="font-size: 25px; font-weight: 700;">결제 안내
                       <!--  <select>
                            <option>은행선택</option>
                        </select>
                        <select>
                        
                            <option>일시불</option>
                        </select> -->
                    </li>
                    
                    <li>
                        <textarea rows="10%" cols="100%">제1조(목적)

이 약관은 'DIFE(주)'(전자거래 사업자)이 운영하는 DIFE(주) 온라인 쇼핑몰(이하 "DIFE 온라인 쇼핑몰"이라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이버몰과 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다. ※ 「PC통신등을 이용하는 전자거래에 대해서도 그 성질에 반하지 않는한 이 약관을 준용합니다」

제2조(정의)

① "DIFE"이란 'DIFE(주)'이 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
② "이용자"란 "DIFE 온라인 쇼핑몰"에 접속하여 이 약관에 따라 "오롬 온라인 쇼핑몰"이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
③ ‘회원’이라 함은 "DIFE 온라인 쇼핑몰"에 개인정보를 제공하여 회원등록을 한 자로서, "오롬 온라인 쇼핑몰"의 정보를 지속적으로 제공받으며, "DIFE 온라인 쇼핑몰"이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
④ ‘비회원’이라 함은 회원에 가입하지 않고 "DIFE 온라인 쇼핑몰"이 제공하는 서비스를 이용하는 자를 말합니다.

제3조(약관등의 명시와 설명 및 개정)

① "DIFE 온라인 쇼핑몰"은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호·모사전송번호·전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 "오롬 온라인 쇼핑몰"의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
② "오롬 온라인 쇼핑몰"은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회·배송책임·환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
③ "오롬 온라인 쇼핑몰"은 전자상거래등에서의소비자보호에관한법률, 약관의규제에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
④ "오롬 온라인 쇼핑몰"이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일이전부터 적용일자 전일까지 공지합니다.
다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰“은 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
⑤ "오롬 온라인 쇼핑몰"이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간내에 "오롬 온라인 쇼핑몰"에 송신하여 "오롬 온라인 쇼핑몰"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자보호지침 및 관계법령 또는 상관례에 따릅니다.

제4조(서비스의 제공 및 변경)

① "오롬 온라인 쇼핑몰"은 다음과 같은 업무를 수행합니다.
1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
2. 구매계약이 체결된 재화 또는 용역의 배송
3. 기타 "오롬 온라인 쇼핑몰"이 정하는 업무
② "오롬 온라인 쇼핑몰"은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.
③ "오롬 온라인 쇼핑몰"이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.
④ 전항의 경우 "오롬 온라인 쇼핑몰"은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, "오롬 온라인 쇼핑몰"이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.

제5조(서비스의 중단)

① "오롬 온라인 쇼핑몰"은 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
② "오롬 온라인 쇼핑몰"은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, "오롬 온라인 쇼핑몰"이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
③ 사업종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 "오롬 온라인 쇼핑몰"은 제8조에 정한 방법으로 이용자에게 통지하고 당초 "오롬 온라인 쇼핑몰"에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, "오롬 온라인 쇼핑몰"이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 포인트 등을 "오롬 온라인 쇼핑몰"에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.</textarea>
                    
                    <br><p class="payment_style">주문자 동의&nbsp;&nbsp; <input type="checkbox"  class="agree"><label>동의</label></p>
                    <p id="agree_select"></p>
                    </li>
                    <li class="payment_style">
                        <div id="pay_sum"> </div>
                    </li>
                </ul>
                 <div class="delete-btn-area">
					<a href="javascript:void(0)" id="orderCancle" class="a_btn">주문취소</a>
					<a href="javascript:void(0)" id="order" class="a_btn">결제하기</a>
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