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
window.onload = function() {
	var checknum1 = document.getElementById("checknum1");
	checknum1.onclick = function(){
		ih.innerHTML = "";
	}
	
	var userid = document.getElementById("checkemail");
	var checknum = document.getElementById("checknum");
	checknum.value = makeid(4);
	userid.onclick = function(){
		ih.innerHTML = "<font color='green' size='-2'>已發送至信箱</font>";
		checknum.value = makeid(4);
		var xhr = new XMLHttpRequest();
		xhr.open("Post","<c:url value='/emailCheck' />",true); 
		xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xhr.send("checknum=" + checknum.value);
		var message="";
		xhr.onreadystatechange = function() {
  			
  			if (xhr.readyState == 4 && xhr.status == 200) {
  				var result = JSON.parse(xhr.responseText);
          			ih.innerHTML = "<font color='green' size='-2'>"
	     				+ result.msg + "</font>";
  			}
  		}
	}
	
	var veritify = document.getElementById("veritify");
	veritify.onclick = function(){
		if(checknum1.value != checknum.value){
			Swal.fire("Error!","驗證碼輸入錯誤！" , "error");
 			return false;
		}else{
			
		}
		var xhr1 = new XMLHttpRequest();
		xhr1.open("Post","<c:url value='/verifysuccess' />",true); 
		xhr1.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xhr1.send();
		xhr1.onreadystatechange = function() {
  			
  			if (xhr1.readyState == 4 && xhr1.status == 200) {
  				var result = JSON.parse(xhr1.responseText);
  				Swal.fire('OK',"驗證成功",'success')
  				.then(function() {window.location.assign("${pageContext.request.contextPath}/login.controller");})
  				
  			}
  		}
	}
	
}
function makeid(length) {
		var itemm          = '';
		var characters       = '0123456789';
		var charactersLength = characters.length;
		for ( var i = 0; i < length; i++ ) {
 	itemm += characters.charAt(Math.floor(Math.random() * charactersLength));
	}
		return itemm;
}
</script>
    <title>信箱驗證</title>

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
                            <div class="col-lg-6 d-none d-lg-block bg-password-image"><img src="${pageContext.request.contextPath}/images/greenisland.jpeg" alt=""></div>
                            
                            <div class="p-5">
                            	
                            	<div class="text-center"><h1 class="h3 text-gray-900 mb-2">　　信箱認證</h1><br>
                                <h2>${registeruser.getEmail()}</h2></div>
                            	<div class="loggedin-forgot d-inline-flex my-3">
                            		<input type="hidden" name="checknum" id="checknum" />	
                                	<input style="outline-color:green;font-size:16px;" type="text" name="checknum1" id="checknum1" placeholder="輸入驗證碼*" class="border p-3 w-100 my-2">                         
                                </div>
                                <br><span  id="ih"></span><br>  
                          		<button id="checkemail" class="btn btn-danger d-block py-1 px-2 bg-primary text-white border-0 rounded font-weight-bold" style="font-size:16px;">發送驗證碼</button><br>
                                	
   
                              	<div>
                                <button id="veritify" type="button" class="btn btn-success" style="font-size:16px;">立即驗證</button>
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
   
    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/js/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/js/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>


	<!-- loader -->
	

</body>

</html>