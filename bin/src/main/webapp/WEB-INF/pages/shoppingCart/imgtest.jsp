<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
    
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
<script >
window.onload = function() {
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "<c:url value='/test.controller' />", true);
		xhr.send();
		xhr.onreadystatechange = function() {

			if (xhr.readyState == 4 && xhr.status == 200) {
				var products = JSON.parse(xhr.responseText);	
				console.log(xhr.responseText);
// 				var content = "<table border='1' align='center' >";
// 				content += "<tr><th width='100'>編輯</th><th width='180'>地區</th><th width='180'>飯店</th><th width='90'>地址</th><th width='140'>入住日期</th><th width='140'>退房日期</th><th width='140'>單價</th><th width='140'>房間數量</th></tr>";
// 				var products = JSON.parse(xhr.responseText);
// 				for(var i=0; i < products.room_id.length; i++){
// 					
// 				    content += 	"<tr><td width='70'><a href='" + tmp + products.room_id[i].shoppingProduct_id + "'>" + 
// 				    			"<img width='36' height='36' src='<c:url value='/images/edit.png' />' ></a>" + 
// 				                "<td align='center'>" + products.room_id[i].hotel_id.city.name + "</td>" +
// 			        	       	"<td>" + products.room_id[i].hotel_id.hotel.name + "</td>" +
// 			            	   	"<td align='right'>" + products.room_id[i].hotel_id.hotel.address + "</td>" +
// 								"<td>" + products.room_id[i].starDay+ "</td><td>" + products.room_id[i].endDay+ "</td>"+
// 								"<td>" + products.room_id[i].hotel_id.price+ "</td><td>" + products.room_id[i].quantity + "</td>" +
								
// 			               		
// 				}
 				
				
				var e ="<table><tr><td><img width='80px' height='auto' src='"+products.image+"' alt='image description'><td><tr></table>";
				

                 console.log(products.number_id)
 				
				var divs = document.getElementById("products");
				divs.innerHTML = e;



				
				}
		}

	}
</script>
</head>
<body>


<div id="products"></div>


</body>
</html>