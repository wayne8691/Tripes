<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.iii.trip.trainandhotel.repository.*"%>

<% 
HttpSession session2 =request.getSession();
List<TrainStation> tsList = session2.getAttribute("all") != null? (List<TrainStation>) session2.getAttribute("all"):
		new ArrayList<>();
int count = 0;
%>
<!DOCTYPE html>
<html>
<head>
<title>餐廳首頁</title>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
<!--    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet"> -->
<!--     <link href="https://fonts.googleapis.com/css2?family=Arizonia&display=swap" rel="stylesheet"> -->

<!--     <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->


    <link rel="stylesheet"type="text/css"  href="${pageContext.request.contextPath}/css/animate.css" />
    
<%--     <link rel="stylesheet"type="text/css"  href="${pageContext.request.contextPath}/css/owl.carousel.min.css" /> --%>
<%--     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css" /> --%>
<%--     <link rel="stylesheet"type="text/css"  href="${pageContext.request.contextPath}/css/magnific-popup.css" /> --%>

<%--     <link rel="stylesheet"type="text/css"  href="${pageContext.request.contextPath}/css/bootstrap-datepicker.css" /> --%>
<%--     <link rel="stylesheet"type="text/css"  href="${pageContext.request.contextPath}/css/jquery.timepicker.css" /> --%>

    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/attractionsstyle.css" />
    <style>
    
    	/*  熱門項目樣式 */
    	.menu{
		   float: left;
		   width: 17%;
		   padding:0.5em;
		   border-radius:10px;
		   background:linear-gradient(#FCFCFC,#F0F0F0,#FCFCFC,#F0F0F0,#F0F0F0,#FCFCFC,#FFFFFF,#FCFCFC,#F0F0F0,#FCFCFC);
		}
		/*  照片 */
	.ellipsis {
		margin:5pt 2pt 5pt 2pt;
		overflow:hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 2;
		-webkit-box-orient: vertical;
		white-space: normal;
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
            z-index:1000
 
}
    .container-1{
	  width: 100%;
	  padding-right:15%;
	  padding-left: 20%;
	  margin-right: auto;
	  margin-left: auto;
	
	}
</style>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">

var indexPage;
var totalPages;
	$(document).ready(function(){
		var indexpage1 =document.getElementById("1");
		console.log(indexpage1)
		indexpage1.className="active";	
		indexPage = 1;		
	    load(indexPage);
	    load(totalPages);
	    
		$.ajax({
			type:'post',
			url:'/attractions.Restaurant/findAllRestaurantByCountDesc/',
			dataType:'JSON',
			contentType:'application/json',
			success: function(data) {
				var json = JSON.stringify(data, null, 4);
			    var parsedObjinArray = JSON.parse(json);
			    $('#hot').empty(""); //清空table內的資料
				if(json = null){
				    $('#hot').prepend("<h3>-----人氣排名計算中-----</h3>");
				}else{
					 var hot = $('#hot');
				    	userReDisplay = "<c:url value='/userReDisplay/' />";
				    	var j = 1 ;
				    	$.each(parsedObjinArray,function(i,n){
					    	 data1 = "<br><div><div class='item'><div class='project-destination'>"
										+ "<a href='" + userReDisplay + n.pk + "' class='img' style='background-image: url(" +  n.imageRe  + ");'>"
										+ "	<div class='text'><h3>👁"+ n.countRe +"人</h3><span>NO."+ j +"</span></div>"
										+ "</a>"
									+"</div></div>";
							 hot.append(data1);		        
					    	 j++;
				   });
			  }
		   },
		   error: function() {
		       console.log("error");
		       $('#hot').prepend("<h3>-----人氣排名計算中-----</h3>");
		   }
		  });
	});


	var lis=null;
	function change(page,li){
		var li0 = document.getElementById(li.id);
		
		if(lis == null){
			var indexpage1 =document.getElementById("1");
			indexpage1.className="aa";
			lis =li0;
			lis.className = "active";
			
		}else if(lis.id != li0.id){
			lis.className = "aa";
			console.log(lis)
			lis =li0;
			console.log(lis)
			lis.className = "active";
			
		}
		console.log(li0.length)			
		indexPage = page;  			
	    load(indexPage);
	}
	
	function back(){
		var indexpage2 =document.getElementById(indexPage);
		console.log(indexpage2)
		
		if(indexPage > 1){
			indexpage2.className="aa";
		    indexPage = indexPage - 1;
		    indexpage2 =document.getElementById(indexPage);
		    indexpage2.className="active";
		    load(indexPage);
		}
	}
	function next(totalPagesValue){
		var indexpage2 =document.getElementById(indexPage);
		if(indexPage < totalPagesValue){
			indexpage2.className="aa";
			indexPage = indexPage + 1;
		    indexpage2 =document.getElementById(indexPage);
		    indexpage2.className="active";
			load(indexPage);
		}	
	} 
	
	function load(indexPage){
		console.log("indexPage:" + indexPage);
		$.ajax({
			type:'post',
			url:'/attractions.Restaurant/queryAllRestaurantByPage.controller/' + indexPage,
			dataType:'JSON',
			contentType:'application/json',
			success: function(data) {
				var json = JSON.stringify(data, null, 4);
			    console.log("SUCCESS : ", json);
			    var parsedObjinArray = JSON.parse(json);
			    $('#area1').empty(""); //清空table內的資料
					if(json = null){
				    	$('div1').prepend("<span>暫無資料</span>");
				    }else{
				    	var area1 = $('#area1');
				    	userReDisplay = "<c:url value='/userReDisplay/' />";
					    $.each(parsedObjinArray,function(i,n){
					    	 data1 = "<div class='col-md-4 ftco-animate fadeInUp ftco-animated'>"
								    	 +"<div class='project-wrap'>"
											+ "<a href='" + userReDisplay + n.pk + "' class='img' style='background-image: url(" +  n.imageRe  + ");'>"
												+ "<span class='price'>" +  n.countiesRe + "</span>"
											+ "</a>"
											+ "<div class='text p-4'>"
												+ "<h3 hidden='hidden'>"+n.pk  +"</h3>"
										    	+ "<h3>"+  n.nameRe +"</h3>"
										    	+ "<h4 class='ellipsis'> "+ n.introductionRe + "</h4>"
										    	+ "<p>營業時間 : " + n.hoursRe + "<br>"
										    	+ "<p><span class='fa fa-map-marker'> " + n.addressRe + "</span></p>"
								    	+ "</div> </div> </div>";
							  area1.append(data1);
					   });
					
				  }
			   },
			   error: function() {
			       console.log("error");
			   }
		  });
		}
		
	  function search(){
	    	var searchCounties= $('#searchCounties').val();
			console.log(searchCounties);
			
			var searchName= $( "input" ).val();
			console.log(searchName);
			
			if(searchName==""){
				searchName="null";
			}
			if(searchCounties != "null" || searchName != "null"){

			$.ajax({
				type:'post',
				url:'/attractions.Restaurant/findRestaurantByNameReOrCountiesRe/'+ searchName +'/'+ searchCounties,
				dataType:'JSON',
				contentType:'application/json',
				success: function(data) {
					var json = JSON.stringify(data, null, 4);
				    console.log("SUCCESS : ", json);
				    var parsedObjinArray = JSON.parse(json);
				    console.log("JSON.parse(json): ", JSON.parse(json));
				    $('#area1').empty(""); //清空table內的資料
						if(json = null){
					    	$('div1').prepend("<span>暫無資料</span>");
					    }else{
							userAtDisplay = "<c:url value='/userAtDisplay/' />";
						    $.each(parsedObjinArray,function(i,a){
						    	 data2 =  "<div class='col-md-4 ftco-animate fadeInUp ftco-animated'>"
							    	 +"<div class='project-wrap'>"
										+ "<a href='" + userReDisplay + a.pk + "' class='img' style='background-image: url(" +  a.imageRe  + ");'>"
											+ "<span class='price'>" +  a.countiesRe + "</span>"
										+ "</a>"
										+ "<div class='text p-4'>"
											+ "<h3 hidden='hidden'>" +a.pk  +"</h3>"
									    	+ "<h3>"+  a.nameRe +"</h3>"
									    	+ "<h4 class='ellipsis'> "+ a.introductionRe + "</h4>"
									    	+ "<p>營業時間 : " + a.hoursRe + "<br>"
									    	+ "<p><span class='fa fa-map-marker'> " + a.addressRe + "</span></p>"
							    	+ "</div> </div> </div>";
								$('#area1').append(data2);
						   });
					  }
				   },
				   error: function() {
				       console.log("error");
				   }
			  });
			}
		}
		
</script>
</head>	
<body>
<!--    ///////////////navbar////////////////////	     -->
<jsp:include page="../webnav.jsp" flush="true"></jsp:include>

<!--    ////////////////圖片標題///////////////////	     -->
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url(&quot;/static/images/bg_1.jpg&quot;); height: 945px;" id="res">
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center" style="height: 937px;">
				<div class="col-md-9 ftco-animate pb-5 text-center fadeInUp ftco-animated">
					<a href="#" name="gotoTitle"></a>
					<p class="breadcrumbs">						
						<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
						<span class="mr-2"><a href="<c:url value='/showAllRestaurant.UserReHome'/>">餐廳美食<i class="fa fa-chevron-right"></i></a></span> 
					</p>
					<h1 class="mb-0 bread" >餐廳美食</h1>
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
                     <li class="nav-item" ><svg class="bk-icon -iconset-spa hp__facility_group_icon cell" onclick='atHome()' fill="#333333" height="24" width="24" viewBox="0 0 128 128" role="presentation" aria-hidden="true" focusable="false"><path d="M64.7 12.3a.8.8 0 0 0-1 0C57 18 38.4 37.8 59.2 59c.3.3 1.5 1.2 1.7-.3a.6.6 0 0 1 0-.1l3.2-21 3.2 20.8v.3c.3 1.3 1.2.7 1.6.4 21-21.1 2.5-40.8-4.2-46.8zM120 51.8v-.1a.8.8 0 0 0-.3-1C111.9 46.4 87 35.3 74.2 62c-.1.4-.6 1.8.9 1.5l20.8-4-18.4 10-.3.1c-1.2.7-.2 1.4.2 1.6C104.1 84 116.5 60 119.9 51.7zm-111.8.1a.8.8 0 0 1 .3-1c7.7-4.4 32.5-15.4 45.4 11.4.1.3.6 1.7-.9 1.5l-20.9-4 18.5 10h.2c1.2.7.3 1.4-.1 1.7C23.9 84.3 11.5 60.3 8 51.9zm94.5 64a.8.8 0 0 0 .8-.7c.8-8.8.7-36-28.9-36.9-.4 0-1.8.2-1 1.4l12.1 17.5-16.5-12.8-.2-.2c-1.2-.8-1.4.3-1.5.8-.7 29.7 26.2 31.3 35.2 31zm-77.1 0h-.1a.8.8 0 0 1-.8-.7c-.7-8.8-.7-36 29-36.9.3 0 1.8.2 1 1.4L42.3 97.3 59 84.4l.2-.2c1.1-.8 1.4.3 1.4.8.7 29.7-26.2 31.3-35.1 31z"></path></svg></li>
                 </ul>
            </td>
       </tr>
	</table>
</div>
<!--    ///////////////////////////////////	  -->
<section class="ftco-section ftco-no-pb" style='background-color:#F0F0F0;height:116em;'>

   <!-- 熱門項目 -->   
   <div class='menu'>
        <h2>人氣景點排名</h2>
		<div id="hot"></div>
   </div>
   
   <!--  搜尋列  --> 
   <div class="container-1">
      <div class="row">
       <div class="col-md-12">
          <div class="search-wrap-1 ftco-animate fadeInUp ftco-animated">
          <div class="search-property-1">
          <div class="row no-gutters">
              <div class="col-lg d-flex">
                   <div class="form-group p-4 border-0">
                       <label for="#">查詢</label>
                       <div class="form-field">
                       	   <div class="icon"><span class="fa fa-search"></span></div>
                           <input type="text" class="form-control" placeholder="輸入" id="searchName" name="searchName" >
                       </div>
                   </div>
               </div>   
		       <div class="col-lg d-flex">
		          <div class="form-group p-4">
		             <label for="counties">縣市</label>
		             <div class="form-field">
		               <div class="select-wrap">
		                <div class="icon"><span class="fa fa-chevron-down"></span></div>
		                <select id="searchCounties" class="form-control">
		                	<option value="null">選擇縣市</option>
		                    <option value="台北市">台北市</option>
							<option value="新北市">新北市</option>
							<option value="桃園市">桃園市</option>
							<option value="新竹市">新竹市</option>
							<option value="苗栗縣">苗栗縣</option>
							<option value="臺中市">臺中市</option>
							<option value="彰化縣">彰化縣</option>
							<option value="南投縣">南投縣</option>
							<option value="雲林縣">雲林縣</option>
							<option value="嘉義縣">嘉義縣</option>
							<option value="臺南市">臺南市</option>
							<option value="高雄市">高雄市</option>
							<option value="屏東縣">屏東縣</option>
							<option value="宜蘭縣">宜蘭縣</option>
							<option value="花蓮縣">花蓮縣</option>
							<option value="臺東縣">臺東縣</option>
							<option value="澎湖縣">澎湖縣</option>
							<option value="金門縣">金門縣</option>
							<option value="連江縣">連江縣</option>
		             	 </select>
			          </div>
			      </div>
			  </div>
			</div>
			<div class="col-lg d-flex">
				<div class="form-group d-flex w-100 border-0">
				    <div class="form-field w-100 align-items-center d-flex">
				        <input type ="button" value="搜尋" id="search" onclick="search()"class="align-self-stretch form-control btn btn-primary"></input>
				    </div>
				</div>
			</div>
			<div class="col-lg d-flex">
				<div class="form-group d-flex w-100 border-1">
				    <div class="form-field w-100 align-items-center d-flex">
				        <input type ="button" value="顯示所有景點"  onclick="javascript:location.href='<c:url value='/showAllAttractions.UserAtHome'/>#gotoTitle'" class="align-self-stretch form-control btn btn-primary"></input>
				    </div>
				</div>
			</div>
			<div class="col-lg d-flex">
				<div class="form-group d-flex w-100 border-1">
				    <div class="form-field w-100 align-items-center d-flex">
				        <input type ="button" value="顯示所有餐廳" onclick="javascript:location.href='<c:url value='/showAllRestaurant.UserReHome'/>#gotoTitle'"  class="align-self-stretch form-control btn btn-primary" ></input>
				    </div>
				</div>
			</div>
		</div>
	  </div>
    </div>
    <br>
  </div>
</div>
	<!--   資料顯示   -->	
		<div class='row' id='area1'></div>
</div>


</section>
	

<section style='background-color:#F0F0F0;height:4em;'>	   
<!--   分頁   -->
	  <div class="col text-center">
	    <div class="block-27" id="showpage">
	      <ul>
	      <li><a class="#" onclick="back();" href="#gotoTitle">&lt;</a></li>
	      <c:forEach var="i" begin="1" end="${totalPages}" step="1">
	        <li class="#" id="${i}" name='pages' value="${i}" onclick="change(${i},this)"><a href="#gotoTitle"><span>${i}</span></a></li>  
	      </c:forEach>
	      <li><a class="#" onclick="next(${totalPages});" href="#gotoTitle">&gt;</a></li>
	    </ul>
		</div>
	</div>
</section>



	
<!--    ////////////////footer///////////////////	     -->
<%@ include file="/WEB-INF/pages/trainandhotel/footer.jsp"%>


<%-- <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script> --%>
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
<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<%-- <script src="${pageContext.request.contextPath}/js/google-map.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/main.js"></script> --%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
$("select[name='end']").on("change", function(){
	console.log("aa")
	$.ajax({
	    url: "http://localhost:8080/train/ticket3",
	    method: "POST",
	    data: {
	    	start:$("select[name='start']").val(),
	    	dest:$("select[name='end']").val()
		},
	    beforeSend:function() {
	    },
	    success:function(response) {
	        $("#last").html(response);
	       
	    },
	    error:function(xhr, status, error) {
	    },
	    complete:function(xhr, status) {
	    }		
	});
});

//加入購物車
function ticketCheckBuy(){
	var star =document.getElementById("start").value;
	var end =document.getElementById("end").value;
	var prices =document.getElementById("price");
	var ticketPrice =document.getElementById("buy").value;
	
	if(id!=""){
		
	
	var xhr = new XMLHttpRequest();
	
	
	var xhr = new XMLHttpRequest();
    xhr.open("POST", "<c:url value='/trainTicket'/>", true);
	xhr.setRequestHeader('Content-type','application/x-www-form-urlencoded');
    xhr.send("price="+ticketPrice+"&star="+star+"&end="+end);
    xhr.onreadystatechange = function(){
	 
    if(xhr.readyState==4&&xhr.status==200){
    	   var train = JSON.parse(xhr.responseText)
    	 
			 swal({
				 
				  icon: "success",
				  title: "以新增至購物車",
				  button: {
					    text: "確定",
					  },
				});     		 
    	    
    	   
         }
    }
  }else{
	  swal({
		  title: "未選擇購票方案",
		  text: "您商未選擇則購票的方案,請再次確認!",
		  icon: "warning",
		  buttons: false,
		  
		})
		.then((willDelete) => {
		  
		});
	  
	  
  }
}



var id="";
//查詢金額
function ticketCheckPrice(){
	
	
	var star =document.getElementById("start").value;
	var end =document.getElementById("end").value;
	var prices =document.getElementById("price");
	var ticketPrice =document.getElementById("buy").value;
	
	var xhr = new XMLHttpRequest();
    xhr.open("POST", "<c:url value='/ticketprice'/>", true);
	xhr.setRequestHeader('Content-type','application/x-www-form-urlencoded');
    xhr.send("price="+ticketPrice+"&star="+star+"&end="+end);

    xhr.onreadystatechange = function(){
	 
    if(xhr.readyState==4&&xhr.status==200){
    	   
    	   var p = JSON.parse(xhr.responseText)
    	   console.log(p);
    	   prices.innerHTML=p.price
    	   id=p.train.id
    	 
         }
    }
}





	
	
	
	
	
	
	window.onload=function(){
		
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
	
	
	
	function shoppingCart(){
		
		window.location.assign("http://localhost:8080/shoppingcart/car");
		
		
	}
function shoppingOrder(){
		
		window.location.assign("http://localhost:8080/ShoppingOrder.controller");
	}






$().ready(function(){
	$("select[name='start']").on("change", function(){
		$.ajax({
		    url: "http://localhost:8080/train/ticket2",
		    method: "POST",
		    data: {
					start: $(this).val()
			},
		    beforeSend:function() {
		    },
		    success:function(response) {
		        $("#end").html(response);
		    },
		    error:function(xhr, status, error) {
		    },
		    complete:function(xhr, status) {
		    }
		});
	});

});

</script>

</body>
</html>