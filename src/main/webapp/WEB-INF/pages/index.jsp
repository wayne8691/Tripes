<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.iii.trip.trainandhotel.repository.*"%>

<%
List<City> cityList = request.getAttribute("cityList") != null ?(List<City>) request.getAttribute("cityList")
        : new ArrayList<>();
List<Hotel> hbList = request.getAttribute("hotelList") != null ? (List<Hotel>) request.getAttribute("hotelList")
        : new ArrayList<>();
List<Hotel> newHotelList = request.getAttribute("newHotelList") != null ? (List<Hotel>) request.getAttribute("newHotelList")
        : new ArrayList<>();
List<HotelTag> tagList = request.getAttribute("tagList") != null ?(List<HotelTag>) request.getAttribute("tagList")
        : new ArrayList<>();
HttpSession session2 =request.getSession();
List<TrainStation> tsList = session2.getAttribute("all") != null? (List<TrainStation>) session2.getAttribute("all"):
		new ArrayList<>();
int count = 0;
int popCount=0;
%>

<!DOCTYPE html>
<html lang="UTF-8">
<head>
	<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importHead.jsp"%>
	<title>Trip</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="http://jaysalvat.github.io/vegas/releases/latest/vegas.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.0/handlebars.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/list.js/1.1.1/list.min.js"></script>
<!--    libs for stomp and sockjs-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<!--    end libs for stomp and sockjs-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet"
          type="text/css">
<link href="${pageContext.request.contextPath}/css/chatcss/style.css" rel="stylesheet">
	<style type="text/css">
	
 	     #example{ 
              height: 100px; 
              width: 1910px; 
             
          } 
	   
	   
#carouselExampleIndicators .carousel-item img {
	max-height: 304px;
	object-fit: cover;
}

.carousel-multi-item.v-2.product-carousel .carousel-inner .carousel-item.active,
.carousel-multi-item.v-2.product-carousel .carousel-item-next,
.carousel-multi-item.v-2.product-carousel .carousel-item-prev {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
}

.carousel-multi-item.v-2.product-carousel .carousel-item-right.active,
	.carousel-multi-item.v-2.product-carousel .carousel-item-next {
	-webkit-transform: translateX(20%);
	-ms-transform: translateX(20%);
	transform: translateX(20%);
}

.carousel-multi-item.v-2.product-carousel .carousel-item-left.active,
	.carousel-multi-item.v-2.product-carousel .carousel-item-prev {
	-webkit-transform: translateX(-20%);
	-ms-transform: translateX(-20%);
	transform: translateX(-20%);
}

.carousel-multi-item.v-2.product-carousel .carousel-item-right,
	.carousel-multi-item.v-2.product-carousel .carousel-item-left {
	-webkit-transform: translateX(0);
	-ms-transform: translateX(0);
	transform: translateX(0);
}

.carousel-multi-item.v-2.product-carousel *, .carousel-multi-item.v-2.product-carousel ::after,
	.carousel-multi-item.v-2.product-carousel ::before {
	-webkit-box-sizing: content-box;
	box-sizing: content-box;
}

.fuchsia-rose-text {
	color: #db0075;
}

.aqua-sky-text {
	color: #5cc6c3;
}

.mimosa-text {
	color: #F0C05A;
}

.list-inline-item .fas, .list-inline-item .far {
	font-size: .8rem;
}

.chili-pepper-text {
	color: #9B1B30;
}

.carousel-multi-item .controls-top .btn-floating {
	background: #F8CDCD;
}

.carousel-multi-item .carousel-indicators li {
	height: .75rem;
	width: .75rem;
	max-width: .75rem;
	background-color: #5cc6c3;
}

.carousel-multi-item .carousel-indicators .active {
	height: 1rem;
	width: 1rem;
	max-width: 1rem;
	background-color: #5cc6c3;
}

.carousel-multi-item .carousel-indicators {
	margin-bottom: -1rem;
}

.bigbox{
	background: lightgreen;
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
.relative2 {
  position: relative;
  top: -100px;
  left: 100px;

  height:100vw;  
}

.option100{
 align-items: flex-start;

}

 
 .tag01{
	width:100px;
}
</style>
	
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/shoppingcarstyle/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/shoppingcarstyle/vendors/themify-icons/themify-icons.css">
</head>
<body style="background-color:#F0F0F0;">
	<%@ include file="/WEB-INF/pages/webnav.jsp"%>
	<section id='example'  class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${pageContext.request.contextPath}/static/images/bg_1.jpg');" id="res"></section>
	    <div class="container100"   >  
			<table class="table table-striped table-bordered zero-configuration   border-collapse: separate; train   " style='border-radius:20px'>
				<tbody>
					<tr style='background-color: blue;'>
		  				<td style='background-color: blue; text-align: center; color:white' colspan='2' >我要訂票</td>
					</tr>
				    <tr>
						<td>起點</td>													
						<td>
							<select class='option100' name="start" id="start">
								<option value="">--</option>
							<%
								for (TrainStation ts : tsList) {
							%>
									<option value="<%=ts.getName()%>"><%=ts.getName() %> </option>
							<%
								}
							%>
							</select>
						</td>
					</tr>
					<tr>
						<td>終點</td>
						<td>
							<select  id="end" name="end">	
								<option>--</option>
							</select>	
						</td>
					</tr>
					<tr>
						<td>剩餘票數</td> 
						<td>
							<div id="last"></div>
						</td>
					</tr>
					<tr>
						<td>購買張數</td>  
						<td>
							<select  id="buy" onchange='ticketCheckPrice()'>
							<option value="no">請選擇張數</option>
							<%for(int i=1;i<=10;i++){%>
							<option value="<%=i %>"><%=i %></option>
							<%}%>
							</select>
						</td>
					</tr>
					<tr>
						<td>費用</td> 
						<td>
							<span id="price"></span>				
						</td>
					</tr>
					<tr>
						<td>購票</td>
						<td>
							<button class="btn btn-primary" onclick="ticketCheckBuy()">加入購物車</button>
						</td>
					</tr>
			</tbody>
		</table>
	</div>
	<div class='icons' style='border-radius:20px; z-index:1000'>
		<table>
			<tr>
				<td>
					<ul class="nav-shop">
						<li class="nav-item" ><button onclick='shoppingCart();' style='outline:none;'><i  class="ti-shopping-cart" style='font-size:23px'></i><span id='cart'  class="nav-shop__circle" ></span></button> </li>
		            </ul>
				</td>
			</tr>
			<tr>
				<td>
					<ul class="nav-shop" >
		          		<li class="nav-item"><button  onclick='shoppingOrder();' style='outline:none;' ><i class="ti-search" style='font-size:23px'></i></button></li>
					</ul>
				</td>
			</tr>
			<tr>
				<td>
					<ul class="nav-shop">
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
						<li class="nav-item" ><svg class="bk-icon -iconset-spa hp__facility_group_icon cell" onclick='atHome()' fill="#333333" height="20" width="20" viewBox="0 0 128 128" role="presentation" aria-hidden="true" focusable="false"><path d="M64.7 12.3a.8.8 0 0 0-1 0C57 18 38.4 37.8 59.2 59c.3.3 1.5 1.2 1.7-.3a.6.6 0 0 1 0-.1l3.2-21 3.2 20.8v.3c.3 1.3 1.2.7 1.6.4 21-21.1 2.5-40.8-4.2-46.8zM120 51.8v-.1a.8.8 0 0 0-.3-1C111.9 46.4 87 35.3 74.2 62c-.1.4-.6 1.8.9 1.5l20.8-4-18.4 10-.3.1c-1.2.7-.2 1.4.2 1.6C104.1 84 116.5 60 119.9 51.7zm-111.8.1a.8.8 0 0 1 .3-1c7.7-4.4 32.5-15.4 45.4 11.4.1.3.6 1.7-.9 1.5l-20.9-4 18.5 10h.2c1.2.7.3 1.4-.1 1.7C23.9 84.3 11.5 60.3 8 51.9zm94.5 64a.8.8 0 0 0 .8-.7c.8-8.8.7-36-28.9-36.9-.4 0-1.8.2-1 1.4l12.1 17.5-16.5-12.8-.2-.2c-1.2-.8-1.4.3-1.5.8-.7 29.7 26.2 31.3 35.2 31zm-77.1 0h-.1a.8.8 0 0 1-.8-.7c-.7-8.8-.7-36 29-36.9.3 0 1.8.2 1 1.4L42.3 97.3 59 84.4l.2-.2c1.1-.8 1.4.3 1.4.8.7 29.7-26.2 31.3-35.1 31z"></path></svg></li>
					</ul>
		        </td>
		    </tr>
		</table>
	</div>
	 <!-- Search Bar -->
	 <div style="float:left; " class="relative2" >
	    <section class="ftco-section ftco-no-pb">
	        <div class="container">
	            <div class="row">
	                <div class="col-md-12">
	                    <div class="search-wrap-1 ftco-animate">
	                        <form action="#" class="search-property-1">
	                        <div class="row no-gutters">
	                            <div class="col-lg d-flex">
	                                <div class="form-group p-4 border-0">
	                                <label for="#">目的地</label>
	                                    <div class="form-field">
	                                        <div class="select-wrap">
	                                    	<div class="icon"><span class="fa fa-chevron-down"></span></div>
	                                        <select name="cityId" class="form-control">
	                                        <%
	                                            for (City city : cityList) {
	                                            out.print("<option style='color:black;' value='" + city.getId() + "'>" + city.getName() + "</option>");
	                                            }
	                                        %>
	                                        </select>
	                                        </div>
	                                   
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-lg d-flex">
	                                <div class="form-group p-4">
	                                    <label for="#">入住日期</label>
	                                    <div class="form-field">
	                                        <div class="icon"><span class="fa fa-calendar"></span></div>
	                                        <input type="text" name="startDate" class="form-control" placeholder="入住日期" required>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-lg d-flex">
	                                <div class="form-group p-4">
	                                    <label for="#">退房日期</label>
	                                    <div class="form-field">
	                                        <div class="icon"><span class="fa fa-calendar"></span></div>
	                                        <input type="text" name="endDate" class="form-control" placeholder="退房日期" required>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-lg d-flex">
	                                <div class="form-group p-4">
	                                    <label for="#">人數</label>
	                                    <div class="form-field">
	                                        <div class="select-wrap">
	                                            <div class="icon"><span class="fa fa-chevron-down"></span></div>
	                                            <select name="cap" id="" class="form-control">
	                                                <option value="">人數</option>
	                                                <option value="1">1</option>
	                                                <option value="2">2</option>
	                                                <option value="3">3</option>
	                                                <option value="4">4</option>
	                                                <option value="5">5</option>
	                                              </select>
	                                        </div>
	                                      </div>
	                                </div>
	                            </div>
	                            <div class="col-lg d-flex">
	                                <div class="form-group d-flex w-100 border-0">
	                                    <div class="form-field w-100 align-items-center d-flex">
	                                        <input type="button" id="search" value="搜尋" class="align-self-stretch form-control btn btn-primary" style="font-size:20px;">
	                                    </div>
	                                </div>
	                            </div>
	                            </div>
	                        </form>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- tag -->
	        <div class="container">
	        	<div class="row" >
	            	<div class="col-md-12" style="font-size:20px; width:1200px;">
	             		<span>熱門標籤</span>
                    	<img src="/static/img/tag.png" width= 25px;>
	                    <%
	                    if(tagList != null && !tagList.isEmpty() ){
	                   		for(int i =0 ; i<5;i++){
	                    %>
	                        <a href ="./tagHotel?name=<%=tagList.get(i).getName()%>"> 
	                        <input class="btn btn-link tag01" name="tag" value="<%=tagList.get(i).getName()%>" style="padding:0; font-size:20px; color:blue;" disabled>
	                    	</a>
	                    <%
	                    	}
	                    }
	                    %>
	                </div>
	            </div>
	        </div>
	    </section>

	  <div id="result">
		<section class="ftco-section ftco-no-pb">
	   	  <div class="container">
	    	<span style="font-size:30px;">探索臺灣</span>
			<div>這些熱門目的地魅力無窮，等你來體驗！</div>
			<br>
	    	<div class="row justify-content-center">
				<div id="carousel-example-multi" class="carousel slide carousel-multi-item v-2 product-carousel" data-ride="carousel">
					<div class="row justify-content-center">            
	                    <div class="carousel-inner" role="listbox">
	                        <%
	                        for (City city: cityList) {
	                            if (city.getPic() != null) {
	                        %>
	                                  <div class="carousel-item <%=cityList.indexOf(city) == 0 ? "active mx-auto" : ""%>">
							            <div class="col-12 col-md-4 col-lg-2 mx-auto">
							              <div class="card mb-2" name="cityInfo" value="<%=city.getName() %>">
							                <div class="view overlay">
							                <a href ="./hotelInCity?name=<%=city.getName()%>"> 
							                  <img class="card-img-top" src="<%=city.getPic() %>" alt="<%=city.getName()%>" width="150px"  height="150px">
							                </a>    
							                    <div class="mask rgba-white-slight"></div>
							                </div>
							                <div class="card-body p-3">
							                <a href ="./hotelinCity?name=<%=city.getName()%>"> 
							                  <h5 class="card-title font-weight-bold fuchsia-rose-text mb-0"><%=city.getName() %></h5>
											</a>
							                </div>
							              </div>
							            </div>
							          </div>
	                        <%
	                            }
	                        }
	                        %>
							</div>                 
						</div>
					</div> 
				</div>
			</div>
		</section>
		<section class="ftco-section">
	        <div class="container">
			    <span style="font-size: 30px;">最新加入的旅館</span>
				<div></div>
	            <div class="row" >
	             <%
	                for (Hotel hotel : newHotelList) {
	                	if(hotel.getPermission().equals("0")){
	                		continue;
	                	}
	                	count++;
	            %>
	                    <div class="col-12 col-md-3 ftco-animate">
	                        <div class=" hotel mb-2">
	                            <a href="./rooms?name=<%=hotel.getId()%>">
	                                <img class="img1" src="<%=hotel.getPic() %>" style="width:250px; height:200px;" />
	                                <span class="price"><!-- 房間價位 --> </span>
	                            </a>
	                            <div class="text p-3" style="background-color:white; width:250px; height:120px;""  >
		                            <a href="./rooms?name=<%=hotel.getId()%>"> 
		                            	<h5 class="card-title font-weight-bold fuchsia-rose-text mb-0"><%=hotel.getName() %></h5>
									</a>
									<p class="location" style="color: #9B1B30; font-size:16px" ><span class="fa fa-map-marker"></span><%=hotel.getCity().getName()%><%=hotel.getAddress() %></p>
	                            </div>
	                        </div>
	                    </div>
	            <%
	            		if(count == 4){
	            			break;
	            		}
	                }
	            %>
	            </div>
	        </div>
	    </section>
	    <section class="ftco-section" style="padding-top:0px;">
	        <div class="container">
			    <span style="font-size: 30px;">大家都在看這些旅館</span>
				<div>人氣旅館</div>
				<br>
	            <div class="row" >
	             <%
	                for (Hotel hotel : hbList) {
	                	if(hotel.getPermission().equals("0")){
	                		continue;
	                	}
	                	popCount++;
	            %>
	                    <div class="col-12 col-md-3 ftco-animate">
	                        <div class=" hotel mb-2">
	                            <a href="./rooms?name=<%=hotel.getId()%>">
	                                <img class="img1" src="<%=hotel.getPic() %>" style="width:250px; height:200px;" />
	                                <span class="price"><!-- 房間價位 --> </span>
	                            </a>
	                            <div class="text p-3" style="background-color:white; width:250px; height:120px;"  >
		                            <a href="./rooms?name=<%=hotel.getId()%>"> 
		                            	<h5 class="card-title font-weight-bold fuchsia-rose-text mb-0"><%=hotel.getName() %></h5>
									</a>
									<p class="location" style="color: #9B1B30; font-size:18px" ><span class="fa fa-map-marker"></span><%=hotel.getCity().getName()%><%=hotel.getAddress() %></p>
	                            </div>
	                        </div>
	                    </div>
	            <%
	            		if(popCount == 4){
	            			break;
	            		}
	                }
	            %>
	            </div>
	        </div>
	    </section>
</div>
</div>
<!-- loader -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importBody.jsp"%>
<c:choose>
<c:when test="${!empty loginuser}">
<button id="btnn" class="chatimgg leftbottom" onclick="showDialog();"> <img alt="avatar" height="150px"
                 src="${pageContext.request.contextPath}/images/robot1.png"
                 width="150px"/></button>
<input id="userName" placeholder="search" type="hidden" value="${loginuser.getUserid()}"/>
  	
    <div class="chat dialog" id="dialog">
    	<div class="close" onclick="hideDialog();" id="x">x</div>
        <div class="chat-header clearfix">
            <img alt="avatar" height="55px" class="chatimgg"
                 src="${pageContext.request.contextPath}/images/robot.png"
                 width="55px"/>

            <div class="chat-about">
                <div class="chat-with" id="selectedUserId"></div>
                <div class="chat-num-messages"></div>
            </div>
            <i class="fa fa-star" style="color:	#FFD306"></i>
        </div> <!-- end chat-header -->

        <div class="chat-history">
            <ul id="history">

            </ul>

        </div> <!-- end chat-history -->

        <div class="chat-message clearfix">
            <textarea id="message-to-send" name="message-to-send" placeholder="Type your message" rows="3"></textarea>
	
            <i class="fa fa-bars" aria-hidden="true" onclick="showDialog1();"></i> &nbsp;&nbsp;&nbsp;
        	<!-- 
            <i class="fa fa-file-image-o"></i>
		-->
            <button id="sendBtn">Send</button>
	
        </div> <!-- end chat-message -->

    </div> 
    <script id="message-template" type="text/x-handlebars-template">
    <li class="clearfix">
        <div class="message-data align-right">
            <span class="message-data-time">{{time}}, Today</span> &nbsp; &nbsp;
            <span class="message-data-name">${loginuser.getName()}</span> <i class="fa fa-circle me"></i>
        </div>
        <div class="message other-message float-right">
            {{messageOutput}}
        </div>
    </li>
</script>

<script id="message-response-template" type="text/x-handlebars-template">
    <li>
        <div class="message-data">
            <span class="message-data-name"><i class="fa fa-circle online"></i> {{userName}}</span>
            <span class="message-data-time">{{time}}, Today</span>
        </div>
        <div class="message my-message">
			{{response}}
            <a href= '{{response1}}' target="_blank" style="text-decoration:none;color:gray;">{{response2}}</a>
			<img src="" width="0" height="0"/>
        </div>	
    </li>
</script>
<div class="dialog1" id="dialog1">
<div class="close" onclick="hideDialog1();" id="x1">x</div><br><br>
<div align="center"><a href='javascript:void(0)' onclick="fn('熱門飯店')" >熱門飯店</a></div><hr>
<div align="center"><a href='javascript:void(0)' onclick="fn('熱門景點')" >熱門景點</a></div><hr>
<div align="center"><a href='javascript:void(0)' onclick="fn('熱門餐廳')" >熱門餐廳</a></div><hr>
<div align="center"><a href='javascript:void(0)' onclick="fn('訂單查詢')" >訂單查詢</a></div><hr>
<div align="center"><a href='javascript:void(0)' onclick="fn('個人資料')" >個人資料</a></div><hr>
<div align="center"><a href='javascript:void(0)' onclick="fn('客服聯繫方式')" >客服聯繫方式</a></div><hr>
</div>
<script src="${pageContext.request.contextPath}/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/js/chat.js"></script>
</c:when>
</c:choose>
		<script>
	
	$(function() {
	    $('#example').vegas({
	        slides: [
	            { src: '/images/b1.jpg' },
	            { src: '/images/b2.jpg' },
	            { src: '/images/b3.jpg' },
	            { src: '/images/b4.jpg' },
	            { src: '/images/b5.jpg' },
	          
	        ]
	    });
	});
	     
	window.onload=function(){
		if(${loginuser != null}){
			dialog=document.getElementById("dialog");
    		x=document.getElementById("x");
    		dialog1=document.getElementById("dialog1");
    		x1=document.getElementById("x1");
    		registration();
		}
		si=0;
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/shoppingcarMain.controller' />", true);
//	 	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		xhr.send();
		
		xhr.onreadystatechange = function(){
			 cart =document.getElementById("cart");
			var cars =JSON.parse(xhr.responseText)
			console.log(cars)
			si=cars.room_id.length+cars.train.length+cars.travel.length;
			console.log(si)
			cart.innerHTML=si
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
		$("#search").on("click", function(){
	    	$.ajax({
	        	url: "http://localhost:8080/trainandhotel/emptyHotel",
	            method: "POST",
	            data: {
	            	cityId: $("select[name='cityId']").val(),
	                start: $("input[name='startDate']").val(),
	                end: $("input[name='endDate']").val(),
	                cap: $("select[name='cap']").val()
	            },
	            beforeSend:function() {
	            },
	            success:function(response) {
	           		try {
	                	//console.log(response);
	                    $("#result").html(response);
	                } catch (e) {
	                }
	            },
	            error:function(xhr, status, error) {
	            },
	            complete:function(xhr, status) {
	            }
	        });
	    });
			
		    $("input[name='startDate'], input[name='endDate']").datepicker({
		        format: "yyyy-mm-dd",
		        autoclose: false,
		        startDate: "today",
		        language: "zh-TW",
		        todayHighlight: true
		    }).on("changeDate", function() {
		    	const startDate = new Date($("input[name='startDate']").val());
		    	const endDate = new Date($("input[name='endDate']").val());
		    	if ($(this).attr("name") == $("input[name='startDate']").attr("name")) {
		    		if (startDate > endDate) {
		    			$("input[name='endDate']").datepicker("update", $("input[name='startDate']").val());
		    		}
		    	} else {
		    		if (endDate < startDate) {
		    			$("input[name='startDate']").datepicker("update", $("input[name='endDate']").val());
		    		}
		    	}
		    });
			const today = new Date();
			$("input[name='startDate'], input[name='endDate']").datepicker("update", today.getFullYear() + "-" + (today.getMonth()+1) + "-" + today.getDate());
				
			
            $('.carousel.carousel-multi-item.v-2 .carousel-item').each(function(){
	          	  var next = $(this).next();
	          	  if (!next.length) {
	          	    next = $(this).siblings(':first');
	          	  }
	          	  next.children(':first-child').clone().appendTo($(this));
	
	          	  for (var i=0;i<3;i++) {
	          	    next=next.next();
	          	    if (!next.length) {
	          	      next = $(this).siblings(':first');
	          	    }
	          	    next.children(':first-child').clone().appendTo($(this));
	          	  }
	          	});   
            
            
		});
		

		var id="";
		//查詢金額
		function ticketCheckPrice(){
			
			var star =document.getElementById("start").value;
			var end =document.getElementById("end").value;
			var prices =document.getElementById("price");
			var ticketPrice =document.getElementById("buy").value;
			if(star==null){
				return;
			}
           if(end==null){
				return;				
			}
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
		
       
		//加入購物車
		function ticketCheckBuy(){
			
			var prices =document.getElementById("price");
			var ticketPrice =document.getElementById("buy").value;
			
			var star =document.getElementById("start").value;
			var end =document.getElementById("end").value;
			
			if(star!=""&&star!=""){
				
				
				ticketCheckPrice();
			var xhr = new XMLHttpRequest();
			
			
			var xhr = new XMLHttpRequest();
		    xhr.open("POST", "<c:url value='/trainTicket'/>", true);
			xhr.setRequestHeader('Content-type','application/x-www-form-urlencoded');
		    xhr.send("price="+ticketPrice+"&star="+star+"&end="+end);
		    xhr.onreadystatechange = function(){
			 
		    if(xhr.readyState==4&&xhr.status==200){
		    	si+=1;
				console.log(si)
				cart.innerHTML=si
				var train = JSON.parse(xhr.responseText)
				    if(train.member=="notmember"){
				    	
				    	window.location.assign("http://localhost:8080/login.controller");
				    	
				    	
				    }else{
				    	swal({
							  icon: "success",
							  title: "以新增至購物車",
							  button: {
								    text: "確定",
							},
						});     		
				    }
				
				
					 
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


			$("select[name='end']").on("change", function(){
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
				    	
				    	var ticketPrice =document.getElementById("buy").value;
				    	
				    	
				    	
				    	
				        $("#last").html(response);
				       
				    },
				    error:function(xhr, status, error) {
				    },
				    complete:function(xhr, status) {
				    }		
				});
			});
			

	</script>

     <script src="http://zeptojs.com/zepto.min.js"></script>
     <script src="http://jaysalvat.github.io/vegas/releases/latest/vegas.js"></script>
     <div style="clear:both;">
     <%@ include file="/WEB-INF/pages/trainandhotel/footer.jsp"%>
     </div>
</body>
</html>