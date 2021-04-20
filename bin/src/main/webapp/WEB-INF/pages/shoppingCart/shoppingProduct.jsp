<%@page import="com.iii.trip.shoppingcart.model.TravelRollsProduct"%>
<%@page import="com.iii.trip.shoppingcart.model.ProductShopping"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>


<link href="${pageContext.request.contextPath}/shoppingcarstyle/css/progressbar.css" rel="stylesheet">
<style>
.product{
    width: 200px;
	height: 300px;
	font-size: 30px;


}
select{ 
    width:100px; 
    align='center';
    
} 
* { 
padding: 0; 
} 

</style>



<meta charset="UTF-8">
<title>Shopping Product</title>
<script>

var pk = ${id};
window.onload = function() {
	
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "<c:url value='/shoppingProducts' />", true);
	xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	xhr.send('pk='+pk);


	xhr.onreadystatechange = function(){

        if(xhr.readyState==4&&xhr.status==200){
        	
//         	console.log(xhr.responseText)
             
        	var products = JSON.parse(xhr.responseText);	
        	query=products.quantity;		
           var content = "<table align='center'>"
        	   content+="<tbody><tr>"+
                                   "<td >"+
           									"<img width='500px' height='500px' src='./../images/products/products-1.jpg' alt='image description'></td>"+					
           								"<td >"+
           									"<h1>"+products.hotel_id.hotel.name+"</h3>"+
           									"<span class='product'><strong>地區:</strong>"+products.hotel_id.city.name+"</span><br/>"+
           									"<p/>"+
           									"<span class='product'><strong>地址: </strong><time>"+products.hotel_id.hotel.address+"</time> </span><br/>"+
           									"<p/>"+
           									"<span class='product'><strong>入住日期</strong>"+products.starDay+"</span><br/>"+
           									"<p/>"+
           									"<span class='product'><strong>退房日期</strong>"+products.endDay+"</span><br/>"+
           									"<p/>"+
           									"<span class='product'><strong>房間數量</strong><select id='query'  >"+
           									"<option class='productselect'>"+products.quantity+"</option>";
           								for (var i = 1; i < 9; i++) {
           								 content+="<option value="+i+">"+i+"</option>";
										}	
           								
           								content+="</select></span><br/>"+
           									"<span class='product'><strong></strong><button onclick='updatrProduct();'>更改</button>"+
           									"  <button onclick='deleteProduct();' >取消房間</button></span><br/>"+
           								"</td>"+      						      
           							"</tr>"+
          "</tbody>"+
          "</table>";
				
          console.log(query)
          var product =document.getElementById("product");
           product.innerHTML= content;
            }
      }


	  
}

function updatrProduct(){
	
// 	tmp = "<c:url value='/shoppingProductsUpdate.controller/' />";
	var query =document.getElementById("query").value;
// 	 document.getElementById("x").setAttribute("href",tmp+pk+"/"+query);
//  	  console.log(query);
	var xhr2 = new XMLHttpRequest();
		xhr2.open("POST", "<c:url value='/shoppingProductsUpdate.controller' />",true);
		xhr2.setRequestHeader('Content-type','application/x-www-form-urlencoded');	
		xhr2.send('pk='+pk+'&query='+query);
		xhr2.onreadystatechange = function(){
		if(xhr2.readyState==4&&xhr2.status==200){
			var productss = JSON.parse(xhr2.responseText);	
			console.log(productss);
			window.location.assign(productss.url);
		}
		}
			
}

function deleteProduct(){
	
// 	tmp = "<c:url value='/shoppingProductsUpdate.controller/' />";
	
// 	 document.getElementById("x").setAttribute("href",tmp+pk+"/"+query);
//  	  console.log(query);
	var xhr3 = new XMLHttpRequest();
		xhr3.open("POST", "<c:url value='/removeProduct.controller' />",true);
		xhr3.setRequestHeader('Content-type','application/x-www-form-urlencoded');	
		xhr3.send('pk='+pk);		
		xhr3.onreadystatechange = function(){

			
			
		if(xhr3.readyState==4&&xhr3.status==200){
			console.log("removeok");
			var hotelremove = JSON.parse(xhr3.responseText);	

			
			window.location.assign(hotelremove.url);
		}
	}
			
}

</script>


</head>
<jsp:include page="../webnav.jsp" flush="true" ></jsp:include>
<body>
	<div id="product">
	</div>
	
	
<input type="hidden" name="pk" id="pk" value="${id}" />

</body>
</html>