<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.iii.trip.trainandhotel.repository.*"%>

<%
List<City> cityList = request.getAttribute("cityList") != null ?(List<City>) request.getAttribute("cityList")
        : new ArrayList<>();
List<Hotel> hotelList = request.getAttribute("tagHotel") != null ? (List<Hotel>) request.getAttribute("tagHotel")
        : new ArrayList<>();
List<HotelTag> tagList = request.getAttribute("tagList") != null ?(List<HotelTag>) request.getAttribute("tagList")
        : new ArrayList<>();
List<TrainStation> tsList = request.getAttribute("all") != null? (List<TrainStation>) request.getAttribute("all"):
		new ArrayList<>();
HotelTag tag = request.getAttribute("tag") !=null ? (HotelTag)request.getAttribute("tag") : new HotelTag();
int count = 0;
%>

<!DOCTYPE html>
<html lang="UTF-8">
<head>
	<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importHead.jsp"%>
	<title>Trip</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

     <link rel="stylesheet" href="http://jaysalvat.github.io/vegas/releases/latest/vegas.min.css">
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
.train:first-child{
   border-top-left-radius: 10px;
   border-bottom-right-radius: 10px;
   weigth:200px
   

}
.train:last-child{
   border-top-left-radius: 10px;
   border-bottom-right-radius: 10px;
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
	<%@ include file="/WEB-INF/pages/href.jsp"%>
</div>
<br><br><br><br>
	 <!-- Search Bar -->
	 <div style="float:left; " class="relative2" >
	  <section class="ftco-section ftco-no-pb">
	        <div class="container">
	            <div class="row">
	                <div class="col-md-12">
	                <a href="./"><span style="font-size:16px;">首頁</span></a>
	                <span style="font-size:16px;">  >  </span>
	                <a href ="./tagHotel?name=<%=tag.getName()%>"><span style="font-size:16px;"> <%=tag.getName() %></span></a>
	                </div>
	            </div>
	        </div>
	   </section>
	    <section class="ftco-section ftco-no-pb" style="padding:40px">
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
	                        <input class="btn btn-link tag01" name="tag" value="<%=tagList.get(i).getName()%>" style="padding:0; font-size:20px;">
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
	   	  
	   	  <h1> 找到 <%=hotelList.size()%>間住宿</h1>	
			<div class="row">
			<%
			if(hotelList != null && !hotelList.isEmpty() ){
				for (Hotel hotel : hotelList) {
					if(hotel.getPermission().equals("0")){
			    		continue;
			    	}
					count++;
			%>

				<div class="col-12 col-md-4 ftco-animate">
	            	<div class=" hotel mb-2">
	            		<a href="./rooms?name=<%=hotel.getId()%>">
	                		<img class="img1" src="<%=hotel.getPic() %>" style="width:300px; height:200px;" />
	                    </a>
	                    <div class="card-body p-3" " style="background-color:white; width:300px; height:120px;">
	                    	<a href="./rooms?name=<%=hotel.getId()%>"><p class="card-title font-weight-bold fuchsia-rose-text mb-0" style="font-size:18px"> <%=hotel.getName() %></p></a>
	                        <p class="location chili-pepper-text mb-0" style="font-size:16px"><span class="fa fa-map-marker"></span><%=hotel.getCity().getName()%><%=hotel.getAddress() %></p>
	                    </div>
	                </div>
	            </div>
		
			<%
					if(count % 3 == 0){
			%>		
				</div><div class="row"><div style="weight:200; height:50px;"></div></div><div class="row">
			<%	
					}
				}
			}
			%>
			</div>
		</section>
	</div>
</div>
<!-- loader -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importBody.jsp"%>
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
				
				si+=1;
				console.log(si)
				cart.innerHTML=si
				ticketCheckPrice();
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