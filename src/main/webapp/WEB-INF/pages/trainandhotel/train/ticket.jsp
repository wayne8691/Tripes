<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.iii.trip.trainandhotel.repository.*"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<%
	List<TrainStation> tsList = request.getAttribute("all") != null? (List<TrainStation>) request.getAttribute("all"):
		new ArrayList<>();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Trip</title>
<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importHead.jsp"%>
</head>
<body>
	<table  class="table table-striped table-bordered zero-configuration">
		<thead>
			<tr>
				<th>起點</th>
				<th>終點</th>
				<th>剩餘票數</th> 
				<th>購買張數</th>  
				<th>費用</th> 
				<th>購票</th>       	
			</tr>
		</thead>
		<tbody>
			<tr>													
				<td>
					<select name="start" id="start">
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
				<td>
					<select id="end" name="end">	
						<option>--</option>
					</select>	
				</td>
				<td>
					<div id="last"></div>
				</td>
					
				<td>
					<select  id="buy" onchange='ticketCheckPrice()'>
					<option value="no">請選擇張數</option>
					<%for(int i=1;i<=10;i++){%>
					<option value="<%=i %>"><%=i %></option>
					<%}%>
					</select>
				</td>
				
				<td>
				
				<span id="price"></span>
				
				
				</td>
				<td>
				
				<button onclick="ticketCheckBuy()">加入購物車</button>
				
				
				</td>
			</tr>
	</tbody>
</table>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

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
		        $("#last").html(response);
		       
		    },
		    error:function(xhr, status, error) {
		    },
		    complete:function(xhr, status) {
		    }		
		});
	});
	
	
	

</script>
	<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importBody.jsp"%>
</body>
</html>