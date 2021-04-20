<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importHead.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Cart</title>
<link href="${pageContext.request.contextPath}/shoppingcarstyle/css/progressbar.css" rel="stylesheet">
<style type="text/css">
.cell {cursor: pointer;}
@import url('https://fonts.googleapis.com/css?family=Poppins:900i');

* {
  box-sizing: border-box;
}

/* body { */
/*   height: 100vh; */
/*   display: flex; */
/*   justify-content: center; */
/*   align-items: center; */
/* } */

.wrapper {
  display: flex;
  justify-content: center;
}

.cta {
    display: flex;
    padding: 10px 45px;
    text-decoration: none;
    font-family: 'Poppins', sans-serif;
    font-size: 40px;
    color: white;
    background: #6225E6;
    transition: 1s;
    box-shadow: 6px 6px 0 black;
    transform: skewX(-15deg);
}

.cta:focus {
   outline: none; 
}

.cta:hover {
    transition: 0.5s;
    box-shadow: 10px 10px 0 #FBC638;
}

.cta span:nth-child(2) {
    transition: 0.5s;
    margin-right: 0px;
}

.cta:hover  span:nth-child(2) {
    transition: 0.5s;
    margin-right: 45px;
}

/*   span { */
/*     transform: skewX(15deg)  */
/*   } */

/*   span:nth-child(2) { */
/*     width: 20px; */
/*     margin-left: 30px; */
/*     position: relative; */
/*     top: 12%; */
/*   } */
  
/**************SVG****************/

path.one {
    transition: 0.4s;
    transform: translateX(-60%);
}

path.two {
    transition: 0.5s;
    transform: translateX(-30%);
}

.cta:hover path.three {
    animation: color_anim 1s infinite 0.2s;
}

.cta:hover path.one {
    transform: translateX(0%);
    animation: color_anim 1s infinite 0.6s;
}

.cta:hover path.two {
    transform: translateX(0%);
    animation: color_anim 1s infinite 0.4s;
}

/* SVG animations */

@keyframes color_anim {
    0% {
        fill: white;
    }
    50% {
        fill: #FBC638;
    }
    100% {
        fill: white;
    }
}
</style>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
var sum=0;
var productcar =new Array()
var productcarT =new Array();  
var length;
var cars;
var buybtnbuy ="<div class='wrapper'onclick='buygo()' >"+
"<a class='cta'  >"+
"<span style='color:white'>前往結帳</span>"+
"<span>"+
"<svg width='66px' height='43px' viewBox='0 0 66 43' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'>"+
"<g id='arrow' stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'>"+
"<path class='one' d='M40.1543933,3.89485454 L43.9763149,0.139296592 C44.1708311,-0.0518420739 44.4826329,-0.0518571125 44.6771675,0.139262789 L65.6916134,20.7848311 C66.0855801,21.1718824 66.0911863,21.8050225 65.704135,22.1989893 C65.7000188,22.2031791 65.6958657,22.2073326 65.6916762,22.2114492 L44.677098,42.8607841 C44.4825957,43.0519059 44.1708242,43.0519358 43.9762853,42.8608513 L40.1545186,39.1069479 C39.9575152,38.9134427 39.9546793,38.5968729 40.1481845,38.3998695 C40.1502893,38.3977268 40.1524132,38.395603 40.1545562,38.3934985 L56.9937789,21.8567812 C57.1908028,21.6632968 57.193672,21.3467273 57.0001876,21.1497035 C56.9980647,21.1475418 56.9959223,21.1453995 56.9937605,21.1432767 L40.1545208,4.60825197 C39.9574869,4.41477773 39.9546013,4.09820839 40.1480756,3.90117456 C40.1501626,3.89904911 40.1522686,3.89694235 40.1543933,3.89485454 Z' fill='#FFFFFF'></path>"+
"<path class='two' d='M20.1543933,3.89485454 L23.9763149,0.139296592 C24.1708311,-0.0518420739 24.4826329,-0.0518571125 24.6771675,0.139262789 L45.6916134,20.7848311 C46.0855801,21.1718824 46.0911863,21.8050225 45.704135,22.1989893 C45.7000188,22.2031791 45.6958657,22.2073326 45.6916762,22.2114492 L24.677098,42.8607841 C24.4825957,43.0519059 24.1708242,43.0519358 23.9762853,42.8608513 L20.1545186,39.1069479 C19.9575152,38.9134427 19.9546793,38.5968729 20.1481845,38.3998695 C20.1502893,38.3977268 20.1524132,38.395603 20.1545562,38.3934985 L36.9937789,21.8567812 C37.1908028,21.6632968 37.193672,21.3467273 37.0001876,21.1497035 C36.9980647,21.1475418 36.9959223,21.1453995 36.9937605,21.1432767 L20.1545208,4.60825197 C19.9574869,4.41477773 19.9546013,4.09820839 20.1480756,3.90117456 C20.1501626,3.89904911 20.1522686,3.89694235 20.1543933,3.89485454 Z' fill='#FFFFFF'></path>"+
"<path class='three' d='M0.154393339,3.89485454 L3.97631488,0.139296592 C4.17083111,-0.0518420739 4.48263286,-0.0518571125 4.67716753,0.139262789 L25.6916134,20.7848311 C26.0855801,21.1718824 26.0911863,21.8050225 25.704135,22.1989893 C25.7000188,22.2031791 25.6958657,22.2073326 25.6916762,22.2114492 L4.67709797,42.8607841 C4.48259567,43.0519059 4.17082418,43.0519358 3.97628526,42.8608513 L0.154518591,39.1069479 C-0.0424848215,38.9134427 -0.0453206733,38.5968729 0.148184538,38.3998695 C0.150289256,38.3977268 0.152413239,38.395603 0.154556228,38.3934985 L16.9937789,21.8567812 C17.1908028,21.6632968 17.193672,21.3467273 17.0001876,21.1497035 C16.9980647,21.1475418 16.9959223,21.1453995 16.9937605,21.1432767 L0.15452076,4.60825197 C-0.0425130651,4.41477773 -0.0453986756,4.09820839 0.148075568,3.90117456 C0.150162624,3.89904911 0.152268631,3.89694235 0.154393339,3.89485454 Z' fill='#FFFFFF'></path>"+
"</g>"+
"</svg>"+
"</span>"+ 
"</a>"+
"</div>";



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

function mouseover(){
      var buy =document.getElementById("buybtn").style.color='blue';
     

	
}
function mouseout(){
    var buy =document.getElementById("buybtn").style.color='red'

}
window.onload = function() {
	var pd="${pd}";
	var couhorcon =document.getElementById("couhorcon");
	
	console.log(couhorcon)
	
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='/shoppingcarMain.controller' />", true);
// 	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xhr.send();
	
	xhr.onreadystatechange = function(){
		
        if(xhr.readyState==4&&xhr.status==200){
        	
        	cars =JSON.parse(xhr.responseText)
           console.log(cars);
        	sum=cars.price;
        	console.log(pd);
        	
       if(pd=="train"){
        		 train();
        		 
        	 }else{

 if(pd=="travel"){
	 travel();
	 
 }  else{
	 
     	 console.log(cars.travel.length)
        	 
          if(cars.room_id.length>6){
        	  
        	  
        	if(cars.room_id.length%6==0){
        		 length =(cars.room_id.length/6);
        		}else{
        			 length =(cars.room_id.length/6)+1;
        		}
        	
        	console.log("length:"+cars.room_id.length)
        	 productcomtent =cars.room_id.length%6;
        
        	 count =0;
        	
        	 for(let i=0;i<length;i++){
        		
        		
        		 productcar[i] =new Array();       	    		 
        		 if(i<length&&productcomtent==0){
        			 console.log(length)
        			 for(let j=0;j<6;j++ ){

                    	 productcar[i][j] =cars.room_id[count]
        					

                       count++; 
                    	 console.log("count:"+count)
                     }
        		 }else if(i<length-2){
        			 
        			 for(let j=0;j<6;j++ ){
//         				 console.log("aaaaaaaaa:"+i)
                    	 productcar[i][j] =cars.room_id[count]
                       count++; 
                    	 console.log("count:"+count)
                     }   		 
        		 }else{        			 
        			 for(let k=0;k<productcomtent;k++ ){
//         				 console.log("ssssssss"+i)
//         				 console.log("kkkkkk"+k)
                    	 productcar[i][k] =cars.room_id[count]   
                    	 count++;
        				 
                     }      			 
        		 }
              } 
        	 
//         	console.log("test:"+productcar[1][0].hotel_id.hotel.name)
//         	let cars =JSON.parse(xhr.responseText)
  couhorcon.style.display = "inline";
            console.log(cars)
            console.log(length)
        	 let content="<section class='ftco-section'>"+
        	   "<div id='shoppingcart' class='container'>"+	
        	   "<div id='firstsss' class='row'>";
        	   
        	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
        	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 
        	 count=0;
        	 index=1
           for(let i=count;i<index;i++){       	  
        for(let j=0;j<productcar[i].length;j++){
        	 console.log("yyyyyyyyyy"+productcar[i][j].hotel_id.name)

        	content+=
         	   "<div class='col-md-4 ftco-animate'>"+
         	   "<div class='project-wrap'>"+
       "<a href='#' class='img' style='background-image: url("+productcar[i][j].hotel_id.pic+");' >"+
             "<span class='price'>$"+productcar[i][j].hotel_id.price+"/person</span>"+
        "</a>"+
         "<div class='text p-4'>"+
        
             "<h3><a href='#'>"+productcar[i][j].hotel_id.hotel.name+"</a></h3>"+
             "<span class='days'>入住日期:"+productcar[i][j].starday+"</span><br\>"+
             "<span class='days'>退房日期:"+productcar[i][j].endday+"</span>"+
             "<ul>"+
                "<li><span class='flaticon-king-size'></span>"+productcar[i][j].hotel_id.name+"</li>"+
           " </ul>"+
           "<p><a  class='btn btn-primary' style='float: right' onclick='hotelRemove("+productcar[i][j].id+")'>取消</a></p>"+
        "</div>"+
   " </div>"+
"</div>";
        	 
        }
  
      }      
           content+="</div>"+
        	   "</div>"+
        	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
//         	   "<a href='"+buy+cars.number_id+"' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: right'>前往結帳</a>"+
//         	   "<button 　style='VISIBILITY: hidden' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: right' onclick='buygo();' >前往結帳</button>"+
        	    buybtnbuy+
        	   "<div class='row mt-5'>"+
               "<div class='col text-center'>"+
               "<div class='block-27'>"+
                 "<ul>";
                
                	 content+="<li><a class='cell' onclick='pageBack();'>&lt;</a></li>";
              
                   for(let i=1;i<=length;i++){
                	   content+="<li class='cell' id='"+i+"' value='"+i+"' onclick='pageindex(this);' ><span>"+i+"</span></li>";
                   }
                
                 content+="<li><a class='cell' onclick='pageBreak();'>&gt;</a></li>"+
                 "</ul>"+
               "</div>"+
             "</div>"+
           "</div>"+
           "</div>"+
	
        "</section>";      
           let bbbb = document.getElementById('aa');        
           bbbb.innerHTML = content; 
           let pageindexs =document.getElementById("1");

           pageindexs.className="active";
//          
//           
           bb()   
        }else{
        	   
        		productcarts();
             }
          } 
         }
	   }
      
	}
   
}












function buygo(){
	console.log("sssss")
	
	swal({
		  title: "確定要前往結帳頁面?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  var xhr = new XMLHttpRequest();
				xhr.open("POST", "<c:url value='/shoppingBuy.controller' />", true);
			 	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
				xhr.send("pk="+cars.number_id);
				xhr.onreadystatechange = function(){
				
			        if(xhr.readyState==4&&xhr.status==200){
			        	
			        	
			        	
			        	window.location.assign("http://localhost:8080/shoppingGoToInf.controller");
			  
			          }		  
			  
			        }
			    
		       } 
		});
	
	

   
}




function hotels(){
	
	if(cars.room_id.length>6){
  	  
  	  
    	if(cars.room_id.length%6==0){
    		 length =(cars.room_id.length/6);
    		}else{
    			 length =(cars.room_id.length/6)+1;
    		}
    	
    	console.log("length:"+cars.room_id.length)
    	 productcomtent =cars.room_id.length%6;
    
    	 count =0;
    	
    	 for(let i=0;i<length;i++){
    		
    		
    		 productcar[i] =new Array();       	    		 
    		 if(i<length&&productcomtent==0){
    			 console.log(length)
    			 for(let j=0;j<6;j++ ){
                	 productcar[i][j] =cars.room_id[count]   			
                     count++; 
                	 console.log("count:"+count)
                 }
    		 }else if(i<length-2){
    			 
    			 for(let j=0;j<6;j++ ){
//     				 console.log("aaaaaaaaa:"+i)
                	 productcar[i][j] =cars.room_id[count]
                   count++; 
                	 console.log("count:"+count)
                 }   		 
    		 }else{        			 
    			 for(let k=0;k<productcomtent;k++ ){
//     				 console.log("ssssssss"+i)
//     				 console.log("kkkkkk"+k)
                	 productcar[i][k] =cars.room_id[count]            	
    				  console.log("sssssss"+productcar[i][k].hotel_id.name)
                 }      			 
    		 }
          } 
 
        console.log(cars)
        console.log(length)
    	 let content="<section class='ftco-section'>"+
    	   "<div id='shoppingcart' class='container'>"+	
    	   "<div id='firstsss' class='row'>";
    	   
    	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
    	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 
    	 count=0;
    	 index=1
       for(let i=count;i<index;i++){       	  
    for(let j=0;j<productcar[i].length;j++){
    	 console.log("yyyyyyyyyy"+productcar[i][j].hotel_id.name)

    	content+=
     	   "<div class='col-md-4 ftco-animate'>"+
     	   "<div class='project-wrap'>"+
   "<a href='#' class='img' style='background-image: url("+productcar[i][j].hotel_id.pic+");' >"+
         "<span class='price'>$"+productcar[i][j].hotel_id.price+"/person</span>"+
    "</a>"+
     "<div class='text p-4'>"+
    
         "<h3><a href='#'>"+productcar[i][j].hotel_id.hotel.name+"</a></h3>"+
         "<span class='days'>入住日期:"+productcar[i][j].starday+"</span><br\>"+
         "<span class='days'>退房日期:"+productcar[i][j].endday+"</span>"+
         "<ul>"+
            "<li><span class='flaticon-king-size'></span>"+productcar[i][j].hotel_id.name+"</li>"+
       " </ul>"+
       "<p><a  class='btn btn-primary' style='float: right' onclick='hotelRemove("+productcar[i][j].id+")'>取消</a></p>"+
    "</div>"+
" </div>"+
"</div>";
 	   
 			   
 	   
 	  
    }

  }      
       content+="</div>"+
    	   "</div>"+
    	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
//     	   "<a href='"+buy+cars.number_id+"' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: right'>前往結帳</a>"+
            buybtnbuy+
           "<div class='row mt-5'>"+
           "<div class='col text-center'>"+
           "<div class='block-27'>"+
             "<ul>";
            
            	 content+="<li><a  class='cell' onclick='pageBack();'>&lt;</a></li>";
          
               for(let i=1;i<=length;i++){
            	   content+="<li class='cell' id='"+i+"' value='"+i+"' onclick='pageindex(this);' ><span>"+i+"</span></li>";
               }
            
             content+="<li><a class='cell'  onclick='pageBreak();'>&gt;</a></li>"+
             "</ul>"+
           "</div>"+
         "</div>"+
       "</div>"+
       "</div>"+
     
    "</section>";      
       let bbbb = document.getElementById('aa');        
       bbbb.innerHTML = content; 
       let pageindexs =document.getElementById("1");

       pageindexs.className="active";
     
      
       bb()   
    }else{
    	 
    		productcarts();
         }
	
	
	
	
}



function pageindex(index){
	  couhorcon.style.display = "inline";
	count=index.id-1;
	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 	 
// 	 console.log(productcar[1][0].hotel_id.hotel.name)
	var ind=index.id;
	let content="<section class='ftco-section'>"+
	   "<div id='shoppingcart' class='container'>"+	
	   "<div id='firstsss' class='row'>";
	   
	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 
for(let i=ind-1;i<ind;i++){       	  
for(let j=0;j<productcar[i].length;j++){

	content+=
	   "<div class='col-md-4 ftco-animate'>"+
	   "<div class='project-wrap'>"+
"<a href='#' class='img' style='background-image: url("+productcar[i][j].hotel_id.pic+");' >"+
  "<span class='price'>$"+productcar[i][j].hotel_id.price*cproductcar[i][j].sumday*productcar[i][j].quantity+"/person</span>"+
"</a>"+
"<div class='text p-4'>"+

  "<h3><a href='#'>"+productcar[i][j].hotel_id.hotel.name+"</a></h3>"+
  "<span class='days'>入住日期:"+productcar[i][j].starday+"</span><br\>"+
  "<span class='days'>退房日期:"+productcar[i][j].endday+"</span>"+
  "<ul>"+
     "<li><span class='flaticon-king-size'></span>"+productcar[i][j].hotel_id.name+"</li>"+
" </ul>"+
"<p><a  class='btn btn-primary' style='float: right' onclick='hotelRemove("+productcar[i][j].id+")'>取消</a></p>"+
"</div>"+
" </div>"+
"</div>";
//  var starday=productcar[i][j].starday
//  starday = starday.substring(8,10);
 
//  var endday=productcar[i][j].endday
//  endday = endday.substring(8,10);
 
//  var iDays =endday-starday
// 		   console.log(iDays) 
//  sum +=(productcar[i][j].hotel_id.price*iDays); 

  }
}      
content+="</div>"+
	   "</div>"+
	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
// 	   "<a href='"+buy+cars.number_id+"' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: right'>前往結帳</a>"+
       buybtnbuy+
    "<div class='row mt-5'>"+
    "<div class='col text-center'>"+
    "<div class='block-27'>"+
      "<ul>";
      if(count>-1)
     	 content+="<li><a class='cell' onclick='pageBack();'>&lt;</a></li>";
        for(let i=1;i<=length;i++){
        	
     	   content+="<li class='cell' id='"+i+"' value='"+i+"' onclick='pageindex(this)' ><span>"+i+"</span></li>";
        }
        content+="<li><a class='cell' onclick='pageBreak();'>&gt;</a></li>"+
      "</ul>"+
    "</div>"+
  "</div>"+
"</div>"+
"</div>"+

"</section>";

let bbbb = document.getElementById('aa');        
bbbb.innerHTML = content; 


let pageindexs =document.getElementById(index.id);

pageindexs.className="active";




bb() 
	}
function pageBreak(){
	  couhorcon.style.display = "inline";
	if(count<length-2){
		 count++;
	}
	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 	 
// 	 console.log(productcar[1][0].hotel_id.hotel.name)
	var ind=index.id;
	let content="<section class='ftco-section'>"+
	   "<div id='shoppingcart' class='container'>"+	
	   "<div id='firstsss' class='row'>";
	   
// 	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
// 	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 
for(let i=count;i<count+1;i++){       	  
for(let j=0;j<productcar[i].length;j++){
W
	content+=
	   "<div class='col-md-4 ftco-animate'>"+
	   "<div class='project-wrap'>"+
"<a href='#' class='img' style='background-image: url("+productcar[i][j].hotel_id.pic+");' >"+
  "<span class='price'>$"+productcar[i][j].hotel_id.price*productcar[i][j].sumday+"/person</span>"+
"</a>"+
"<div class='text p-4'>"+

  "<h3><a href='#'>"+productcar[i][j].hotel_id.hotel.name+"</a></h3>"+
  "<span class='days'>入住日期:"+productcar[i][j].starday+"</span><br\>"+
  "<span class='days'>退房日期:"+productcar[i][j].endday+"</span>"+
  "<ul>"+
     "<li><span class='flaticon-king-size'></span>"+productcar[i][j].hotel_id.name+"</li>"+
" </ul>"+
"<p><a  class='btn btn-primary' style='float: right' onclick='hotelRemove("+productcar[i][j].id+")'>取消</a></p>"+
"</div>"+
" </div>"+
"</div>";
//  var starday=productcar[i][j].starday
//  starday = starday.substring(8,10);
 
//  var endday=productcar[i][j].endday
//  endday = endday.substring(8,10);
 
//  var iDays =endday-starday
// 		   console.log(iDays) 
//  sum +=(productcar[i][j].hotel_id.price*iDays); 

  }

}      
content+="</div>"+
	   "</div>"+
	   "<div align= 'right'  ><font style=' font-size:2em'  color='red' >總價:"+sum+"元</font><div>"+
// 	   "<a href='"+buy+cars.number_id+"' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: right'>前往結帳</a>"+
        buybtnbuy+
    "<div class='row mt-5'>"+
    "<div class='col text-center'>"+
    "<div class='block-27'>"+
    "<ul>";
    
   	 content+="<li><a class='cell' onclick='pageBack();'>&lt;</a></li>";
        for(let i=1;i<=length;i++){
        	
     	   content+="<li class='cell' id='"+i+"' value='"+i+"' onclick='pageindex(this)' ><span>"+i+"</span></li>";
        }
        content+="<li><a class='cell' onclick='pageB();'>&gt;</a></li>"+
      "</ul>"+
    "</div>"+
  "</div>"+
"</div>"+
"</div>"+

"</section>";

let bbbb = document.getElementById('aa');        
bbbb.innerHTML = content; 


let pageindexs =document.getElementById(count+1);

pageindexs.className="active";




bb() 
	 
	
	
}

function pageB(){
	
	pageBreak();
}

function pageBK(){
	
	pageBack();
}


function pageBack(){
	if(count>0){
	   count--;
	}
	  couhorcon.style.display = "inline";
	console.log(count)	 
	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 	 
// 	 console.log(productcar[1][0].hotel_id.hotel.name)
	var ind=index.id;
	let content="<section class='ftco-section'>"+
	   "<div id='shoppingcart' class='container'>"+	
	   "<div id='firstsss' class='row'>";
	   
	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 
for(let i=count;i<count+1;i++){       	  
for(let j=0;j<productcar[i].length;j++){

	content+=
	   "<div class='col-md-4 ftco-animate'>"+
	   "<div class='project-wrap'>"+
"<a href='#' class='img' style='background-image: url("+productcar[i][j].hotel_id.pic+");' >"+
  "<span class='price'>$"+productcar[i][j].hotel_id.price*cproductcar[i][j].sumday*productcar[i][j].quantity+"/person</span>"+
"</a>"+
"<div class='text p-4'>"+

  "<h3><a href='#'>"+productcar[i][j].hotel_id.hotel.name+"</a></h3>"+
  "<span class='days'>入住日期:"+productcar[i][j].starday+"</span><br\>"+
  "<span class='days'>退房日期:"+productcar[i][j].endday+"</span>"+
  "<ul>"+
     "<li><span class='flaticon-king-size'></span>"+productcar[i][j].hotel_id.name+"</li>"+
" </ul>"+
"<p><a  class='btn btn-primary' style='float: right' onclick='hotelRemove("+productcar[i][j].id+")'>取消</a></p>"+
"</div>"+
" </div>"+
"</div>";
//  var starday=productcar[i][j].starday
//  starday = starday.substring(8,10);
 
//  var endday=productcar[i][j].endday
//  endday = endday.substring(8,10);
 
//  var iDays =endday-starday
// 		   console.log(iDays) 
//  sum +=(productcar[i][j].hotel_id.price*iDays); 

  }

}      
content+="</div>"+
	   "</div>"+
	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
// 	   "<a href='"+buy+cars.number_id+"' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: right'>前往結帳</a>"+
       buybtnbuy+
    "<div class='row mt-5'>"+
    "<div class='col text-center'>"+
    "<div class='block-27'>"+
    "<ul>";
   
   	 content+="<li><a class='cell' onclick='pageBK();'>&lt;</a></li>";
        for(let i=1;i<=length;i++){
        	
     	   content+="<li class='cell' id='"+i+"' value='"+i+"' onclick='pageindex(this)' ><span>"+i+"</span></li>";
        }
        content+="<li><a class='cell' onclick='pageB();'>&gt;</a></li>"+
      "</ul>"+
    "</div>"+
  "</div>"+
"</div>"+
"</div>"+
	
"</section>";

let bbbb = document.getElementById('aa');        
bbbb.innerHTML = content; 


let pageindexs =document.getElementById(count+1);

pageindexs.className="active";




bb() 
	 
	
	
}



function  bb(){

	var scipt =document.createElement("script");
	scipt.src="${pageContext.request.contextPath}/static/js/owl.carousel.min.js";
	document.head.appendChild(scipt);

	var scipt2 =document.createElement("script");
	scipt2.src="${pageContext.request.contextPath}/static/js/scrollax.min.js";
	document.head.appendChild(scipt2);

	var scipt3 =document.createElement("script");
	scipt3.src="${pageContext.request.contextPath}/static/js/main.js";
	document.head.appendChild(scipt3);	
}




function productcarts(){
	if(cars.room_id.length!=0){
		console.log("hhh")
		  couhorcon.style.display = "inline";
	 let content="<section class='ftco-section'>"+
	 
	 "<section class='ftco-section'>"+
	   "<div id='shoppingcart' class='container'>"+	
	   
	   "<div id='firstsss' class='row'>";
	   
	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 
	 count=0;
	 index=1
 for(let i=count;i<cars.room_id.length;i++){       	  

	
	content+=
	   "<div class='col-md-4 ftco-animate'>"+
	   "<div class='project-wrap'>"+
"<a href='#' class='img' style='background-image: url("+cars.room_id[i].hotel_id.pic+");' >"+
   "<span class='price'>$"+cars.room_id[i].hotel_id.price*cars.room_id[i].sumday*cars.room_id[i].quantity+"/person</span>"+
"</a>"+
"<div class='text p-4'>"+
 
   "<h3><a href='#'>"+cars.room_id[i].hotel_id.hotel.name+"</a></h3>"+
   "<span class='days'>入住日期:"+cars.room_id[i].starday+"</span><br\>"+
   "<span class='days'>退房日期:"+cars.room_id[i].endday+"</span>"+
   "<ul>"+
      "<li><span class='flaticon-king-size'></span>"+cars.room_id[i].hotel_id.name+"</li>"+
 " </ul>"+
 "<p><a  class='btn btn-primary' style='float: right' onclick='hotelRemove("+cars.room_id[i].id+")'>取消</a></p>"+
 
 
"</div>"+
" </div>"+
"</div>";

 


}      
 content+="</div>"+
	   "</div>"+
	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
// 	   "<a href='"+buy+cars.number_id+"' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: right'>前往結帳</a>"+
        buybtnbuy+

	   "<div class='row mt-5'>"+
     "<div class='col text-center'>"+
     "<div class='block-27'>"+
       "<ul>";
      
      	 content+="<li><a  onclick=''>&lt;</a></li>";
        
      	   content+="<li class='' id='1' value='' onclick='' ><span>"+1+"</span></li>";
         
      
       content+="<li><a  onclick=''>&gt;</a></li>"+
       "</ul>"+
     "</div>"+
   "</div>"+
 "</div>"+
 "</div>"+
"</section>"+
"<div>"+

"</div>";      
 let bbbb = document.getElementById('aa');        
 bbbb.innerHTML = content; 
 let pageindexs =document.getElementById("1");
console.log("vvvvvvvvvvvvvvvvvvvvv")
 pageindexs.className="active";
 

 bb() 
 
	} else{
		
//  	 imgs ="<img src='${pageContext.request.contextPath}/images/404/404.png'>";
	let bbbb = document.getElementById('aa');
	  couhorcon.style.display = "none";
      bbbb.innerHTML = "<div align= 'center'><font  color='red'>未購預定任何飯店</font><div>"; 
  
   } 
}

var travelRemove="<c:url value='/travel/remove/' />";

//套裝行程
function travel(){
	  couhorcon.style.display = "inline";
	if(cars.travel.length>6){
     	  console.log("travel")
     	  
     	if(cars.travel.length%6==0){
     		 length =(cars.travel.length/6);
     		}else{
     			 length =(cars.travel.length/6)+1;
     		}
     	
     	console.log("length:"+cars.travel.length)
     	 productcomtent =cars.travel.length%6;
     
     	 count =0;
     	
     	 for(let i=0;i<length;i++){
     		
     		
     		 productcarT[i] =new Array();       	    		 
     		 if(i<length&&productcomtent==0){
     			 console.log(length)
     			 for(let j=0;j<6;j++ ){
//      				 console.log("aaaaaaaaa:"+i)
                 	 productcarT[i][j] =cars.travel[count]
     					

                    count++; 
                 	 console.log("count:"+count)
                  }
     		 }else if(i<length-2){
     			 
     			 for(let j=0;j<6;j++ ){
//      				 console.log("aaaaaaaaa:"+i)
                 	 productcarT[i][j] =cars.travel[count]
                    count++; 
                 	 console.log("count:"+count)
                  }   		 
     		 }else{        			 
     			 for(let k=0;k<productcomtent;k++ ){
//      				 console.log("ssssssss"+i)
//      				 console.log("kkkkkk"+k)
                 	 productcarT[i][k] =cars.travel[count]            	
//      				  console.log("sssssss"+productcar[i][k].travel.name)
     				  
                  }      			 
     		 }
           }
     	 
     	 
     	
     	 
     	 
     	 
     	 
     	 let content="<section class='ftco-section'>"+
  	      "<div id='shoppingcart' class='container'>"+	
  	      "<div id='firstsss' class='row'>";
  	   
  	
  	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 
  	 count=0;
  	 index=1
     for(let i=count;i<index;i++){       	  
         for(let j=0;j<productcarT[i].length;j++){


  	        content+=
   	     "<div class='col-md-4 ftco-animate'>"+
   	        "<div class='project-wrap'>"+
   	     "<a href='#' class='img' style='background-image: url("+productcarT[i][j].travelGroup.image+");'   >"+
            "<span class='price'>$"+productcarT[i][j].price+"/person</span>"+
            "</a>"+
            "<div class='text p-4'>"+
     
            "<h3><a href='#'>"+productcarT[i][j].travelGroup.name+"</a></h3>"+
            "<span class='days'>出發地點:"+productcarT[i][j].travelGroup.origin+"</span><br\>"+
            "<span class='days'>目的地:"+productcarT[i][j].travelGroup.destination+"</span><br\>"+
            "<span class='days'>旅遊天數:"+productcarT[i][j].travelGroup.day+"</span><br\>"+
            "<span class='days'>日期:"+productcarT[i][j].travelGroup.day+"</span>"+
            "<ul>"+
            "<li><span class='flaticon-king-size'></span>購買票數"+productcarT[i][j].quantity+"張</li>"+
            " </ul>"+
            "<p><a  class='btn btn-primary' style='float: right' onclick='trivelRemove("+productcarT[i][j].id+")'>取消</a></p>"+
            "</div>"+
            " </div>"+
          "</div>";

	  
  }

}      
     content+="</div>"+
  	   "</div>"+
  	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
//   	   "<a href='"+buy+cars.number_id+"' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: right'>前往結帳</a>"+
          buybtnbuy+
         "<div class='row mt-5'>"+
         "<div class='col text-center'>"+
         "<div class='block-27'>"+
           "<ul>";
          
          	 content+="<li><a class='cell' onclick='pageBack();'>&lt;</a></li>";
        
             for(let i=1;i<=length;i++){
          	   content+="<li class='cell' id='"+i+"' value='"+i+"' onclick='pageindextravel(this);' ><span>"+i+"</span></li>";
             }
          
           content+="<li><a class='cell' onclick='pageBreaktravel();'>&gt;</a></li>"+
           "</ul>"+
         "</div>"+
       "</div>"+
     "</div>"+
     "</div>"+
    
  "</section>";      
     let bbbb = document.getElementById('aa');        
     bbbb.innerHTML = content; 
     let pageindexs =document.getElementById("1");

     pageindexs.className="active";
   
    
     bb() 
     	 
     	 
     	 
     	 
     	 
     	 
     	 
     	 
	
	
      }else{
	
	     travelP();
	
	
	
      }

	
	
}






function pageindextravel(index){
	  couhorcon.style.display = "inline";
	count=index.id-1;
	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 	 
// 	 console.log(productcar[1][0].hotel_id.hotel.name)
	var ind=index.id;
	let content="<section class='ftco-section'>"+
	   "<div id='shoppingcart' class='container'>"+	
	   "<div id='firstsss' class='row'>";
	   
	 
	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 
for(let i=ind-1;i<ind;i++){       	  
for(let j=0;j<productcarT[i].length;j++){

	content+=
	   "<div class='col-md-4 ftco-animate'>"+
	   "<div class='project-wrap'>"+
	   "<a href='#' class='img' style='background-image: url("+productcarT[i][j].travelGroup.image+");'   >"+
  "<span class='price'>$"+productcarT[i][j].price+"/person</span>"+
"</a>"+
"<div class='text p-4'>"+

"<h3><a href='#'>"+productcarT[i][j].travelGroup.name+"</a></h3>"+
"<span class='days'>出發地點:"+productcarT[i][j].travelGroup.origin+"</span><br\>"+
"<span class='days'>目的地:"+productcarT[i][j].travelGroup.destination+"</span><br\>"+
"<span class='days'>旅遊天數:"+productcarT[i][j].travelGroup.day+"</span><br\>"+
"<span class='days'>日期:"+productcarT[i][j].travelGroup.day+"</span>"+
"<ul>"+
"<li><span class='flaticon-king-size'></span>購買票數"+productcarT[i][j].quantity+"張</li>"+
" </ul>"+
"<p><a  class='btn btn-primary' style='float: right' onclick='trivelRemove("+productcarT[i][j].id+")'>取消</a></p>"+
"</div>"+
" </div>"+
"</div>";
//  var starday=productcar[i][j].starday
//  starday = starday.substring(8,10);
 
//  var endday=productcar[i][j].endday
//  endday = endday.substring(8,10);
 
//  var iDays =endday-starday
// 		   console.log(iDays) 
//  sum +=(productcar[i][j].hotel_id.price*iDays); 

  }
}      
content+="</div>"+
	   "</div>"+
	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
// 	   "<a href='"+buy+cars.number_id+"' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: right'>前往結帳</a>"+
       buybtnbuy+
    "<div class='row mt-5'>"+
    "<div class='col text-center'>"+
    "<div class='block-27'>"+
      "<ul>";
      if(count>-1)
     	 content+="<li><a class='cell' onclick='pageBacktravel();'>&lt;</a></li>";
        for(let i=1;i<=length;i++){
        	
     	   content+="<li class='cell' id='"+i+"' value='"+i+"' onclick='pageindextravel(this)' ><span>"+i+"</span></li>";
        }
        content+="<li><a class='cell' onclick='pageBreaktravel();'>&gt;</a></li>"+
      "</ul>"+
    "</div>"+
  "</div>"+
"</div>"+
"</div>"+

"</section>";

let bbbb = document.getElementById('aa');        
bbbb.innerHTML = content; 


let pageindexs =document.getElementById(index.id);

pageindexs.className="active";




bb() 
	}
function pageBreaktravel(){
	if(count<length-2){
		 count++;
	}
	  couhorcon.style.display = "inline";
	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 	 
// 	 console.log(productcar[1][0].hotel_id.hotel.name)
	var ind=index.id;
	let content="<section class='ftco-section'>"+
	   "<div id='shoppingcart' class='container'>"+	
	   "<div id='firstsss' class='row'>";
	   
	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 
for(let i=count;i<count+1;i++){       	  
for(let j=0;j<productcarT[i].length;j++){

	content+=
	   "<div class='col-md-4 ftco-animate'>"+
	   "<div class='project-wrap'>"+
	   "<a href='#' class='img' style='background-image: url("+productcarT[i][j].travelGroup.image+");'   >"+
  "<span class='price'>$"+productcarT[i][j].price+"/person</span>"+
"</a>"+
"<div class='text p-4'>"+

"<h3><a href='#'>"+productcarT[i][j].travelGroup.name+"</a></h3>"+
"<span class='days'>出發地點:"+productcarT[i][j].travelGroup.origin+"</span><br\>"+
"<span class='days'>目的地:"+productcarT[i][j].travelGroup.destination+"</span><br\>"+
"<span class='days'>旅遊天數:"+productcarT[i][j].travelGroup.day+"</span><br\>"+
"<span class='days'>日期:"+productcarT[i][j].travelGroup.day+"</span>"+
"<ul>"+
"<li><span class='flaticon-king-size'></span>購買票數"+productcarT[i][j].quantity+"張</li>"+
" </ul>"+
"<p><a  class='btn btn-primary' style='float: right' onclick='trivelRemove("+productcarT[i][j].id+")'>取消</a></p>"+
"</div>"+
" </div>"+
"</div>";
//  var starday=productcar[i][j].starday
//  starday = starday.substring(8,10);
 
//  var endday=productcar[i][j].endday
//  endday = endday.substring(8,10);
 
//  var iDays =endday-starday
// 		   console.log(iDays) 
//  sum +=(productcar[i][j].hotel_id.price*iDays); 

  }

}      
content+="</div>"+
	   "</div>"+
	   "<div align= 'right'  ><font style=' font-size:2em'  color='red' >總價:"+sum+"元</font><div>"+
// 	   "<a href='"+buy+cars.number_id+"' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: right'>前往結帳</a>"+
       buybtnbuy+
    "<div class='row mt-5'>"+
    "<div class='col text-center'>"+
    "<div class='block-27'>"+
    "<ul>";
    
   	 content+="<li><a class='cell' onclick='pageBacktravel();'>&lt;</a></li>";
        for(let i=1;i<=length;i++){
        	
     	   content+="<li class='cell' id='"+i+"' value='"+i+"' onclick='pageindextravel(this)' ><span>"+i+"</span></li>";
        }
        content+="<li><a class='cell' onclick='pageBreaktravel();'>&gt;</a></li>"+
      "</ul>"+
    "</div>"+
  "</div>"+
"</div>"+
"</div>"+

"</section>";

let bbbb = document.getElementById('aa');        
bbbb.innerHTML = content; 


let pageindexs =document.getElementById(count+1);

pageindexs.className="active";




bb() 
	 
	
	
}

function pageBtravel(){
	
	pageBreaktravel();
}

function pageBKtravel(){
	
	pageBacktravel();
}


function pageBacktravel(){
    console.log(count)
	if(count>0){
	   count--;
	}
    couhorcon.style.display = "inline";
    couhorcon.style.display = "inline";
	console.log(count)	
	
	
	
	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 	 
	var ind=index.id;
	
	
	
	           
	           let content="<section class='ftco-section'>"+
	   "<div id='shoppingcart' class='container'>"+	
	   "<div id='firstsss' class='row'>";
	   
	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 
for(let i=count;i<count+1;i++){       	  
for(let j=0;j<productcarT[i].length;j++){

	content+=
	   "<div class='col-md-4 ftco-animate'>"+
	   "<div class='project-wrap'>"+
	   "<a href='#' class='img' style='background-image: url("+productcarT[i][j].travelGroup.image+");'   >"+
  "<span class='price'>$"+productcarT[i][j].price+"/person</span>"+
"</a>"+
"<div class='text p-4'>"+

"<h3><a href='#'>"+productcarT[i][j].travelGroup.name+"</a></h3>"+
"<span class='days'>出發地點:"+productcarT[i][j].travelGroup.origin+"</span><br\>"+
"<span class='days'>目的地:"+productcarT[i][j].travelGroup.destination+"</span><br\>"+
"<span class='days'>旅遊天數:"+productcarT[i][j].travelGroup.day+"</span><br\>"+
"<span class='days'>日期:"+productcarT[i][j].travelGroup.day+"</span>"+
"<ul>"+
"<li><span class='flaticon-king-size'></span>購買票數"+productcarT[i][j].quantity+"張</li>"+
" </ul>"+
"<p><a  class='btn btn-primary' style='float: right' onclick='trivelRemove("+productcarT[i][j].id+")'>取消</a></p>"+
"</div>"+
" </div>"+
"</div>";
//  var starday=productcar[i][j].starday
//  starday = starday.substring(8,10);
 
//  var endday=productcar[i][j].endday
//  endday = endday.substring(8,10);
 
//  var iDays =endday-starday
// 		   console.log(iDays) 
//  sum +=(productcar[i][j].hotel_id.price*iDays); 

  }

}      
content+="</div>"+
	   "</div>"+
	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
// 	   "<a href='"+buy+cars.number_id+"' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: right'>前往結帳</a>"+
       buybtnbuy+
    "<div class='row mt-5'>"+
    "<div class='col text-center'>"+
    "<div class='block-27'>"+
    "<ul>";
   
   	 content+="<li><a class='cell' onclick='pageBKtravel();'>&lt;</a></li>";
        for(let i=1;i<=length;i++){       	
     	   content+="<li class='cell' id='"+i+"' value='"+i+"' onclick='pageindextravel(this)' ><span>"+i+"</span></li>";
        }
        content+="<li><a class='cell' onclick='pageBtravel();'>&gt;</a></li>"+
      "</ul>"+
    "</div>"+
  "</div>"+
"</div>"+
"</div>"+

"</section>";

let bbbb = document.getElementById('aa');        
bbbb.innerHTML = content; 


let pageindexs =document.getElementById(count+1);

pageindexs.className="active";




bb() 
	 
	
	
}











// function ()















function travelP(){
	
	if(cars.travel.length!=0){
		  couhorcon.style.display = "inline";
		 let content="<section class='ftco-section'>"+
		 
		 "<section class='ftco-section'>"+
		   "<div id='shoppingcart' class='container'>"+	
		   
		   "<div id='firstsss' class='row'>";
		   
		 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
		 var buy = "<c:url value='/shoppingBuy.controller/' />"; 
		 count=0;
		 index=1
	 for(let i=count;i<cars.travel.length;i++){       	  

		
		content+=
		   "<div class='col-md-4 ftco-animate'>"+
		   "<div class='project-wrap'>"+
		   "<a href='#' class='img' style='background-image: url("+cars.travel[i].travelGroup.image+");'   >"+
	   "<span class='price'>$"+cars.travel[i].price+"/person</span>"+
	"</a>"+
	"<div class='text p-4'>"+
	 
	"<h3><a href='#'>"+cars.travel[i].travelGroup.name+"</a></h3>"+
    "<span class='days'>出發地點:"+cars.travel[i].travelGroup.origin+"</span><br\>"+
    "<span class='days'>目的地:"+cars.travel[i].travelGroup.destination+"</span><br\>"+
    "<span class='days'>旅遊天數:"+cars.travel[i].travelGroup.day+"</span><br\>"+
    "<span class='days'>日期:"+cars.travel[i].travelGroup.day+"</span>"+
    "<ul>"+
    "<li><span class='flaticon-king-size'></span>購買票數"+cars.travel[i].quantity+"張</li>"+
	 " </ul>"+
	 "<p><a  class='btn btn-primary' style='float: right' onclick='trivelRemove("+cars.travel[i].id+")'>取消</a></p>"+
	"</div>"+
	" </div>"+
	"</div>";
// 	  var starday=cars.room_id[i].starday
// 	  starday = starday.substring(8,10);
	  
// 	  var endday=cars.room_id[i].endday
// 	  endday = endday.substring(8,10);
	  
// 	  var iDays =endday-starday
// 			   console.log(iDays) 
// 	  sum +=(cars.room_id[i].hotel_id.price*iDays); 
	 


	}      
	 content+="</div>"+
		   "</div>"+
		   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
// 		   "<a href='"+buy+cars.number_id+"' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: right'>前往結帳</a>"+
            buybtnbuy+
	     "<div class='row mt-5'>"+
	     "<div class='col text-center'>"+
	     "<div class='block-27'>"+
	       "<ul>";
	      
	      	 content+="<li><a href='#' onclick='travelP();'>&lt;</a></li>";        
	      	   content+="<li class='' id='1' value='' onclick='travelP(this)' ><span>"+1+"</span></li>";
	       content+="<li><a href='#' onclick='travelP();'>&gt;</a></li>"+
	       "</ul>"+
	     "</div>"+
	   "</div>"+
	 "</div>"+
	 "</div>"+
	"</section>"+
	"<div>"+
	
	"</div>";      
	 let bbbb = document.getElementById('aa');        
	 bbbb.innerHTML = content; 
	 let pageindexs =document.getElementById("1");
	console.log("vvvvvvvvvvvvvvvvvvvvv")
	 pageindexs.className="active";

	 bb() 
		} else{
//	  	 imgs ="<img src='${pageContext.request.contextPath}/images/404/404.png'>";
		let bbbb = document.getElementById('aa');
		  couhorcon.style.display = "none";
	      bbbb.innerHTML = "<div align= 'center'><font  color='red'>未購買任何套裝行程</font><div>"; 
	  
	   } 
	
	
	
} 





















function train(){
	
	if(cars.train.length>6){
     	  
		  couhorcon.style.display = "inline";
     	if(cars.train.length%6==0){
     		 length =(cars.train.length/6);
     		}else{
     			 length =(cars.train.length/6)+1;
     		}
     	
     	console.log("length:"+cars.train.length)
     	 productcomtent =cars.train.length%6;
     
     	 count =0;
     	
     	 for(let i=0;i<length;i++){
     		
     		
     		 productcarT[i] =new Array();       	    		 
     		 if(i<length&&productcomtent==0){
     			 console.log(length)
     			 for(let j=0;j<6;j++ ){
//      				 console.log("aaaaaaaaa:"+i)
                 	 productcarT[i][j] =cars.train[count]
     					

                    count++; 
                 	 console.log("count:"+count)
                  }
     		 }else if(i<length-2){
     			 
     			 for(let j=0;j<6;j++ ){
//      				 console.log("aaaaaaaaa:"+i)
                 	 productcarT[i][j] =cars.train[count]
                    count++; 
                 	 console.log("count:"+count)
                  }   		 
     		 }else{        			 
     			 for(let k=0;k<productcomtent;k++ ){
//      				 console.log("ssssssss"+i)
//      				 console.log("kkkkkk"+k)
                 	 productcarT[i][k] =cars.train[count]            	
//      				  console.log("sssssss"+productcar[i][k].travel.name)
     				  
                  }      			 
     		 }
           }
     	 
     	 
     	
     	 
     	 
     	 
     	 
     	 let content="<section class='ftco-section'>"+
  	   "<div id='shoppingcart' class='container'>"+	
  	   "<div id='firstsss' class='row'>";
  	   
  	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
  	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 
  	 count=0;
  	 index=1
     for(let i=count;i<index;i++){       	  
  for(let j=0;j<productcarT[i].length;j++){
//   	 console.log("yyyyyyyyyy"+productcar[i][j].hotel_id.name)

  	content+=
   	   "<div class='col-md-4 ftco-animate'>"+
   	   "<div class='project-wrap'>"+
   
   "<a href='#' class='img' style='background-image: url(../images/tr.png);'   >"+
   "<span id='person' style='position:absolute;color:black; font-weight:500; font-size:40px; top:25%;left:47%;transform: translate(-40%, -75%); x-index:1000;'>"+productcarT[i][j].train.start+"</span>"+
 "<span id='person' style='position:absolute;color:black; font-weight:500; font-size:40px; top:70%;left:47%;transform: translate(-40%, -60%); x-index:1000;'>"+productcarT[i][j].train.dest+"</span>"+
       "<span class='price'>$"+productcarT[i][j].train.price+"/person</span>"+
  "</a>"+
   "<div class='text p-4'>"+
     
       "<h3><a href='#'>火車套票</a></h3>"+
       "<span class='days'>起點:"+productcarT[i][j].train.start+"</span><br\>"+
       "<span class='days'>終點:"+productcarT[i][j].train.dest+"</span>"+
       "<ul>"+
          "<li><span class='flaticon-mountains'></span>票數:"+productcarT[i][j].qutity+"張</li>"+
     " </ul>"+
     "<p><a  class='btn btn-primary' style='float: right' onclick='trainRemove("+productcarT[i][j].id+")'>取消</a></p>"+
  "</div>"+
" </div>"+
"</div>";

// 	   var starday=productcar[i][j].starday
// 	   starday = starday.substring(8,10);
	   
// 	   var endday=productcar[i][j].endday
// 	   endday = endday.substring(8,10);
	   
// 	   var iDays =endday-starday
// 			   console.log(iDays) 
// 	   sum +=(productcar[i][j].hotel_id.price*iDays); 
	  
  }

}      
     content+="</div>"+
  	   "</div>"+
  	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
//   	   "<a href='"+buy+cars.number_id+"' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: right'>前往結帳</a>"+
         buybtnbuy+
         "<div class='row mt-5'>"+
         "<div class='col text-center'>"+
         "<div class='block-27'>"+
           "<ul>";
          
          	 content+="<li><a class='cell' onclick='pageBacktrain();'>&lt;</a></li>";
        
             for(let i=1;i<=length;i++){
          	   content+="<li class='cell' id='"+i+"' value='"+i+"' onclick='pageindextrain(this);' ><span>"+i+"</span></li>";
             }        
           content+="<li><a class='cell' onclick='pageBreaktrain();'>&gt;</a></li>"+
           "</ul>"+
         "</div>"+
       "</div>"+
     "</div>"+
     "</div>"+
     
  "</section>";      
     let bbbb = document.getElementById('aa');        
     bbbb.innerHTML = content; 
     let pageindexs =document.getElementById("1");
     pageindexs.className="active";
   
    
     bb() 
     	 
     	 
     	 
     	 
     	 
     	 
     	 
     	 
	
	
      }else{
	
    	  trainT();
	
	
	
      }

	
	
}






function pageindextrain(index){
	  couhorcon.style.display = "inline";
	count=index.id-1;
	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 	 
// 	 console.log(productcar[1][0].hotel_id.hotel.name)
	var ind=index.id;
	let content="<section class='ftco-section'>"+
	   "<div id='shoppingcart' class='container'>"+	
	   "<div id='firstsss' class='row'>";
	   
	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 
for(let i=ind-1;i<ind;i++){       	  
for(let j=0;j<productcarT[i].length;j++){

	content+=
	   "<div class='col-md-4 ftco-animate'>"+
	   "<div class='project-wrap'>"+
	   "<a href='#' class='img' style='background-image: url(../images/tr.png);'   >"+
	   "<span id='person' style='position:absolute;color:black; font-weight:500; font-size:40px; top:25%;left:47%;transform: translate(-40%, -75%); x-index:1000;'>"+productcarT[i][j].train.start+"</span>"+
	 "<span id='person' style='position:absolute;color:black; font-weight:500; font-size:40px; top:70%;left:47%;transform: translate(-40%, -60%); x-index:1000;'>"+productcarT[i][j].train.dest+"</span>"+
	       "<span class='price'>$"+productcarT[i][j].train.price+"/person</span>"+
	  "</a>"+
	   "<div class='text p-4'>"+
	     
	       "<h3><a href='#'>火車套票</a></h3>"+
	       "<span class='days'>起點:"+productcarT[i][j].train.start+"</span><br\>"+
	       "<span class='days'>終點:"+productcarT[i][j].train.dest+"</span>"+
	       "<ul>"+
	          "<li><span class='flaticon-mountains'></span>票數:"+productcarT[i][j].qutity+"張</li>"+
" </ul>"+
"<p><a  class='btn btn-primary' style='float: right' onclick='trainRemove("+productcarT[i][j].id+")'>取消</a></p>"+
"</div>"+
" </div>"+
"</div>";
//  var starday=productcar[i][j].starday
//  starday = starday.substring(8,10);
 
//  var endday=productcar[i][j].endday
//  endday = endday.substring(8,10);
 
//  var iDays =endday-starday
// 		   console.log(iDays) 
//  sum +=(productcar[i][j].hotel_id.price*iDays); 

  }
}      
content+="</div>"+
	   "</div>"+
	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
// 	   "<a href='"+buy+cars.number_id+"' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: right'>前往結帳</a>"+
       buybtnbuy+
    "<div class='row mt-5'>"+
    "<div class='col text-center'>"+
    "<div class='block-27'>"+
      "<ul>";
      if(count>-1)
     	 content+="<li><a class='cell' onclick='pageBacktrain();'>&lt;</a></li>";
        for(let i=1;i<=length;i++){
        	
     	   content+="<li class='cell' id='"+i+"' value='"+i+"' onclick='pageindextrain(this)' ><span>"+i+"</span></li>";
        }
        content+="<li><a class='cell' onclick='pageBreaktrain();'>&gt;</a></li>"+
      "</ul>"+
    "</div>"+
  "</div>"+
"</div>"+
"</div>"+

"</section>";

let bbbb = document.getElementById('aa');        
bbbb.innerHTML = content; 


let pageindexs =document.getElementById(index.id);

pageindexs.className="active";




bb() 
	}
	
	
	
	
	
function pageBreaktrain(){
	
	
	
	if(count<length-2){
		 count++;
	}
	  couhorcon.style.display = "inline";
	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 	 
// 	 console.log(productcar[1][0].hotel_id.hotel.name)
	var ind=index.id;
	let content="<section class='ftco-section'>"+
	   "<div id='shoppingcart' class='container'>"+	
	   "<div id='firstsss' class='row'>";
	   
	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 
for(let i=count;i<count+1;i++){       	  
for(let j=0;j<productcarT[i].length;j++){

	content+=
	   "<div class='col-md-4 ftco-animate'>"+
	   "<div class='project-wrap'>"+
	   "<a href='#' class='img' style='background-image: url(../images/tr.png);'   >"+
	   "<span id='person' style='position:absolute;color:black; font-weight:500; font-size:40px; top:25%;left:47%;transform: translate(-40%, -75%); x-index:1000;'>"+productcarT[i][j].train.start+"</span>"+
	 "<span id='person' style='position:absolute;color:black; font-weight:500; font-size:40px; top:70%;left:47%;transform: translate(-40%, -60%); x-index:1000;'>"+productcarT[i][j].train.dest+"</span>"+
	       "<span class='price'>$"+productcarT[i][j].train.price+"/person</span>"+
	  "</a>"+
	   "<div class='text p-4'>"+
	     
	       "<h3><a href='#'>火車套票</a></h3>"+
	       "<span class='days'>起點:"+productcarT[i][j].train.start+"</span><br\>"+
	       "<span class='days'>終點:"+productcarT[i][j].train.dest+"</span>"+
	       "<ul>"+
	          "<li><span class='flaticon-mountains'></span>票數:"+productcarT[i][j].qutity+"張</li>"+
" </ul>"+
"<p><a  class='btn btn-primary' style='float: right' onclick='trainRemove("+productcarT[i][j].id+")'>取消</a></p>"+
"</div>"+
" </div>"+
"</div>";
//  var starday=productcar[i][j].starday
//  starday = starday.substring(8,10);
 
//  var endday=productcar[i][j].endday
//  endday = endday.substring(8,10);
 
//  var iDays =endday-starday
// 		   console.log(iDays) 
//  sum +=(productcar[i][j].hotel_id.price*iDays); 

  }

}      
content+="</div>"+
	   "</div>"+
	   "<div align= 'right'  ><font style=' font-size:2em'  color='red' >總價:"+sum+"元</font><div>"+
// 	   "<a href='"+buy+cars.number_id+"' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: right'>前往結帳</a>"+
       buybtnbuy+
    "<div class='row mt-5'>"+
    "<div class='col text-center'>"+
    "<div class='block-27'>"+
    "<ul>";
    
   	 content+="<li><a href='#' onclick='pageBacktrain();'>&lt;</a></li>";
        for(let i=1;i<=length;i++){
        	
     	   content+="<li class='cell' id='"+i+"' value='"+i+"' onclick='pageindextrain(this)' ><span>"+i+"</span></li>";
        }
        content+="<li><a class='cell' onclick='pageBreaktrain();'>&gt;</a></li>"+
      "</ul>"+
    "</div>"+
  "</div>"+
"</div>"+
"</div>"+

"</section>";

let bbbb = document.getElementById('aa');        
bbbb.innerHTML = content; 


let pageindexs =document.getElementById(count+1);

pageindexs.className="active";




bb() 
	 
	
	
}

function pageBtrain(){
	
	pageBreaktrain();
}

function pageBKtrain(){
	
	pageBacktrain();
}


function pageBacktrain(){
	if(count>0){
	   count--;
	}
	  couhorcon.style.display = "inline";
	console.log(count)	 
	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 	 
// 	 console.log(productcar[1][0].hotel_id.hotel.name)
	var ind=index.id;
	let content="<section class='ftco-section'>"+
	   "<div id='shoppingcart' class='container'>"+	
	   "<div id='firstsss' class='row'>";
	   
	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 
for(let i=count;i<count+1;i++){       	  
for(let j=0;j<productcarT[i].length;j++){

	content+=
	   "<div class='col-md-4 ftco-animate'>"+
	   "<div class='project-wrap'>"+
	   "<a href='#' class='img' style='background-image: url(../images/tr.png);'   >"+
	   "<span id='person' style='position:absolute;color:black; font-weight:500; font-size:40px; top:25%;left:47%;transform: translate(-40%, -75%); x-index:1000;'>"+productcarT[i][j].train.start+"</span>"+
	 "<span id='person' style='position:absolute;color:black; font-weight:500; font-size:40px; top:70%;left:47%;transform: translate(-40%, -60%); x-index:1000;'>"+productcarT[i][j].train.dest+"</span>"+
	       "<span class='price'>$"+productcarT[i][j].train.price+"/person</span>"+
	  "</a>"+
	   "<div class='text p-4'>"+
	     
	       "<h3><a href='#'>火車套票</a></h3>"+
	       "<span class='days'>起點:"+productcarT[i][j].train.start+"</span><br\>"+
	       "<span class='days'>終點:"+productcarT[i][j].train.dest+"</span>"+
	       "<ul>"+
	          "<li><span class='flaticon-mountains'></span>票數:"+productcarT[i][j].qutity+"張</li>"+
" </ul>"+
"<p><a  class='btn btn-primary' style='float: right' onclick='trainRemove("+productcarT[i][j].id+")'>取消</a></p>"+
"</div>"+
" </div>"+
"</div>";

  }

}      
content+="</div>"+
	   "</div>"+
	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
// 	   "<a href='"+buy+cars.number_id+"' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: right'>前往結帳</a>"+
         buybtnbuy+
    "<div class='row mt-5'>"+
    "<div class='col text-center'>"+
    "<div class='block-27'>"+
    "<ul>";
   
   	 content+="<li><a class='cell' onclick='pageBKtraveltrain();'>&lt;</a></li>";
        for(let i=1;i<=length;i++){       	
     	   content+="<li class='cell' id='"+i+"' value='"+i+"' onclick='pageindextrain(this)' ><span>"+i+"</span></li>";
        }
        content+="<li><a class='cell' onclick='pageBtraveltrain();'>&gt;</a></li>"+
      "</ul>"+
    "</div>"+
  "</div>"+
"</div>"+
"</div>"+

"</section>";

let bbbb = document.getElementById('aa');        
bbbb.innerHTML = content; 


let pageindexs =document.getElementById(count+1);

pageindexs.className="active";




bb() 
	 
	
	
}











function trainT(){
	
	if(cars.train.length!=0){
		  couhorcon.style.display = "inline";
		 let content="<section class='ftco-section'>"+
		 
		 "<section class='ftco-section'>"+
		   "<div id='shoppingcart' class='container'>"+	
		   
		   "<div id='firstsss' class='row'>";
		   
		 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
		 var buy = "<c:url value='/shoppingBuy.controller/' />"; 
		 count=0;
		 index=1
		 productcarT =cars.train;
		
	 for(let i=count;i<cars.train.length;i++){       	  

		
		content+=
		   "<div class='col-md-4 ftco-animate'>"+
		   "<div class='project-wrap'>"+
		   "<a href='#' class='img' style='background-image: url(../images/tr.png);'   >"+
		   "<span id='person' style='position:absolute;color:black; font-weight:500; font-size:40px; top:25%;left:47%;transform: translate(-40%, -75%); x-index:1000;'>"+productcarT[i].train.start+"</span>"+
		 "<span id='person' style='position:absolute;color:black; font-weight:500; font-size:40px; top:70%;left:47%;transform: translate(-40%, -60%); x-index:1000;'>"+productcarT[i].train.dest+"</span>"+
		       "<span class='price'>$"+productcarT[i].train.price+"/person</span>"+
		  "</a>"+
		   "<div class='text p-4'>"+
		     
		       "<h3><a href='#'>火車套票</a></h3>"+
		       "<span class='days'>起點:"+productcarT[i].train.start+"</span><br\>"+
		       "<span class='days'>終點:"+productcarT[i].train.dest+"</span>"+
		       "<ul>"+
		          "<li><span class='flaticon-mountains'></span>票數:"+productcarT[i].qutity+"張</li>"+
	 " </ul>"+
	 "<p><a  class='btn btn-primary' style='float: right' onclick='trainRemove("+productcarT[i].id+")'>取消</a></p>"+
	"</div>"+
	" </div>"+
	"</div>";
// 	  var starday=cars.room_id[i].starday
// 	  starday = starday.substring(8,10);
	  
// 	  var endday=cars.room_id[i].endday
// 	  endday = endday.substring(8,10);
	  
// 	  var iDays =endday-starday
// 			   console.log(iDays) 
// 	  sum +=(cars.room_id[i].hotel_id.price*iDays); 
	 


	}      
	 content+="</div>"+
		   "</div>"+
		   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
// 		   "<a href='"+buy+cars.number_id+"' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: right'>前往結帳</a>"+
          buybtnbuy+
	     "<div class='row mt-5'>"+
	     "<div class='col text-center'>"+
	     "<div class='block-27'>"+
	       "<ul>";
	      
	      	 content+="<li><a class='cell' onclick='pageBacktrain();'>&lt;</a></li>";        
	      	   content+="<li class='cell' id='1' value='' onclick='pageindextrain(this)' ><span>"+1+"</span></li>";
	       content+="<li><a class='cell' onclick='pageBreaktrain();'>&gt;</a></li>"+
	       "</ul>"+
	     "</div>"+
	   "</div>"+
	 "</div>"+
	 "</div>"+
	"</section>"+
	"<div>"+	
"</div>";      
	 let bbbb = document.getElementById('aa');        
	 bbbb.innerHTML = content; 
	 let pageindexs =document.getElementById("1");
	 pageindexs.className="active";

	 bb() 
		} else{
			console.log("not product")
//	  	 imgs ="<img src='${pageContext.request.contextPath}/images/404/404.png'>";
		let bbbb = document.getElementById('aa');
		  couhorcon.style.display = "none";
	      bbbb.innerHTML = "<div align= 'center'><font  color='red'>未購買任何車票</font><div>"; 
	  
	   } 
} 

//移除飯店
function hotelRemove(id){
	
	swal({
		  title: "確定要移除此飯店嗎?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  var xhr = new XMLHttpRequest();
				xhr.open("POST", "<c:url value='/shoppingProductRemove.controller' />", true);
			 	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
				xhr.send("id="+id);
				xhr.onreadystatechange = function(){
				
			        if(xhr.readyState==4&&xhr.status==200){
			        	
			        	
			        	
			        	window.location.assign("http://localhost:8080/shoppingcart/car");
			  
			          }		  
			  
			        }
			    
		       } 
		});
}

//移除套裝行程
function trivelRemove(id){
	swal({
		  title: "確定要移除套裝行程?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  var xhr = new XMLHttpRequest();
				xhr.open("POST", "<c:url value='/travel/remove' />", true);
			 	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
				xhr.send("id="+id);
				xhr.onreadystatechange = function(){
				
			        if(xhr.readyState==4&&xhr.status==200){
			        	pd="${pd}";
			        	console.log("aaa")
			        	
			        	window.location.assign("http://localhost:8080/shoppingcart/car");
			  
			          }		  
			  
			        }
			    
		       } 
		});
	
}
//移除火車套票
function trainRemove(id){
	swal({
		  title: "確定要移除火車套票?",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  var xhr = new XMLHttpRequest();
				xhr.open("POST", "<c:url value='/train/remove' />", true);
			 	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
				xhr.send("id="+id);
				xhr.onreadystatechange = function(){
				
			        if(xhr.readyState==4&&xhr.status==200){
			        	pd="${pd}";
			        	
			        	
			        	window.location.assign("http://localhost:8080/shoppingcart/car");
			  
			          }		  
			  
			        }
			    
		       } 
		});
	
}





</script>

<style type="text/css">
     
   .float-nav-outer {
    height :55px;
   background-color: rgb(230, 230, 230);
    overflow: hidden;
}

.float-nav > li {
 text-align: center;
    float: left;
    position: relative;
    right: 50%; /* left: -50% 也有同樣效果 */
}







.float-nav {
    
    float: left;
    left: 50%;
    position: relative;
}
.backcolor{

/*   background-color: #FBFBFF; */
z-index: -1; /* 讓線條置於圓圈後 */
background-color: #F0F0F0
}


.backfootcolor{
  color:#FFFFFF;
  background-color:#ECECFF;


}
.top{
    
    position:relative;
   



}

</style>





</head>
<jsp:include page="../webnav.jsp" flush="true" ></jsp:include>

  <body> 


<nav  class="float-nav-outer">
    <ul class="float-nav">
        <li><a style='font-size:30px;text-align: center;' href="#" onclick="hotels();">飯店&nbsp&nbsp&nbsp</a></li>
        <li><a style='font-size:30px' href="#" onclick="train();">火車&nbsp&nbsp&nbsp</a></li>
        <li><a style='font-size:30px' href="#" onclick="travel();">套裝行程</a></li>    
    </ul>
</nav>






<div class='backcolor' >

<div id='couhorcon' class="activeCouHorCon"  align="center" style='display:none'>
	<ul class="activeCouHorPro" >
		<li class="active" >購物車</li>
		<li >收件人資訊</li>
		<li>付款</li>
	</ul>
</div>
<div class='icons' style='border-radius:20px; z-index:1000'>
	<table >
	      <tr>
	  
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
                          
                         <li class="nav-item" ><svg class="bk-icon -iconset-spa hp__facility_group_icon cell" onclick='atHome()' fill="#333333" height="24" width="24" viewBox="0 0 128 128" role="presentation" aria-hidden="true" focusable="false"><path d="M64.7 12.3a.8.8 0 0 0-1 0C57 18 38.4 37.8 59.2 59c.3.3 1.5 1.2 1.7-.3a.6.6 0 0 1 0-.1l3.2-21 3.2 20.8v.3c.3 1.3 1.2.7 1.6.4 21-21.1 2.5-40.8-4.2-46.8zM120 51.8v-.1a.8.8 0 0 0-.3-1C111.9 46.4 87 35.3 74.2 62c-.1.4-.6 1.8.9 1.5l20.8-4-18.4 10-.3.1c-1.2.7-.2 1.4.2 1.6C104.1 84 116.5 60 119.9 51.7zm-111.8.1a.8.8 0 0 1 .3-1c7.7-4.4 32.5-15.4 45.4 11.4.1.3.6 1.7-.9 1.5l-20.9-4 18.5 10h.2c1.2.7.3 1.4-.1 1.7C23.9 84.3 11.5 60.3 8 51.9zm94.5 64a.8.8 0 0 0 .8-.7c.8-8.8.7-36-28.9-36.9-.4 0-1.8.2-1 1.4l12.1 17.5-16.5-12.8-.2-.2c-1.2-.8-1.4.3-1.5.8-.7 29.7 26.2 31.3 35.2 31zm-77.1 0h-.1a.8.8 0 0 1-.8-.7c-.7-8.8-.7-36 29-36.9.3 0 1.8.2 1 1.4L42.3 97.3 59 84.4l.2-.2c1.1-.8 1.4.3 1.4.8.7 29.7-26.2 31.3-35.1 31z"></path></svg></li>
                        
                    </ul>
                </td>
          
          </tr>
          
          
	</table>
</div>

<div id='aa' class='top' >

<input type="hidden" id="buybtn">

</div>
</div>


<section class="ftco-intro ftco-section ftco-no-pt">
 <div class="container">
    <div class="row justify-content-center">
       <div class="col-md-12 text-center">
          <div class="img" >
             <div class="overlay"></div>
             <h2>顧客須知</h2>
             <p style='color:white'>您所購買的火車票與套裝行程無法退貨,購買前請先確認</p>
<!--              <p class="mb-0"><a href="#" class="btn btn-primary px-4 py-3">Ask For A Quote</a></p> -->
         </div>
     </div>
 </div>
</div>
</section>




<script type="text/javascript">

// //計算購物車商品數量
// var xhr = new XMLHttpRequest();
// xhr.open("GET", "<c:url value='/shoppingcarMain.controller' />", true);
// //	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
// xhr.send();

// xhr.onreadystatechange = function(){
// 	var cart =document.getElementById("cart");
// 	var cars =JSON.parse(xhr.responseText)
// 	console.log(cars)
// 	cart.innerHTML=cars.room_id.length+cars.train.length+cars.travel.length;
//   }




</script>

<%@ include file="/WEB-INF/pages/trainandhotel/footer.jsp"%>

<!-- loader -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

</body>
<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importBody.jsp"%>
</html>