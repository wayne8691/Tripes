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
	<script>
	window.onload = function(){
		let flag1=false;
		var sendemail = document.getElementById("sendemail");
		var userid = document.getElementById("userid");
		var feildset = document.getElementById("feildset");
		userid.onchange = function(){
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
  					  message = "<font color='red' > 帳號不存在</font>";
  					  flag1 = false;
  				   } else if (	result.msg.startsWith("Error") ) {
  					  message = "<font color='red' > 發生錯誤: 帳號" + result.id + "</font>";
  					  flag1=false
  				   } else {
  					  message = ""; 
  					  flag1=true
  				   }
  				   ih1.innerHTML = message;
  			    }
  		     }
		}
		
		sendemail.onclick = function(){
			if(!flag1){
				Swal.fire("Error!","請確認輸入帳號是否正確！" , "error");
				return false;
			}else{
				ih1.innerHTML = "<font color='green' > 寄信中，請稍候．．．</font>";
			}
			var xhr1 = new XMLHttpRequest();
  			xhr1.open("Post","<c:url value='/forgetpwd' />",true); 
  			xhr1.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
  			xhr1.send("userid=" + userid.value);
  			xhr1.onreadystatechange = function() {
  			    // 伺服器請求完成
  			    if (xhr1.readyState == 4 && xhr1.status == 200) {
  			    	var result = JSON.parse(xhr1.responseText);
  			  		if(result.fail){
  			  			Swal.fire("Error!",result.fail , "error");
  			  		}else if(result.success){
  			  			Swal.fire('OK',"已成功寄送信件至"+result.email+"信箱，請至信箱確認新密碼!",'success').then(function() {window.location.assign("<c:url value='/login.controller' />");})
  			  		}
  			    }
  			}
		}
	}
</script>
    <title>忘記密碼</title>

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
                            <div class="col-lg-6 d-none d-lg-block bg-password-image"><img src="${pageContext.request.contextPath}/images/taichung.jpeg" alt=""></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h3 text-gray-900 mb-2">忘記你的密碼了嗎 ?</h1><br>
                                        <p class="mb-4" style="font-size:18px;">我們明白了，事情發生了。 只要在下面輸入您的使用者帳號，我們就會向您信箱發送新密碼！</p>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                id="userid" placeholder="使用者帳號*" style="font-size:16px;">
                                            <span  id="ih1"></span><br>
                                        </div>
                                       <button type="button" id="sendemail" class="btn btn-info btn-user btn-block" style="font-size:16px;">
                                            重置密碼
                                       </button> 
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                        <a class="small"  style="font-size:16px;" href="<c:url value='/register.controller' />">創建新帳戶 !</a>
                                    </div><br>
                                    <div class="text-center">
                                        <a class="small"  style="font-size:16px;" href="<c:url value='/login.controller' />">已經擁有帳戶 ? 登入 !</a>
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
    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/js/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/js/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>


<!-- loader -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importBody.jsp"%>

</body>

</html>