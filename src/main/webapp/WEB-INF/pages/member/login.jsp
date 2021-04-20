<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importHead.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
	<meta name="google-signin-client_id" content="542797334433-kubelp1c26c1eop1pnmb7eaf2tjtjosp.apps.googleusercontent.com">
	<script type="text/javascript">
  	let flag1=false,flag2=false;
  	window.onload = function() {
  		var senddata = document.getElementById("senddata");
  		var userid = document.getElementById("userid");
  		var password = document.getElementById("password");
  		var checkbox = document.getElementById("customCheck");
  		var ih1 = document.getElementById("ih1");
  		var ih2 = document.getElementById("ih2");
  		userid.onblur = function(){
  			if(!userid.value){
  				ih1.innerHTML =  "<font color='red' >*請確認使用者帳號</font>";
  				flag1 = false;
  			}else{
  				ih1.innerHTML =  "";
  			}
  			
  			var xhr = new XMLHttpRequest();
  			xhr.open("Post","<c:url value='/CheckedMemId' />",true); 
  			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
  			xhr.send("userid=" + userid.value);
  			var message="";
  			xhr.onreadystatechange = function() {
  			    // 伺服器請求完成
  			    if (xhr.readyState == 4 && xhr.status == 200) {
  				   var result = JSON.parse(xhr.responseText);
  				   if (result.msg.length == 0) {
  					  message = "<font color='red' >*請確認使用者帳號</font>";
  					  flag1 = false;
  				   } else if (	result.msg.startsWith("Error") ) {
  					  message = "<font color='red' >發生錯誤: 帳號" + result.id + "</font>";
  					  flag1=false
  				   } else {
  					  message = ""; 
  					  flag1=true
  				   }
  				   ih1.innerHTML = message;
  			    }
  		     }
  		}
  		
  		password.onblur = function(){
  			if(!password.value){
  				ih2.innerHTML =  "<font color='red' >*請輸入密碼</font>";
  				flag2 = false;
  			}else{
  				ih2.innerHTML =  "";
  				flag2=true;
  			}
  		}
  		
  		senddata.onclick = function(){
  			console.log(checkbox.value);
  			if(!(flag1)){
  				Swal.fire("Error!", "請確認使用者帳號" , "error")
  				//ih1.innerHTML =  "<font color='red' >*請確認使用者帳號</font>";
  				return false;
			}	
  			if(!flag2){
  				Swal.fire("Error!", "密碼錯誤" , "error")
  				//ih2.innerHTML =  "<font color='red' >*密碼錯誤</font>";
	   			return false;
  			}
			var xhr1 = new XMLHttpRequest();
  	   		xhr1.open("POST", "<c:url value='/loginaction' />", true);
  	   		xhr1.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
  	   		xhr1.send("userid=" + userid.value + "&password=" + password.value + "&checkbox=" + checkbox.value);
  	   		xhr1.onreadystatechange = function() {
  	   			if (xhr1.readyState == 4 && xhr1.status == 200) {
  	   				var result = JSON.parse(xhr1.responseText);
  	   				if(result.pwdfail){
  	   					Swal.fire("Error!", result.pwdfail , "error")
  	   					/* ih2.innerHTML = "<font color='red' >*" + result.pwdfail + "</font>"; */
  	   				} else if(result.success){
  	   					/* ih1.innerHTML = "<font color='red' >" + result.success + "</font>"; */
  	   					Swal.fire('OK',result.success,'success').then(function() {window.location.assign("${pageContext.request.contextPath}/");})
  	   					/* window.location.assign(result.url); */
  	   				} else if(result.verify){
  	   					Swal.fire('OK',result.verify+"請先進行驗證！",'info').then(function() {window.location.assign("<c:url value='/emailcheck.controller' />");})
  	   					/* ih1.innerHTML = "<font color='red' >" + result.verify + "</font>";
  	   					window.location.assign(result.url); */
  	   				} else if(result.idfail){
  	   					Swal.fire("Error!", result.idfail , "error")
//   	   					ih1.innerHTML = "<font color='red' >*" + result.idfail + "</font>";
  	   				} else if(result.stopfail){
  	   					Swal.fire("Error!", result.stopfail , "error")
//   	   					ih1.innerHTML = "<font color='red' >*" + result.stopfail + "</font>";
  	   				}
  	   				
  	   			}
  	   		}
  	   		
  	   		
  		}
  		
  	}
  	
  	function onSignIn(googleUser) {
  	  	var profile = googleUser.getBasicProfile();
  	  	console.log('ID: ' + profile.getId()); 
  	 	console.log('Name: ' + profile.getName());
  	  	console.log('Given Name: ' + profile.getGivenName());
  	  	console.log('Family Name: ' + profile.getFamilyName());
  	  	console.log('Image URL: ' + profile.getImageUrl());
  	 	console.log('Email: ' + profile.getEmail()); 
  	  	var xhr2 = new XMLHttpRequest();
 		xhr2.open("POST", "<c:url value='/GoogleSignin' />", true);
		var jsonMember = {
			"userid": profile.getEmail(), 	
			"email" : profile.getEmail(),
			"name" : profile.getName(),
			"image1": profile.getImageUrl()
 		}
		//alert(JSON.stringify(jsonMember));
 		xhr2.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
 		xhr2.send(JSON.stringify(jsonMember));
 		xhr2.onreadystatechange = function() {
	   			if (xhr2.readyState == 4 && xhr2.status == 200) {
	   				var result = JSON.parse(xhr2.responseText);
	   				var auth2 = gapi.auth2.getAuthInstance();
	   				auth2.signOut().then(function () {
	   		  	      console.log('User signed out.');
	   		  	    });
	   				Swal.fire('OK',result.success,'success').then(function() {window.location.assign(result.url);})
	   				
	   			}
	   	}
  	}
  	
  	function signOut() {
  	    var auth2 = gapi.auth2.getAuthInstance();
  	    auth2.signOut().then(function () {
  	      console.log('User signed out.');
  	    });
  	  }
</script>
    <title>登入介面</title>
	
    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/js/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet">
	
</head>
<jsp:include page="../webnav.jsp" flush="true" ></jsp:include>
<body class="background">
    
    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"><img src="${pageContext.request.contextPath}/images/Taiwan_Taipei_Taipei-101_AShutterstock_28310509.jpeg" alt=""></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h3 text-gray-900 mb-4">歡迎回來 !</h1>
                                    </div>
                                    
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="userid" aria-describedby="emailHelp"
                                                placeholder="使用者帳號*" style="font-size:16px;">
                                                <span  id="ih1"></span><br>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="password" placeholder="使用者密碼*" style="font-size:16px;">
                                                <span  id="ih2"></span><br>
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck" value="false">
                                                <label class="custom-control-label" for="customCheck" style="font-size:16px;">自動登入</label>
                                            </div>
                                        </div>
                                        <button id="senddata" class="btn btn-info btn-user btn-block"style="font-size:16px;">
                                            登入
                                        </button>
                                        <hr>
                                        <div align="center" >
                                            <i  class="g-signin2" data-onsuccess="onSignIn" ></i>
                                        </div>
                                       <!--  <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                            <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                                        </a> -->
                                         <hr>
                                    	 <div align="center">
                							<a class="navbar-brand" href="<c:url value='/quicklogin/o19980724' />" title="o19908724">
												<img src="${pageContext.request.contextPath}/images/—Pngtree—flat man avatar_5939772.png" alt="">
											</a>
											<a class="navbar-brand" href="<c:url value='/quicklogin/wayne869191' />">
												<img src="${pageContext.request.contextPath}/images/—Pngtree—flat man head_5936100.png" alt="">
											</a>	
											<a class="navbar-brand" href="<c:url value='/quicklogin/a3321323432' />">
												<img src="${pageContext.request.contextPath}/images/—Pngtree—flat man head_5913517.png" alt="">
											</a>
											<a class="navbar-brand" href="<c:url value='/quicklogin/christine210102126' />">
												<img src="${pageContext.request.contextPath}/images/—Pngtree—flat girl head_5939621.png" alt="">
											</a>
											<a class="navbar-brand" href="<c:url value='/quicklogin/aaaaa792877' />">
												<img src="${pageContext.request.contextPath}/images/—Pngtree—flat girl head_5941802.png" alt="">
											</a>
										</div>
                                    <hr>
                                    
                                    <div class="text-center">
                                        <a class="small" style="font-size:16px;" href="<c:url value='/forgetpwd.controller'  />">忘記密碼 ?</a>
                                    </div><br>
                                    <div class="text-center">
                                        <a class="small" style="font-size:16px;" href="<c:url value='/register.controller' />">創建新帳戶 !</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
	<footer class="ftco-footer bg-bottom ftco-no-pt" style="background-image: url('${pageContext.request.contextPath}/static/images/bg_3.jpg');">
	<%@ include file="/WEB-INF/pages/trainandhotel/footer.jsp"%>
	</footer>
	<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importBody.jsp"%>
    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/js/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/js/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>
	<script>
	$('#customCheck').on('click',function(){
    	let checked=$(this).prop('checked')
   
    if(checked){
    	$('#customCheck').attr("value", "true");	
    }
    else if(!checked){
    	$('#customCheck').attr("value", "false");
    }
	})
</script>
</body>

</html>