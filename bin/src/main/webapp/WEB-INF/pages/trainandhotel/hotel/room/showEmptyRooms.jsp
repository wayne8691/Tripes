<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.iii.trip.trainandhotel.repository.*"%>
<%
List<Room> list = request.getAttribute("roomList") != null ? (List<Room>) request.getAttribute("roomList")
		: new ArrayList<>();
Hotel hotel = request.getAttribute("hotel") != null ? (Hotel) request.getAttribute("hotel") : new Hotel();
String startDate = (String)request.getAttribute("start") ;
String endDate = (String)request.getAttribute("end") ;
String intro = hotel.getIntro();
HttpSession session2 =request.getSession();
List<TrainStation> tsList = session2.getAttribute("all") != null? (List<TrainStation>) session2.getAttribute("all"):
		new ArrayList<>();
List<HotelFacility> hotelFacilityList = request.getAttribute("hotelFacilityList") != null ? (List<HotelFacility>) request.getAttribute("hotelFacilityList") : new ArrayList<>();;
List<HotelTag> hotelTagList = request.getAttribute("hotelTagList") != null ?(List<HotelTag>) request.getAttribute("hotelTagList") : new ArrayList<>();
int count = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>旅館</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importHead.jsp"%>
<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importBody.jsp"%>
<%@ include file="/WEB-INF/pages/trainandhotel/hotel/room/showRooms-style.jsp"%>

<script>
$().ready(function() {
    changePage(1);
    $("select[name='sort'], select[name='cap']").on("change", () => {changePage(1)});
    
});

function changePage(page) {
    $.ajax({
        url: "./getEmptyRooms/" + page,
        method: "POST",
        data: {
                hotelId: "<%=hotel.getId()%>",
                cap: $("select[name='cap']").val(),
                sort: $("select[name='sort']").val(),
                startDate: document.getElementById("startDate").value,
        		endDate: document.getElementById("endDate").value
        },
        beforeSend:function() {
        },
        success:function(response) {
            //console.log(response);
            $(".emptyRoomList").html(response);
        },
        error:function(xhr, status, error) {
        },
        complete:function(xhr, status) {
        }
    });
}

</script>
</head>
<body style="background-color:#F0F0F0;">
	<input type="hidden" id="startDate" value="<%=startDate%>">
	<input type="hidden" id="endDate" value="<%=endDate%>">
	<%@ include file="/WEB-INF/pages/webnav.jsp"%>
    
	<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('${pageContext.request.contextPath}/static/images/bg_1.jpg');">
	    <div class="container">
	      <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-center">
	        <div class="col-md-9 ftco-animate pb-5 text-center"></div>
	      </div>
	    </div>
	 </section>
	
  <div style="background-color:#F0F0F0" class="container col-12">
    <div class="row">
      <div class="col-2 page-left">
  	    <div class="container100"   >  
 	    <%@ include file="/WEB-INF/pages/trainandhotel/hotel/room/train.jsp"%>
 	  </div>
  	</div>

	  <div class="col-9 page-center">
	  <section class="ftco-section ftco-no-pb" style="padding-top:20px;">
	        <div class="container">
	            <div class="row">
	                <div class="col-md-12">
	                <a href="./"><span style="font-size:16px;">首頁</span></a>
	                <span style="font-size:16px;">  >  </span>
	                <a href ="./hotelInCity?name=<%=hotel.getCity().getName()%>"><span style="font-size:16px;"> <%=hotel.getCity().getName() %></span></a>
	                <span style="font-size:16px;">  >  </span>
	                <span style="font-size:16px;"> <%=hotel.getName() %></span>
	                </div>
	            </div>
	        </div>
	   </section>
	    <section class="">
	      <div class="container"><br>
	        <div class="container row justify-content-center">
	          <div class="col-md-12 text-center">
	            <h1 class="mb-0 bread"><%=hotel.getName()%></h1>
	          </div>
	        </div>
	      </div>
	    
	      <div class="container">
	        <div class="row justify-content-md-center" >
	          <div class="col-lg-12 py-md-5 mt-md-5"  >
	            <div class="container w-100">
	            <!-- pic -->
  				  <div class="row justify-content-md-center"  >
	                <div id="carouselExampleIndicators" class="col-8 carousel slide" data-ride="carousel" >
	                  <ol class="carousel-indicators">
	                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	                    <%
	                    for (Room room: list) {
	                      if (room.getPic() != null) {
	                        out.print("<li data-target='#carouselExampleIndicators' data-slide-to='" + (list.indexOf(room)+1) + "' class=''></li>");
	                      }
	                    }
	                    %>
	                  </ol>
	                  <div class="carousel-inner">
	                    <div class="carousel-item active" style="height:400px;">
	                      <img src="<%=hotel.getPic()%>" class="d-block w-100" alt="..." >
	                    </div>
	                    <%
	                    for (Room room: list) {
	                      if (room.getPic() != null) {
	                    %>
	                    <div class="carousel-item">
	                      <img src="<%=room.getPic()%>" class="d-block w-100" alt="...">
	                    </div>
	                    <%
	                      }
	                    }
	                    %>
	                  </div>
	                  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                    <span class="sr-only">Previous</span>
	                  </a>
	                  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	                    <span class="sr-only">Next</span>
	                  </a>
	                </div>
	                <div class="col-4">
	                  <img src="/static/img/location.png" style="width:25px">
	                  <span style="color:blue; font-size:18px;"><%=hotel.getCity().getName()%><%=hotel.getAddress() %></span>
	                  <br>
	                  <iframe width="300" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src=https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=<%=hotel.getCity().getName()%><%=hotel.getAddress() %>&z=16&output=embed&t=地圖模式></iframe>
 	                </div>
	              </div>
	              <!-- end pic -->
	            </div><br>
                <div class="row">
	            <!-- Sharingbutton Facebook -->
	            <a class="resp-sharing-button__link" href="https://facebook.com/sharer/sharer.php?u=http%3A%2F%2Flocalhost%3A8080%2Frooms%3Fname%3D20210409105704183-f715974f-86d6-42bf-a724-a8525dc0b863" target="_blank" rel="noopener" aria-label="Facebook">
	              <div class="resp-sharing-button resp-sharing-button--facebook resp-sharing-button--medium">
	                  <div aria-hidden="true" class="resp-sharing-button__icon resp-sharing-button__icon--solid">
	                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
	                      <path d="M18.77 7.46H14.5v-1.9c0-.9.6-1.1 1-1.1h3V.5h-4.33C10.24.5 9.5 3.44 9.5 5.32v2.15h-3v4h3v12h5v-12h3.85l.42-4z"/>
	                    </svg>
	                </div>Facebook
	              </div>
	            </a>
	            
	            <!-- Sharingbutton Twitter -->
	            <a class="resp-sharing-button__link" href="https://twitter.com/intent/tweet/?text=%E5%BF%AB%E4%BE%86%E7%9C%8B%E7%9C%8B%E9%80%99%E9%A3%AF%E5%BA%97&amp;url=http%3A%2F%2Flocalhost%3A8080%2Frooms%3Fname%3D20210409105704183-f715974f-86d6-42bf-a724-a8525dc0b863" target="_blank" rel="noopener" aria-label="Twitter">
	              <div class="resp-sharing-button resp-sharing-button--twitter resp-sharing-button--medium">
	                  <div aria-hidden="true" class="resp-sharing-button__icon resp-sharing-button__icon--solid">
	                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
	                      <path d="M23.44 4.83c-.8.37-1.5.38-2.22.02.93-.56.98-.96 1.32-2.02-.88.52-1.86.9-2.9 1.1-.82-.88-2-1.43-3.3-1.43-2.5 0-4.55 2.04-4.55 4.54 0 .36.03.7.1 1.04-3.77-.2-7.12-2-9.36-4.75-.4.67-.6 1.45-.6 2.3 0 1.56.8 2.95 2 3.77-.74-.03-1.44-.23-2.05-.57v.06c0 2.2 1.56 4.03 3.64 4.44-.67.2-1.37.2-2.06.08.58 1.8 2.26 3.12 4.25 3.16C5.78 18.1 3.37 18.74 1 18.46c2 1.3 4.4 2.04 6.97 2.04 8.35 0 12.92-6.92 12.92-12.93 0-.2 0-.4-.02-.6.9-.63 1.96-1.22 2.56-2.14z"/>
	                    </svg>
	                </div>Twitter
	              </div>
	            </a>
	            
	            <!-- Sharingbutton Tumblr -->
	            <a class="resp-sharing-button__link" href="https://www.tumblr.com/widgets/share/tool?posttype=link&amp;title=%E5%BF%AB%E4%BE%86%E7%9C%8B%E7%9C%8B%E9%80%99%E9%A3%AF%E5%BA%97&amp;caption=%E5%BF%AB%E4%BE%86%E7%9C%8B%E7%9C%8B%E9%80%99%E9%A3%AF%E5%BA%97&amp;content=http%3A%2F%2Flocalhost%3A8080%2Frooms%3Fname%3D20210409105704183-f715974f-86d6-42bf-a724-a8525dc0b863&amp;canonicalUrl=http%3A%2F%2Flocalhost%3A8080%2Frooms%3Fname%3D20210409105704183-f715974f-86d6-42bf-a724-a8525dc0b863&amp;shareSource=tumblr_share_button" target="_blank" rel="noopener" aria-label="Tumblr">
	              <div class="resp-sharing-button resp-sharing-button--tumblr resp-sharing-button--medium">
	                <div aria-hidden="true" class="resp-sharing-button__icon resp-sharing-button__icon--solid">
	                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
	                    <path d="M13.5.5v5h5v4h-5V15c0 5 3.5 4.4 6 2.8v4.4c-6.7 3.2-12 0-12-4.2V9.5h-3V6.7c1-.3 2.2-.7 3-1.3.5-.5 1-1.2 1.4-2 .3-.7.6-1.7.7-3h3.8z"/>
	                  </svg>
	                </div>Tumblr
	              </div>
	            </a>
	            
	            <!-- Sharingbutton E-Mail -->
	            <a class="resp-sharing-button__link" href="mailto:?subject=%E5%BF%AB%E4%BE%86%E7%9C%8B%E7%9C%8B%E9%80%99%E9%A3%AF%E5%BA%97&amp;body=http%3A%2F%2Flocalhost%3A8080%2Frooms%3Fname%3D20210409105704183-f715974f-86d6-42bf-a724-a8525dc0b863" target="_self" rel="noopener" aria-label="E-Mail">
	              <div class="resp-sharing-button resp-sharing-button--email resp-sharing-button--medium">
	                <div aria-hidden="true" class="resp-sharing-button__icon resp-sharing-button__icon--solid">
	                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
	                    <path d="M22 4H2C.9 4 0 4.9 0 6v12c0 1.1.9 2 2 2h20c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zM7.25 14.43l-3.5 2c-.08.05-.17.07-.25.07-.17 0-.34-.1-.43-.25-.14-.24-.06-.55.18-.68l3.5-2c.24-.14.55-.06.68.18.14.24.06.55-.18.68zm4.75.07c-.1 0-.2-.03-.27-.08l-8.5-5.5c-.23-.15-.3-.46-.15-.7.15-.22.46-.3.7-.14L12 13.4l8.23-5.32c.23-.15.54-.08.7.15.14.23.07.54-.16.7l-8.5 5.5c-.08.04-.17.07-.27.07zm8.93 1.75c-.1.16-.26.25-.43.25-.08 0-.17-.02-.25-.07l-3.5-2c-.24-.13-.32-.44-.18-.68s.44-.32.68-.18l3.5 2c.24.13.32.44.18.68z"/>
	                  </svg>
	                </div>E-Mail
	              </div>
	            </a>
	            
	            <!-- Sharingbutton WhatsApp -->
	            <a class="resp-sharing-button__link" href="whatsapp://send?text=%E5%BF%AB%E4%BE%86%E7%9C%8B%E7%9C%8B%E9%80%99%E9%A3%AF%E5%BA%97%20http%3A%2F%2Flocalhost%3A8080%2Frooms%3Fname%3D20210409105704183-f715974f-86d6-42bf-a724-a8525dc0b863" target="_blank" rel="noopener" aria-label="WhatsApp">
	              <div class="resp-sharing-button resp-sharing-button--whatsapp resp-sharing-button--medium"><div aria-hidden="true" class="resp-sharing-button__icon resp-sharing-button__icon--solid">
	                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
	                    <path d="M20.1 3.9C17.9 1.7 15 .5 12 .5 5.8.5.7 5.6.7 11.9c0 2 .5 3.9 1.5 5.6L.6 23.4l6-1.6c1.6.9 3.5 1.3 5.4 1.3 6.3 0 11.4-5.1 11.4-11.4-.1-2.8-1.2-5.7-3.3-7.8zM12 21.4c-1.7 0-3.3-.5-4.8-1.3l-.4-.2-3.5 1 1-3.4L4 17c-1-1.5-1.4-3.2-1.4-5.1 0-5.2 4.2-9.4 9.4-9.4 2.5 0 4.9 1 6.7 2.8 1.8 1.8 2.8 4.2 2.8 6.7-.1 5.2-4.3 9.4-9.5 9.4zm5.1-7.1c-.3-.1-1.7-.9-1.9-1-.3-.1-.5-.1-.7.1-.2.3-.8 1-.9 1.1-.2.2-.3.2-.6.1s-1.2-.5-2.3-1.4c-.9-.8-1.4-1.7-1.6-2-.2-.3 0-.5.1-.6s.3-.3.4-.5c.2-.1.3-.3.4-.5.1-.2 0-.4 0-.5C10 9 9.3 7.6 9 7c-.1-.4-.4-.3-.5-.3h-.6s-.4.1-.7.3c-.3.3-1 1-1 2.4s1 2.8 1.1 3c.1.2 2 3.1 4.9 4.3.7.3 1.2.5 1.6.6.7.2 1.3.2 1.8.1.6-.1 1.7-.7 1.9-1.3.2-.7.2-1.2.2-1.3-.1-.3-.3-.4-.6-.5z"/>
	                  </svg>
	                </div>WhatsApp
	              </div>
	            </a>
	            
	            <!-- Sharingbutton Telegram -->
	            <a class="resp-sharing-button__link" href="https://telegram.me/share/url?text=%E5%BF%AB%E4%BE%86%E7%9C%8B%E7%9C%8B%E9%80%99%E9%A3%AF%E5%BA%97&amp;url=http%3A%2F%2Flocalhost%3A8080%2Frooms%3Fname%3D20210409105704183-f715974f-86d6-42bf-a724-a8525dc0b863" target="_blank" rel="noopener" aria-label="Telegram">
	              <div class="resp-sharing-button resp-sharing-button--telegram resp-sharing-button--medium">
	                <div aria-hidden="true" class="resp-sharing-button__icon resp-sharing-button__icon--solid">
	                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
	                    <path d="M.707 8.475C.275 8.64 0 9.508 0 9.508s.284.867.718 1.03l5.09 1.897 1.986 6.38a1.102 1.102 0 0 0 1.75.527l2.96-2.41a.405.405 0 0 1 .494-.013l5.34 3.87a1.1 1.1 0 0 0 1.046.135 1.1 1.1 0 0 0 .682-.803l3.91-18.795A1.102 1.102 0 0 0 22.5.075L.706 8.475z"/>
	                  </svg>
	                </div>Telegram
	              </div>
	            </a>
	            </div><br><br>
	            <div class="w-100">
	            <br>
	            <h3>飯店提供的服務</h3>
	              <div class="row">
		            <%
		            for(HotelFacility hf: hotelFacilityList){
		            	count++;
		            %>
		            <div class="col-2">
		            	<div>
		            		<img src="<%=hf.getPic()%>" style="width:80px;">
		            	</div>
		            	<br>
		            	<div class="text-justify" style="font-size:16px; text-align:justify;"><%=hf.getName()%></div>
		            	<br>
	                </div>
	                <%
	                if(count ==6){
	                	break;
	                }
		            }
	                %>
	            </div>
	            <div class="w-100">
	              <div class="templatemo_gradient1">
	                <div class="templatemo_gradient2">
                      <p class="text-font"><%=intro.replace("\n", "</p><p class='text-font'>")%></p>
	                </div>
	              </div>
	            </div><br>
	            <div class="w-100">
			      <div style="background-color:	#A6FFA6">
			        <div class="templatemo_gradient2">
			          <p class="text-font"> 旅行是我們人生中不可或缺的一部份，即便在充滿挑戰的時刻，我們依然對下一趟旅程滿懷憧憬。由於未來仍充滿不確定性，因此在預訂飯店時請確認飯店是否提供免費取消服務。</p>
			          <%
					  if(!hotelTagList.isEmpty()){
					    for(HotelTag tag : hotelTagList){
					      if(tag.getName().equals("免費取消")){
					  %>
					  <p style="color:red; font-size:20px;">此飯店提供免費取消服務</p>
					  <%
					  	  }
					    }
					  }
					  %>
				  </div>
			    </div>
			  </div><br>
			  <div class="w-100">
			    <div style="background-color: #FFED97">
			      <div class="templatemo_gradient2">
			        <p class="text-font"> 國內旅遊/自由行訂房，有越來越多人選擇透過訂房網來預定住宿，不外乎就是方便比較且優惠。若善用適合的信用卡，總能再省下一點點費用喔～</p>
                	<%
		            if(!hotelTagList.isEmpty()){
					  for(HotelTag tag : hotelTagList){
					    if(tag.getName().equals("可刷卡")){
					%>
					<p style="color:red; font-size:20px;" >此飯店可刷卡付費</p>
					<%
						}
					  }
					}
					%>
				  </div>
			    </div>
			  </div><br>
	          <div class="option">
	            <div class="container">
	              <div class="row justify-content-md-center">
	                <select name="cap">
	                  <option value="">----------</option>
	                  <option value="1">1人</option>
	                  <option value="2">2人</option>
	                  <option value="3">3人</option>
	                  <option value="4">4人</option>
	                  <option value="5">5人</option>
	                </select>
	                <select name="sort">
	                  <option value="0">價格 - 低到高</option>
	                  <option value="1">價格 - 高到低</option>
	                </select>
	              </div>
	            </div>
	          </div>
	          <div class="emptyRoomList"></div>
	        </div>
	      </div>
	    </div>
	  </section>
	</div>
	<div class="col-1 page-right">
	  <div class='icons' style='border-radius:20px; z-index:1000'>
		<%@include file="/WEB-INF/pages/href.jsp" %>
	  </div>
	</div>
  </div>
</div>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script>
		var si=0
		window.onload=function(){
			if(${loginuser != null}){
				dialog=document.getElementById("dialog");
	    		x=document.getElementById("x");
	    		
			}
			si=0;
			var xhr = new XMLHttpRequest();
			xhr.open("GET", "<c:url value='/shoppingcarMain.controller' />", true);
//		 	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
			xhr.send();
			
			xhr.onreadystatechange = function(){
				 cart =document.getElementById("cart");
				var cars =JSON.parse(xhr.responseText)
				console.log(cars)
				si=cars.room_id.length+cars.train.length+cars.travel.length;
				cart.innerHTML=si
			  }
			}
		
		
		
		
	     function buy(roomindex){
	    	 
	         var startDate =document.getElementById("startDate").value;
	         var endDate =document.getElementById("endDate").value;
	         console.log(roomindex.value)
	    	 var xhr = new XMLHttpRequest();
	    		xhr.open("POST", "<c:url value='/shoppingProduct.controller' />", true);
	    		xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	    		xhr.send('roomid='+roomindex.value+"&starDate="+startDate+"&endDate="+endDate);
	    		xhr.onreadystatechange = function(){
	    		 if(xhr.readyState==4&&xhr.status==200){
	        		
	    				var products = JSON.parse(xhr.responseText);
	    				 console.log(products)
	    				 if(products.member=="notmember"){
	    					 
	    					 window.location.assign("http://localhost:8080/login.controller");
	    					 
	    					 
	    				 }else{
	    					 si+=1;
	    					 cart.innerHTML=si
	//     				alert(products.addproduct)	
	    				 swal({
	        				 
	    					  icon: "success",
	    					  title: "以新增至購物車",
	    					  button: {
	    						    text: "確定",
	    						  },
	    					});     		 
	    					};  
	    				 }
	        		 }
	    		}
	         
	     
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
</body>
</html>