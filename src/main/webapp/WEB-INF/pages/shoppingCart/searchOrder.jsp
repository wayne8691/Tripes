<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importHead.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>SearchOrder</title>

<style>
.cell {
	cursor: pointer;
}

.div {
	width: 800px;
	height: 0px;
	/* border: solid 1px black ; */
	transition-property: all;
	transition-duration: 0.5s;
	margin-top: 0px;
	padding: 0px;
	vertical-align: top;
	margin: auto;
}

.float-nav-outer {
	height: 55px;
	background-color: rgb(230, 230, 230);
	overflow: hidden;
}

.float-nav>li {
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

.backcolor {
	/*   background-color: #FBFBFF; */
	z-index: -1; /* 讓線條置於圓圈後 */
	background-color: #F0F0F0
}

.backfootcolor {
	color: #FFFFFF;
	background-color: #ECECFF;
}


</style>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
var product;
var ex=0
var sum=0;
var productcar =new Array()
var length;
var order1;
var cars;
var sw=0;
window.onload =function(){
	//計算購物車商品數量
	var xhr1 = new XMLHttpRequest();
	xhr1.open("GET", "<c:url value='/shoppingcarMain.controller' />", true);
// 	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xhr1.send();	
	xhr1.onreadystatechange = function(){
		var cartcs =document.getElementById("cart");
		var carsc =JSON.parse(xhr1.responseText)
		console.log(cars)
		cartcs.innerHTML=carsc.room_id.length+carsc.train.length+carsc.travel.length;
	  }
	
var xhr = new XMLHttpRequest();
xhr.open("GET", "<c:url value='/shoppingOrderSearch.contrller' />", true);
xhr.send();
xhr.onreadystatechange =function(){
	
	if(xhr.readyState==4&&xhr.status==200){
		
		order1=JSON.parse(xhr.responseText);
		cars=order1;
 		console.log(order1)
 		
 		
 			
 			
 			 if(order1.length>10){
 	        	  
 	        	  
 	        	if(order1.length%10==0){
 	        		 length =(order1.length/10);
 	        		}else{
 	        			 length =(order1.length/10)+1;
 	        		}
 	        	
 	        	console.log("length:"+order1.length)
 	        	 productcomtent =order1.length%10;
 	        
 	        	 count =0;
 	        	
 	        	 for(let i=0;i<length-1;i++){
 	        		
 	        		
 	        		productcar[i] =new Array();       	    		 
 	        		 if(i<length&&productcomtent==0){
 	        			 console.log(length)
 	        			 for(let j=0;j<10;j++ ){

 	        				productcar[i][j] =order1[count]
 	        					

 	                       count++; 
 	                    	 console.log("a:"+count)
 	                     }
 	        		 }else if(i<length-2){
 	        			 
 	        			 for(let j=0;j<10;j++ ){
// 	         				 console.log("aaaaaaaaa:"+i)
 	                    	 productcar[i][j] =order1[count]
 	                       count++; 
 	                    	 console.log("b:"+count)
 	                     }   		 
 	        		 }else{        			 
 	        			 for(let k=0;k<productcomtent;k++ ){
 	                    	 productcar[i][k] =order1[count]   
 	                    	 
 	                    	 console.log("c:"+count)
 	                    	count++;
 	                     }      			 
 	        		 }
 	              } 
 			
 			

		   var content = "<table class='' align='center'>";
		   content += "<thead>"+
			"<tr>"+
				"<th></th>"+
				"<th>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 訂單查詢</th>"+
				"<th class='text-center'>會員</th>"+
				"<th class='text-center'>付款金額</th>"+
				"<th class='text-center'>購買日期</th>"+
				"<th class='text-center'>收貨人資訊</th>"+
			"</tr>";
			
			 product=productcar;
// 			 console.log(product)
// 			   console.log(orderProducts.length)
             count=0;
             console.log(productcar)
			for(var i=count; i <productcar.length; i++){
				for(j=0;j<productcar[i].length;j++){
				
			   console.log("consi="+i)
			   orderProducts1 = "<c:url value='/shoppingProductView.controller/' />"; 
			   order = "<c:url value='/shoppingProductView.controller/' />";   
				    content += 	"</thead><tbody>"+
					"<tr align='center'>"+
						"<td class='product-thumb'>"+
						 
						"<td class='product'>"+
						"<span class='add-id'> &nbsp; &nbsp; &nbsp;<strong></strong></span>"+
						"<input type='hidden' id='orders' value='"+i+"'>"+

						"<a  href='#' class='cell' type='"+j+"' rel='"+i+"' onclick='serachProduct(this);'  >"+productcar[i][j].id+"</a>"+	
// 							"<span ><button style='border: none;' onclick='' >"+orderProducts[i].order_id+"</button></span>"+
							
						"</td>"+
						"<td class='product-category'><span class='categories'>" + productcar[i][j].member_id +"</span></td>"+						
						"<td class='product-category'><span class='categories'>" + productcar[i][j].sumPrice +"</span></td>"+
						"<td class='product-category'><span class='categories'>" + productcar[i][j].date +"</span></td>"+	
							
						"<td class='action' data-title='Action'>"+
						
				           
				            
							"<div class=''>"+
								"<ul class='list-inline justify-content-center'>"+
								"<li >"+
								
								"</li>"+
								"<li class='list-inline-item'>"+
									"<a data-toggle='tooltip' data-placement='top' title='Edit' class='edit cell' rel='"+i+"' onclick='information2(this,"+j+");' >"+							
										"<i class='fa fa-pencil'></i>"+
									"</a>"+
								"</li>"+
								"<li>"+
									
								"</li>"+
							"</ul>"+
							"</div>";
						
				    content +="</tr>";
				    content+= "<tr><td colspan='6'><ul  class='inful div' id='infs"+i+"a"+j+"'  style='list-style:none'>"+
			           "</ul><td><td></td><td></td><td></td><td>  </td></tr>";
			   }
			}

		   content += "</tbody ></table>";
		   
		   
		   content+="<div class='row mt-5'>"+
           "<div class='col text-center'>"+
           "<div class='block-27'>"+
             "<ul>";
            
            	 content+="<li><a class='cell' onclick='orderBack();'>&lt;</a></li>";
          
               for(let i=1;i<=length;i++){
            	   content+="<li class='cell' id='"+i+"' value='"+i+"' onclick='orderPage(this);' ><span>"+i+"</span></li>";
               }
            
             content+="<li><a class='cell' onclick='orderNext();'>&gt;</a></li>"+
             "</ul>"+
           "</div>"+
         "</div>"+
       "</div>";
		   
		   
		   var divs = document.getElementById("products");
			divs.innerHTML = content;

		  }else{
			  orderpr();

			  }
		  
			
		}
	
     
}




}


function orderpr(){
	console.log(order1.length)
	if(order1.length!=0){
		  
		   var content = "<table class='' align='center'>";
		   content += "<thead>"+
			"<tr>"+
				"<th></th>"+
				"<th>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 訂單查詢</th>"+
				"<th class='text-center'>會員</th>"+
				"<th class='text-center'>付款金額</th>"+
				"<th class='text-center'>購買日期</th>"+
				"<th class='text-center'>收貨人資訊</th>"+
			"</tr>";
			 var orderProducts =order1;
			 product=orderProducts;
			 console.log(product)
//			   console.log(orderProducts.length)
			for(var i=0; i <orderProducts.length; i++){
			   console.log(i)
			   orderProducts1 = "<c:url value='/shoppingProductView.controller/' />"; 
			   order = "<c:url value='/shoppingProductView.controller/' />";   
				    content += 	"</thead><tbody>"+
					"<tr align='center'>"+
						"<td class='product-thumb'>"+
						 
						"<td class='product'>"+
						"<span class='add-id'> &nbsp; &nbsp; &nbsp;<strong></strong></span>"+
						"<input type='hidden' id='orders' value='"+i+"'>"+

						"<a  href='#' class='cell'  rel='"+i+"' onclick='serachProduct(this);'  >商品詳細</a>"+	
//							"<span ><button style='border: none;' onclick='' >"+orderProducts[i].order_id+"</button></span>"+
							
						"</td>"+
						"<td class='product-category'><span class='categories'>" + orderProducts[i].member_id +"</span></td>"+						
						"<td class='product-category'><span class='categories'>" + orderProducts[i].sumPrice +"</span></td>"+
						"<td class='product-category'><span class='categories'>" + orderProducts[i].date +"</span></td>"+	
							
						"<td class='action' data-title='Action'>"+
							"<div class=''>"+
								"<ul class='list-inline justify-content-center'>"+
								"<li >"+
								
								"</li>"+
								"<li class='list-inline-item'>"+
									"<a data-toggle='tooltip' data-placement='top' title='Edit' class='edit cell' rel='"+i+"' onclick='information(this);' >"+							
										"<i class='fa fa-pencil'></i>"+
									"</a>"+
								"</li>"+
								"<li>"+
									
								"</li>"+
							"</ul>"+
							"</div>";
						
				    content +="</tr>";
				    content+= "<tr><td colspan='6'><ul  class='inful div' id='infs"+i+"'  style='list-style:none'>"+
			           "</ul><td><td></td><td></td><td></td><td>  </td></tr>";	
			}

		   content += "</tbody ></table>";
		   
		   content+="<div class='row mt-5'>"+
           "<div class='col text-center'>"+
           "<div class='block-27'>"+
             "<ul>";
            
            	 content+="<li><a class='cell' onclick='pageBack();'>&lt;</a></li>";
          
              
            	   content+="<li class='cell'  onclick='' ><span>1</span></li>";
              
            
             content+="<li><a class='cell' onclick='pageBreak();'>&gt;</a></li>"+
             "</ul>"+
           "</div>"+
         "</div>"+
       "</div>";
		   
		   
		   
		   
		   
		   
		   
		   var divs = document.getElementById("products");
			divs.innerHTML = content;

		  }else{
			  var divs = document.getElementById("products");
			  divs.innerHTML = "<div align= 'center'><font  color='red'>很抱歉您沒在此購物的紀錄</font><div>"; 

			  }
	
	
	
}





var boo=true

var orders=null;
function information(orderNumber){
	var orderindex =orderNumber.rel;
	var infss = document.getElementById('infs'+orderindex);
	

	if(orders==null){
		orders=infss;
		 boo=true
		}else{
			console.log(order)
			if(orders.id!=infss.id){
				orders.style.border ='solid 0px black';
			 
			        while (orders.firstChild) {
			        	orders.removeChild(orders.firstChild);
			        	
			     }
			        orders.style.height =0+'px';
			        orders=infss;
			        boo=true
			       
				}else{
					
					 
					
					if(!orders.firstChild){
						 boo=true
						 
						}else{
							 boo=false
							 

							}		
				}

		}

       
if(boo){
  
   
	infss.style.height =150+'px';
	infss.style.width =800+'px';
	infss.style.border ='solid 1px black';
//     console.log("ssssssssssssssssss="+product[orderindex].paymenttype_id.name)
    var h3 = document.createElement('h3');
    h3.textContent = '收貨人資料' 

    var str = document.createElement('li');
     str = document.createElement('li');
    str.textContent = '姓名:'+product[orderindex].paymenttype_id.name
    str.setAttribute('class','inf');

    var str2 = document.createElement('li');
    str2.textContent = '電話:'+product[orderindex].paymenttype_id.phone
    str2.setAttribute('class','inf');
    
    var str3 = document.createElement('li');  
    str3.textContent = '地址:'+product[orderindex].paymenttype_id.address
    str3.setAttribute('class','inf');
    
    var str4 = document.createElement('li');
    str4.textContent = 'Email:'+product[orderindex].paymenttype_id.mail
    str4.setAttribute('class','inf');
    var str5 = document.createElement('li');
    str5.textContent = '寄送方式:'+product[orderindex].paymenttype_id.payment_type
    str5.setAttribute('class','inf');
   var array =[h3,str,str2,str3,str4,str5];
for(var i=0;i<array.length;i++){


document.querySelector('#infs'+orderindex).appendChild(array[i]);

}

// for(var i=0;i<product.length;i++){
// 	if()
// 	 var infs = document.getElementById('infs'+orderindex);
// 	    infs.style.border ='solid 0px black';
// 	    var element = document.querySelector(".inful");
// 	        while (element.firstChild) {
// 	          element.removeChild(element.firstChild);
// 	     }
// 	     infs.style.height =0+'px';
// }
}else{
	
    
    console.log('aa')
    var infs = document.getElementById('infs'+orderindex);
    infs.style.border ='solid 0px black';
  
        while (infs.firstChild) {
        	infs.removeChild(infs.firstChild);
     }
     infs.style.height =0+'px';
    
}

}





function information2(orderNumber,index2){
	var orderindex =orderNumber.rel;  
	var infss = document.getElementById('infs'+orderindex+"a"+index2);
	
     console.log(infss.id)
	if(orders==null){
		orders=infss;
		 boo=true
		}else{
			console.log(order)
			if(orders.id!=infss.id){
				orders.style.border ='solid 0px black';
			 
			        while (orders.firstChild) {
			        	orders.removeChild(orders.firstChild);
			        	
			     }
			        orders.style.height =0+'px';
			        orders=infss;
			        boo=true
			       
				}else{
					
					 
					
					if(!orders.firstChild){
						 boo=true
						 
						}else{
							 boo=false
							 

							}		
				}

		}

       
if(boo){
  
   
	infss.style.height =150+'px';
	infss.style.width =800+'px';
	infss.style.border ='solid 1px black';
//     console.log("ssssssssssssssssss="+product[orderindex].paymenttype_id.name)
    var h3 = document.createElement('h3');
    h3.textContent = '收貨人資料' 

    var str = document.createElement('li');
     str = document.createElement('li');
    str.textContent = '姓名:'+product[orderindex][index2].paymenttype_id.name
    str.setAttribute('class','inf');

    var str2 = document.createElement('li');
    str2.textContent = '電話:'+product[orderindex][index2].paymenttype_id.phone
    str2.setAttribute('class','inf');
    
    var str3 = document.createElement('li');  
    str3.textContent = '地址:'+product[orderindex][index2].paymenttype_id.address
    str3.setAttribute('class','inf');
    
    var str4 = document.createElement('li');
    str4.textContent = 'Email:'+product[orderindex][index2].paymenttype_id.mail
    str4.setAttribute('class','inf');
    var str5 = document.createElement('li');
    str5.textContent = '寄送方式:'+product[orderindex][index2].paymenttype_id.payment_type
    str5.setAttribute('class','inf');
   var array =[h3,str,str2,str3,str4,str5];
for(var i=0;i<array.length;i++){


document.querySelector('#infs'+orderindex+"a"+index2).appendChild(array[i]);

}

// for(var i=0;i<product.length;i++){
// 	if()
// 	 var infs = document.getElementById('infs'+orderindex);
// 	    infs.style.border ='solid 0px black';
// 	    var element = document.querySelector(".inful");
// 	        while (element.firstChild) {
// 	          element.removeChild(element.firstChild);
// 	     }
// 	     infs.style.height =0+'px';
// }
}else{
	
    
    console.log('aa')
    var infs = document.getElementById('infs'+orderindex+"a"+index2);
    infs.style.border ='solid 0px black';
  
        while (infs.firstChild) {
        	infs.removeChild(infs.firstChild);
     }
     infs.style.height =0+'px';
    
}

}








//訂單分頁
function orderPage(index){

	count=index.id-1;
console.log("nsdfff"+index.id)
	var ind=index.id;
	var content = "<table class='' align='center'>";
	   content += "<thead>"+
		"<tr>"+
			"<th></th>"+
			"<th>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 訂單查詢</th>"+
			"<th class='text-center'>會員</th>"+
			"<th class='text-center'>付款金額</th>"+
			"<th class='text-center'>購買日期</th>"+
			"<th class='text-center'>收貨人資訊</th>"+
		"</tr>";
		
		 product=productcar;
//		 console.log(product)
//		   console.log(orderProducts.length)
      
      console.log(productcar)
		for(var i=count; i <ind; i++){
			for(j=0;j<productcar[i].length;j++){
			
		   console.log("consi="+i)
		   orderProducts1 = "<c:url value='/shoppingProductView.controller/' />"; 
		   order = "<c:url value='/shoppingProductView.controller/' />";   
			    content += 	"</thead><tbody>"+
				"<tr align='center'>"+
					"<td class='product-thumb'>"+
					 
					"<td class='product'>"+
					"<span class='add-id'> &nbsp; &nbsp; &nbsp;<strong></strong></span>"+
					"<input type='hidden' id='orders' value='"+i+"'>"+

					"<a  href='#' class='cell' type='"+j+"' rel='"+i+"' onclick='serachProduct(this);'  >商品詳細</a>"+	
//						"<span ><button style='border: none;' onclick='' >"+orderProducts[i].order_id+"</button></span>"+
						
					"</td>"+
					"<td class='product-category'><span class='categories'>" + productcar[i][j].member_id +"</span></td>"+						
					"<td class='product-category'><span class='categories'>" + productcar[i][j].sumPrice +"</span></td>"+
					"<td class='product-category'><span class='categories'>" + productcar[i][j].date +"</span></td>"+	
						
					"<td class='action' data-title='Action'>"+
					
			           
			            
						"<div class=''>"+
							"<ul class='list-inline justify-content-center'>"+
							"<li >"+
							
							"</li>"+
							"<li class='list-inline-item'>"+
							"<a data-toggle='tooltip' data-placement='top' title='Edit' class='edit cell' rel='"+i+"' onclick='information2(this,"+j+");' >"+							
									"<i class='fa fa-pencil'></i>"+
								"</a>"+
							"</li>"+
							"<li>"+
								
							"</li>"+
						"</ul>"+
						"</div>";
					
			    content +="</tr>";
			    content+= "<tr><td colspan='6'><ul  class='inful div' id='infs"+i+"a"+j+"'  style='list-style:none'>"+
		           "</ul><td><td></td><td></td><td></td><td>  </td></tr>";
		   }
		}

	   content += "</tbody ></table>";
	   
	   
	   content+="<div class='row mt-5'>"+
    "<div class='col text-center'>"+
    "<div class='block-27'>"+
      "<ul>";
     
     	 content+="<li><a class='cell' onclick='orderBack();'>&lt;</a></li>";
   
        for(let i=1;i<=length;i++){
     	   content+="<li class='cell' id='"+i+"' value='"+i+"' onclick='orderPage(this);' ><span>"+i+"</span></li>";
        }
     
      content+="<li><a class='cell' onclick='orderNext();'>&gt;</a></li>"+
      "</ul>"+
    "</div>"+
  "</div>"+
"</div>";
	   
	   
	   var divs = document.getElementById("products");
		divs.innerHTML = content;
} 




//訂單下一頁
function orderNext(){
     if(count<productcar.length){
    	 
    	 count++;
     }
	var content = "<table class='' align='center'>";
	   content += "<thead>"+
		"<tr>"+
			"<th></th>"+
			"<th>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 訂單查詢</th>"+
			"<th class='text-center'>會員</th>"+
			"<th class='text-center'>付款金額</th>"+
			"<th class='text-center'>購買日期</th>"+
			"<th class='text-center'>收貨人資訊</th>"+
		"</tr>";
		
		 product=productcar;
//		 console.log(product)
//		   console.log(orderProducts.length)
      
      console.log(productcar)
		for(var i=count; i <count+1; i++){
			for(j=0;j<productcar[i].length;j++){
			
		   console.log("consi="+i)
		   orderProducts1 = "<c:url value='/shoppingProductView.controller/' />"; 
		   order = "<c:url value='/shoppingProductView.controller/' />";   
			    content += 	"</thead><tbody>"+
				"<tr align='center'>"+
					"<td class='product-thumb'>"+
					 
					"<td class='product'>"+
					"<span class='add-id'> &nbsp; &nbsp; &nbsp;<strong></strong></span>"+
					"<input type='hidden' id='orders' value='"+i+"'>"+

					"<a  href='#' class='cell' type='"+j+"' rel='"+i+"' onclick='serachProduct(this);'  >"+productcar[i][j].id+"</a>"+	
//						"<span ><button style='border: none;' onclick='' >"+orderProducts[i].order_id+"</button></span>"+
						
					"</td>"+
					"<td class='product-category'><span class='categories'>" + productcar[i][j].member_id +"</span></td>"+						
					"<td class='product-category'><span class='categories'>" + productcar[i][j].sumPrice +"</span></td>"+
					"<td class='product-category'><span class='categories'>" + productcar[i][j].date +"</span></td>"+	
						
					"<td class='action' data-title='Action'>"+
					
			           
			            
						"<div class=''>"+
							"<ul class='list-inline justify-content-center'>"+
							"<li >"+
							
							"</li>"+
							"<li class='list-inline-item'>"+
							"<a data-toggle='tooltip' data-placement='top' title='Edit' class='edit cell' rel='"+i+"' onclick='information2(this,"+j+");' >"+					
									"<i class='fa fa-pencil'></i>"+
								"</a>"+
							"</li>"+
							"<li>"+
								
							"</li>"+
						"</ul>"+
						"</div>";
					
			    content +="</tr>";
			    content+= "<tr><td colspan='6'><ul  class='inful div' id='infs"+i+"a"+j+"'  style='list-style:none'>"+
		           "</ul><td><td></td><td></td><td></td><td>  </td></tr>";
		   }
		}

	   content += "</tbody ></table>";
	   
	   
	   content+="<div class='row mt-5'>"+
    "<div class='col text-center'>"+
    "<div class='block-27'>"+
      "<ul>";
     
     	 content+="<li><a class='cell' onclick='orderBack();'>&lt;</a></li>";
   
        for(let i=1;i<=length;i++){
     	   content+="<li class='cell' id='"+i+"' value='"+i+"' onclick='orderPage(this);' ><span>"+i+"</span></li>";
        }
     
      content+="<li><a class='cell' onclick='orderNext();'>&gt;</a></li>"+
      "</ul>"+
    "</div>"+
  "</div>"+
"</div>";
	   
	   
	   var divs = document.getElementById("products");
		divs.innerHTML = content;
} 




//訂單前一頁
function orderBack(){
     if(count>=0){
    	 
    	 count--;
     }
	
	var content = "<table class='' align='center'>";
	   content += "<thead>"+
		"<tr>"+
			"<th></th>"+
			"<th>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 訂單查詢</th>"+
			"<th class='text-center'>會員</th>"+
			"<th class='text-center'>付款金額</th>"+
			"<th class='text-center'>購買日期</th>"+
			"<th class='text-center'>收貨人資訊</th>"+
		"</tr>";
		
		 product=productcar;
//		 console.log(product)
//		   console.log(orderProducts.length)
      
      console.log(productcar)
		for(var i=count; i <count+1; i++){
			for(j=0;j<productcar[i].length;j++){
			
		   console.log("consi="+i)
		   orderProducts1 = "<c:url value='/shoppingProductView.controller/' />"; 
		   order = "<c:url value='/shoppingProductView.controller/' />";   
			    content += 	"</thead><tbody>"+
				"<tr align='center'>"+
					"<td class='product-thumb'>"+
					 
					"<td class='product'>"+
					"<span class='add-id'> &nbsp; &nbsp; &nbsp;<strong></strong></span>"+
					"<input type='hidden' id='orders' value='"+i+"'>"+

					"<a  href='#' class='cell' type='"+j+"'  rel='"+i+"' onclick='serachProduct(this);'  >商品詳細</a>"+	
//						"<span ><button style='border: none;' onclick='' >"+orderProducts[i].order_id+"</button></span>"+
						
					"</td>"+
					"<td class='product-category'><span class='categories'>" + productcar[i][j].member_id +"</span></td>"+						
					"<td class='product-category'><span class='categories'>" + productcar[i][j].sumPrice +"</span></td>"+
					"<td class='product-category'><span class='categories'>" + productcar[i][j].date +"</span></td>"+	
						
					"<td class='action' data-title='Action'>"+
					
			           
			            
						"<div class=''>"+
							"<ul class='list-inline justify-content-center'>"+
							"<li >"+
							
							"</li>"+
							"<li class='list-inline-item'>"+
							"<a data-toggle='tooltip' data-placement='top' title='Edit' class='edit cell' rel='"+i+"' onclick='information2(this,"+j+");' >"+					
									"<i class='fa fa-pencil'></i>"+
								"</a>"+
							"</li>"+
							"<li>"+
								
							"</li>"+
						"</ul>"+
						"</div>";
					
			    content +="</tr>";
			    content+= "<tr><td colspan='6'><ul  class='inful div' id='infs"+i+"a"+j+"'  style='list-style:none'>"+
		           "</ul><td><td></td><td></td><td></td><td>  </td></tr>";
		   }
		}

	   content += "</tbody ></table>";
	   
	   
	   content+="<div class='row mt-5'>"+
    "<div class='col text-center'>"+
    "<div class='block-27'>"+
      "<ul>";
     
     	 content+="<li><a class='cell' onclick='orderBack();'>&lt;</a></li>";
   
        for(let i=1;i<=length;i++){
     	   content+="<li class='cell' id='"+i+"' value='"+i+"' onclick='orderPage(this);' ><span>"+i+"</span></li>";
        }
     
      content+="<li><a class='cell' onclick='orderNext();'>&gt;</a></li>"+
      "</ul>"+
    "</div>"+
  "</div>"+
"</div>";
	   
	   
	   var divs = document.getElementById("products");
		divs.innerHTML = content;
} 



//收尋飯店
function serachProduct(orderproducts){
	
	 if(sw==0){
	swal({
			 
		  icon: "warning",
		  title: "注意",
		  text:"1.您所訂購的飯店退訂申請後還是無法退訂將無法再次退訂\n2.您所訂購套裝行程與車票將無法退貨,祝您旅途愉快!" ,
		 
		  button: {
			    text: "確定",
			  },
		});	 
	
	 }
	
	
	sw++;
	
	
	var i =orderproducts.rel;
	
	context =i;
	contens =orderproducts.type;
	 
     if(order1.length>10){
    	 console.log("aaaaaaaaaaaaaaaaassssssssssss")
     
	    cars = product[context][contens].shoppingcar_id; 
    	 sum=cars.price;
     }else{
    	 cars = product[context].shoppingcar_id
    	 console.log(cars)
    	 sum=cars.price;
     }
      
    	 if(cars.room_id.length>6){
       	  
       	  
         	if(cars.room_id.length%6==0){
         		 length =(cars.room_id.length/6);
         		}else{
         			 length =(cars.room_id.length/6)+1;
         		}
         	
         	console.log("length:"+cars.room_id.length)
         	 productcomtent =cars.room_id.length%6;
          console.log("sdadasdddddddddddddddddd="+productcomtent)
         	 count =0;
         	
         	 for(let i=0;i<length-1;i++){
         		
         		
         		 productcar[i] =new Array();       	    		 
         		 if(i<length&&productcomtent==0){
         			 console.log(length)
         			 for(let j=0;j<6;j++ ){
//          				 console.log("aaaaaaaaa:"+i)
                     	 productcar[i][j] =cars.room_id[count]
         					
//                      	 console.log("count:"+cars.shoppingcar_id.room_id[count].id)
                        count++; 
                     	
                      }
         		 }else if(i<length-2){
         			 
         			 for(let j=0;j<6;j++ ){
          				  console.log("count:"+cars.room_id[count].id)
                     	 productcar[i][j] =cars.room_id[count]
                        count++; 
                     	 console.log("count:"+count)
                      }   		 
         		 }else{        			 
         			 for(let k=0;k<productcomtent;k++ ){
//          				 console.log("ssssssss"+i)
//          				 console.log("kkkkkk"+k)

                        

                     	 productcar[i][k] =cars.room_id[count] 
                         count++;
//          				  console.log("sssssss"+productcar[i][k].id)
                      }      			 
         		 }
               } 
    	 
    	 
    	 
    	 
    	 
    	 
    	 
    	 
    	 
    	 
    	 
    	 
    	 
    	
    		
    	
    		
    	   
//     	console.log("test:"+productcar[1][0].hotel_id.hotel.name)
//     	let cars =JSON.parse(xhr.responseText)
        navs(context)
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
    	content+=
     	   "<div class='col-md-4 ftco-animate'>"+
     	   "<div class='project-wrap'>"+
   "<a href='#' class='img' style='background-image: url("+productcar[i][j].hotel_id.pic+");' >"+
         "<span class='price'>$"+(productcar[i][j].hotel_id.price*productcar[i][j].sumday)*productcar[i][j].quantity+"/person</span>"+
    "</a>"+
     "<div class='text p-4'>"+
       
         "<h3><a href='#'>"+productcar[i][j].hotel_id.hotel.name+"</a></h3>"+
         "<span class='days'>入住日期:"+productcar[i][j].starday+"</span><br\>"+
         "<span class='days'>退房日期:"+productcar[i][j].endday+"</span>"+
         "<ul>"+
            "<li><span class='flaticon-king-size'></span>"+productcar[i][j].hotel_id.name+"</li>"+
       " </ul>";
       
       if(productcar[i][j].checkout==1&&productcar[i][j].roomout==0){
    	   content+="<p><a class='btn 'rel='"+productcar[i][j].id+"' style='float: right; background:#8E8E8E;color: white'  disabled>退房申請中....</a></p>"; 
       }else if(productcar[i][j].checkout==1&&productcar[i][j].roomout==1){
    	   content+="<p><a class='btn 'rel='"+productcar[i][j].id+"' style='float: right; background:#8E8E8E;color: white'  disabled>此房間無法退房</a></p>"; 
       }else{
    	   content+="<p><a class='btn btn-primary'rel='"+productcar[i][j].id+"' style='float: right' onclick='hotelout(this);'>申請退房</a></p>"; 
       }
    
       content+="</div>"+
    	   "</div>"+
    	   "</div>";
 	   var starday=productcar[i][j].starday
 	   starday = starday.substring(8,10);
 	   
 	   var endday=productcar[i][j].endday
 	   endday = endday.substring(8,10);
 	   
 	   var iDays =endday-starday
 			   console.log(iDays) 
 	   sum +=(productcar[i][j].hotel_id.price*iDays); 
 	  
    }

  }      
       content+="</div>"+
    	   "</div>"+
    	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+	   
    	   "<a href='' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: left' onclick='reset();'>回到訂單</a>"+
           "<div class='row mt-5'>"+
           "<div class='col text-center'>"+
           "<div class='block-27'>"+
             "<ul>";
            
            	 content+="<li><a href='#' onclick='pageBack();'>&lt;</a></li>";
          
               for(let i=1;i<=length;i++){
            	   content+="<li class='' id='"+i+"' value='"+i+"' onclick='pageindex(this);' ><span>"+i+"</span></li>";
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
       let pageindexs =document.getElementById("1");

       pageindexs.className="active";
     
       bb() 
       
    }else{
    		
    		productcarts();
         }
    	 
    	 
    	 
    
    	 
    	 
    	 
    	 
}





//收尋飯店
function serachProductAfter(orderproducts){
	
	   
	    
    	 if(cars.room_id.length>6){
       	  
       	  
         	if(cars.room_id.length%6==0){
         		 length =(cars.room_id.length/6);
         		}else{
         			 length =(cars.room_id.length/6)+1;
         		}
         	
         	console.log("length:"+cars.room_id.length)
         	 productcomtent =cars.room_id.length%6;
          console.log("sdadasdddddddddddddddddd="+productcomtent)
         	 count =0;
         	
         	 for(let i=0;i<length-1;i++){
         		
         		
         		 productcar[i] =new Array();       	    		 
         		 if(i<length&&productcomtent==0){
         			 console.log(length)
         			 for(let j=0;j<6;j++ ){
//          				 console.log("aaaaaaaaa:"+i)
                     	 productcar[i][j] =cars.room_id[count]
         					
//                      	 console.log("count:"+cars.shoppingcar_id.room_id[count].id)
                        count++; 
                     	
                      }
         		 }else if(i<length-2){
         			 
         			 for(let j=0;j<6;j++ ){
          				  console.log("count:"+cars.room_id[count].id)
                     	 productcar[i][j] =cars.room_id[count]
                        count++; 
                     	 console.log("count:"+count)
                      }   		 
         		 }else{        			 
         			 for(let k=0;k<productcomtent;k++ ){
//          				 console.log("ssssssss"+i)
//          				 console.log("kkkkkk"+k)

                        

                     	 productcar[i][k] =cars.room_id[count] 
                         count++;
//          				  console.log("sssssss"+productcar[i][k].id)
                      }      			 
         		 }
               } 
    	 
    	 
    	 
    	 
    	 
    	 
    	 
    	 
    	 
    	 
    	 
    	 
    	 
    	
    		
    	 console.log("sdsdsdsdsdsdsdsd:"+productcar[1][0].id)
    		
    	   
//     	console.log("test:"+productcar[1][0].hotel_id.hotel.name)
//     	let cars =JSON.parse(xhr.responseText)
        navs(context)
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
    	content+=
     	   "<div class='col-md-4 ftco-animate'>"+
     	   "<div class='project-wrap'>"+
   "<a href='#' class='img' style='background-image: url("+productcar[i][j].hotel_id.pic+");' >"+
         "<span class='price'>$"+(productcar[i][j].hotel_id.price*productcar[i][j].sumday)*productcar[i][j].quantity+"/person</span>"+
    "</a>"+
     "<div class='text p-4'>"+
       
         "<h3><a href='#'>"+productcar[i][j].hotel_id.hotel.name+"</a></h3>"+
         "<span class='days'>入住日期:"+productcar[i][j].starday+"</span><br\>"+
         "<span class='days'>退房日期:"+productcar[i][j].endday+"</span>"+
         "<ul>"+
            "<li><span class='flaticon-king-size'></span>"+productcar[i][j].hotel_id.name+"</li>"+
       " </ul>";
       
       if(productcar[i][j].checkout==1&&productcar[i][j].roomout==0){
    	   content+="<p><a class='btn 'rel='"+productcar[i][j].id+"' style='float: right; background:#8E8E8E;color: white'  disabled>退房申請中....</a></p>"; 
       }else if(productcar[i][j].checkout==1&&productcar[i][j].roomout==1){
    	   content+="<p><a class='btn 'rel='"+productcar[i][j].id+"' style='float: right; background:#8E8E8E;color: white'  disabled>此房間無法退房</a></p>"; 
       }else{
    	   content+="<p><a class='btn btn-primary'rel='"+productcar[i][j].id+"' style='float: right' onclick='hotelout(this);'>申請退房</a></p>"; 
       }
    
       content+="</div>"+
    	   "</div>"+
    	   
    	   "</div>";
 	   var starday=productcar[i][j].starday
 	   starday = starday.substring(8,10);
 	   
 	   var endday=productcar[i][j].endday
 	   endday = endday.substring(8,10);
 	   
 	   var iDays =endday-starday
 			   console.log(iDays) 
 	   sum +=(productcar[i][j].hotel_id.price*iDays); 
 	  
    }

  }      
       content+="</div>"+
    	   "</div>"+
    	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
    	   "<a href='' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: left' onclick='reset();'>回訂單列表</a>"+
           "<div class='row mt-5'>"+
           "<div class='col text-center'>"+
           "<div class='block-27'>"+
             "<ul>";
            
            	 content+="<li><a href='#' onclick='pageBack();'>&lt;</a></li>";
          
               for(let i=1;i<=length;i++){
            	   content+="<li class='' id='"+i+"' value='"+i+"' onclick='pageindex(this);' ><span>"+i+"</span></li>";
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
       let pageindexs =document.getElementById("1");

       pageindexs.className="active";
     
       bb() 
       
    }else{
    		
    		productcarts();
         }
    	 
    	 
    	 
    	 
    	 
    	 
    	 
    	 
}









function navs(i){
	
	
	var contr ="<nav class='float-nav-outer'><ul class='float-nav'>"+
    		"<li><a style='font-size:30px;text-align: center;' href='#' onclick='serachProductAfter("+context+");'>飯店&nbsp&nbsp&nbsp</a></li>"+
    		"<li><a style='font-size:30px' href='#' onclick='train();'>火車&nbsp&nbsp&nbsp</a></li>"+
    		"<li><a style='font-size:30px' href='#' onclick='travel();'>套裝行程</a></li>"+
			"</ul></nav>";
	
	  var navs = document.querySelector("#nv");
	   
	navs.innerHTML=contr;
	
	
	
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

function serachReceiving(){
	
	console.log(product);
	 var orderNumber = document.getElementById("orders").value;
	console.log(orderNumber)

	var content = "<section class='ad-post bg-gray py-5'>";
	content+="<div class='container'>"+
        "<fieldset class='border border-gary p-4 mb-5'>"+
                "<div class='row'>"+
                    "<div class='col-lg-12'>"+
                        "<h3>收貨人資料</h3>"+
                    "</div>"+
                    "<div class='col-lg-6'>"+
                        "<h6 class='font-weight-bold pt-4 pb-1'>寄送方式:</h6>"+
                        "<div class='row px-3'>"+
                            "<div class='col-lg-4 mr-lg-4 my-2 rounded bg-white'>"+
                                "<input type='radio' name='PaymentType' value='personal' id='personal'  disabled >"+
                                "<label for='personal' class='py-2'>貨到付款</label>"+
                            "</div>"+
                            "<div class='col-lg-4 mr-lg-4 my-2 rounded bg-white '>"+
                                "<input type='radio' name='PaymentType' value='business' id='business'  disabled >"+
                                "<label for='business' class='py-2'>ATM轉帳</label>"+
                           " </div>"+
                        "</div>"+
                      "</div>"+
                    "<div class='col-lg-6'>"+
                    " 姓名:"+
                    "<input type='text' class='border w-100 p-2 bg-white text-capitalize' value='"+product[orderNumber].paymentType_id.name+"' readonly='readonly'>"+
                        "<h6 class='font-weight-bold pt-4 pb-1'>電話:</h6>"+
                        "<input type='text' class='border w-100 p-2 bg-white text-capitalize'  value='"+product[orderNumber].paymentType_id.phone+"'  readonly='readonly'>"+
                        "<h6 class='font-weight-bold pt-4 pb-1'>信箱:</h6>"+
                        "<input type='text' class='border w-100 p-2 bg-white text-capitalize'  value='"+product[orderNumber].paymentType_id.mail+"'  readonly='readonly'>"+
                        "<h6 class='font-weight-bold pt-4 pb-1'>地址:</h6>"+
                        "<input type='text' class='border w-100 p-2 bg-white text-capitalize'  value='"+product[orderNumber].paymentType_id.address+"' readonly='readonly' >"+            
                      "</div>"+
               " </div>"+
        "</fieldset>"+
"</section>";
		
		
		

	 var divs = document.getElementById("products");
	 divs.innerHTML = content;
	 console.log()
	 if(product[orderNumber].paymentType_id.payment_type=="ATM轉帳") {

			$("#personal").prop('checked', true);//radio默认选中
			}else{
				$("#business").prop('checked', true);//radio默认选中
				}
}



function hotelout(id){
     
	var pk=id.rel;
// 	console.log("aaaa"+id);
	var message="";
	(async () => {

		const { value: text } = await Swal.fire({
		  input: 'textarea',
		  inputLabel: '請問是否要退訂房間',
		  inputPlaceholder: '退房原因',
		  inputAttributes: {
		    'aria-label': 'Type your message here'
		  },
// 		  showCancelButton: true
		})

		if (text) {
	      	var xhr = new XMLHttpRequest();
	        xhr.open("POST", "<c:url value='/checkourhotel' />", true);
	    	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	        xhr.send("id="+pk+"&message="+text);
	        xhr.onreadystatechange =function(){
	        	
	        	if(xhr.readyState==4&&xhr.status==200){
	        		
	        		window.location.assign("http://localhost:8080/ShoppingOrder.controller");
	        	}
	        	
	        	
	    }
	
	      
	      
	      
	      
		  Swal.fire("處理中")
		}

		})()
	
	
	
	
	
	
}







function pageindex(index){
	navs(context)
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
for(let i=count;i<ind;i++){       	  
for(let j=0;j<productcar[i].length;j++){

	content+=
	   "<div class='col-md-4 ftco-animate'>"+
	   "<div class='project-wrap'>"+
"<a href='#' class='img' style='background-image: url("+productcar[i][j].hotel_id.pic+");' >"+
  "<span class='price'>$"+(productcar[i][j].hotel_id.price*productcar[i][j].sumday)*productcar[i][j].quantity+"/person</span>"+
"</a>"+
"<div class='text p-4'>"+

  "<h3><a href='#'>"+productcar[i][j].hotel_id.hotel.name+"</a></h3>"+
  "<span class='days'>入住日期:"+productcar[i][j].starday+"</span><br\>"+
  "<span class='days'>退房日期:"+productcar[i][j].endday+"</span>"+
  "<ul>"+
     "<li><span class='flaticon-king-size'></span>"+productcar[i][j].hotel_id.name+"</li>"+
     " </ul>";
     
     if(productcar[i][j].checkout==1&&productcar[i][j].roomout==0){
  	   content+="<p><a class='btn 'rel='"+productcar[i][j].id+"' style='float: right; background:#8E8E8E;color: white'  disabled>退房申請中....</a></p>"; 
     }else if(productcar[i][j].checkout==1&&productcar[i][j].roomout==1){
  	   content+="<p><a class='btn 'rel='"+productcar[i][j].id+"' style='float: right; background:#8E8E8E;color: white'  disabled>此房間無法退房</a></p>"; 
     }else{
  	   content+="<p><a class='btn btn-primary'rel='"+productcar[i][j].id+"' style='float: right' onclick='hotelout(this);'>申請退房</a></p>"; 
     }
  
     content+="</div>"+
" </div>"+
"</div>";


  }
}      
content+="</div>"+
	   "</div>"+
	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
	   "<a href='' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: left' onclick='reset();'>回到訂單</a>"+
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
"<a href='#' class='img' style='background-image: url("+productcar[i][j].hotel_id.pic+");' >"+
  "<span class='price'>$"+(productcar[i][j].hotel_id.price*productcar[i][j].sumday)*productcar[i][j].quantity+"/person</span>"+
"</a>"+
"<div class='text p-4'>"+

  "<h3><a href='#'>"+productcar[i][j].hotel_id.hotel.name+"</a></h3>"+
  "<span class='days'>入住日期:"+productcar[i][j].starday+"</span><br\>"+
  "<span class='days'>退房日期:"+productcar[i][j].endday+"</span>"+
  "<ul>"+
     "<li><span class='flaticon-king-size'></span>"+productcar[i][j].hotel_id.name+"</li>"+
     " </ul>";
     
     if(productcar[i][j].checkout==1&&productcar[i][j].roomout==0){
    	   content+="<p><a class='btn 'rel='"+productcar[i][j].id+"' style='float: right; background:#8E8E8E;color: white'  disabled>退房申請中....</a></p>"; 
       }else if(productcar[i][j].checkout==1&&productcar[i][j].roomout==1){
    	   content+="<p><a class='btn 'rel='"+productcar[i][j].id+"' style='float: right; background:#8E8E8E;color: white'  disabled>此房間無法退房</a></p>"; 
       }else{
    	   content+="<p><a class='btn btn-primary'rel='"+productcar[i][j].id+"' style='float: right' onclick='hotelout(this);'>申請退房</a></p>"; 
       }
  
     content+="</div>"+
" </div>"+
"</div>";


  }

}      
content+="</div>"+
	   "</div>"+
	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
	   "<a href='' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: left' onclick='reset();'>回到訂單</a>"+
    "<div class='row mt-5'>"+
    "<div class='col text-center'>"+
    "<div class='block-27'>"+
    "<ul>";
    
   	 content+="<li><a href='#' onclick='pageBack();'>&lt;</a></li>";
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
	navs(context)
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
"<a href='#' class='img' style='background-image: url("+productcar[i][j].hotel_id.pic+");' >"+
  "<span class='price'>$"+(productcar[i][j].hotel_id.price*productcar[i][j].sumday)*productcar[i][j].quantity+"/person</span>"+
"</a>"+
"<div class='text p-4'>"+

  "<h3><a href='#'>"+productcar[i][j].hotel_id.hotel.name+"</a></h3>"+
  "<span class='days'>入住日期:"+productcar[i][j].starday+"</span><br\>"+
  "<span class='days'>退房日期:"+productcar[i][j].endday+"</span>"+
  "<ul>"+
     "<li><span class='flaticon-king-size'></span>"+productcar[i][j].hotel_id.name+"</li>"+
 " </ul>";
     
    if(productcar[i][j].checkout==1&&productcar[i][j].roomout==0){
	   content+="<p><a class='btn 'rel='"+productcar[i][j].id+"' style='float: right; background:#8E8E8E;color: white'  disabled>退房申請中....</a></p>"; 
   }else if(productcar[i][j].checkout==1&&productcar[i][j].roomout==1){
	   content+="<p><a class='btn 'rel='"+productcar[i][j].id+"' style='float: right; background:#8E8E8E;color: white'  disabled>此房間無法退房</a></p>"; 
   }else{
	   content+="<p><a class='btn btn-primary'rel='"+productcar[i][j].id+"' style='float: right' onclick='hotelout(this);'>申請退房</a></p>"; 
   }
  
     content+="</div>"+
" </div>"+
"</div>";


  }

}      
content+="</div>"+
	   "</div>"+
	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
	   "<a href='' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: left' onclick='reset();'>回到訂單</a>"+
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

function reset(){
	
	
	setTimeout('myrefresh()');
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
	navs(context)
	
     
	if(cars.room_id.length!=0){
		
	
	 let content="<section class='ftco-section'>"+
	   "<div id='shoppingcart' class='container'>"+	
	   "<div id='firstsss' class='row'>";
	   console.log(cars)
	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 
	 count=0;
	 index=1
 for(let i=count;i<cars.room_id.length;i++){       	  

	content+=
	   "<div class='col-md-4 ftco-animate'>"+
	   "<div class='project-wrap'>"+
"<a href='#' class='img' style='background-image: url("+cars.room_id[i].hotel_id.pic+");' >"+
   "<span class='price'>$"+(cars.room_id[i].hotel_id.price*cars.room_id[i].sumday)*cars.room_id[i].quantity+"/person</span>"+
"</a>"+
"<div class='text p-4'>"+
 
   "<h3><a href='#'>"+cars.room_id[i].hotel_id.hotel.name+"</a></h3>"+
   "<span class='days'>入住日期:"+cars.room_id[i].starday+"</span><br\>"+
   "<span class='days'>退房日期:"+cars.room_id[i].endday+"</span>"+
   "<ul>"+
      "<li><span class='flaticon-king-size'></span>"+cars.room_id[i].hotel_id.name+"</li>"+
      " </ul>";
      
      if(cars.room_id[i].checkout==1&&cars.room_id[i].roomout==0){
   	   content+="<p><a class='btn 'rel='"+cars.room_id[i].id+"' style='float: right; background:#8E8E8E;color: white'  disabled>退房申請中....</a></p>"; 
      }else if(cars.room_id[i].checkout==1&&cars.room_id[i].roomout==1){
   	   content+="<p><a class='btn 'rel='"+cars.room_id[i].id+"' style='float: right; background:#8E8E8E;color: white'  disabled>此房間無法退房</a></p>"; 
      }else{
   	   content+="<p><a class='btn btn-primary'rel='"+cars.room_id[i].id+"' style='float: right' onclick='hotelout(this);'>申請退房</a></p>"; 
      }
   
      content+="</div>"+
" </div>"+
"</div>";

if(ex==0){
	


}


}      
 content+="</div>"+
	   "</div>"+
	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
	   "<a href='' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: left' onclick='reset();'>回到訂單</a>"+
     "<div class='row mt-5'>"+
     "<div class='col text-center'>"+
     "<div class='block-27'>"+
       "<ul>";  
      	 content+="<li><a href='#' onclick='only();'>&lt;</a></li>";
        
      	   content+="<li class='' id='1' value='' onclick='' ><span>"+1+"</span></li>";
         
      
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
 
	}else{
		let bbbb = document.getElementById('products');
	    console.log("500")
	    bbbb.innerHTML = "<div align= 'center'><font  color='red'>未訂任何飯店</font><div>"; 
	}
}
function only(){
	
	productcarts();
	
}


function only(){
	
	productcarts();
	
}










function travel(){
	navs(context)
	
	if(cars.travel.length>6){
		
     	  
     	if(cars.travel.length%6==0){
     		 length =(cars.travel.length/6);
     		}else{
     			 length =(cars.travellength/6)+1;
     		}
     	
     	console.log("length:"+cars.travellength)
     	 productcomtent =cars.travellength%6;
     
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
   	     "<a href='#' class='img' style='background-image: url("+cars.travel[i].travelGroup.image+");'   >"+
            "<span class='price'>$"+productcarT[i][j].travelGroup.price+"/person</span>"+
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
           
            "</div>"+
            " </div>"+
          "</div>";


	  
  }

}      
     content+="</div>"+
  	   "</div>"+
  	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
  	   "<a href='' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: left' onclick='reset();'>回到訂單</a>"+
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
     let bbbb = document.getElementById('products');        
     bbbb.innerHTML = content; 
     let pageindexs =document.getElementById("1");

     pageindexs.className="active";

     bb() 
     	 

      }else{
	
	     travelP();
	
	
	
      }

	
	
}






function pageindextravel(index){
	navs(context)
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
	   "<a href='#' class='img' style='background-image: url("+cars.travel[i].travelGroup.image+");'   >"+
  "<span class='price'>$"+productcarT[i][j].travelGroup.price+"/person</span>"+
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

"</div>"+
" </div>"+
"</div>";


  }
}      
content+="</div>"+
	   "</div>"+
	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
	   "<a href='' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: left' onclick='reset();'>回到訂單</a>"+
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

let bbbb = document.getElementById('products');        
bbbb.innerHTML = content; 


let pageindexs =document.getElementById(index.id);

pageindexs.className="active";


bb() 
	}
function pageBreaktravel(){
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
	   
	 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
	 var buy = "<c:url value='/shoppingBuy.controller/' />"; 
for(let i=count;i<count+1;i++){       	  
for(let j=0;j<productcarT[i].length;j++){

	content+=
	   "<div class='col-md-4 ftco-animate'>"+
	   "<div class='project-wrap'>"+
	   "<a href='#' class='img' style='background-image: url("+cars.travel[i].travelGroup.image+");'   >"+
  "<span class='price'>$"+productcarT[i][j].travelGroup.price+"/person</span>"+
"</a>"+
"<div class='text p-4'>"+

  "<h3><a href='#'>"+productcarT[i][j].travelGroup.name+"</a></h3>"+
  "<span class='days'>入住日期:"+productcarT[i][j].travelGroup.destination+"</span><br\>"+
  "<span class='days'>退房日期:"+productcarT[i][j].travelGroup.origin+"</span>"+
  "<ul>"+
     "<li><span class='flaticon-sun-umbrella'></span>"+productcarT[i][j].travelGroup.day+"天</li>"+
" </ul>"+

"</div>"+
" </div>"+
"</div>";


  }

}      
content+="</div>"+
	   "</div>"+
	   "<div align= 'right'  ><font style=' font-size:2em'  color='red' >總價:"+sum+"元</font><div>"+
	   "<a href='"+buy+cars.number_id+"' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: right'>前往結帳</a>"+
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

let bbbb = document.getElementById('products');        
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
	navs(context)
    console.log(count)
	if(count>0){
	   count--;
	}
	 
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
"<a href='#' class='img'  >"+
  "<span class='price'>$"+productcarT[i][j].travelGroup.price+"/person</span>"+
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

"</div>"+
" </div>"+
"</div>";


  }

}      
content+="</div>"+
	   "</div>"+
	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
	   "<a href='' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: left' onclick='reset();'>回到訂單</a>"+
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

let bbbb = document.getElementById('products');        
bbbb.innerHTML = content; 


let pageindexs =document.getElementById(count+1);

pageindexs.className="active";


bb() 
	 
	
	
}











// function ()















function travelP(){
	navs(context)
	if(cars.travel.length!=0){
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
	   "<span class='price'>$"+cars.travel[i].travelGroup.price+"/person</span>"+
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

	"</div>"+
	" </div>"+
	"</div>";

	 


	}      
	 content+="</div>"+
		   "</div>"+
		   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
		   "<a href='"+buy+cars.number_id+"' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: right'>前往結帳</a>"+
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
	 let bbbb = document.getElementById('products');        
	 bbbb.innerHTML = content; 
	 let pageindexs =document.getElementById("1");
	console.log("vvvvvvvvvvvvvvvvvvvvv")
	 pageindexs.className="active";

	 bb() 
		} else{
//	  	 imgs ="<img src='${pageContext.request.contextPath}/images/404/404.png'>";
		let bbbb = document.getElementById('products');
	     console.log("500")
	      bbbb.innerHTML = "<div align= 'center'><font  color='red'>未購買任何套裝行程</font><div>"; 
	  
	   } 
	
	
	
} 


















var productcarT =new Array();     


function train(){
	navs(context)
	if(cars.train.length>6){
     	  
     	  
     	if(cars.train.length%6==0){
     		 length =(cars.shoppingcar_id.train.length/6);
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
   	 "<a href='#' class='img' style='background-image: url(../images/tr.png);'	>"+
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

  "</div>"+
" </div>"+
"</div>";


	  
  }

}      
     content+="</div>"+
  	   "</div>"+
  	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
  	   "<a href='' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: left' onclick='reset();'>回到訂單</a>"+
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
     let bbbb = document.getElementById('products');        
     bbbb.innerHTML = content; 
     let pageindexs =document.getElementById("1");

     pageindexs.className="active";

     bb() 
     	 
     	 
     	 
     	 
     	 
     	 
     	 
     	 
	
	
      }else{
	
    	  travelT();
	
	
	
      }

	
	
}






function pageindextrain(index){
	navs(context)
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

"</div>"+
" </div>"+
"</div>";


  }
}      
content+="</div>"+
	   "</div>"+
	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
	   "<a href='' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: left' onclick='reset();'>回到訂單</a>"+
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

let bbbb = document.getElementById('products');        
bbbb.innerHTML = content; 


let pageindexs =document.getElementById(index.id);

pageindexs.className="active";


bb() 
	}
	
	
	
	
	
function pageBreaktrain(){
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
  "<span class='price'>$"+productcarT[i][j].train.quantity+"/person</span>"+
"</a>"+
"<div class='text p-4'>"+

"<h3><a href='#'>火車套票</a></h3>"+
"<span class='days'>起點:"+productcarT[i][j].train.start+"</span><br\>"+
"<span class='days'>終點:"+productcarT[i][j].train.dest+"</span>"+
"<ul>"+
   "<li><span class='flaticon-mountains'></span>票數:"+productcarT[i][j].qutity+"張</li>"+
" </ul>"+

"</div>"+
" </div>"+
"</div>";


  }

}      
content+="</div>"+
	   "</div>"+
	   "<div align= 'right'  ><font style=' font-size:2em'  color='red' >總價:"+sum+"元</font><div>"+
	   "<a href='' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: left' onclick='reset();'>回到訂單</a>"+
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

let bbbb = document.getElementById('products');        
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
	navs(context)
	if(count>0){
	   count--;
	}
	 
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

"</div>"+
" </div>"+
"</div>";


  }

}      
content+="</div>"+
	   "</div>"+
	   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
	   "<a href='' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: left' onclick='reset();'>回到訂單</a>"+
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

let bbbb = document.getElementById('products');        
bbbb.innerHTML = content; 


let pageindexs =document.getElementById(count+1);

pageindexs.className="active";

bb() 
	 
	
	
}











function travelT(){
	navs(context)
	if(cars.train.length!=0){
		 let content="<section class='ftco-section'>"+
		 
		 "<section class='ftco-section'>"+
		   "<div id='shoppingcart' class='container'>"+	
		   
		   "<div id='firstsss' class='row'>";
		   
		 var temp ="<c:url value='/shoppingProductRemove.controller/' />";
		 var buy = "<c:url value='/shoppingBuy.controller/' />"; 
		 count=0;
		 index=1
	 for(let i=count;i<cars.train.length;i++){       	  

		
		content+=
		   "<div class='col-md-4 ftco-animate'>"+
		   "<div class='project-wrap'>"+
		   "<a href='#' class='img' style='background-image: url(../images/tr.png);'   >"+
		   "<span id='person' style='position:absolute;color:black; font-weight:500; font-size:40px; top:25%;left:47%;transform: translate(-40%, -75%); x-index:1000;'>"+cars.train[i].train.start+"</span>"+
		 "<span id='person' style='position:absolute;color:black; font-weight:500; font-size:40px; top:70%;left:47%;transform: translate(-40%, -60%); x-index:1000;'>"+cars.train[i].train.dest+"</span>"+
	   "<span class='price'>$"+cars.train[i].train.price+"/person</span>"+
	"</a>"+
	"<div class='text p-4'>"+
	 
	 "<h3><a href='#'>火車套票</a></h3>"+
     "<span class='days'>起點:"+cars.train[i].train.start+"</span><br\>"+
     "<span class='days'>終點:"+cars.train[i].train.dest+"</span>"+
     "<ul>"+
        "<li><span class='flaticon-mountains'></span>票數:"+cars.train[i].qutity+"張</li>"+
	 " </ul>"+
	"</div>"+
	" </div>"+
	"</div>";

	 


	}      
	 content+="</div>"+
		   "</div>"+
		   "<div align= 'right'  ><font style=' font-size:2em'  color='red'>總價:"+sum+"元</font><div>"+
		   "<a href='' id='buybtn' class='btn buybtn d-block mt-2' style='color: white; background-color: #2828FF; float: left'>回訂單列表</a>"+
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
	 let bbbb = document.getElementById('products');        
	 bbbb.innerHTML = content; 
	 let pageindexs =document.getElementById("1");
	console.log("vvvvvvvvvvvvvvvvvvvvv")
	 pageindexs.className="active";
	 bb() 
		} else{
			console.log("not product")
//	  	 imgs ="<img src='${pageContext.request.contextPath}/images/404/404.png'>";
		let bbbb = document.getElementById('products');
	     console.log("500")
	      bbbb.innerHTML = "<div align= 'center'><font  color='red'>未購買任何車票</font><div>"; 
	  
	   } 
	
	
	
} 





























</script>
<style type="text/css">
</style>
</head>

<jsp:include page="../webnav.jsp" flush="true"></jsp:include>

<body>
<div class='icons' style='border-radius:20px; z-index:1000'>
	<table >
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
                          
                         <li class="nav-item" ><svg class="bk-icon -iconset-spa hp__facility_group_icon cell" onclick='atHome()' fill="#333333" height="24" width="24" viewBox="0 0 128 128" role="presentation" aria-hidden="true" focusable="false"><path d="M64.7 12.3a.8.8 0 0 0-1 0C57 18 38.4 37.8 59.2 59c.3.3 1.5 1.2 1.7-.3a.6.6 0 0 1 0-.1l3.2-21 3.2 20.8v.3c.3 1.3 1.2.7 1.6.4 21-21.1 2.5-40.8-4.2-46.8zM120 51.8v-.1a.8.8 0 0 0-.3-1C111.9 46.4 87 35.3 74.2 62c-.1.4-.6 1.8.9 1.5l20.8-4-18.4 10-.3.1c-1.2.7-.2 1.4.2 1.6C104.1 84 116.5 60 119.9 51.7zm-111.8.1a.8.8 0 0 1 .3-1c7.7-4.4 32.5-15.4 45.4 11.4.1.3.6 1.7-.9 1.5l-20.9-4 18.5 10h.2c1.2.7.3 1.4-.1 1.7C23.9 84.3 11.5 60.3 8 51.9zm94.5 64a.8.8 0 0 0 .8-.7c.8-8.8.7-36-28.9-36.9-.4 0-1.8.2-1 1.4l12.1 17.5-16.5-12.8-.2-.2c-1.2-.8-1.4.3-1.5.8-.7 29.7 26.2 31.3 35.2 31zm-77.1 0h-.1a.8.8 0 0 1-.8-.7c-.7-8.8-.7-36 29-36.9.3 0 1.8.2 1 1.4L42.3 97.3 59 84.4l.2-.2c1.1-.8 1.4.3 1.4.8.7 29.7-26.2 31.3-35.1 31z"></path></svg></li>
                        
                    </ul>
                </td>
          
          </tr>
          
          
	</table>
</div>
<div class='backs()'>
	<div id='nv'></div>







	<div class="widget dashboard-container my-adslist background">
		<div id="products"></div>
	</div>

	<!-- pagination -->
	<div class="pagination justify-content-center">
		<nav aria-label="Page navigation example">
			<!-- 			<ul class="pagination"> -->
			<!-- 				<li class="page-item"><a class="page-link" href="#" -->
			<!-- 					aria-label="Previous"> <span aria-hidden="true">&laquo;</span> -->
			<!-- 						<span class="sr-only">Previous</span> -->
			<!-- 				</a></li> -->
			<!-- 				<li class="page-item"><a class="page-link" href="#">1</a></li> -->

			<!-- 				<li class="page-item"><a class="page-link" href="#" -->
			<!-- 					aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span -->
			<!-- 						class="sr-only">Next</span> -->
			<!-- 				</a></li> -->
			<!-- 			</ul> -->
		</nav>

	</div>
	<%@ include file="/WEB-INF/pages/trainandhotel/footer.jsp"%>
	<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importBody.jsp"%>
	</div>
	
	
	<script type="text/javascript">
	
	
	
	
	
	
	



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