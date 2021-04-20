<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改</title>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
var key = ${pk};
var hasError = false;

window.onload = function() {
	var divResult = document.getElementById('resultMsg');
	var pk = document.getElementById("pk");
	var nameRe = document.getElementById("nameRe");
	var countiesRe = document.getElementById("countiesRe");
	var addressRe = document.getElementById("addressRe");
	var hoursRe = document.getElementById("hoursRe");
	var phoneRe = document.getElementById("phoneRe");
	var categoryRe = document.getElementById("categoryRe");
	var imageRe = document.getElementById("imageRe");
	var image_img = document.getElementById("image_img");
	var introductionRe = document.getElementById("introductionRe");
	var countRe = document.getElementById("countRe");
	var xhr = new XMLHttpRequest();

	xhr.open("GET", "<c:url value='/getRestaurantByPk/" + key + "' />", true);
	xhr.send();	

	var message = "";
	xhr.onreadystatechange = function() {
	 // 伺服器請求完成
	    if (xhr.readyState == 4 && xhr.status == 200) {
		   var restaurantData = JSON.parse(xhr.responseText);
		   pk.value = restaurantData.pk;
		   nameRe.value = restaurantData.nameRe;
		   countiesRe.value = restaurantData.countiesRe;
		   addressRe.value = restaurantData.addressRe;
		   hoursRe.value = restaurantData.hoursRe;
		   phoneRe.value = restaurantData.phoneRe;
		   categoryRe.value = restaurantData.categoryRe;
 		   imageRe.value = restaurantData.imageRe;
 		   image_img.src = restaurantData.imageRe;
		   introductionRe.value = restaurantData.introductionRe;
		   countRe.value = restaurantData.countRe;

	    }
     }

   var updateData = document.getElementById("updateData");
   var deleteData = document.getElementById('deleteData');
	deleteData.addEventListener('click', (e)=> {
		swal({
			  title: "确定删除吗？",
			  icon: "warning", 
			    buttons: {
			        Btn: false,
			        cancel: {
			          text: "取消",
			          visible: true
			        },
			        confirm: {
			            text: "確認刪除",
			            visible: true
			        }
			    }
			}).then(function (isConfirm) {
				if(isConfirm){
					var xhr2 = new XMLHttpRequest();
				    xhr2.open("DELETE", "<c:url value='/deleterestaurant/' />" + key , true);
			   		xhr2.send();
			   		xhr2.onreadystatechange = function() {
								// 伺服器請求完成
			   		if (xhr2.readyState == 4 && (xhr2.status == 200 || xhr2.status == 204) ) {
						//window.location.assign(window.location.href);
			      		result = JSON.parse(xhr2.responseText);
			      		if (result.success) {
				  			swal({
								  icon: "success",
								  title: "刪除成功"
							}).then(function () {
								window.location.href = "<c:url value='/restaurantMain.controller'/>";
						    })
				  		} else if (result.fail) {
				  			divResult.innerHTML = "<font color='red' >"
								+ result.fail + "</font>";
			      		}    
					}
				}  
			}
	    })
	});
   updateData.onclick = function() {
		hasError = false;
   		// 讀取欄位資料
		var pkValue = document.getElementById("pk").value;
		var nameReValue = document.getElementById("nameRe").value;
		var countiesReValue = document.getElementById("countiesRe").value;
		var addressReValue = document.getElementById("addressRe").value;
		var hoursReValue = document.getElementById("hoursRe").value;
		var phoneReValue = document.getElementById("phoneRe").value;
		var categoryReValue = document.getElementById("categoryRe").value;
		var imageReValue = document.getElementById("imageRe").value;
		var introductionReValue = document.getElementById("introductionRe").value;
		var countReValue = document.getElementById("countRe").value;
		
		var sp1 = document.getElementById('sp1');
		var sp2 = document.getElementById('sp2');
		var sp3 = document.getElementById('sp3');
		var sp4 = document.getElementById('sp4');
		var sp5 = document.getElementById('sp5');
		var sp6 = document.getElementById('sp6');
		var sp7 = document.getElementById('sp7');
		var sp8 = document.getElementById('sp8');
		
		if (!nameReValue){
			setErrorFor(sp1, "請輸入景點");
   		} 	else {
   			sp1.innerHTML = "";
   		}
		if (!countiesReValue){
			setErrorFor(sp2, "請輸入縣市");
		} else {
			sp2.innerHTML = "";
		}
		if (!addressReValue){
			setErrorFor(sp3, "請輸入地址");
		} else {
			sp3.innerHTML = "";
		}
		if (!hoursReValue){
			setErrorFor(sp4, "請輸入營業時間");
		} else {
			sp4.innerHTML = "";
		}
		if (!phoneReValue){
			setErrorFor(sp5, "請輸入電話");
		} else {
			sp5.innerHTML = "";
		}
		if (!categoryReValue){
			setErrorFor(sp6, "不可空白");
		} else {
			sp6.innerHTML = "";
		}
   		if (!imageReValue){
			setErrorFor(sp7, "請選擇照片");
		} else {
			sp7.innerHTML = "";
   		}
   		if (!introductionReValue){
			setErrorFor(sp8, "不可空白");  
   		} else {
   			sp8.innerHTML = "";
   		}
   		if (hasError){
       		return false;
   		}
   		
   		var xhr1 = new XMLHttpRequest();
   		xhr1.open("PUT", "<c:url value='/updateRestaurant/' />" + key, true);
		var jsonRe = {
			"pk": pkValue, 					
			"nameRe": nameReValue, 	
			"countiesRe": countiesReValue,
			"addressRe": addressReValue,
			"hoursRe": hoursReValue,
			"phoneRe": phoneReValue,
			"categoryRe": categoryReValue,
			"imageRe": imageReValue,
			"introductionRe": introductionReValue,
			"countRe": countReValue

   		}
   		xhr1.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
   		xhr1.send(JSON.stringify(jsonRe));

   		xhr1.onreadystatechange = function() {
				// 伺服器請求完成
   		if (xhr1.readyState == 4 && (xhr1.status == 200 || xhr1.status == 201) ) {
      		result = JSON.parse(xhr1.responseText);
      		if (result.fail) {
		 		divResult.innerHTML = "<font color='red' >" + result.fail + "</font>";
	  		} else if (result.success) {
				divResult.innerHTML = " ";			
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
						  title: "修改成功",
						  button: {
							    text: "確定",   
						  },
					}).then(function (Confirm){
						if(Confirm){
							window.location.href = "<c:url value='/restaurantMain.controller'/>";
						}	
					});		 
	 		} else {
				if (result.nameReError) {
					sp1.innerHTML = "<font color='green' size='-2'>"
						+ result.nameReError + "</font>";
				} else {
					sp1.innerHTML = "";
	   			}
				if (result.countiesReError) {
					sp2.innerHTML = "<font color='green' size='-2'>"
						+ result.countiesReError + "</font>";
				} else {
					sp2.innerHTML = "";
    			}
				if (result.addressReError) {
					sp3.innerHTML = "<font color='green' size='-2'>"
						+ result.addressReError + "</font>";
				} else {
					sp3.innerHTML = "";
				}
				if (result.hoursReError) {
					sp4.innerHTML = "<font color='green' size='-2'>"
						+ result.hoursReError + "</font>";
				} else {
					sp4.innerHTML = "";
				}
				if (result.phoneReError) {
					sp5.innerHTML = "<font color='green' size='-2'>"
						+ result.phoneReError + "</font>";
				} else {
					sp5.innerHTML = "";
				}
				if (result.categoryReError) {
					sp6.innerHTML = "<font color='green' size='-2'>"
						+ result.categoryReError + "</font>";
				} else {
					sp6.innerHTML = "";
				}				
				if (result.imageReError) {
					sp7.innerHTML = "<font color='green' size='-2'>"
						+ result.imageReError + "</font>";
				} else {
					sp7.innerHTML = "";
				}
				if (result.introductionReError) {
					sp8.innerHTML = "<font color='green' size='-2'>"
	     				+ result.introductionReError + "</font>";
				} else {
					sp8.innerHTML = "";
				}
      		}
		} 
   		}
   }
	function setErrorFor(input, message){
		input.innerHTML = "<font color='red' size='-2'>" + message + "</font>";
	    hasError = true;
	}

}        
    </script>
</head>
<body>
<jsp:include page="../managementnav.jsp" flush="true"></jsp:include>
	<div class="content-body" style="min-height: 927px;">
		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						<a href="<c:url value='/restaurantMain.controller'/>">
							<font style="vertical-align: inherit;">Restaurant Home</font>
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
							<div class="basic-form">
								<!-- <div class="form-validation">	 -->
								<h2>修改/刪除餐廳資料</h2>
								</br>
								<div>
									<input type="hidden" class="form-control" id="pk" name="pk">
									<input type="hidden" class="form-control" id="countRe" name="countRe" value="1">
								</div>
								
								<div>
									<label for="nameRe">
										<font style="vertical-align: inherit;">餐廳名稱</font>
											<span class="text-danger">
												<font style="vertical-align: inherit;">*</font>
											</span> 
									</label>
									<div class="form-group">
										<input type="text" class="form-control input-default" id="nameRe" name="nameRe"> 
										<span id="sp1" class="invalid-feedback animated fadeInDown" style="display: block;"></span>
									</div>
								</div>	
								<div>
									<label for="countiesRe">
										<font style="vertical-align: inherit;">縣市</font>
											<span class="text-danger">
												<font style="vertical-align: inherit;">*</font>
											</span> 
									</label>
									<div class="form-group">
										<input type="text" class="form-control input-default" id="countiesRe" name="countiesRe"> 
										<span id="sp2" class="invalid-feedback animated fadeInDown" style="display: block;"></span>
									</div>
								</div>
 
								<div>
									<label for="addressRe">
										<font style="vertical-align: inherit;">完整地址</font>
											<span class="text-danger"> 
												<font style="vertical-align: inherit;">*</font>
											</span> 
									</label>
									<div class="form-group">
										<input type="text" class="form-control input-default" id="addressRe" name="addressRe"> 
										<span id="sp3" class="invalid-feedback animated fadeInDown" style="display: block;"></span>
									</div>
								</div>

								<div>
									<label for="hoursRe">
										<font style="vertical-align: inherit;">營業時間</font>
											<span class="text-danger"> 
												<font style="vertical-align: inherit;">*</font>
											</span> 
									</label>
									<div class="form-group">
										<input type="text" class="form-control input-default" id="hoursRe" name="hoursRe"> 
										<span id="sp4" class="invalid-feedback animated fadeInDown" style="display: block;"></span>
									</div>
								</div>

								<div>
									<label for="phoneRe">
										<font style="vertical-align: inherit;">店家電話</font>
											<span class="text-danger"> 
												<font style="vertical-align: inherit;">*</font>
											</span> 
									</label>
									<div class="form-group">
										<input type="text" class="form-control input-default" id="phoneRe" name="phoneRe"> 
										<span id="sp5" class="invalid-feedback animated fadeInDown" style="display: block;"></span>
									</div>
								</div>			           

								<div>
									<label for="categoryRe">
										<font style="vertical-align: inherit;">美食種類</font>
											<span class="text-danger"> 
												<font style="vertical-align: inherit;">*</font>
											</span> 
									</label>
									<div class="form-group">
										<input type="text" class="form-control input-default" id="categoryRe" name="categoryRe"> 
										<span id="sp6" class="invalid-feedback animated fadeInDown" style="display: block;"></span>
									</div>
								</div>		

								<div>
									<label for="imageRe">
										<font style="vertical-align: inherit;">照片</font>
											<span class="text-danger">
												<font style="vertical-align: inherit;">*</font>
											</span> 
									</label>
									<div class="form-group">
										<input type="hidden" class="form-control input-default" name="imageRe" id="imageRe"> 
										<img src="#" id="image_img" width="350px" height="230px"> 
										<span id="sp7" class="invalid-feedback animated fadeInDown" style="display: block;"></span>
									</div>
								</div>

								<div>
									<label for="introductionRe">
										<font style="vertical-align: inherit;">介紹</font>
											<span class="text-danger">
												<font style="vertical-align: inherit;">*</font>
											</span> 
									</label>
									<div class="form-group">
										<textarea class="form-control input-default" id="introductionRe" rows="6"></textarea>
										<span id="sp8" class="invalid-feedback animated fadeInDown" style="display: block;"></span>
									</div>
								</div>

					            <div>
					            	<button  class="btn btn-warning" id='updateData'>修改</button>
									<button  class="btn btn-danger" id='deleteData'>刪除此筆資料</button>
									<span id="resultMsg"></span>
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

	<script	src="${pageContext.request.contextPath}/plugins/common/common.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/custom.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/settings.js"></script>
	<script src="${pageContext.request.contextPath}/js/gleek.js"></script>
	<script src="${pageContext.request.contextPath}/js/styleSwitcher.js"></script>

	<script	src="${pageContext.request.contextPath}/plugins/validation/jquery.validate.min.js"></script>
	<script	src="${pageContext.request.contextPath}/plugins/validation/jquery.validate-init.js"></script>

</body>

</html>