<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importHead.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
/* 隱藏file樣式 */
input[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0,0,0,0);
    border: 0;
}
</style>
<script>
	window.onload = function() {
// 		dialog=document.getElementById("dialog");
//     	x=document.getElementById("x");
//     	registration();
		var personalbtn = document.getElementById("personalbtn");
		var userid = document.getElementById("userid");
		var city = document.getElementById("city");
		var town = document.getElementById("town");
		var road = document.getElementById("road1");
		
		personalbtn.onclick = function(){
			var image = document.getElementById("inputfile");
			var name = document.getElementById("name");
			var phone = document.getElementById("phone");
			var xhr = new XMLHttpRequest();
  			xhr.open("Post","<c:url value='/upadatepersonalaction' />",true); 
  			var jsonMember = {
  	  				"userid": userid.value, 	
  	  				"name": name.value,
  	  				"phone": phone.value,
  	  				"a_address": city.value,
  	  				"b_address": town.value,
  	  				"c_address": road.value
  	  	   		}
  	  	  	xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
  	  	   	xhr.send(JSON.stringify(jsonMember));
  	  		
  	  	   	xhr.onreadystatechange = function() {
				// 伺服器請求完成
 				if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 201) ) {
 					var result = JSON.parse(xhr.responseText);
 					var ih2 = document.getElementById("ih2");
 					if(result.success){
 						Swal.fire('OK',result.success ,'success')
 						ih2.innerHTML = result.changename;
 					}else if(result.fail){
 						Swal.fire("Error!", result.fail , "error")
 					}
 				}
  	  		}
  	  	   	
		}	
		
		
		city.onchange = function(){
			var xhr3 = new XMLHttpRequest();
  			xhr3.open("Post","<c:url value='/searchtown' />",true); 
  			xhr3.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
  			xhr3.send("city=" + city.value);
  			console.log(city.value);
  			xhr3.onreadystatechange = function() {
  				// 伺服器請求完成
  				if (xhr3.readyState == 4 && (xhr3.status == 200 || xhr3.status == 201) ) {
  					var citytown = JSON.parse(xhr3.responseText);
  					var str = '';
  					for(var i=0 ;i<citytown.length ;i++){
  						var content = ' <option value='+ citytown[i].c_zipcode_name +'>'+ citytown[i].c_zipcode_name +'</option> ';
  						str += content;
  						town.innerHTML = str;
  					}	
  					
  					
  				} 
  		  	}
  			
  			
		}
		
		
	}
</script>
<style>

</style>
<title>個人資料</title>
</head>
<jsp:include page="../webnav.jsp" flush="true" ></jsp:include>
<body style="background-color: #F0F0F0;">
<section class="user-profile section">
	<div class="container">
		<div class="row">
			<div class="col-md-10 offset-md-1 col-lg-3 offset-lg-0">
				<div class="sidebar">
					<!-- User Widget -->
					<!-- <form action="<c:url value="/upadateimageaction"/>" method="post" enctype="multipart/form-data"> -->
					<div class="widget user">
						<!-- User Image -->
						<div class="image d-flex justify-content-center">
							<input type="hidden" id="imagebase64" name="inputfile">
							<label for="imgInp">
							<img src="${loginuser.getImage1()}" alt="" class="" id="preview_progressbarTW_img" />
							</label>
						</div>
						<!-- File chooser -->
						
						<input type="file" class="form-control-file mt-2 pt-1" id="imgInp" accept="image/gif, image/jpeg, image/png">
						 
						<!-- User Name -->
						<h5 class="text-center" id="ih2">${loginuser.getName()}</h5>
					</div>
					<!-- </form> -->
					<!-- Dashboard Links -->
					<div class="widget dashboard-links">
						<ul>
							<li><a class="my-1 d-inline-block" href="${pageContext.request.contextPath}/userprofile.controller">編輯個人資料</a></li>
							<li><a class="my-1 d-inline-block" href="${pageContext.request.contextPath}/userpassword.controller">修改密碼</a></li>
							<li><a class="my-1 d-inline-block" href="${pageContext.request.contextPath}/userloginrecord.controller">登入記錄</a></li>
							<li><a class="my-1 d-inline-block" href="${pageContext.request.contextPath}/bsrecord.controller">瀏覽記錄</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-10 offset-md-1 col-lg-9 offset-lg-0">
				<!-- Edit Profile Welcome Text -->
				<div class="widget welcome-message">
					<h2>編輯個人資料</h2>
					<p>更新個人資訊並查看我們如何使用這些資訊。</p>
				</div>
				
				<!-- Personal read-only information -->
				<div class="row">
					
					
					<div class="col-lg-6 col-md-6">
						<div class="widget personal-info">
							<h3 class="widget-header user">個人資料</h3>
							
								<!-- User Name -->
								<div class="form-group">
									<label for="userid">使用者帳號</label>
									<input type="text" class="form-control" id="userid" value="${loginuser.getUserid()}" readonly>
								</div>
								
								<!-- Bitthday -->
								<div class="form-group">
									<label for="birthday">生日</label>
									<input type="text" class="form-control" id="birthday" value="${loginuser.getBirthday()}" readonly>
								</div>
								<!-- Email -->
								<div class="form-group">
									<label for="current-email">信箱</label>
									<input type="email" class="form-control" id="current-email" value="${loginuser.getEmail()}" readonly>
								</div>
								<!-- Submit button -->
						</div>
					</div>
					
					
					
					<div class="col-lg-6 col-md-6">
						<!-- Change Address -->
					<div class="widget change-email mb-0">
						<h3 class="widget-header user">基本資料</h3>
						<div class="form-group">
								<!-- Name -->
								<div class="form-group">
									<label for="name">中文姓名</label>
									<input type="text" class="form-control" id="name" value="${loginuser.getName()}">
								</div>
								<!-- Phone -->
								<div class="form-group">
									<label for="phone">聯絡電話</label>
									<input type="text" class="form-control" id="phone" value="${loginuser.getPhone()}">
								</div>
								<label>住址</label><br>
								<div class="form-group" >
									<select id="city">
										<option value="${loginuser.getA_address()}">${loginuser.getA_address()} </option>
										<option value="臺北市">臺北市</option>
										<option value="新北市">新北市</option>
										<option value="桃園市">桃園市</option>
										<option value="臺中市">臺中市</option>
										<option value="臺南市">臺南市</option>
										<option value="高雄市">高雄市</option>
										<option value="基隆市">基隆市</option>
										<option value="新竹市">新竹市</option>
										<option value="嘉義市">嘉義市</option>
										<option value="新竹縣">新竹縣</option>
										<option value="苗栗縣">苗栗縣</option>
										<option value="彰化縣">彰化縣</option>
										<option value="南投縣">南投縣</option>
										<option value="雲林縣">雲林縣</option>
										<option value="嘉義縣">嘉義縣</option>
										<option value="屏東縣">屏東縣</option>
										<option value="宜蘭縣">宜蘭縣</option>
										<option value="花蓮縣">花蓮縣</option>
										<option value="臺東縣">臺東縣</option>
										<option value="澎湖縣">澎湖縣</option>
										<option value="金門縣">金門縣</option>
									</select>
									<select id="town" >
										<option value="${loginuser.getB_address()}">${loginuser.getB_address()}</option>
									</select>
								</div>
							<div class="form-group">
								<input type="text" class="form-control" value="${loginuser.getC_address()}" id="road1">
							</div>
						</div>
							<!-- Submit Button -->
							<button class="btn btn-transparent" id="personalbtn">確認更改</button>
					</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</section>
<footer class="ftco-footer bg-bottom ftco-no-pt" style="background-image: url('${pageContext.request.contextPath}/static/images/bg_3.jpg');">
	<%@ include file="/WEB-INF/pages/trainandhotel/footer.jsp"%>
</footer>
<!-- loader -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importBody.jsp"%>

<!-- <button id="btnn" class="chatimgg leftbottom" onclick="showDialog();"> <img alt="avatar" height="80px" -->
<%--                  src="${pageContext.request.contextPath}/images/rounded.svg" --%>
<!--                  width="80px"/></button> -->
<%-- <input id="userName" placeholder="search" type="hidden" value="${loginuser.getUserid()}"/> --%>
  
<!--     <div class="chat dialog" id="dialog"> -->
<!--     	<div class="close" onclick="hideDialog();" id="x">x</div> -->
<!--         <div class="chat-header clearfix"> -->
<!--             <img alt="avatar" height="55px" class="chatimgg" -->
<!--                  src="" -->
<!--                  width="55px"/> -->

<!--             <div class="chat-about"> -->
<!--                 <div class="chat-with" id="selectedUserId"></div> -->
<!--                 <div class="chat-num-messages"></div> -->
<!--             </div> -->
<!--             <i class="fa fa-star"></i> -->
<!--         </div> end chat-header -->

<!--         <div class="chat-history"> -->
<!--             <ul id="history"> -->

<!--             </ul> -->

<!--         </div> end chat-history -->

<!--         <div class="chat-message clearfix"> -->
<!--             <textarea id="message-to-send" name="message-to-send" placeholder="Type your message" rows="3"></textarea> -->

<!--             <i class="fa fa-file-o"></i> &nbsp;&nbsp;&nbsp; -->
<!--             <i class="fa fa-file-image-o"></i> -->

<!--             <button id="sendBtn">Send</button> -->

<!--         </div> end chat-message -->

<!--     </div>  -->
<!--     <script id="message-template" type="text/x-handlebars-template"> -->
<!--     <li class="clearfix"> -->
<!--         <div class="message-data align-right"> -->
<!--             <span class="message-data-time">{{time}}, Today</span> &nbsp; &nbsp; -->
<%--             <span class="message-data-name">${loginuser.getName()}</span> <i class="fa fa-circle me"></i> --%>
<!--         </div> -->
<!--         <div class="message other-message float-right"> -->
<!--             {{messageOutput}} -->
<!--         </div> -->
<!--     </li> -->
<!-- </script> -->

<!-- <script id="message-response-template" type="text/x-handlebars-template"> -->
<!--     <li> -->
<!--         <div class="message-data"> -->
<!--             <span class="message-data-name"><i class="fa fa-circle online"></i> {{userName}}</span> -->
<!--             <span class="message-data-time">{{time}}, Today</span> -->
<!--         </div> -->
<!--         <div class="message my-message"> -->
<!-- 			{{response}} -->
<!--             <a href= '{{response1}}' target="_blank" style="text-decoration:none;color:gray;">{{response2}}</a> -->
<!-- 			<img src="" width="0" height="0"/> -->
<!--         </div>	 -->
<!--     </li> -->
<!-- </script> -->

<script src="${pageContext.request.contextPath}/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/js/chat.js"></script>

</body>
<script>
		var fileout = true;
		//當檔案改變後，做一些事 
		/* 	$("#imgInp").change(function() {
			readURL(this); // this代表<input id="imgInp">
		}); */
		
		function readURL(input) {
			
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					/* $("#preview_progressbarTW_img")
							.attr('src', e.target.result); */
					//console.log(e.target.result); 
					let a = document.querySelector('#imagebase64')
					a.value = e.target.result;
					//console.log(a.value); 
				}
				
				reader.readAsDataURL(input.files[0]);
			}
		}
		
		$('input[type=file]').each(function() {
			
			var max_size = 102400;
			$(this).change(function(evt) {
				fileout = true;
				var finput = $(this);
				var files = evt.target.files; // 獲得檔案物件
				var output = [];
				for (var i = 0, f; f = files[i]; i++) {//檢查檔案大小
					if (f.size > max_size) {
						alert("上傳的圖片不能超過100KB!");
						fileout = false;
						//window.location.assign(window.location.href);
						$(this).val('');
					}
				}
				console.log(fileout);
				if(fileout){
					readURL(this);
					Swal.fire({
						  title: '確定變更圖片嗎?',
						  showDenyButton: true,
						  /* showCancelButton: true, */
						  confirmButtonText: `儲存`,
						  denyButtonText: `不儲存`,
						}).then((result) => {
						  /* Read more about isConfirmed, isDenied below */
						  if (result.isConfirmed) {
							  	var imagebase64 = document.getElementById("imagebase64");
								var xhr1 = new XMLHttpRequest();
					  			xhr1.open("Post","<c:url value='/upadateimageaction' />",true); 
					  			var jsonMember = {
					  	  				"userid": userid.value, 	
					  	  				"image1": imagebase64.value
					  	  	   		}
					  	  	  	xhr1.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
					  	  	   	xhr1.send(JSON.stringify(jsonMember));
					  	  		
					  	  	   	xhr1.onreadystatechange = function() {
								// 伺服器請求完成
									if (xhr1.readyState == 4 && (xhr1.status == 200 || xhr1.status == 201) ) {
										var result = JSON.parse(xhr1.responseText);
										var image2 = document.getElementById("preview_progressbarTW_img");
										if(result.success){
											image2.src=imagebase64.value;
											Swal.fire('OK',result.success ,'success')
											imagebase64.value="";
										} else if(result.fail){
											Swal.fire("Error!",result.fail , "error")
										}
									}
						  		}
						  } else if (result.isDenied) {
						    Swal.fire('圖片未修改', '', 'info')
						  }
						})
						
				}
			});
		});
		
</script>
</html>