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
	$("#res-submit").click(function(){
		window.close();
	})
})
</script>
</head>
<body>
<form id="res-form">
	<h3 id="res-title">상담 확인</h3>
	<table id="res-table">
        <colgroup>
            <col width="15%">
            <col>
        </colgroup>
	    <tr id="res-date">
	        <td>날짜</td>
	        <td>${vo.con_start_str } - ${vo.con_end_str }</td>
	    </tr>
	    <tr>
	        <td>신청내역</td>
	        <td>${vo.pil_title }</td>
	    </tr>
	    <tr>
	        <td>시간</td>
	        <td>${vo.con_time }</td>
	    </tr>
	    <tr>
	        <td>인원</td>
	        <td>${vo.con_attend }&nbsp; 명</td>
	    </tr>
	    <tr>
	        <td>상담내용</td>
	        <td><textarea rows="10%" cols="65%" id="res-textarea" name="res-textarea">${vo.con_purpose }</textarea></td>
	    </tr>
	</table>
	<button id="res-submit" type="button">닫기</button>
</form>
</body>
</html>