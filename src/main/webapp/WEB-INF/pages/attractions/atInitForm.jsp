<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>新增</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">

<!-- Custom Stylesheet -->
<link href="${pageContext.request.contextPath}/css/userstyle.css" rel="stylesheet">

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">

//照片處理----------------
function readURL(input){
	  if(input.files && input.files[0]){
		var fild = document.getElementById("image");
	    var imageID = input.getAttribute("fild");
	    var reader = new FileReader();
	    reader.onload = function (e) {
		    
	       var img = document.getElementById("image_img");
	       var imageDiv = document.getElementById("image_div");
	       img.setAttribute("src", e.target.result);
	       imageDiv.setAttribute("style"," ");
	       var img1 = document.getElementById("image1");
	       img1.setAttribute("value", e.target.result);
	    }
	    reader.readAsDataURL(input.files[0]);
	 }
}

//檢查&傳值----------------------------------------------------------------------------------  	
	var hasError = false;
	window.onload = function() {
		var alink = document.getElementById("accountCheck");
		var sp1 = document.getElementById('sp1');
		alink.onclick = function() {
			var nameValue = document.getElementById("name").value;
			if (nameValue == "") {
				sp1.innerHTML = "請輸入景點";
				return;
			}
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "<c:url value='/checkAttractions.controller' />", true);
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xhr.send("name=" + nameValue);
			var message = "";
			xhr.onreadystatechange = function() {
				// 伺服器請求完成
				if (xhr.readyState == 4 && xhr.status == 200) {
					var result = JSON.parse(xhr.responseText);
					if (result.name.length == 0) {
						message = "<font color='green'>可新增</font>";
					} else if (result.name.startsWith("Error")) {
						message = "<font color='red'>發生錯誤:"+ result.name + "新增失敗</font>";
					} else{
						message = "<font color='red'>景點已存在，請勿重複新增</font>";
					} 
					sp1.innerHTML = message;
				}
			}
		}

		var sendData = document.getElementById("sendData");
		sendData.onclick = function() {
			hasError = false;
			// 讀取欄位資料	  
			var countValue = document.getElementById("count").value;
			var nameValue = document.getElementById("name").value;
			var countiesValue = document.getElementById("counties").value;
			var addressValue = document.getElementById("address").value;
			var imageValue = document.getElementById("image").value;
			var imageValue1 =document.getElementById("image1").value;
			var introductionValue = document.getElementById("introduction").value;

			var sp1 = document.getElementById('sp1');
			var sp2 = document.getElementById('sp2');
			var sp3 = document.getElementById('sp3');
			var sp4 = document.getElementById('sp4');
			var sp5 = document.getElementById('sp5');
			var divResult = document.getElementById('resultMsg');

			if (nameValue == ""){
				setErrorFor(sp1, "請輸入景點");
	   		} 	else {
	   			sp1.innerHTML = "";
	   		}
			if (countiesValue == ""){
				setErrorFor(sp2, "請輸入縣市");
			} else {
				sp2.innerHTML = "";
			}
			if (addressValue == ""){
				setErrorFor(sp3, "請輸入地址");
			} else {
				sp3.innerHTML = "";
			}
	   		if (imageValue == ""){
				setErrorFor(sp4, "請選擇照片");
			} else {
				sp4.innerHTML = "";
	   		}
	   		if (introductionValue == ""){
				setErrorFor(sp5, "不可空白");  
	   		} else {
	   			sp5.innerHTML = "";
	   		}
	   		if (introductionValue != "" & imageValue != "" &  addressValue!= "" & countiesValue != "" &  nameValue!= ""){
				var xhr1 = new XMLHttpRequest();
		   		xhr1.open("POST", "<c:url value='/saveAttractions.controller' />", true);
				var jsonAt = {
					"count" : countValue,
					"name" : nameValue,
					"counties" : countiesValue,
					"address" : addressValue,
					"image" : imageValue1,
					"introduction" : introductionValue
				}
			
				xhr1.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
				xhr1.send(JSON.stringify(jsonAt));
				xhr1.onreadystatechange = function() {
					// 伺服器請求完成
					if (xhr1.readyState == 4  && (xhr1.status == 200 || xhr1.status == 201)) {
						result = JSON.parse(xhr1.responseText);
						if (result.fail) { 
							divResult.innerHTML = "<font color='red' >"	+ result.fail + "</font>";
						} else if (result.success) {
							divResult.innerHTML = " ";
							sp1.innerHTML = "";
							sp2.innerHTML = "";
							sp3.innerHTML = "";
							sp4.innerHTML = "";
							sp5.innerHTML = "";
							
							swal({
								  icon: "success",
								  title: "新增成功",
								  button: {
									    text: "確定",   
								  },
							}).then(function (Confirm){
								if(Confirm){
									window.location.reload();
								}	
							});	
							
							 
	
						} else {
							if (result.nameError) {
								sp1.innerHTML = result.nameError;
							} else {
								sp1.innerHTML = "";
							}
							if (result.countiesError) {
								sp2.innerHTML = result.countiesError;
							} else {
								sp2.innerHTML = "";
							}
							if (result.addressError) {
								sp3.innerHTML = result.addressError;
							} else {
								sp3.innerHTML = "";
							}
							if (result.imageError) {
								sp4.innerHTML = result.imageError;
							} else {
								sp4.innerHTML = "";
							}
							if (result.introductionError) {
								sp5.innerHTML = result.introductionError;
							} else {
								sp5.innerHTML = "";
							}
	
						}
					}
				}
	   		}
		}
		var fastData = document.getElementById("fastData");
		fastData.onclick = function() {
			var name = document.getElementById("name");
			var address = document.getElementById("address");
			var introduction = document.getElementById("introduction");
			
			name.value = "奇美博物館";
			address.value = "台南市仁德區文華路二段66號";
			introduction.value = "夜遊奇美博物館，闔家散步好浪漫，美景、展覽、美食、音樂輕鬆有趣的藝術之夜，常設展全票：200元、"
								+"優惠票：150元，雙展套票：380元，更多門票資訊請參照奇美博物館官方網站。";	
		}
	}
	function setErrorFor(input, message){
		input.innerHTML = "<font color='red' size='-2'>" + message + "</font>";
	    hasError = true;
	}


</script>
</head>
<body>
	<!-- 導覽列 -->
	<jsp:include page="../managementnav.jsp" flush="true"></jsp:include>
	
	<!-- 小標導覽列 -->
	<div class="content-body" style="min-height: 927px;">
		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<a href="<c:url value='/attractionsMain.controller'/>">
							<font style="vertical-align: inherit;">景點管理</font>
						</a>
					</li>
					<li class="breadcrumb-item active">
						<a href="<c:url value='/atInitMain.AtInitForm'/>">
							<font style="vertical-align: inherit;">新增景點</font>
						</a>
					</li>
				</ol>
			</div>
		</div>

		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div class="form-validation">
								<h2>新增景點資料</h2>
								<div>
									<input type="hidden" class="form-control" id="count" name="count" value="0">
								</div>
								<div>
									<label for="name">
										<font style="vertical-align: inherit;">景點名稱</font>
										<span class="text-danger">
											<font style="vertical-align: inherit;">*</font>
											<span id="sp1"></span> 
										</span> 
									</label>
									<div class="form-group">
										<input type="text" class="form-control" id="name" name="name">
										<a href='#' id='accountCheck' style='font-size: 10pt;'>檢查景點是否存在</a>
									</div>
								</div>

								<div>
									<label for="counties">
										<font style="vertical-align: inherit;">縣市</font>
										<span class="text-danger">
											<font style="vertical-align: inherit;">*</font>
											<span id="sp2"></span>
										</span> 
									</label>
									<div class="form-group">
										<select class="form-control" id="counties" name="counties" aria-required="true" aria-describedby="val-skill-error" aria-invalid="true">
											<option value="台北市">台北市</option>
											<option value="新北市">新北市</option>
											<option value="桃園市">桃園市</option>
											<option value="新竹市">新竹市</option>
											<option value="苗栗縣">苗栗縣</option>
											<option value="臺中市">臺中市</option>
											<option value="彰化縣">彰化縣</option>
											<option value="南投縣">南投縣</option>
											<option value="雲林縣">雲林縣</option>
											<option value="嘉義縣">嘉義縣</option>
											<option value="臺南市">臺南市</option>
											<option value="高雄市">高雄市</option>
											<option value="屏東縣">屏東縣</option>
											<option value="宜蘭縣">宜蘭縣</option>
											<option value="花蓮縣">花蓮縣</option>
											<option value="臺東縣">臺東縣</option>
											<option value="澎湖縣">澎湖縣</option>
											<option value="金門縣">金門縣</option>
											<option value="連江縣">連江縣</option>
										</select>
									</div>
								</div>

								<div>
									<label for="address">
										<font style="vertical-align: inherit;">完整地址</font>
										<span class="text-danger">
											<font style="vertical-align: inherit;">*</font>
											<span id="sp3"></span>
										</span> 
									</label>
									<div class="form-group">
										<input type="text" class="form-control" id="address" name="address" aria-required="true" aria-describedby="val-username-error" aria-invalid="true">										
									</div>
								</div>

								<div>
									<label for="image">
										<font style="vertical-align: inherit;">照片</font>
										<span class="text-danger">
											<font style="vertical-align: inherit;">*</font>
											<span id="sp4"></span>
										</span> 
									</label>
									<div class="form-group">
										<input type="file" onchange="readURL(this)" id="image"accept="image/gif, image/jpeg, image/png" class="form-control-file"></br>
											<div id="image_div" style="display:none" >
												<img id="image_img" src="#"width="350px" height="250px" /> 
											</div>
											<input type="hidden" name="image1" id="image1" value="#"> 
									</div>
								</div>

								<div>
									<label for="introduction">
										<font style="vertical-align: inherit;">介紹</font>
										<span class="text-danger">
											<font style="vertical-align: inherit;">*</font>
											<span id="sp5"></span>
										</span> 
									</label>
									<div class="form-group">
										<textarea class="form-control h-150px" rows="6" id="introduction"></textarea>									
									</div>
								</div>

								<div>
									<button class="btn btn-primary" id="sendData">送出</button>
									<button class="btn btn-primary" id="fastData">一鍵輸入</button>
									<span id='resultMsg'></span>
								</div>
								<hr>
								<div style="text-align: center;">
									<a href="<c:url value='/attractionsMain.controller'/>">回前頁</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="${pageContext.request.contextPath}/plugins/common/common.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/custom.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/settings.js"></script>
	<script src="${pageContext.request.contextPath}/js/gleek.js"></script>
	<script src="${pageContext.request.contextPath}/js/styleSwitcher.js"></script>

	<script src="${pageContext.request.contextPath}/plugins/validation/jquery.validate.min.js"></script>
	<script	src="${pageContext.request.contextPath}/plugins/validation/jquery.validate-init.js"></script>

</body>

</html>