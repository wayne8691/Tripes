<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			var fild = document.getElementById("imageRe");
		    var imageID = input.getAttribute("fild");
		    var reader = new FileReader();
		    reader.onload = function (e) {
		       var img = document.getElementById("image_img");
		       var imageDiv = document.getElementById("image_div");
		       img.setAttribute("src", e.target.result);
		       imageDiv.setAttribute("style"," ");
		       var img2 = document.getElementById("image2");
		       img2.setAttribute("value", e.target.result);
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
        			var nameReValue = document.getElementById("nameRe").value;
        			if (nameReValue == "") {
        				sp1.innerHTML = "請輸入餐廳";
        				return;
        			}
        			var xhr = new XMLHttpRequest();
        			xhr.open("POST", "<c:url value='/checkRestaurantName' />", true);
        			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        			xhr.send("nameRe=" + nameReValue);
        			var message = "";
        			xhr.onreadystatechange = function() {
        				// 伺服器請求完成
        				if (xhr.readyState == 4 && xhr.status == 200) {
        					var result = JSON.parse(xhr.responseText);
        					if (result.nameRe.length == 0) {
        						message = "<font color='green'>可新增</font>";
        					} else if (result.nameRe.startsWith("Error")) {
        						message = "<font color='red'>發生錯誤:"+ result.nameRe + "新增失敗</font>";
        					} else {
        						message = "<font color='red'>餐廳已存在，請勿重複新增</font>";
        					}
        					sp1.innerHTML = message;
        				}
        			}
        		}

        		var sendData = document.getElementById("sendData");
        		sendData.onclick = function() {
        			hasError = false;
        			// 讀取欄位資料
        			var countReValue = document.getElementById("countRe").value; 
        			var nameReValue = document.getElementById("nameRe").value;
        			var countiesReValue = document.getElementById("countiesRe").value;
        			var addressReValue = document.getElementById("addressRe").value;
        			var hoursReValue = document.getElementById("hoursRe").value;
        			var phoneReValue = document.getElementById("phoneRe").value;
        			var categoryReValue = document.getElementById("categoryRe").value;
        			var imageReValue = document.getElementById("imageRe").value;
        			var image2 = document.getElementById("image2").value;
        			var introductionReValue = document.getElementById("introductionRe").value;

        			var sp1 = document.getElementById('sp1');
        			var sp2 = document.getElementById('sp2');
        			var sp3 = document.getElementById('sp3');
        			var sp4 = document.getElementById('sp4');
        			var sp5 = document.getElementById('sp5');
        			var sp6 = document.getElementById('sp6');
        			var sp7 = document.getElementById('sp7');
        			var sp8 = document.getElementById('sp8');
        			var divResult = document.getElementById('resultMsg');
        			
        			if (nameReValue == ""){
        				setErrorFor(sp1, "請輸入餐廳");
        	   		} 	else {
        	   			sp1.innerHTML = "";
        	   		}
        			if (countiesReValue == ""){
        				setErrorFor(sp2, "請選擇縣市");
        			} else {
        				sp2.innerHTML = "";
        			}
        			if (addressReValue == ""){
        				setErrorFor(sp3, "請輸入地址");
        			} else {
        				sp3.innerHTML = "";
        			}
        	   		if (hoursReValue == ""){
        				setErrorFor(sp4, "不可空白");
        			} else {
        				sp4.innerHTML = "";
        	   		}
        	   		if (phoneReValue == ""){
        				setErrorFor(sp5, "不可空白");  
        	   		} else {
        	   			sp5.innerHTML = "";
        	   		}
        	   		if (categoryReValue == ""){
        				setErrorFor(sp6, "不可空白");  
        	   		} else {
        	   			sp6.innerHTML = "";
        	   		}
        	   		if (imageReValue == ""){
        				setErrorFor(sp7, "請選擇照片");  
        	   		} else {
        	   			sp7.innerHTML = "";
        	   		}
        	   		if (introductionReValue == ""){
        				setErrorFor(sp8, "不可空白");  
        	   		} else {
        	   			sp8.innerHTML = "";
        	   		}
        	   		if (introductionReValue != "" & imageReValue != ""& categoryReValue != "" 
            	   		& phoneReValue != "" & hoursReValue != "" & addressReValue != "" 
                	   	& countiesReValue != "" & nameReValue != "" ){
        			var xhr1 = new XMLHttpRequest();
        			xhr1.open("POST", "<c:url value='/saveRestaurant' />", true);

        			var jsonRe = {
        				"countRe" : countReValue,
        				"nameRe" : nameReValue,
        				"countiesRe" : countiesReValue,
        				"addressRe" : addressReValue,
        				"hoursRe" : hoursReValue,
        				"phoneRe" : phoneReValue,
        				"categoryRe" : categoryReValue,
        				"imageRe" : image2,
        				"introductionRe" : introductionReValue
        			}
        			
        			
        			xhr1.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
        			xhr1.send(JSON.stringify(jsonRe));

        			xhr1.onreadystatechange = function() {
        				// 伺服器請求完成
        				if (xhr1.readyState == 4  && (xhr1.status == 200 || xhr1.status == 201)) {
        					result = JSON.parse(xhr1.responseText);
        					if (result.fail) {
        						divResult.innerHTML = "<font color='red' >"	+ result.fail + "</font>";
        					} else if (result.success) {
         						divResult.innerHTML = "";
        						sp1.innerHTML = "";
        						sp2.innerHTML = "";
        						sp3.innerHTML = "";
        						sp4.innerHTML = "";
        						sp5.innerHTML = "";
        						sp6.innerHTML = "";
        						sp7.innerHTML = "";
        						sp8.innerHTML = "";
        						
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
        						if (result.nameReError) {
        							sp1.innerHTML = result.nameReError;
        						} else {
        							sp1.innerHTML = "";
        						}
        						if (result.countiesReError) {
        							sp2.innerHTML = result.countiesReError;
        						} else {
        							sp2.innerHTML = "";
        						}
        						if (result.addressReError) {
        							sp3.innerHTML = result.addressReError;
        						} else {
        							sp3.innerHTML = "";
        						}
        						if (result.hoursReError) {
        							sp4.innerHTML = result.hoursReError;
        						} else {
        							sp4.innerHTML = "";
        						}
        						if (result.phoneReError) {
        							sp5.innerHTML = result.phoneReError;
        						} else {
        							sp5.innerHTML = "";
        						}
        						if (result.categoryReError) {
        							sp6.innerHTML = result.categoryReError;
        						} else {
        							sp6.innerHTML = "";
        						}
        						if (result.imageReError) {
        							sp7.innerHTML = result.imageReError;
        						} else {
        							sp7.innerHTML = "";
        						}
        						if (result.introductionReError) {
        							sp8.innerHTML = result.introductionReError;
        						} else {
        							sp8.innerHTML = "";
        						}

        					}
        				}
        			}
        		}
        	}
//         		一鍵輸入1
        		var fast1Data = document.getElementById("fast1Data");
        		fast1Data.onclick = function() {
        			var nameRe = document.getElementById("nameRe");
        			var addressRe = document.getElementById("addressRe");
        			var hoursRe = document.getElementById("hoursRe");
        			var phoneRe = document.getElementById("phoneRe");
        			var categoryRe = document.getElementById("categoryRe");
        			var introductionRe = document.getElementById("introductionRe");
        			
        			nameRe.value = "新橋韓式烤肉";
        			addressRe.value = "新竹市東區文化街22號";
        			hoursRe.value = "11:30–14:00,17:30–21:30";
        			phoneRe.value = "03-532-0908";
        			categoryRe.value = "韓式烤肉";
        			introductionRe.value = "這間是新竹人都知道的新橋餐飲所開的韓式烤肉，小編已經回訪N次的新橋韓式，每次吃都覺得CP值也太高了！菜單以套餐及"
        									+"單點兩種選擇，最推薦豬肉雙人套餐，光是套餐就可以吃到燒肉、飛魚卵蒸蛋、海鮮煎餅、小菜無限續，吃完這一餐比吃到飽還滿足。";	
        		}
//         		一鍵輸入2
        		var fast2Data = document.getElementById("fast2Data");
        		fast2Data.onclick = function() {
        			var nameRe = document.getElementById("nameRe");
        			var addressRe = document.getElementById("addressRe");
        			var hoursRe = document.getElementById("hoursRe");
        			var phoneRe = document.getElementById("phoneRe");
        			var categoryRe = document.getElementById("categoryRe");
        			var introductionRe = document.getElementById("introductionRe");
        			
        			nameRe.value = "態芮";
        			addressRe.value = "台北市中山區樂群三路299號6樓";
        			hoursRe.value = "11:30–14:00,17:30–21:30";
        			phoneRe.value = "02-85015500";
        			categoryRe.value = "米其林餐廳";
        			introductionRe.value = "使用台灣食材組合出台灣人飲食記憶的「態芮」，為米其林二星裡風格特殊的餐廳，適合用來招待外籍友人認識台灣，也適合台灣人紮下在地化高端飲食印象。";	
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
						<a href="<c:url value='/restaurantMain.controller'/>">
							<font style="vertical-align: inherit;">餐廳管理</font>
						</a>
					</li>
					<li class="breadcrumb-item active">
						<a href="<c:url value='/reInitMain.controller'/>">
							<font style="vertical-align: inherit;">新增餐廳</font>
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
								<h2>新增餐廳資料</h2>
								<div>
									<input type="hidden" class="form-control" id="countRe" name="countRe" value="0">
								</div>
								<div>
									<label for="nameRe">
										<font style="vertical-align: inherit;">餐廳名稱</font>
										<span class="text-danger">
											<font style="vertical-align: inherit;">*</font>
											<span id="sp1"></span> 
										</span> 
									</label>
									<div class="form-group">
										<input type="text" class="form-control" id="nameRe" name="nameRe">
										<a href='#' id='accountCheck' style='font-size: 10pt;'>檢查餐廳是否已存在</a>
									</div>
								</div>
								
								<div>
									<label for="countiesRe">
										<font style="vertical-align: inherit;">縣市</font>
										<span class="text-danger">
											<font style="vertical-align: inherit;">*</font>
											<span id="sp2"></span>
											
										</span> 
									</label>
									<div class="form-group">
										<select class="form-control" id="countiesRe" name="countiesRe" aria-required="true" aria-describedby="val-skill-error" aria-invalid="true">
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
									<label for="addressRe">
										<font style="vertical-align: inherit;">完整地址</font>
										<span class="text-danger">
											<font style="vertical-align: inherit;">*</font>
											<span id="sp3"></span>
										</span> 
									</label>
									<div class="form-group">
										<input type="text" class="form-control" id="addressRe" name="addressRe" aria-required="true" aria-describedby="val-username-error" aria-invalid="true">
									</div>
								</div>

								<div>
									<label for="hoursRe">
										<font style="vertical-align: inherit;">營業時間</font>
										<span class="text-danger">
											<font style="vertical-align: inherit;">*</font>
											<span id="sp4"></span>
										</span> 
									</label>
									<div class="form-group">
										<input type="text" class="form-control" id="hoursRe" name="hoursRe" aria-required="true" aria-describedby="val-username-error" aria-invalid="true">
									</div>
								</div>
								
								<div>
									<label for="phoneRe">
										<font style="vertical-align: inherit;">店家電話</font>
										<span class="text-danger">
											<font style="vertical-align: inherit;">*</font>
											<span id="sp5"></span>
										</span> 
									</label>
									<div class="form-group">
										<input type="text" class="form-control" id="phoneRe" name="phoneRe" aria-required="true" aria-describedby="val-username-error" aria-invalid="true">
									</div>
								</div>
								
								<div>
									<label for="categoryRe">
										<font style="vertical-align: inherit;">美食種類</font>
										<span class="text-danger">
											<font style="vertical-align: inherit;">*</font>
											<span id="sp6" ></span>
										</span> 
									</label>
									<div class="form-group">
										<input type="text" class="form-control" id="categoryRe" name="categoryRe" aria-required="true" aria-describedby="val-username-error" aria-invalid="true">
									</div>
								</div>

								<div>
									<label for="imageRe">
										<font style="vertical-align: inherit;">照片</font>
										<span class="text-danger">
											<font style="vertical-align: inherit;">*</font>
											<span id="sp7"></span>
										</span> 
									</label>
									<div class="form-group">
										<input type="file" onchange="readURL(this)" id="imageRe" accept="image/gif, image/jpeg, image/png" class="form-control-file"> 
											<div id="image_div" style="display:none" >
												<img id="image_img" src="#" width="350px" height="250px" /> 
											</div>
											<input type="hidden" name="image2" id="image2" value="#"> 
									</div>
								</div>
								
								<div>
									<label for="introductionRe">
										<font style="vertical-align: inherit;">介紹</font>
										<span class="text-danger">
											<font style="vertical-align: inherit;">*</font>
											<span id="sp8"></span>
										</span> 
									</label>
									<div class="form-group">
										<textarea class="form-control h-150px" rows="6" id="introductionRe"></textarea>
									</div>
								</div>	
															
								<div>
									<button class="btn btn-primary" id="sendData">送出</button>
									<button class="btn btn-primary" id="fast1Data">一鍵輸入1</button>
									<button class="btn btn-primary" id="fast2Data">一鍵輸入2</button>
									<span id='resultMsg'></span>
								</div>
								<hr>
								<div style="text-align: center;">
									<a href="<c:url value='/restaurantMain.controller'/>">回前頁</a>
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
								

		
