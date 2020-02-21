<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<body>
<a id="kakao-login-btn"></a>

<a href="http://developers.kakao.com/logout"></a>
 
 
<!-- Kakao Login -->

<script type="text/javascript">
      // 사용할 앱의 JavaScript 키를 설정해 주세요.
      Kakao.init('2419a41da13d5ceaf615799022f751d9');
      // 카카오 로그인 버튼을 생성합니다.
      Kakao.Auth.createLoginButton({
        container: '#kakao-login-btn',
        success: function(authObj) {
          // 로그인 성공시, API를 호출합니다.
          //  Kakao.API.request({
          //  url: '/v1/user/me',
          //  success: function(res) {
          //    console.log(JSON.stringify(res.kaccount_email));
          //    console.log(JSON.stringify(res.id));
          //    console.log(JSON.stringify(res.properties.profile_image));
          //    console.log(JSON.stringify(res.properties.nickname));
          //  },
          //  fail: function(error) {
          //    alert(JSON.stringify(error));
          //  }
          //});
          document.getElementById('kakao-login-result').innerText='success:' +
          JSON.stringify(authObj);
        },
        fail: function(err) {
        	document.getElementById('kakao-login-result').innerText='fail:' +
        	JSON.stringify(err);
        }
      });

</script>

</body>
</html>