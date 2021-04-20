<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="542797334433-kubelp1c26c1eop1pnmb7eaf2tjtjosp.apps.googleusercontent.com">
<script>
function onSignIn(googleUser) {
  var profile = googleUser.getBasicProfile();
  console.log('ID: ' + profile.getId()); 
  console.log('Name: ' + profile.getName());
  console.log('Given Name: ' + profile.getGivenName());
  console.log('Family Name: ' + profile.getFamilyName());
  console.log('Image URL: ' + profile.getImageUrl());
  console.log('Email: ' + profile.getEmail()); 
  console.log('Email: ' + profile.getPhone()); 
}
    


function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
  }
</script>
<title>Insert title here</title>
</head>
<body>
//登入
<div class="g-signin2" data-onsuccess="onSignIn"></div>
//登出
<a class="g-signout2" href="#" onclick="signOut();">Sign out</a>
</body>
</html>