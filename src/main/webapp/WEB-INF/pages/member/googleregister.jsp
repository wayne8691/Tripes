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
  				"status": "c_Member",
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
	  				Swal.fire('OK',"註冊成功!",'success').then(function() {window.location.assign("<c:url value='/login.controller' />");})
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
	
    <title>信箱註冊</title>
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

         <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-6 d-none d-lg-block bg-login-image"><img src="${pageContext.request.contextPath}/images/cfjoyqlhwjk.jpeg" alt=""></div>
                    <div class="col-lg-6">
                        <div class="p-5">
                            <div class="text-center">
                                <h2 class="h2 text-gray-900 mb-4">填寫完整資料！</h2>
                            </div>
                            <div class="user">
                                <span  id="ih0"></span><br>
                            	
                                <div class="form-group">
                                <input style="outline-color:green;" type="text" name="userid" id="userid" placeholder="使用者帳號*" class="form-control form-control-user" value="${registeruser.getUserid()}" readonly>
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
                                <input style="outline-color:green;" type="text" name="name" id="name" placeholder="中文姓名*" class="form-control form-control-user" value="${registeruser.getName()}">
                                <span style="color: red;" id="ih4"></span><br>
                                </div>
                                
                                <div class="form-group">
                                <input style="outline-color:green;" type="text" name="email" id="email" placeholder="信箱*" class="form-control form-control-user" value="${registeruser.getEmail()}" readonly>
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
                                <button id="sendData" type="button" class="btn btn-success" >立即註冊</button>
                                <button id="quick" type="button" class="btn btn-light" >快速輸入</button>
                                </div>
                            </div>
                            <hr>
                            <div class="text-center">
                                <a class="small" style="font-size:16px;" href="<c:url value='/forgetpwd.controller' />">忘記密碼 ?</a>
                            </div><br>
                            <div class="text-center">
                                <a class="small" style="font-size:16px;" href="<c:url value='/login.controller' />">已經擁有帳戶 ? 登入 !</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
	</div>
    </div>
	<%-- <footer class="ftco-footer bg-bottom ftco-no-pt" style="background-image: url('${pageContext.request.contextPath}/static/images/bg_3.jpg');">
	<%@ include file="/WEB-INF/pages/trainandhotel/footer.jsp"%>
</footer> --%>



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
  			var c2 = document.getElementById("password");
  			var c3 = document.getElementById("password1");
  			var c6 = document.getElementById("birthday");
  			c2.value = "Aa123456";
  			c3.value = "Aa123456";
  			c6.value = "1998-07-24";
  			var div2 = document.getElementById('ih2');
  			var div3 = document.getElementById('ih3');
  			var div6 = document.getElementById('ih6');
  			ih2.innerHTML = "";
  			ih3.innerHTML = "";
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




<!-- loader -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importBody.jsp"%>

</body>

</html>