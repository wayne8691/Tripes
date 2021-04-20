<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="h-100" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <script type="text/javascript">
  	let flag1=false,flag2=false;
  	window.onload = function() {
  		var senddata = document.getElementById("senddata");
  		var userid = document.getElementById("userid");
  		var password = document.getElementById("password");
  		userid.onchange = function(){
  			if(!userid.value){
  				ih1.innerHTML =  "<font color='red' >*請輸入使用者帳號</font>";
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
  					  message = "<font color='red' >帳號錯誤</font>";
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
  		
  		password.onchange = function(){
  			if(!password.value){
  				ih2.innerHTML =  "<font color='red' >*請輸入密碼</font>";
  				flag2 = false;
  			}else{
  				ih2.innerHTML =  "";
  				flag2=true;
  			}
  		}
  		
		senddata.onclick = function(){
  			
  			if(!(flag1)){
  				ih1.innerHTML =  "<font color='red' >*使用者帳號錯誤</font>";
  				return false;
			}	
  			if(!flag2){
  				ih2.innerHTML =  "<font color='red' >*密碼錯誤</font>";
	   			return false;
  			}
			var xhr1 = new XMLHttpRequest();
  	   		xhr1.open("POST", "<c:url value='/loginaction' />", true);
  	   		xhr1.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
  	   		xhr1.send();
  	   		xhr1.onreadystatechange = function() {
  	   			if (xhr1.readyState == 4 && xhr1.status == 200) {
  	   				var result = JSON.parse(xhr1.responseText);
  	   				if(result.pwdfail){
  	   					ih2.innerHTML = "<font color='red' >*" + result.pwdfail + "</font>";
  	   				} else if(result.success){
  	   					ih1.innerHTML = "<font color='red' >" + result.success + "</font>";
  	   					window.location.assign(result.url);
  	   				} else if(result.verify){
  	   					ih1.innerHTML = "<font color='red' >" + result.verify + "</font>";
  	   					window.location.assign(result.url);
  	   				} else if(result.idfail){
  	   					ih1.innerHTML = "<font color='red' >*" + result.idfail + "</font>";
  	   				} else if(result.stopfail){
  	   					ih1.innerHTML = "<font color='red' >*" + result.stopfail + "</font>";
  	   				}
  	   				
  	   			}
  	   		}
  	   		
  		}
  	}
  	</script>
    <title>Quixlab - Bootstrap Admin Dashboard Template by Themefisher.com</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/managementimages/favicon.png">
    <link href="${pageContext.request.contextPath}/managementcss/style.css" rel="stylesheet">
    
</head>

<body class="h-100">
    
    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    



    <div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                <a class="text-center" href="index.html"> <h4>Rosella</h4></a>
        
                                <div class="mt-5 mb-5 login-input">
                                    <div class="form-group">
                                        <input type="text" class="form-control" placeholder="UserID" id="userid">
                                        <span  id="ih1"></span><br>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" placeholder="Password" id="password">
                                   		<span  id="ih2"></span><br>
                                    </div>
                                    <button class="btn login-form__btn submit w-100" id="senddata">Sign In</button>
                                </div>
                                <div align="center">
                <a class="navbar-brand" href="<c:url value='' />" title="o19908724">
					<img src="${pageContext.request.contextPath}/images/—Pngtree—flat man avatar_5939772.png" alt="">
				</a>
				<a class="navbar-brand" href="<c:url value='/tripwebindex.controller' />">
					<img src="${pageContext.request.contextPath}/images/—Pngtree—flat man head_5936100.png" alt="">
				</a>
				<a class="navbar-brand" href="<c:url value='/tripwebindex.controller' />">
					<img src="${pageContext.request.contextPath}/images/—Pngtree—flat man head_5913517.png" alt="">
				</a>
				<a class="navbar-brand" href="<c:url value='/tripwebindex.controller' />">
					<img src="${pageContext.request.contextPath}/images/—Pngtree—flat girl head_5939621.png" alt="">
				</a>
				<a class="navbar-brand" href="<c:url value='/tripwebindex.controller' />">
					<img src="${pageContext.request.contextPath}/images/—Pngtree—flat girl head_5941802.png" alt="">
				</a>
				</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

    

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="${pageContext.request.contextPath}/managementplugins/common/common.min.js"></script>
    <script src="${pageContext.request.contextPath}/managementjs/custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/managementjs/settings.js"></script>
    <script src="${pageContext.request.contextPath}/managementjs/gleek.js"></script>
    <script src="${pageContext.request.contextPath}/managementjs/styleSwitcher.js"></script>
</body>
</html>





