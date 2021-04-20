function pageindex(index){
	
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
"<a href='#' class='img' style='background-image: url("+productcar[i][j].hotel_id.picBase64+");' >"+
  "<span class='price'>$"+productcar[i][j].hotel_id.price+"/person</span>"+
"</a>"+
"<div class='text p-4'>"+

  "<h3><a href='#'>"+productcar[i][j].hotel_id.hotel.name+"</a></h3>"+
  "<span class='days'>入住日期:"+productcar[i][j].starday+"</span><br\>"+
  "<span class='days'>退房日期:"+productcar[i][j].endday+"</span>"+
  "<ul>"+
     "<li><span class='flaticon-king-size'></span>"+productcar[i][j].hotel_id.name+"</li>"+
" </ul>"+
"<p><a href='"+temp+productcar[i][j].id+"/"+"car"+"' class='btn btn-primary' style='float: right'>取消</a></p>"+
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
	   
    "<div class='row mt-5'>"+
    "<div class='col text-center'>"+
    "<div class='block-27'>"+
      "<ul>";
     
     	 content+="<li><a href='#' onclick='pageBack();'>&lt;</a></li>";
        for(let i=1;i<=length;i++){
        	
     	   content+="<li class='' id='"+i+"' value='"+i+"' onclick='pageindex(this)' ><span>"+i+"</span></li>";
        }
        content+="<li><a href='#' onclick='pageBreak();'>&gt;</a></li>"+
      "</ul>"+
    "</div>"+
  "</div>"+
"</div>"+
"</div>"+
"</section>";

let bbbb = document.getElementById('products');        
bbbb.innerHTML = content; 


let pageindexs =document.getElementById(index.id);

pageindexs.className="active";



bb() 
	}
function pageBreak(){
	console.log("kjkjkjkjkjkjk")
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
	   console.log
	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 
for(let i=count;i<count+1;i++){       	  
for(let j=0;j<productcar[i].length;j++){

	content+=
	   "<div class='col-md-4 ftco-animate'>"+
	   "<div class='project-wrap'>"+
"<a href='#' class='img' style='background-image: url("+productcar[i][j].hotel_id.picBase64+");' >"+
  "<span class='price'>$"+productcar[i][j].hotel_id.price+"/person</span>"+
"</a>"+
"<div class='text p-4'>"+

  "<h3><a href='#'>"+productcar[i][j].hotel_id.hotel.name+"</a></h3>"+
  "<span class='days'>入住日期:"+productcar[i][j].starday+"</span><br\>"+
  "<span class='days'>退房日期:"+productcar[i][j].endday+"</span>"+
  "<ul>"+
     "<li><span class='flaticon-king-size'></span>"+productcar[i][j].hotel_id.name+"</li>"+
" </ul>"+
"<p><a href='"+temp+productcar[i][j].id+"/"+"car"+"' class='btn btn-primary' style='float: right'>取消</a></p>"+
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
	   
    "<div class='row mt-5'>"+
    "<div class='col text-center'>"+
    "<div class='block-27'>"+
    "<ul>";
    
   	 content+="<li><a href='#' onclick='pageBk();'>&lt;</a></li>";
        for(let i=1;i<=length;i++){
        	
     	   content+="<li class='' id='"+i+"' value='"+i+"' onclick='pageindex(this)' ><span>"+i+"</span></li>";
        }
        content+="<li><a href='#' onclick='pageB();'>&gt;</a></li>"+
      "</ul>"+
    "</div>"+
  "</div>"+
"</div>"+
"</div>"+
"</section>";

let bbbb = document.getElementById('products');        
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
	 
	console.log("jjjjjjjjjjjjjjjj="+count)	 
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
"<a href='#' class='img' style='background-image: url("+productcar[i][j].hotel_id.picBase64+");' >"+
  "<span class='price'>$"+productcar[i][j].hotel_id.price+"/person</span>"+
"</a>"+
"<div class='text p-4'>"+

  "<h3><a href='#'>"+productcar[i][j].hotel_id.hotel.name+"</a></h3>"+
  "<span class='days'>入住日期:"+productcar[i][j].starday+"</span><br\>"+
  "<span class='days'>退房日期:"+productcar[i][j].endday+"</span>"+
  "<ul>"+
     "<li><span class='flaticon-king-size'></span>"+productcar[i][j].hotel_id.name+"</li>"+
" </ul>"+
"<p><a href='"+temp+productcar[i][j].id+"/"+"car"+"' class='btn btn-primary' style='float: right'>取消</a></p>"+
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
	   
    "<div class='row mt-5'>"+
    "<div class='col text-center'>"+
    "<div class='block-27'>"+
    "<ul>";
   
   	 content+="<li><a href='#' onclick='pageBK();'>&lt;</a></li>";
        for(let i=1;i<=length;i++){
        	
     	   content+="<li class='' id='"+i+"' value='"+i+"' onclick='pageindex(this)' ><span>"+i+"</span></li>";
        }
        content+="<li><a href='#' onclick='pageB();'>&gt;</a></li>"+
      "</ul>"+
    "</div>"+
  "</div>"+
"</div>"+
"</div>"+
"</section>";

let bbbb = document.getElementById('products');        
bbbb.innerHTML = content; 


let pageindexs =document.getElementById(count+1);

pageindexs.className="active";



bb() 
	 
	
	
}




function productcarts(){
	var cars = product[context];
	productcar=cars.shoppingcar_id.room_id;
	

	
	 let content="<section class='ftco-section'>"+
	   "<div id='shoppingcart' class='container'>"+	
	   "<div id='firstsss' class='row'>";
	   console.log(cars)
	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 
	 count=0;
	 index=1
 for(let i=count;i<cars.shoppingcar_id.room_id.length;i++){       	  

	
	content+=
	   "<div class='col-md-4 ftco-animate'>"+
	   "<div class='project-wrap'>"+
"<a href='#' class='img' style='background-image: url("+cars.shoppingcar_id.room_id[i].hotel_id.picBase64+");' >"+
   "<span class='price'>$"+cars.shoppingcar_id.room_id[i].hotel_id.price+"/person</span>"+
"</a>"+
"<div class='text p-4'>"+
 
   "<h3><a href='#'>"+cars.shoppingcar_id.room_id[i].hotel_id.hotel.name+"</a></h3>"+
   "<span class='days'>入住日期:"+cars.shoppingcar_id.room_id[i].starday+"</span><br\>"+
   "<span class='days'>退房日期:"+cars.shoppingcar_id.room_id[i].endday+"</span>"+
   "<ul>"+
      "<li><span class='flaticon-king-size'></span>"+cars.shoppingcar_id.room_id[i].hotel_id.name+"</li>"+
 " </ul>"+
 "<p><a href='"+temp+cars.shoppingcar_id.room_id[i].id+"/"+"car"+"' class='btn btn-primary' style='float: right'>取消</a></p>"+
"</div>"+
" </div>"+
"</div>";

if(ex==0){
	 var starday=cars.shoppingcar_id.room_id[i].starday
	  starday = starday.substring(8,10);
	  
	  var endday=cars.shoppingcar_id.room_id[i].endday
	  endday = endday.substring(8,10);
	  
	  var iDays =endday-starday
			   console.log(iDays) 
	  sum +=(cars.shoppingcar_id.room_id[i].hotel_id.price*iDays); 
	 
}
 


}      
 content+="</div>"+
	   "</div>"+
	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
	   
     "<div class='row mt-5'>"+
     "<div class='col text-center'>"+
     "<div class='block-27'>"+
       "<ul>";
      
      	 content+="<li><a href='#' onclick='only();'>&lt;</a></li>";
        
      	   content+="<li class='' id='1' value='' onclick='pageindex(this)' ><span>"+1+"</span></li>";
         
      
       content+="<li><a href='#' onclick='only();'>&gt;</a></li>"+
       "</ul>"+
     "</div>"+
   "</div>"+
 "</div>"+
 "</div>"+
"</section>";

	let bbbb = document.getElementById('products');        
	 bbbb.innerHTML = content; 
	 let pageindexs =document.getElementById("1");
	 pageindexs.className="active";

 

 bb() 
	 ex++;
}
function only(){
	
	productcarts();
	
}