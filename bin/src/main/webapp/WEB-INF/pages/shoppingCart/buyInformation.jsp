<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/shoppingcarstyle/css/progressbar.css" rel="stylesheet">

<style type="text/css">

#wrap { display:table; }
#cell {  vertical-align:middle; }
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

.fonts{
     color:red;
}



</style>
<meta charset="UTF-8">
<title>Information</title>
</head>
<jsp:include page="../webnav.jsp" flush="true"></jsp:include>
<body>
<div class="activeCouHorCon" align="center">
	<ul class="activeCouHorPro" >
		<li  >購物車</li>
		<li id="forms" class="active">收件人資訊</li>
		<li id="ptype" class="">付款</li>
	</ul>
</div>

	<section class=" bg-gray py-5">
	
		  
		<div class="container">	
		<form name="form1" id='form1' action="<c:url value='/creditCardCheckOut.concroller/' />"
					method="post" > 	
				<input id='pk' type="hidden" name='pk' value="${pk}">
				<!-- Post Your ad start -->
				<fieldset class="border border-gary p-4 mb-5">
					<div align= "center"  >
           			
					</div>
					<div class="row">
						<div class="col-lg-12">
							<h3>收件人資料</h3>
						</div>
  
						<div class="col-lg-6">
           
							<h6 class="font-weight-bold pt-4 pb-1">姓:</h6>
							<input id='last' type="text" class="border w-100 p-2 bg-white text-capitalize" name='lastname'  onChange='formChage();' required>
							<span  class='fonts' id='li'></span>
							<h6 class="font-weight-bold pt-4 pb-1">寄送方式:</h6>
							
							<div class="row px-3" onChange='formChage();'>
								<div class="col-lg-4 mr-lg-4 my-2 rounded bg-white" >
									<input class='type' type="radio" name="PaymentType"
										value="電子票卷" id="personal" required> <label for="personal"
										class="py-2"  >電子票卷</label>
								</div>
				
								<div class="col-lg-4 mr-lg-4 my-2 rounded bg-white ">
									<input class='type' type="radio" name="PaymentType"
										value="紙本票卷" id="business" required> <label for="business"
										class="py-2"  >紙本票卷</label>
										
								</div>
							</div>
							<h6 class="font-weight-bold pt-4 pb-1">付款方式</h6>
							<img id="img1" style="width: 70px;height: 40px" src="<c:url value='../shoppingcarstyle/images/visa.png' />" ">
							<span class='fonts' id='ty'></span>
							<h6 class="font-weight-bold pt-4 pb-1">意見與回覆:</h6>
							<textarea name="" id="" class="border p-3 w-100" rows="7"
								placeholder="您的寶貴意見是我們繼續得動力"></textarea>

						</div>
						<div class="col-lg-6">
							<h6 class="font-weight-bold pt-4 pb-1">名:</h6>
							<input id='name' type="text"
								class="border w-100 p-2 bg-white text-capitalize" name='name'  onChange='formChage();'
								 required>
                             <span class='fonts' id='na'></span>
							<h6 class="font-weight-bold pt-4 pb-1">電話:</h6>
							<input id="phone" type="text"
								class="border w-100 p-2 bg-white text-capitalize" name='phone'  onChange='formChage();'
								 required>
								<span class='fonts' id='ph'></span>
							<h6 class="font-weight-bold pt-4 pb-1">信箱:</h6>
							<input id="Email" type="text"
								class="border w-100 p-2 bg-white text-capitalize" name='mail'  onChange='formChage();'
								 required>
									<span class='fonts' id='ma'></span>
							
							<h6 class="font-weight-bold pt-4 pb-1">地址:</h6>
							<input id="address" type="text"
								class="border w-100 p-2 bg-white text-capitalize" name='address'  onChange='formChage();' required>
	                            <span class='fonts' id='add'></span>
						</div>
						
					</div>
				
				</fieldset>


				<!-- submit button -->
				<div class="checkbox d-inline-flex">
					<input id='member' type="checkbox" id="terms-&-condition"
						class="mt-1"> <label for="terms-&-condition" class="ml-2">與會員同資料
						<!--                     <span> <a class="text-success" href="terms-condition.html">Terms & Condition and Posting Rules.</a></span> -->
					</label>
					
				</div>
				<!-- designed by me... enjoy! -->
<div class="wrapper">
  <a class="cta" onclick="sub();">
    <span style='color: white'>前往結帳頁面</span>
    <span>
      <svg width="66px" height="43px" viewBox="0 0 66 43" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
        <g id="arrow" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
          <path class="one" d="M40.1543933,3.89485454 L43.9763149,0.139296592 C44.1708311,-0.0518420739 44.4826329,-0.0518571125 44.6771675,0.139262789 L65.6916134,20.7848311 C66.0855801,21.1718824 66.0911863,21.8050225 65.704135,22.1989893 C65.7000188,22.2031791 65.6958657,22.2073326 65.6916762,22.2114492 L44.677098,42.8607841 C44.4825957,43.0519059 44.1708242,43.0519358 43.9762853,42.8608513 L40.1545186,39.1069479 C39.9575152,38.9134427 39.9546793,38.5968729 40.1481845,38.3998695 C40.1502893,38.3977268 40.1524132,38.395603 40.1545562,38.3934985 L56.9937789,21.8567812 C57.1908028,21.6632968 57.193672,21.3467273 57.0001876,21.1497035 C56.9980647,21.1475418 56.9959223,21.1453995 56.9937605,21.1432767 L40.1545208,4.60825197 C39.9574869,4.41477773 39.9546013,4.09820839 40.1480756,3.90117456 C40.1501626,3.89904911 40.1522686,3.89694235 40.1543933,3.89485454 Z" fill="#FFFFFF"></path>
          <path class="two" d="M20.1543933,3.89485454 L23.9763149,0.139296592 C24.1708311,-0.0518420739 24.4826329,-0.0518571125 24.6771675,0.139262789 L45.6916134,20.7848311 C46.0855801,21.1718824 46.0911863,21.8050225 45.704135,22.1989893 C45.7000188,22.2031791 45.6958657,22.2073326 45.6916762,22.2114492 L24.677098,42.8607841 C24.4825957,43.0519059 24.1708242,43.0519358 23.9762853,42.8608513 L20.1545186,39.1069479 C19.9575152,38.9134427 19.9546793,38.5968729 20.1481845,38.3998695 C20.1502893,38.3977268 20.1524132,38.395603 20.1545562,38.3934985 L36.9937789,21.8567812 C37.1908028,21.6632968 37.193672,21.3467273 37.0001876,21.1497035 C36.9980647,21.1475418 36.9959223,21.1453995 36.9937605,21.1432767 L20.1545208,4.60825197 C19.9574869,4.41477773 19.9546013,4.09820839 20.1480756,3.90117456 C20.1501626,3.89904911 20.1522686,3.89694235 20.1543933,3.89485454 Z" fill="#FFFFFF"></path>
          <path class="three" d="M0.154393339,3.89485454 L3.97631488,0.139296592 C4.17083111,-0.0518420739 4.48263286,-0.0518571125 4.67716753,0.139262789 L25.6916134,20.7848311 C26.0855801,21.1718824 26.0911863,21.8050225 25.704135,22.1989893 C25.7000188,22.2031791 25.6958657,22.2073326 25.6916762,22.2114492 L4.67709797,42.8607841 C4.48259567,43.0519059 4.17082418,43.0519358 3.97628526,42.8608513 L0.154518591,39.1069479 C-0.0424848215,38.9134427 -0.0453206733,38.5968729 0.148184538,38.3998695 C0.150289256,38.3977268 0.152413239,38.395603 0.154556228,38.3934985 L16.9937789,21.8567812 C17.1908028,21.6632968 17.193672,21.3467273 17.0001876,21.1497035 C16.9980647,21.1475418 16.9959223,21.1453995 16.9937605,21.1432767 L0.15452076,4.60825197 C-0.0425130651,4.41477773 -0.0453986756,4.09820839 0.148075568,3.90117456 C0.150162624,3.89904911 0.152268631,3.89694235 0.154393339,3.89485454 Z" fill="#FFFFFF"></path>
        </g>
      </svg>
    </span> 
  </a>
</div>
				
<!-- 				<button id='btns' type="button" class="btn btn-primary d-block mt-2" onclick='sub()'>確認購買</button> -->
<!-- 		 <input type="submit" value="繼續結帳(將導向至綠界金流支付頁面)" class="btn"> -->
		</form>
	
		</div>
	</section>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
	 
	var la =false;
	var na =false;
	var ph =false;
	var ma =false;
	var add =false;
	var ty =false;
	
	
	
	
	function formChage(){
		
		let lasts =document.getElementById("last").value;
        let name =document.getElementById("name").value;
        let PaymentType =$("[name='PaymentType']:checked").val() ;
        let phones =document.getElementById("phone").value;
        let Email =document.getElementById("Email").value;
        let addresss =document.getElementById("address").value;
        let pk =document.getElementById("pk").value;
		

			
			var notlast = document.getElementById("li");
			var notnames = document.getElementById("na");
			var notphone = document.getElementById("ph");
			var notmail = document.getElementById("ma");
			var notaddress = document.getElementById("add")
		    var nottype = document.getElementById("ty")
		     console.log("aa"+lasts);
		 
		        if(lasts!=""){
			    	
		    	     notlast.innerHTML=""
	             }else{
	            	 
	            	 
	            	 notlast.innerHTML="姓不能回為空!"
	             }
			
	              if(name!=""){
	            	
	            	  notnames.innerHTML=""
	             }else{
	            	 
	            	notnames.innerHTML="名子不能回為空!"
	             }
	            if(PaymentType!=null){
	            	
	            	nottype.innerHTML=""
	             }else{
	            	 
	            	nottype.innerHTML="寄送方式能回為空!"
	             }
	            if(phones!=""){
	            	
	            	notphone.innerHTML=""
	            }else{
	            	 
	            	notphone.innerHTML="電話不能回為空!"
	             }
	            if(addresss!=""){
	            	
	            	notaddress.innerHTML=""
	            }else{
	            	 
	            	notaddress.innerHTML="地址不能回為空!"
	             }
	            if(Email!=""){
	            	
	            	notmail.innerHTML=""
	            }else{
	            	 
	            	notmail.innerHTML="信箱不能回為空!"
	             }
		    
		
		
		
	}
	
	
	
	
	var notlast = document.getElementById("li");
	var notnames = document.getElementById("na");
	var notphone = document.getElementById("ph");
	var notmail = document.getElementById("ma");
	var notaddress = document.getElementById("add")
    var nottype = document.getElementById("ty")

	
	
	function sub(){
		
		
		
		
		

		    var form = document.getElementById("form1");
		    var btn = document.getElementById("btns");
			var last = document.getElementById("last");
			var names = document.getElementById("name");
			var phone = document.getElementById("phone");
			var mail = document.getElementById("Email");
			var address = document.getElementById("address")
		

			
			var notlast = document.getElementById("li");
			var notnames = document.getElementById("na");
			var notphone = document.getElementById("ph");
			var notmail = document.getElementById("ma");
			var notaddress = document.getElementById("add")
		    var nottype = document.getElementById("ty")
		
		
		
        let lasts =document.getElementById("last").value;
        let name =document.getElementById("name").value;
        let PaymentType =$("[name='PaymentType']:checked").val() ;
        let phones =document.getElementById("phone").value;
        let Email =document.getElementById("Email").value;
        let addresss =document.getElementById("address").value;
        let pk =document.getElementById("pk").value;
       
        
       
        swal({
  		  title: "確定要繼續結帳?",
  		  icon: "warning",
  		  buttons: true,
  		  dangerMode: true,
  		})
  		.then((willDelete) => {
  		  if (willDelete) {
  			    if(lasts!=""){
  			    	
  	        	    la=true;
  	             }else{
  	            	 
  	            	 
  	            	notlast.innerHTML="姓不能回為空!"
  	             }
  	              if(name!=""){
  	            	
  	        	     na=true;
  	             }else{
  	            	 
  	            	notnames.innerHTML="名子不能回為空!"
  	             }
  	            if(PaymentType!=null){
  	            	
  	        	    ty=true;
  	             }else{
  	            	 
  	            	nottype.innerHTML="寄送方式能回為空!"
   	             }
  	            if(phones!=""){
  	            	
  	        	    ph=true;
  	            }else{
  	            	 
  	            	notphone.innerHTML="電話不能回為空!"
  	             }
  	            if(addresss!=""){
  	            	
  	        	    add=true;
  	            }else{
  	            	 
  	            	notaddress.innerHTML="地址不能回為空!"
  	             }
  	            if(Email!=""){
  	            	
  	        	    ma=true;
  	            }else{
  	            	 
  	            	notmail.innerHTML="信箱不能回為空!"
  	             }
  	          console.log(ty)
  	          if(la&&na&&ty&&ph&&add&&ma){
  	        	 console.log(ma)
  	        	form1.submit();
  	        	
  	          }else{
  	        	  
  	        	swal({
  	    		  title: "有欄位未填選",
  	    		  text: "您收件人資訊有不份資訊尚未填寫,請再次確認,謝謝!",
  	    		  icon: "warning",
  	    		  buttons: false,
  	    		  
  	    		})
  	    		.then((willDelete) => {
  	    		  
  	    		});
  	
  	           }

  		     } 
  		});
        
        
        
        
        
        
        
        
        
        
        
        
       
        
        
        
        
        
//         var btn = document.getElementById("btns");
      
        
        
        
        
     	
        
        
		
		
		
// 		btn.disabled=true;
		

}


    



	

	 var form = document.getElementById("form1");
	    var btn = document.getElementById("btns");
		var last = document.getElementById("last");
		var names = document.getElementById("name");
		var phone = document.getElementById("phone");
		var mail = document.getElementById("Email");
		var address = document.getElementById("address");
        var personal= document.getElementById("personal");
		document.getElementById("member").onchange = function() {

			var meme = document.getElementById("member")

			if (meme.checked == true) {
				last.value="N/A"
				names.value="${mem.name}"
				phone.value="${mem.phone}"
				mail.value="${mem.Email}"
				address.value="${mem.address}"
				
				personal.checked=true;
				notlast.innerHTML=""
				notnames.innerHTML=""
				notphone.innerHTML=""
				notmail.innerHTML=""		
			    notaddress.innerHTML=""		
				nottype.innerHTML=""
			}else{
				
				
				
				    notlast.innerHTML="姓不能為空!"
					notnames.innerHTML="名不能為空!"
					notphone.innerHTML="電話不能為空!"
					notmail.innerHTML="信箱不能為空!"		
				    notaddress.innerHTML="地址不能為空!"		
					nottype.innerHTML="寄送方式不能為空!"
				
				
				
				last.value=""
				names.value="";
				phone.value="";
				mail.value="";
				address.value="";
			}
		}
	</script>
</body>
</html>