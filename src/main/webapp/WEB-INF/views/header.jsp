<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
       <!-- header -->
        <div id="header">
            <div id="header-top">
               <div id="category">
                    <span id="category-1" class="animated fadeInUp">
                        <a href="main"><img src="img/logo/DIFE_logo3.png" id="logo"></a>
                        <a href="drone" class="cl-effect-1">드론</a>
                        <a href="pilot" class="cl-effect-1">파일럿</a>
                        <a href="location" class="cl-effect-1">비행정보</a>
                        <a href="support" class="cl-effect-1">고객지원</a>
                        <a href="board" class="cl-effect-1">커뮤니티</a>
                    </span>
                     <span id="category-2" class="animated fadeInUp">
                        <a id="sign" class="cl-effect-1"></a>
                        <a class="cl-effect-1" id="mypage">MYPAGE</a>
                        <a href="basket" class="cl-effect-1"><i class="fas fa-shopping-basket"></i></a>
                   </span>
                </div>
            </div>
            <div id="header-nav"></div>
        </div>
        <!-- //header -->
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