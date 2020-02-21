<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, , minimum-scale=1, maximum-scale=1">
<title>DIFE.com</title>
<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<!-- 링크 -->
<link href="css/reset.css" rel="stylesheet">
<link href="css/pilot/pilot_popup.css" rel="stylesheet">
<!-- 제이쿼리 플러그인 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript">
$(function(){
	//인원수 출력문
	for (var i = 1; i <= 10; i++) {
		var option = $("<option></option>").attr("value",i).html(i);
		$("#num").append(option);
	}
	
	//날짜 변환 메소드
	function calendar(day){
		var yyyy = day.substr(0,4);
		var mm = day.substr(5,2);
		var dd = day.substr(8,2);

		var cal = (yyyy+"-"+mm+"-"+dd);
		return cal;
	}
	
	//상담신청하기
	$("#res-submit").click(function(){
		var con_start = "${startDate}";
		var con_end = "${endDate}";
		
		con_start = calendar(con_start);
		con_end = calendar(con_end);
		
		var con_time = "";
		$("input[name=res-time]:checked").each(function(){
			con_time += $(this).val()+"/";
		})
		con_time = con_time.substring(0, con_time.lastIndexOf("/"));
		console.log(con_time);
		
		var con_attend = $("select[name=num]").val();
		var con_purpose = $("#res-textarea").val();
		
		//vo로 저장될 data값
		var data = {"con_start":con_start,"con_end":con_end,"con_time":con_time,"con_attend":con_attend,"mem_no":"${mem_no}",
				"con_purpose":con_purpose,"list_no":"${list_no}","con_sort":"${con_sort}","con_loc":"${con_loc}"};
		console.log("data:"+data);
		var json_data = JSON.stringify(data);
		
		if(con_time == null || con_time == ""){
			alert("시간을 선택해주세요.");
		}
		if(con_purpose == null || con_purpose == ""){
			alert("상담 내용을 입력해주세요.");
		}else{
	  	 	$.ajax({type:"post",
  	 			url:"/pilot_popup",
  	 			data:json_data,
  	 			dataType:"json",
  	 			contentType:"application/json;charset=UTF-8",
  	 			success:function(r){
  	 				alert("상담이 신청되었습니다. \n신청내역은 '마이페이지-내글 관리'에서 확인하실 수 있습니다.");
  	 				window.close();
  	 			}})
		}
	})
})
</script>
</head>
<body>
<form id="res-form">
	<h3 id="res-title">예약 상담</h3>
	<table id="res-table">
        <colgroup>
            <col width="15%">
            <col>
        </colgroup>
	    <tr id="res-date">
	        <td>날짜</td>
	        <td>${startDate } - ${endDate }</td>
	    </tr>
	    <tr>
	        <td>시간</td>
	        <td>
	            <input type="checkbox" name="res-time" class="res-time" value="9-12시">9-12시&nbsp;&nbsp;&nbsp;
                <input type="checkbox" name="res-time" class="res-time" value="12-3시">12-3시&nbsp;&nbsp;&nbsp;
                <input type="checkbox" name="res-time" class="res-time" value="3-6시">3-6시&nbsp;&nbsp;&nbsp;
                <input type="checkbox" name="res-time" class="res-time" value="6-9시">6-9시
                <span class="res-info">*중복으로 선택 가능합니다.</span>
	        </td>
	    </tr>
	    <tr>
	        <td>인원</td>
	        <td>
	            <select id="num" name="num"></select>&nbsp;&nbsp;명
	            <span class="res-info">*10명이상 단체는 상담창에 입력해주세요.</span>
	        </td>
	    </tr>
	    <tr>
	        <td>상담내용</td>
	        <td><textarea rows="10%" cols="65%" id="res-textarea" name="res-textarea"></textarea></td>
	    </tr>
	</table>
	<button id="res-submit" type="button">상담 신청하기</button>
</form>
</body>
</html>