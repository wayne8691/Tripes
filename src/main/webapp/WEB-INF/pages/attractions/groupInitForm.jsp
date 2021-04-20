<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增</title>

<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">

	function readURL(input){
	  if(input.files && input.files[0]){
		var fild = document.getElementById("image");
	    var imageID = input.getAttribute("fild");
	    var reader = new FileReader();
	    reader.onload = function (e) {
	       var img = document.getElementById("image_img");
	       img.setAttribute("src", e.target.result);
	       var img1 = document.getElementById("image1");
	       img1.setAttribute("value", e.target.result);
	    }
	    reader.readAsDataURL(input.files[0]);
	  }
	}

	//----------------------------------------------------------------------------------  	
	var hasError = false;
	window.onload = function() {
		var alink = document.getElementById("accountCheck");
		var sp1 = document.getElementById('sp1');
		alink.onclick = function() {
			var nameValue = document.getElementById("name").value;
			if (!nameValue) {
				sp1.innerHTML = "<font color='red' size='-2'>請輸入行程團名</font>";
				return;
			}
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "<c:url value='/checkTravelGroup.controller' />", true);
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xhr.send("name=" + nameValue);
			var message = "";
			xhr.onreadystatechange = function() {
				// 伺服器請求完成
				if (xhr.readyState == 4 && xhr.status == 200) {
					var result = JSON.parse(xhr.responseText);
					if (result.name.length == 0) {
						message = " ";
					} else if (result.name.startsWith("Error")) {
						message = "<font color='red' size='-2'>發生錯誤:行程團名"+ result.name + "</font>";
					} else {
						message = "<font color='red' size='-2'>行程已存在，請勿重複新增</font>";
					}
					sp1.innerHTML = message;
				}
			}
		}

		var sendData = document.getElementById("sendData");
		sendData.onclick = function() {
			hasError = false;
			// 讀取欄位資料	  
			var nameValue = document.getElementById("name").value;
			var priceValue = document.getElementById("price").value;
			var originValue = document.getElementById("origin").value;
			var destinationValue = document.getElementById("destination").value;
			var dayValue = document.getElementById("day").value;
			var featureValue = document.getElementById("feature").value;
			var imageValue = document.getElementById("image1").value;


			var sp1 = document.getElementById('sp1');
			var sp2 = document.getElementById('sp2');
			var sp3 = document.getElementById('sp3');
			var sp4 = document.getElementById('sp4');
			var sp5 = document.getElementById('sp5');
			var sp6 = document.getElementById('sp6');
			var sp7 = document.getElementById('sp7');
			var divResult = document.getElementById('resultMsg');
			
			if (!nameValue){
				setErrorFor(sp1, "請輸入");
	   		} 	else {
	   			sp1.innerHTML = "";
	   		}
			if (!priceValue){
				setErrorFor(sp2, "請輸入");
			} else {
				sp2.innerHTML = "";
			}
			if (!originValue){
				setErrorFor(sp3, "請輸入");
			} else {
				sp3.innerHTML = "";
			}
	   		if (!destinationValue){
				setErrorFor(sp4, "不可空白");
			} else {
				sp4.innerHTML = "";
	   		}
	   		if (!dayValue){
				setErrorFor(sp5, "不可空白");  
	   		} else {
	   			sp5.innerHTML = "";
	   		}
	  
	   		if (!featureValue){
				setErrorFor(sp6, "不可空白");  
	   		} else {
	   			sp6.innerHTML = "";
	   		}
	   		if (!imageValue){
				setErrorFor(sp7, "請選擇照片");
			} else {
				sp7.innerHTML = "";
	   		} 		
 		
			var xhr1 = new XMLHttpRequest();

			xhr1.open("POST", "<c:url value='/insertTravelGroup.controller' />", true);

			var jsonGroup = {
				"name" : nameValue,
				"price" : priceValue,
				"origin" : originValue,
				"destination" : destinationValue,
				"day" : dayValue,
				"feature" : featureValue,
				"image" : imageValue
			}

			
			alert(JSON.stringify(jsonGroup));
			
			xhr1.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
			xhr1.send(JSON.stringify(jsonGroup));

			xhr1.onreadystatechange = function() {
				// 伺服器請求完成
				if (xhr1.readyState == 4  && (xhr1.status == 200 || xhr1.status == 201)) {
					result = JSON.parse(xhr1.responseText);
					if (result.fail) {
						divResult.innerHTML = "<font color='red' >"	+ result.fail + "</font>";
					} else if (result.success) {
						divResult.innerHTML = "<font color='GREEN'>"+ result.success + "</font>";

						sp1.innerHTML = "";
						sp2.innerHTML = "";
						sp3.innerHTML = "";
						sp4.innerHTML = "";
						sp5.innerHTML = "";
						sp6.innerHTML = "";
						sp7.innerHTML = "";

					} else {
						if (result.nameError) {
							sp1.innerHTML = result.nameError;
						} else {
							sp1.innerHTML = "";
						}
						if (result.priceError) {
							sp2.innerHTML = result.priceError;
						} else {
							sp2.innerHTML = "";
						}
						if (result.originError) {
							sp3.innerHTML = result.originError;
						} else {
							sp3.innerHTML = "";
						}
						if (result.destinationError) {
							sp4.innerHTML = result.destinationError;
						} else {
							sp4.innerHTML = "";
						}
						if (result.dayError) {
							sp5.innerHTML = result.dayError;
						} else {
							sp5.innerHTML = "";
						}
						if (result.featureError) {
							sp6.innerHTML = result.featureError;
						} else {
							sp6.innerHTML = "";
						}
						if (result.imageError) {
							sp7.innerHTML = result.imageError;
						} else {
							sp7.innerHTML = "";
						}

					}
				}
			}
		}
	}
	function setErrorFor(input, message){
		input.innerHTML = "<font color='red' size='-2'>" + message + "</font>";
	    hasError = true;
	}
</script>
</head>
<body>
	<div>
		<h2>請輸入行程團體資料</h2>
	</div>
	<fieldset>
		<legend>新增內容</legend>
		<div class="divst">
			<label for="name" class="st1">團名:</label> 
			<input type="text" id="name" name="name" size="20">
			<span id="sp1"></span><br/>
			<a href='#' id='accountCheck' style='font-size: 10pt;'>檢查團名是否已存在</a>
		</div>
		<div class="divst">
			<label class="st1" for="price">銷售價:</label> 
			<input type="number" id="price" name="price" size="30">
			<span id="sp2"></span><br/>
		</div>
		<div class="divst">
			<label class="st1" for="origin">出發地點:</label> 
			
			<select name="origin" id="origin">
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
			<span id="sp3"></span><br/>
		</div>
		
		<div class="divst">
			<label class="st1">旅遊縣市:</label>
			<select name="destination" id="destination">
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
			<span id="sp4"></span><br/>
		</div>
		<div class="divst">
			<label for="day" class="st1">旅遊天數:</label>
			<input type="number" id="day" name="day" size="30">
			<span id="sp5"></span><br/>
		</div>
		<div class="divst">
			<label for="feature" class="st1">主要特點:</label>
			<textarea cols="40" rows="5" name="feature" id="feature"></textarea>
			<span id="sp6"></span><br/>
		</div>
		<div class="divst">
			<label class="st1" for="image">照片:</label>
			<input type="file" onchange="readURL(this)" id="image" accept="image/gif, image/jpeg, image/png">
			<img id="image_img" src="#" width="250px" height="156px"/>
			<input type="hidden" name="image1" id="image1" value="#"> 
			<span id="sp7"></span><br/>
		</div>
		<div id='resultMsg' style="height: 18px; font-weight: bold; position: absolute; left: 50%;"></div>
		<div class="sub">
			<br> 
			<button id="sendData">送出 </button>
			<input type="reset" value="清除輸入">
		</div>

	</fieldset>
	<hr>
	<p>
<%-- 		<a href="<c:url value='/attractionsMain.controller'/>">回前頁</a> --%>
	<hr>
</body>