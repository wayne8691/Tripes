<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>餐廳</title>

<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Arizonia&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.timepicker.css">	
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/attractionsstyle.css">

<style>
	/* 操作提示手指符號 */
	#addressRe { cursor: pointer; }
	
</style>
<!-- <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script> -->
<script type="text/javascript">	
	var key = ${pk};
	window.onload = function() {
		var div_image = document.getElementById("div_image");
		var nameRe = document.getElementById("nameRe");
		var addressRe = document.getElementById("addressRe");
		var hoursRe = document.getElementById("hoursRe");
		var phoneRe = document.getElementById("phoneRe");
		var categoryRe = document.getElementById("categoryRe");
		var introductionRe = document.getElementById("introductionRe");
		var xhr1 = new XMLHttpRequest();
		xhr1.open("GET", "<c:url value='/getRestaurantByPk/" + key + "' />", true);
		xhr1.send();	
		xhr1.onreadystatechange = function() {
		 // 伺服器請求完成
		    if (xhr1.readyState == 4 && xhr1.status == 200) {
			   var restaurantData = JSON.parse(xhr1.responseText);
			   div_image.style = "background-image:url("+ restaurantData.imageRe +");";
			   nameRe.innerHTML = restaurantData.nameRe;
			   addressRe.innerHTML = restaurantData.addressRe;
			   hoursRe.innerHTML = restaurantData.hoursRe;
			   phoneRe.innerHTML = restaurantData.phoneRe;
			   categoryRe.innerHTML = restaurantData.categoryRe;
			   introductionRe.innerHTML = restaurantData.introductionRe;
		    }
	     }
		var googleMapBtn = document.getElementById("googleMapBtn");
		googleMapBtn.onclick = function() {
			var attractionsBean = JSON.parse(xhr.responseText);
			var addressValue = attractionsBean.address;
			var googleMapDiv = document.getElementById("googleMapDiv");
			googleMapDiv.innerHTML ="<iframe width='1100' height='550' frameborder='0' style='border:0' "
								+" src='https://www.google.com/maps/embed/v1/place?key=AIzaSyCPjI6dHGzigdFeOQsjZdNFNL9niTZxBUM&q=" + addressValue + "' allowfullscreen> </iframe>";
			    
		}
		addressRe.onclick = function() {
			var attractionsBean = JSON.parse(xhr.responseText);
			var addressReValue = attractionsBean.addressRe;
			var googleMapDiv = document.getElementById("googleMapDiv");
			googleMapDiv.innerHTML ="";
			googleMapDiv.innerHTML ="<iframe width='1100' height='550' frameborder='0' style='border:0' "
								+" src='https://www.google.com/maps/embed/v1/place?key=AIzaSyCPjI6dHGzigdFeOQsjZdNFNL9niTZxBUM&q=" + addressReValue + "' allowfullscreen> </iframe>";
			    
		}
		
		
		//計算購物車商品數量
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/shoppingcarMain.controller' />", true);
//	 	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xhr.send();
		
		xhr.onreadystatechange = function(){
			var cart =document.getElementById("cart");
			var cars =JSON.parse(xhr.responseText)
			console.log(cars)
			cart.innerHTML=cars.room_id.length+cars.train.length+cars.travel.length;
		  }
		
		
		
		
		
	}
	
	
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

	
	
	
	
	</script>
</head>
<body>
<!--    ///////////////navbar////////////////////	     -->
	<jsp:include page="../webnav.jsp" flush="true"></jsp:include>

<!--    ////////////////圖片標題///////////////////	     -->
	<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url(&quot;/static/images/bg_1.jpg&quot;); height: 937px;" id="res">
			<div class="container">
				<div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center" style="height: 937px;">
					<div class="col-md-9 ftco-animate pb-5 text-center fadeInUp ftco-animated">
						<p class="breadcrumbs">
							<span class="mr-2"><a href="<c:url value='/'/>">Home <i class="fa fa-chevron-right"></i></a></span> 
							<span class="mr-2"><a href="<c:url value='/showAllRestaurant.UserReHome'/>">餐廳美食<i class="fa fa-chevron-right"></i></a></span> 
							<span class="mr-2">介紹</span> 
						</p>
						<h1 class="mb-0 bread">餐廳美食</h1>
					</div>
				</div>
			</div>
	</section>
	<!--  icons -->
<div class='icons' style='border-radius:20px; z-index:1000'>
	<table>
	   <tr>
	      <td>
	           <ul class="nav-shop">
                  <li class="nav-item" ><button onclick='shoppingCart();' style='outline:none;'><i  class="ti-shopping-cart" style='font-size:25px'></i><span id='cart'  class="nav-shop__circle" ></span></button> </li>
               </ul>
            </td>
       </tr>
       <tr>
          <td>
          <ul class="nav-shop" >
                <li class="nav-item"><button  onclick='shoppingOrder();' style='outline:none;' ><i class="ti-search" style='font-size:25px'></i></button></li>
           </ul>
           </td>
       </tr>
       <tr>
            <td>
                 <ul class="nav-shop">
                      <li class="nav-item" ><svg style='cursor: pointer;' class="bk-icon -streamline-bed cell" onclick='hotel()' height="24" width="24" viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false"><path d="M2.75 12h18.5c.69 0 1.25.56 1.25 1.25V18l.75-.75H.75l.75.75v-4.75c0-.69.56-1.25 1.25-1.25zm0-1.5A2.75 2.75 0 0 0 0 13.25V18c0 .414.336.75.75.75h22.5A.75.75 0 0 0 24 18v-4.75a2.75 2.75 0 0 0-2.75-2.75H2.75zM0 18v3a.75.75 0 0 0 1.5 0v-3A.75.75 0 0 0 0 18zm22.5 0v3a.75.75 0 0 0 1.5 0v-3a.75.75 0 0 0-1.5 0zm-.75-6.75V4.5a2.25 2.25 0 0 0-2.25-2.25h-15A2.25 2.25 0 0 0 2.25 4.5v6.75a.75.75 0 0 0 1.5 0V4.5a.75.75 0 0 1 .75-.75h15a.75.75 0 0 1 .75.75v6.75a.75.75 0 0 0 1.5 0zm-13.25-3h7a.25.25 0 0 1 .25.25v2.75l.75-.75h-9l.75.75V8.5a.25.25 0 0 1 .25-.25zm0-1.5A1.75 1.75 0 0 0 6.75 8.5v2.75c0 .414.336.75.75.75h9a.75.75 0 0 0 .75-.75V8.5a1.75 1.75 0 0 0-1.75-1.75h-7z"></path></svg></li>
                      <li class="nav-item" ><svg class="bk-icon -streamline-attractions cell" onclick='GroupHome()' height="24" width="24" viewBox="0 0 24 24" role="presentation" aria-hidden="true" focusable="false"><path d="M13.5 3a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zM15 3a3 3 0 1 0-6 0 3 3 0 0 0 6 0zm6 4.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm1.5 0a3 3 0 1 0-6 0 3 3 0 0 0 6 0zM6 7.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm1.5 0a3 3 0 1 0-6 0 3 3 0 0 0 6 0zM21 15a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm1.5 0a3 3 0 1 0-6 0 3 3 0 0 0 6 0zm-9-3.75a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm1.5 0a3 3 0 1 0-6 0 3 3 0 0 0 6 0zM6 15a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0zm1.5 0a3 3 0 1 0-6 0 3 3 0 0 0 6 0zm10.066 1.277a7.5 7.5 0 0 1-3.077 2.05.75.75 0 0 0 .498 1.415 9 9 0 0 0 3.693-2.46.75.75 0 1 0-1.114-1.005zm1.798-6.466c.177.922.183 1.869.015 2.792a.75.75 0 1 0 1.476.268c.2-1.106.194-2.24-.019-3.344a.75.75 0 1 0-1.472.284zm-5.337-5.784a7.5 7.5 0 0 1 3.54 2.196.75.75 0 0 0 1.113-1.004 9.002 9.002 0 0 0-4.247-2.636.75.75 0 1 0-.406 1.444zM6.434 6.223a7.5 7.5 0 0 1 3.539-2.196.75.75 0 1 0-.406-1.444A9.001 9.001 0 0 0 5.32 5.219a.75.75 0 0 0 1.114 1.004zM4.636 12.69a7.602 7.602 0 0 1 0-2.878.75.75 0 1 0-1.472-.284 9.102 9.102 0 0 0 0 3.446.75.75 0 0 0 1.472-.284zm4.876 5.639a7.517 7.517 0 0 1-3.035-2.005.75.75 0 0 0-1.106 1.014 9.017 9.017 0 0 0 3.641 2.405.75.75 0 1 0 .5-1.414zM7.31 21.872A1.5 1.5 0 0 0 8.672 24h6.656a1.5 1.5 0 0 0 1.362-2.128l-3.314-8.217c-.361-.785-1.252-1.114-2.005-.767a1.5 1.5 0 0 0-.733.734l-3.343 8.283zm1.377.595l3.328-8.25-.015.033 3.313 8.217.015.033H8.672z"></path></svg></li>
                 </ul>
            </td>
       </tr>         
       <tr>
                <td>
                    <ul class="nav-shop">
                        
                          <li class="nav-item" ><svg class="bk-icon -iconset-food hp__facility_group_icon cell" onclick='ReHome();' fill="#333333" height="20" width="20" viewBox="0 0 128 128" role="presentation" aria-hidden="true" focusable="false"><path d="M44.1 8.9L48 44a12 12 0 0 1-12 12h-3.6l3.4 59.8a4 4 0 0 1-4 4.2h-7.6a4 4 0 0 1-4-4.2L23.6 56H20A12 12 0 0 1 8 44l3.9-35.1a1 1 0 0 1 1-.9H15a1 1 0 0 1 1 1v19a4 4 0 0 0 4 4h4.8L26 9a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1l1.2 23H36a4 4 0 0 0 4-4V9a1 1 0 0 1 1-1h2.1a1 1 0 0 1 1 .9zM60 24v48h8l-3.8 43.8a4 4 0 0 0 4 4.2h7.6a4 4 0 0 0 4-4.2L80 8h-4a16 16 0 0 0-16 16zm60 8c0-13.3-7.2-24-16-24S88 18.8 88 32c0 11 5 20.2 11.6 23l-3.4 60.8a4 4 0 0 0 4 4.2h7.6a4 4 0 0 0 4-4.2L108.4 55c6.7-2.8 11.6-12 11.6-23z"></path></svg></li >
                    </ul>
                </td>
          
          </tr>
           <tr>
            <td>
                 <ul class="nav-shop">
                     <li class="nav-item" ><svg class="bk-icon -iconset-spa hp__facility_group_icon cell" onclick='atHome();' fill="#333333" height="24" width="24" viewBox="0 0 128 128" role="presentation" aria-hidden="true" focusable="false"><path d="M64.7 12.3a.8.8 0 0 0-1 0C57 18 38.4 37.8 59.2 59c.3.3 1.5 1.2 1.7-.3a.6.6 0 0 1 0-.1l3.2-21 3.2 20.8v.3c.3 1.3 1.2.7 1.6.4 21-21.1 2.5-40.8-4.2-46.8zM120 51.8v-.1a.8.8 0 0 0-.3-1C111.9 46.4 87 35.3 74.2 62c-.1.4-.6 1.8.9 1.5l20.8-4-18.4 10-.3.1c-1.2.7-.2 1.4.2 1.6C104.1 84 116.5 60 119.9 51.7zm-111.8.1a.8.8 0 0 1 .3-1c7.7-4.4 32.5-15.4 45.4 11.4.1.3.6 1.7-.9 1.5l-20.9-4 18.5 10h.2c1.2.7.3 1.4-.1 1.7C23.9 84.3 11.5 60.3 8 51.9zm94.5 64a.8.8 0 0 0 .8-.7c.8-8.8.7-36-28.9-36.9-.4 0-1.8.2-1 1.4l12.1 17.5-16.5-12.8-.2-.2c-1.2-.8-1.4.3-1.5.8-.7 29.7 26.2 31.3 35.2 31zm-77.1 0h-.1a.8.8 0 0 1-.8-.7c-.7-8.8-.7-36 29-36.9.3 0 1.8.2 1 1.4L42.3 97.3 59 84.4l.2-.2c1.1-.8 1.4.3 1.4.8.7 29.7-26.2 31.3-35.1 31z"></path></svg></li>
                 </ul>
            </td>
       </tr>
	</table>
		</div>
<!--    ////////////////影片///////////////////	     -->
	<section class="ftco-section ftco-about img" style="background-image: url(https://images.unsplash.com/photo-1428278819486-8f00bd7cdf80?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1350&q=80);">
	 <div class="overlay"></div>
		<div class="row py-md-5">
			<div class="col-md d-flex align-items-center justify-content-center">
				<a href="https://www.youtube.com/watch?v=1kSN5YPEch0" class="icon-video popup-vimeo d-flex align-items-center justify-content-center mb-4">
					<span class="fa fa-play"></span>
				</a>
			</div>
		</div>
	</section>
	

<!--    ////////////////資料顯示區///////////////////	     -->
	<section class="ftco-section ftco-about ftco-no-pt img" style='background-color:#FCFCFC;'>
		<div style="padding: 0 8% 2% 8%;">
			<div class="row d-flex">
				<div class="col-md-12 about-intro">
					<div class="row">
						<div class="col-md-6 d-flex align-items-stretch">
							<!-- 跳轉位置 -->
							<a href="#" name="gotoMapDiv"></a>
							<div id="div_image" class="img d-flex w-100 align-items-center justify-content-center" style="">
							</div>
						</div>
						<div class="col-md-6 pl-md-5 py-5">
							<div class="row justify-content-start pb-3">
								<div class="col-md-12 heading-section ftco-animate fadeInUp ftco-animated">
									<h2 class="mb-4">
										<font style="vertical-align: inherit;" id="nameRe"></font>
									</h2>
									<p>
										<font style="vertical-align: inherit;"> 
											<span id="introductionRe"></span>
										</font>
									</p>
									<h4>營業時間 :
										<font style="vertical-align: inherit;"> 
											<span id="hoursRe"></span>
										</font>
									</h4>
									<h4>電話 : 
										<font style="vertical-align: inherit;"> 
											<span id="phoneRe"></span>
										</font>
									</h4>
									<h4 class="mb-4">種類 : 
										<font style="vertical-align: inherit;"> 
											<span id="categoryRe"></span>
										</font>
									</h4>
									<h4 class="mb-4">
										<font style="vertical-align: inherit;"> 
											<span class="fa fa-map-marker" id="addressRe"></span>
										</font><br>
									</h4>
									<p>
										<a href="#gotoMapDiv" class="btn btn-primary" id="googleMapBtn"> 
											<font style="vertical-align: inherit;">查看地圖</font>
										</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--   googleMap -->
		<div class="container">
			<div id="googleMapDiv"></div>
		</div>
	</section>
<!--    ////////////////footer///////////////////	     -->
<%@ include file="/WEB-INF/pages/trainandhotel/footer.jsp"%>


<!--    /////////////// loader////////////////////	     -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.animateNumber.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="${pageContext.request.contextPath}/js/google-map.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>
</html>