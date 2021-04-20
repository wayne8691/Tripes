<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
	
  <!-- SITE TITTLE -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <title>TripWeb</title>
  
  <!-- FAVICON -->
  <link href="${pageContext.request.contextPath}/img/favicon.png" rel="shortcut icon">
  <!-- PLUGINS CSS STYLE -->
  <!-- <link href="plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet"> -->
  <!-- Bootstrap -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap-slider.css">
  <!-- Font Awesome -->
  <link href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <!-- Owl Carousel -->
  <link href="${pageContext.request.contextPath}/plugins/slick-carousel/slick/slick.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/plugins/slick-carousel/slick/slick-theme.css" rel="stylesheet">
  <!-- Fancy Box -->
  <link href="${pageContext.request.contextPath}/plugins/fancybox/jquery.fancybox.pack.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/plugins/jquery-nice-select/css/nice-select.css" rel="stylesheet">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/shoppingcarstyle/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/shoppingcarstyle/vendors/themify-icons/themify-icons.css">
  <!-- CUSTOM CSS -->
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
  <link rel="apple-touch-icon" href="https://t-cf.bstatic.com/static/img/apple-touch-icon/c9b35bf29a75cac2f430f80a5d4bc7fd961d21a7.png">
<link rel="help" href="https://www.booking.com/faq.zh-tw.html?aid=376396;label=booking-name-yefrPbbyS%2AFIINHgyCnmNgS267725091255%3Apl%3Ata%3Ap1%3Ap22%2C563%2C000%3Aac%3Aap%3Aneg%3Afi%3Atikwd-65526620%3Alp1012817%3Ali%3Adec%3Adm%3Appccp%3DUmFuZG9tSVYkc2RlIyh9YfqnDqqG8nt1O4nYvDr1lms;sid=c82c00c592774d551579a29110105b86;srpvid=a6f11f4c60bc0054&amp;;">
<!--   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.13.0/dist/sweetalert2.all.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
    <style type="text/css">
   @import url('https://fonts.googleapis.com/css2?family=Noto+Sans&family=Roboto&display=swap');
   .fonts{
    font-family: 'Noto Sans', sans-serif;
font-family: 'Noto Sans TC', sans-serif;
font-family: 'Roboto', sans-serif;
   }
   
   
   .container100 {
  display: flex;
  justify-content: space-around;
  align-items: flex-start;
  border: 2px dashed rgba(114, 186, 94, 0.35);
  height: 400px;
  background: rgba(114, 186, 94, 0.05);
  position: sticky;
  top: 0;
  width: 350px;
  height: 250px;
  margin:0;
  
 float: left;
 
}
  
       .cell {
	       cursor: pointer;
         }
   
         .colors{
          background-color: #212529;
          font-color:white
         
         
         }
         
          .background{
          background-color: #F0F0F0;
         }
         .icons {
  display: flex;
  justify-content: space-around;
  align-items: flex-start;
  border: 2px solid ;
  height: 250px;
  background: #F0F0F0;
  position: sticky;
  top: 0;
  width: 60px;
 text-align: center;
  height: 200px;
  margin:0;
    
 
 
 float: right;
 
}
.icons li{
position: relative;
    left: -10px;
    float: right;
}
         
    
    
    </style>
</head>

<body class="body-wrapper ">


<section class='colors'>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg navbar-light navigation">
					<a class="navbar-brand" href="<c:url value='/'/>">
						<img src="${pageContext.request.contextPath}/images/logo.png" alt="">
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
					 aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ml-auto main-nav ">
							<li class="nav-item active">
							
								<a  class="nav-link fonts"  style="color:white; font-size:18px; " href="/">首頁</a>
							</li>
							
							<li class="nav-item dropdown dropdown-slide">
							
								<a class="nav-link dropdown-toggle" data-toggle="dropdown " style="color:white; font-size:18px;font-size:20px; "  href=""><i class="fa fa-h-square" aria-hidden="true"></i>	火車/住宿<span><i class="fa fa-angle-down"></i></span>
								</a>

								<!-- Dropdown list -->
								<div class="dropdown-menu">
								
									<a class="dropdown-item" style="font-size:18px;" href="<c:url value='/'/>">我要訂房</a>
						
								</div>
							</li>
							<li class="nav-item dropdown dropdown-slide">
								<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" style="color:white; font-size:18px; " aria-expanded="false">
									<i class="fa fa-map" aria-hidden="true"></i>景點/套裝行程<span><i class="fa fa-angle-down"></i></span>
								</a>
								
								<!-- Dropdown list -->
								<div class="dropdown-menu">
									<a class="dropdown-item" style="font-size:18px;" href="<c:url value='/showAllAttractions.UserAtHome'/>">旅遊景點</a>
									<a class="dropdown-item" style="font-size:18px;" href="<c:url value='/showAllGroup.UserGroupHome'/>">套裝行程</a>
						
								</div>
							</li>
							<li class="nav-item dropdown dropdown-slide">
								<a class="nav-link dropdown-toggle"  href="" data-toggle="dropdown" aria-haspopup="true" style="color:white; font-size:18px; " aria-expanded="false">
									<i class="fa fa-tasks" aria-hidden="true"></i></i>討論區 <span><i class="fa fa-angle-down"></i></span>
								</a>
								<!-- Dropdown list -->
								<div class="dropdown-menu">
									<a class="dropdown-item" style="font-size:18px;" href="<c:url value='/userBlogHome.controller'/>">文章</a>
									<a class="dropdown-item" style="font-size:18px;" href="">其他</a>
								</div>
							</li>
							<li class="nav-item dropdown dropdown-slide">
								<a class="nav-link dropdown-toggle" href="" data-toggle="dropdown" style="color:white; font-size:18px; " aria-haspopup="true" aria-expanded="false">
									<i class="fa fa-shopping-cart" aria-hidden="true"></i></i>購物車 <span><i class="fa fa-angle-down"></i></span>
								</a>
								<!-- Dropdown list -->
								<div class="dropdown-menu">
								   <a class="dropdown-item" style="font-size:18px;" href="<c:url value='/shoppingcart/car' />">購物車</a>
									<a class="dropdown-item" style="font-size:18px;" href="<c:url value='/ShoppingOrder.controller'/>">訂單查詢</a>
		
								</div>
							</li>	
						</ul>
						
						<ul class="navbar-nav ml-auto mt-10" id="information">
							<c:choose>
							<c:when test="${empty loginuser}">
              					<li class="nav-item">
									<a class="nav-link login-button" style=" color:white;" href="<c:url value='/login.controller' />">
										登入
									</a>
								</li>
								<li class="nav-item">
									<a class="nav-link text-white add-button" style=" color:white;" href="<c:url value='/register.controller' />">
										<i class="fa fa-plus-circle"></i> 註冊
									</a>
								</li>
							</c:when>
							<c:otherwise>
									<li class="nav-item dropdown dropdown-slide" >
 										<a class="nav-link dropdown-toggle" href="" style="color:white; font-size:15px;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
 											${loginuser.getUserid()}
 										</a>
										<div class="dropdown-menu">
											<c:choose>
											<c:when test="${loginuser.getStatus()=='a_Admin'}">
											<a class="dropdown-item" style="font-size:18px;" href="${pageContext.request.contextPath}/managememberchart.controller">
												管理員專區
											</a>
											</c:when>
											</c:choose>
											<a class="dropdown-item" style=" font-size:18px;" href="${pageContext.request.contextPath}/userprofile.controller">
												個人資料
											</a>
											<a class="dropdown-item" style=" font-size:18px;" href="<c:url value='/logout' />">
												登出
											</a>
										</div>
 									</li>
							</c:otherwise>
     						</c:choose>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
</section>



<!-- JAVASCRIPTS -->
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap-slider.js"></script>
  <!-- tether js -->
<script src="${pageContext.request.contextPath}/plugins/tether/js/tether.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/raty/jquery.raty-fa.js"></script>
<script src="${pageContext.request.contextPath}/plugins/slick-carousel/slick/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jquery-nice-select/js/jquery.nice-select.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/fancybox/jquery.fancybox.pack.js"></script>
<script src="${pageContext.request.contextPath}/plugins/smoothscroll/SmoothScroll.min.js"></script>
<script>
//跳轉畫面
function shoppingCart(){
			
			window.location.assign("http://localhost:8080/shoppingcart/car");
			
			
		}
	function shoppingOrder(){
			
			window.location.assign("http://localhost:8080/ShoppingOrder.controller");
		}

	function hotel(){

		window.location.assign("http://localhost:8080/");


		}

	function ReHome(){
		
		window.location.assign("http://localhost:8080/showAllRestaurant.UserReHome");
	}

	function GroupHome(){

	window.location.assign("http://localhost:8080/showAllGroup.UserGroupHome");


	}
	function atHome(){

		window.location.assign("http://localhost:8080/showAllAttractions.UserAtHome");
	}


</script>

</body>

</html>



