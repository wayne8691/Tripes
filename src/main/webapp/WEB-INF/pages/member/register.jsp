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
	<script type="text/javascript">
  	let flag1=false,flag2=false,flag3=false,flag4=false,flag5=false,flag6=false;
  	window.onload = function() {
  		var userid = document.getElementById("userid");
  		var ih1 = document.getElementById("ih1");
  		userid.onclick = function(){
  			
  		}
  		userid.onblur = function(){
  			var idValue = document.getElementById("userid").value;
  			if(!idValue){
  				ih1.innerHTML =  "<font color='red' >*請輸入使用者帳號</font>";
  				return;
  			}
  			
  			var xhr = new XMLHttpRequest();
  			xhr.open("Post","<c:url value='/CheckedMemId' />",true); 
  			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
  			xhr.send("userid=" + idValue);
  			var message="";
  			xhr.onreadystatechange = function() {
  			    // 伺服器請求完成
  			    if (xhr.readyState == 4 && xhr.status == 200) {
  				   var result = JSON.parse(xhr.responseText);
  				   if (result.msg.length == 0) {
  					 console.log="13w"
  					  message = "<font color='green' >帳號可用</font>";
  					  flag1 = true;
  				   } else if (	result.msg.startsWith("Error") ) {
  					  message = "<font color='red' >發生錯誤: 帳號" + result.id + "</font>";
  					  flag1=false
  				   } else {
  					  message = "<font color='red'>帳號重複，請重新輸入帳號</font>"; 
  					  flag1=false
  				   }
  				   ih1.innerHTML = message;
  			    }
  		     }
  			
  		}
  		
  		var pwd = document.getElementById("password");
  		re1 = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
		pwd.onclick = function(){
  			
  		}
  		pwd.onblur = function() {
  			var pwdValue = document.getElementById("password").value;
  			var pwd11Value = document.getElementById("password1").value;
  			if(!pwdValue){
  				ih2.innerHTML =  "<font color='red' >*請輸入密碼</font>";
  				flag2=false;
  			}else if(! re1.test(pwdValue)){
  				ih2.innerHTML =  "<font color='red' >*(需含數字與大小寫英文,必須大於8個字)</font>";
  				flag2=false;
  			}else{
  				ih2.innerHTML =  "";
  				flag2 = true;
  			}
  			
  			if(pwd11Value != pwdValue){
  				ih3.innerHTML =  "<font color='red' >*請確認密碼</font>";
  				flag3=false;
  			}
  		}
  		
  		var pwd1 = document.getElementById("password1");
		pwd1.onclick = function(){
  			
  		}
  		pwd1.onblur = function() {
  			var pwd1Value = document.getElementById("password1").value;
  			if(!pwd1Value){
  				ih3.innerHTML =  "<font color='red' >*請確認您輸入的密碼</font>";
  				flag3=false;
  			}else if(pwd1Value == pwd.value){
  				ih3.innerHTML =  "";
  				flag3 = true;
  			}else{
  				ih3.innerHTML =  "<font color='red' >*請確認您輸入的密碼</font>";
  				flag3=false;
  			}
  		}
  		
  		var username = document.getElementById("name");
  		re2 = /^([\u4e00-\u9fa5]){2,}$/;
		username.onclick = function(){
  			
  		}
  		username.onblur = function() {
  			var nameValue = document.getElementById("name").value;
  			if(!nameValue){
  				ih4.innerHTML =  "<font color='red' >*請輸入姓名</font>";
  				flag4=false;
  			}else if(! re2.test(nameValue)){
  				ih4.innerHTML =  "<font color='red' >*(需含兩個中文字以上)</font>";
  				flag4=false;
  			}else{
  				ih4.innerHTML =  "";
  				flag4 = true;
  			}
  		}
  		
  		var email = document.getElementById("email");
  		re3 = /(\S)+[@]{1}(\S)+[.]{1}(\w)+/;
		email.onclick = function(){
  			
  		}
  		email.onblur = function() {
  			var emailValue = document.getElementById("email").value;
  			if(!emailValue){
  				ih5.innerHTML =  "<font color='red' >*請輸入信箱</font>";
  				flag5=false;
  			}else if(! re3.test(emailValue)){
  				ih5.innerHTML =  "<font color='red' >*(ex:12345678@gmail.com)</font>";
  				flag5=false;
  			}else{
  				ih5.innerHTML =  "";
  				flag5 = true;
  			}
  		}
  		
  		var birthday = document.getElementById("birthday");
  		re4 = /^(\d{4})(-|\/)(\d{1,2})\2(\d{1,2})$/;
		birthday.onclick = function(){
  			
  		}
  		birthday.onblur = function() {
  			var birthdayValue = document.getElementById("birthday").value;
  			if(!birthdayValue){
  				ih6.innerHTML =  "<font color='red' >*請輸入生日</font>";
  				flag6=false;
  			}else if(! re4.test(birthdayValue)){
  				ih6.innerHTML =  "<font color='red' >*(YYYY-MM-DD)</font>";
  				flag6=false;
  			}else{
  				ih6.innerHTML =  "";
  				flag6 = true;
  			}
  		}
  		
  	   	var sendData = document.getElementById("sendData");
  	   	sendData.onclick = function() {
  	   		// 讀取欄位資料	  
  			var idValue = document.getElementById("userid").value;
  			var pwdValue = document.getElementById("password").value;
  			var pwd1Value = document.getElementById("password1").value;
  			var nameValue = document.getElementById("name").value;
  			var emailValue = document.getElementById("email").value;
  			var birthdayValue = document.getElementById("birthday").value;
  		
  			var div1 = document.getElementById('ih1');
  			var div2 = document.getElementById('ih2');
  			var div3 = document.getElementById('ih3');
  			var div4 = document.getElementById('ih4');
  			var div5 = document.getElementById('ih5');
  			var div6 = document.getElementById('ih6');
  			
  	   		/* if(!(flag1&&flag2&&flag3&&flag4&&flag5&&flag6)){
  	   			return false;
			} */
  	   		
  	   		
  	   		var xhr1 = new XMLHttpRequest();
  	   		
  	   		xhr1.open("POST", "<c:url value='/RegisterMember' />", true);
  			var jsonMember = {
  				"userid": idValue, 	
  				"password": pwdValue,
  				"name": nameValue,
  				"email": emailValue,
  				"birthday": birthdayValue,
  				"suspension": 1,
  				"status": "y_Notcertified",
  				"fail_count": 0,
  				"login_status": 0,
  				"image1": "images/user/user-thumb.jpg"
  	   		}
  			//alert(JSON.stringify(jsonMember));
  	   		xhr1.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
  	   		xhr1.send(JSON.stringify(jsonMember));
  		
  	   		//後端顯示
  	   		xhr1.onreadystatechange = function() {
  					// 伺服器請求完成
  	   		if (xhr1.readyState == 4 && (xhr1.status == 200 || xhr1.status == 201) ) {
  	   			result = JSON.parse(xhr1.responseText);
			    
  	   			if (result.fail) {
  	   				Swal.fire("Error!", "資料輸入錯誤" , "error")
	  			} else if (result.success) {
	  				Swal.fire('OK',"註冊成功!",'success').then(function() {window.location.assign(result.url);})
	 			}
  	   			
			    if (result.idError) {
          			ih1.innerHTML = "<font color='red'>"
	     				+ result.idError + "</font>";
          			flag1=false;
				} else {
          			ih1.innerHTML = "";
          			flag1=true;
				}
			    
			    if (result.pwdError) {
          			ih2.innerHTML = "<font color='red'>"
	     				+ result.pwdError + "</font>";
          			flag2=false;
				} else {
          			ih2.innerHTML = "";
          			flag2=true;
				}
			       
			    if (pwd1Value != pwd.value) {
          			ih3.innerHTML = "<font color='red'>*請確認您輸入的密碼！</font>";
          			flag3=false;
				} else {
          			ih3.innerHTML = "";
          			flag3=true;
				}
			    
			    if (result.nameError) {
          			ih4.innerHTML = "<font color='red'>"
	     				+ result.nameError + "</font>";
          			flag4=false;
				} else {
          			ih4.innerHTML = "";
          			flag4=true;
				}
			    
			    if (result.emailError) {
          			ih5.innerHTML = "<font color='red'>"
	     				+ result.emailError + "</font>";
          			flag5=false;
				} else {
          			ih5.innerHTML = "";
          			flag5=true;
				}
			    
			    if (result.birthdayError) {
          			ih6.innerHTML = "<font color='red'>"
	     				+ result.birthdayError + "</font>";
          			flag6=false;
				} else {
          			ih6.innerHTML = "";
          			flag6=true;
				}
			    
  			} 
  	  	    
  	   		}
  	   		
  	   		
  	    }
  	   
 
  	}
  </script>
	
    <title>註冊頁面</title>
	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<meta name="google-signin-client_id" content="542797334433-kubelp1c26c1eop1pnmb7eaf2tjtjosp.apps.googleusercontent.com">
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

        
        <div class="row justify-content-center ">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                     <div class="col-lg-6 d-none d-lg-block bg-login-image"><img src="${pageContext.request.contextPath}/images/cfjoyqlhwjk.jpeg" alt=""></div>
                    <div class="col-lg-6">
                        <div class="p-5">
                            <div class="text-center">
                                <h2 class="h3 text-gray-900 mb-4">創建新帳號</h2>
                            </div>
                            <div class="user">
                                <span  id="ih0"></span><br>
                            	
                                <div class="form-group">
                                <input style="outline-color:green;" type="text" name="userid" id="userid" placeholder="使用者帳號*" class="form-control form-control-user">
                                <span  id="ih1"></span><br>
                                </div>
                                <div class="form-group">
                                <input style="outline-color:green;" type="password" name="password" id="password" placeholder="使用者密碼*" class="form-control form-control-user">
                                <span style="color: red;" id="ih2"></span><br>
                                 <br><button><i class="fa fa-eye" aria-hidden="true" id="btnn"></i></button><br>
      							</div>
                                
                                <div class="form-group">
                                <input style="outline-color:green;" type="password" name="password1" id="password1" placeholder="確認密碼*" class="form-control form-control-user">
                                <span style="color: red;" id="ih3"></span><br>
                                </div>
                                <div class="form-group">
                                <input style="outline-color:green;" type="text" name="name" id="name" placeholder="中文姓名*" class="form-control form-control-user">
                                <span style="color: red;" id="ih4"></span><br>
                                </div>
                                <div class="form-group">
                                <input style="outline-color:green;" type="text" name="email" id="email" placeholder="信箱*" class="form-control form-control-user">
                                <span style="color: red;" id="ih5"></span><br>
                                </div>
                                <div class="form-group">
                                <input style="outline-color:green;" type="text" name="birthday" id="birthday" placeholder="生日*" class="form-control form-control-user">
                                <span style="color: red;" id="ih6"></span><br>
                                </div>
                               <!--  <div class="loggedin-forgot d-inline-flex my-3">
                                        <input type="checkbox" id="registering" class="mt-1">
                                        <label for="registering" class="px-2">By registering, you accept our <a class="text-primary font-weight-bold" href="#">Terms  Conditions</a></label>
                                </div> -->
                                <div align="center">
                                <button type="button" class="btn btn-success" id="sendData"  >立即註冊</button>
                                <button id="quick" type="button" class="btn btn-light" >快速輸入</button>
                                </div>
                            </div>
                            <hr>
                            <div class="text-center">
                                <a class="small" style="font-size:16px;" href="<c:url value='/forgetpwd.controller' />">忘記密碼 ?</a>
                            </div><br>
                            <div class="text-center">
                                <a class="small" style="font-size:16px;"  href="<c:url value='/login.controller' />">已經擁有帳戶 ? 登入 !</a>
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
	<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
	<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importBody.jsp"%>


<!-- loader -->


    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/js/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/js/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>
    <script>


var quick = document.getElementById("quick");
  		quick.onclick = function(){
  			var c1 = document.getElementById("userid");
  			var c2 = document.getElementById("password");
  			var c3 = document.getElementById("password1");
  			var c4 = document.getElementById("name");
  			var c5 = document.getElementById("email");
  			var c6 = document.getElementById("birthday");
  			var div1 = document.getElementById('ih1');
  			var div2 = document.getElementById('ih2');
  			var div3 = document.getElementById('ih3');
  			var div4 = document.getElementById('ih4');
  			var div5 = document.getElementById('ih5');
  			var div6 = document.getElementById('ih6');
  			c1.value = makeid(8);
  			c2.value = "Aa123456";
  			c3.value = "Aa123456";
  			c4.value = "陳小明";
  			c5.value = "eeit1260101@gmail.com";
  			c6.value = "1998-07-24";
  			ih1.innerHTML = "";
  			ih2.innerHTML = "";
  			ih3.innerHTML = "";
  			ih4.innerHTML = "";
  			ih5.innerHTML = "";
  			ih6.innerHTML = "";
  		}

function makeid(length) {
  		var itemm          = '';
  		var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  		var charactersLength = characters.length;
  		for ( var i = 0; i < length; i++ ) {
     	itemm += characters.charAt(Math.floor(Math.random() * charactersLength));
  	}
  		return itemm;
}

var btnn = document.getElementById("btnn");
btnn.onclick = function (){
	var f1 = document.getElementById("password");
	var f2 = document.getElementById("password1");
	if(f1.type == "password"){
		f1.type = "text";
		f2.type = "text";
	}else if(f1.type == "text"){
		f1.type = "password";
		f2.type = "password";
	}
}
</script>

</body>

</html>