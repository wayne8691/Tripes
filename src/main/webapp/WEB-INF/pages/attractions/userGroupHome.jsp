<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
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
<title>套裝行程首頁</title>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" />

<style type="text/css">.scrollax-performance, .scrollax-performance *, .scrollax-performance *:before, .scrollax-performance *:after { pointer-events: none !important; -webkit-animation-play-state: paused !important; animation-play-state: paused !important; };</style>
 <style>
       /* 熱門項目樣式 */
	    .menu{
		   float: left;
		   width: 18.5%;
		   padding:1em;
		   border-radius:10px;
		   background:linear-gradient(#FCFCFC,#F0F0F0,#FCFCFC,#F0F0F0,#F0F0F0,#FCFCFC,#FFFFFF,#FCFCFC,#F0F0F0,#FCFCFC);
		}
		/* 左右邊距 */
		.container-1{
		  width: 100%;
		  padding-right:15%;
		  padding-left: 22%;
		  margin-right: auto;
		  margin-left: auto;
		
		}
		/* section */
		.ftco-section-1 {
			  padding: 3em 0;
			  position: relative;
			  width: 100%; }
			  @media (max-width: 767.98px) {
			    .ftco-section-1 {
			      padding: 1em 0; } 
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
				url:'/findAllGroupByCountDesc/',
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
					    	groupConfirm = "<c:url value='/groupConfirm/' />";
					    	var j = 1 ;						   
					    	$.each(parsedObjinArray,function(i,n){
					    		 data1 = "<br><div><div class='item'><div class='project-destination'>"									   
										+ "<a href='" + groupConfirm + n.id + "' class='img' style='background-image: url(" +  n.image + ");'>"
											+ "	<div class='text'><h3>👁"+  n.count +"人</h3><span>NO."+ j +"</span></div>"
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
			
// 			if(indexPage > 1){
// 				indexpage2.className="aa";
// 			    indexPage = indexPage - 1;
// 			    indexpage2 =document.getElementById(indexPage);
// 			    indexpage2.className="active";
// 			    load(indexPage);
// 			}
		}
		function next(totalPagesValue){
			var indexpage2 =document.getElementById(indexPage);
// 			if(indexPage < totalPagesValue){
// 				indexpage2.className="aa";
// 				indexPage = indexPage + 1;
// 				indexpage2 =document.getElementById(indexPage);
// 				indexpage2.className="active";
// 				load(indexPage);
// 			}	
		} 
		
		
		function load(indexPage){
			console.log("indexPage:" + indexPage);
			$.ajax({
				type:'post',
				url:'/queryAllGroupByPage.controller/' + indexPage,
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
					    	
					    	groupConfirm = "<c:url value='/groupConfirm/' />";
						    $.each(parsedObjinArray,function(i,n){
						    	 data1 = "<div class='col-md-4 ftco-animate fadeInUp ftco-animated'>"
									    + "<div class='project-wrap'>"
										+ "<a href='" + groupConfirm + n.id + "' class='img' style='background-image: url(" +  n.image + ");'>"
											+ "<span class='price'>$" + n.price + "</span>"
										+ "</a>"
										+ "<div class='text p-4'>"
											+ "<h3 hidden='hidden'>"+ n.id + "</h3>"
											+ "<h3>"+ n.name + "</h3>"
											+ "<h4>出發地 : "+ n.origin + "</h4>"
											+ "<h4>目的地 : "+ n.destination +"</h4>"
											+ "<h4>旅遊天數 : "+ n.day + " Day</h4>"
											//+ "<h4>特色 : "+ group[i].feature + "</h4>"
											+ "<p><a href='" + groupConfirm + n.id + "' > 報名 </a>"
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

			var searchName= $("input").val();
			console.log(searchName);
			var searchOrigin= $('#searchOrigin').val();
			console.log(searchOrigin);
	    	var searchDestination= $('#searchDestination').val();
			console.log(searchDestination);
			
			if(searchName==""){
				searchName="null";
			}
			if(searchName != "null" || searchOrigin != "null" || searchDestination != "null"){

			$.ajax({
				type:'post',
				url:'/findgGroupByNameOrCounties/'+ searchName +'/'+ searchOrigin +'/'+ searchDestination,
				dataType:'JSON',
				contentType:'application/json',
				success: function(data) {
					var json = JSON.stringify(data, null, 4);
				    console.log("SUCCESS : ", json);
				    var parsedObjinArray = JSON.parse(json);
				    console.log("JSON.parse(json): ", JSON.parse(json));
				    $('#area1').empty(""); //清空table內的資料
						if(json = null){
					    	$('#area1').prepend("<h2>搜尋到0筆資料</h2>");
					    }else{
					    	groupConfirm = "<c:url value='/groupConfirm/' />";
						    $.each(parsedObjinArray,function(i,a){
						    	 data2 = "<div class='col-md-4 ftco-animate fadeInUp ftco-animated'>"
									    + "<div class='project-wrap'>"
										+ "<a href='" + groupConfirm + a.id + "' class='img' style='background-image: url(" +  a.image + ");'>"
											+ "<span class='price'>$" + a.price + "</span>"
										+ "</a>"
										+ "<div class='text p-4'>"
											+ "<h3 hidden='hidden'>"+ a.id + "</h3>"
											+ "<h3>"+ a.name + "</h3>"
											+ "<h4>出發地 : "+ a.origin + "</h4>"
											+ "<h4>目的地 : "+ a.destination +"</h4>"
											+ "<h4>旅遊天數 : "+ a.day + " Day</h4>"
											//+ "<h4>特色 : "+ group[i].feature + "</h4>"
											+ "<p><a href='" + groupConfirm + a.id + "' > 報名 </a>"
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
<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url(&quot;/static/images/bg_1.jpg&quot;); height: 937px;" id="res">
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center" style="height: 937px;">
				<div class="col-md-9 ftco-animate pb-5 text-center fadeInUp ftco-animated">
					<a href="#" name="gotoTitle"></a>
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/">Home <i class="fa fa-chevron-right"></i></a></span> 
						<span class="mr-2"><a href="<c:url value='/showAllGroup.UserGroupHome'/>">套裝行程<i class="fa fa-chevron-right"></i></a></span> 
					</p>
					<h1 class="mb-0 bread">套裝行程</h1>
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
                     <li class="nav-item" ><svg class="bk-icon -iconset-spa hp__facility_group_icon cell" onclick='atHome()' fill="#333333" height="24" width="24" viewBox="0 0 128 128" role="presentation" aria-hidden="true" focusable="false"><path d="M64.7 12.3a.8.8 0 0 0-1 0C57 18 38.4 37.8 59.2 59c.3.3 1.5 1.2 1.7-.3a.6.6 0 0 1 0-.1l3.2-21 3.2 20.8v.3c.3 1.3 1.2.7 1.6.4 21-21.1 2.5-40.8-4.2-46.8zM120 51.8v-.1a.8.8 0 0 0-.3-1C111.9 46.4 87 35.3 74.2 62c-.1.4-.6 1.8.9 1.5l20.8-4-18.4 10-.3.1c-1.2.7-.2 1.4.2 1.6C104.1 84 116.5 60 119.9 51.7zm-111.8.1a.8.8 0 0 1 .3-1c7.7-4.4 32.5-15.4 45.4 11.4.1.3.6 1.7-.9 1.5l-20.9-4 18.5 10h.2c1.2.7.3 1.4-.1 1.7C23.9 84.3 11.5 60.3 8 51.9zm94.5 64a.8.8 0 0 0 .8-.7c.8-8.8.7-36-28.9-36.9-.4 0-1.8.2-1 1.4l12.1 17.5-16.5-12.8-.2-.2c-1.2-.8-1.4.3-1.5.8-.7 29.7 26.2 31.3 35.2 31zm-77.1 0h-.1a.8.8 0 0 1-.8-.7c-.7-8.8-.7-36 29-36.9.3 0 1.8.2 1 1.4L42.3 97.3 59 84.4l.2-.2c1.1-.8 1.4.3 1.4.8.7 29.7-26.2 31.3-35.1 31z"></path></svg></li>
                 </ul>
            </td>
       </tr>
	</table>
</div>




<section class="ftco-section-1 ftco-no-pb" style='background-color:#F0F0F0;height:123em;'>
 
    <!-- 熱門項目 -->
   <div class='menu'>
        <h2>人氣行程排名</h2>
		<div id="hot"></div>
   </div>
   
 <!--   搜尋列  -->
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
                           <input type="text" class="form-control" placeholder="輸入" id="searchName" name="searchName">
                       </div>
                   </div>
               </div>
               <div class="col-lg d-flex">
		          <div class="form-group p-4">
		             <label for="">出發地</label>
		             <div class="form-field">
		               <div class="select-wrap">
		                <div class="icon"><span class="fa fa-chevron-down"></span></div>
		                <select id="searchOrigin" class="form-control">
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
		          <div class="form-group p-4">
		             <label for="">目的地</label>
		             <div class="form-field">
		               <div class="select-wrap">
		                <div class="icon"><span class="fa fa-chevron-down"></span></div>
		                <select id="searchDestination" class="form-control">
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
				        <input type ="button" value="搜尋" id="search" onclick="search()"class="align-self-stretch form-control btn btn-primary" style="font-size:20px;"></input>
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
		<div class='row' id='area1'>
		</div>
	</div>
</section>

<section style='background-color:#F0F0F0;height:4em;'>
<!--   分頁   -->
	  <div class="col text-center">
	    <div class="block-27" id="showpage">
	      <ul>
	      <li><a class="#" onclick="back();" href="#gotoTitle">&lt;</a></li>
<%--	分頁等待修正1    --%> 	      
	       <li class="active" id="1" name='pages' value="1" onclick="change(1,this)"><a href="#gotoTitle"><span>1</span></a></li> 
<%--	分頁等待修正2   --%>    
<%-- 	      <c:forEach var="i" begin="1" end="${totalPages}" step="1"> --%>
<%-- 	        <li class="#" id="${i}" name='pages' value="${i}" onclick="change(${i},this)"><a href="#gotoTitle"><span>${i}</span></a></li>   --%>
<%-- 	      </c:forEach> --%>
	      
	      
	      <li><a class="#"onclick="next(${totalPages});" href="#gotoTitle">&gt;</a></li>
	    </ul>
		</div>
	</div>
</section>


<!--    ////////////////footer///////////////////	     -->
<div class="container">
		<div class="row mb-5">
			<div class="col-md pt-5">
				<div class="ftco-footer-widget pt-md-5 mb-4">
					<h2 class="ftco-heading-2">感謝</h2>
					<p>資策會全體人員</p>
					<ul class="ftco-footer-social list-unstyled float-md-left float-lft">
						<li class="ftco-animate fadeInUp ftco-animated"><a href="#"><span class="fa fa-twitter"></span></a></li>
						<li class="ftco-animate fadeInUp ftco-animated"><a href="#"><span class="fa fa-facebook"></span></a></li>
						<li class="ftco-animate fadeInUp ftco-animated"><a href="#"><span class="fa fa-instagram"></span></a></li>
					</ul>
				</div>
			</div>
			<div class="col-md pt-5 border-left">
				<div class="ftco-footer-widget pt-md-5 mb-4 ml-md-5">
				<h2 class="ftco-heading-2">感謝老師</h2>
				<ul class="list-unstyled">
					<li><a href="#" class="py-2 d-block">蔡昇達老師</a></li>
					<li><a href="#" class="py-2 d-block">陳炯圻老師</a></li>
					<li><a href="#" class="py-2 d-block">張春生老師</a></li>
					<li><a href="#" class="py-2 d-block">王振漢老師</a></li>
					<li><a href="#" class="py-2 d-block">陳銀華老師</a></li>
					<li><a href="#" class="py-2 d-block">紀宜昕老師</a></li>
					<li><a href="#" class="py-2 d-block">王憲春老師</a></li>
					<li><a href="#" class="py-2 d-block">陳奕兆老師</a></li>
				
				</ul>
				</div>
			</div>
			<div class="col-md pt-5 border-left">
				<div class="ftco-footer-widget pt-md-5 mb-4">
				<h2 class="ftco-heading-2">Admin</h2>
				<ul class="list-unstyled">
					<li><a href="/managementindex" class="py-2 d-block">管理介面</a></li>
					<!-- <li><a href="#" class="py-2 d-block">Hotel and Restaurant</a></li>
					<li><a href="#" class="py-2 d-block">Beach</a></li>
					<li><a href="#" class="py-2 d-block">Nature</a></li>
					<li><a href="#" class="py-2 d-block">Camping</a></li>
					<li><a href="#" class="py-2 d-block">Party</a></li> -->
				</ul>
				</div>
			</div>
			<div class="col-md pt-5 border-left">
				<div class="ftco-footer-widget pt-md-5 mb-4">
				<h2 class="ftco-heading-2">我在哪裡?</h2>
				<div class="block-23 mb-3">
				<ul>
					<li><span class="icon fa fa-map-marker"></span><span class="text">20桃園市中壢區中大路300號 國立中央大學 (工程二館側面 / 資策會大樓)</span></li>
					<li><a href="#"><span class="icon fa fa-phone"></span><span class="text">(02)66316666</span></a></li>
					<li><a href="#"><span class="icon fa fa-paper-plane"></span><span class="text">jeny@iii.org.tw</span></a></li>
				</ul>
				</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 text-center">
			<p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			Copyright ©<script>document.write(new Date().getFullYear());</script>2021 All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
			</div>
		</div>
	</div>

<!-- <!--    /////////////// loader////////////////////	     --> -->
<%-- <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div> --%>

<!--    ///////////////////////////////////	     -->
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