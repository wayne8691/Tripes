<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	//var pkLabel = document.getElementById("pka");
	var name = document.getElementById("name");
	var counties = document.getElementById("counties");
	var address = document.getElementById("address");
	var image = document.getElementById("image");
	var image_img = document.getElementById("image_img");
	var introduction = document.getElementById("introduction");
	var count = document.getElementById("count");
	var xhr = new XMLHttpRequest();

	xhr.open("GET", "<c:url value='/attractions/" + key + "' />", true);
	xhr.send();	
	
	var message = "";
	xhr.onreadystatechange = function() {
	 // 伺服器請求完成
	    if (xhr.readyState == 4 && xhr.status == 200) {
		//	alert("xhr.responseText"+xhr.responseText);	
		   var attractionsBean = JSON.parse(xhr.responseText);
		   pk.value = attractionsBean.pk;
		  // pkLabel.innerHTML = attractionsBean.pk;
		   name.value = attractionsBean.name;
		   counties.value = attractionsBean.counties;
		   address.value = attractionsBean.address;
 		   image.value = attractionsBean.image;
 		   image_img.src = attractionsBean.image;
		   introduction.value = attractionsBean.introduction;
		   count.value = attractionsBean.count;
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
			    xhr2.open("DELETE", "<c:url value='/attractions/' />" + key , true);
		   		xhr2.send();
		   		xhr2.onreadystatechange = function() {
							// 伺服器請求完成
		   		if (xhr2.readyState == 4 && (xhr2.status == 200 || xhr2.status == 204) ) {
					//window.location.assign(window.location.href);
		      		result = JSON.parse(xhr2.responseText);
		      		if (result.fail) {
		      			divResult.innerHTML = "<font color='red' >"
							+ result.fail + "</font>";
			  		} else if (result.success) {
			  			window.location.href = "<c:url value='/attractionsMain.controller'/>";
		      		}    
				}
			}  
			}
	    })
	    

	});
	
	
// 	swal({
// 		  title: "确定删除吗？",
// 		  icon: "warning", 
// 		    buttons: {
// 		        Btn: false,
// 		        cancel: {
// 		          text: "取消",
// 		          visible: true
// 		        },
// 		        confirm: {
// 		            text: "確認刪除",
// 		            visible: true
// 		        }
// 		    }
// 		});

// 	deleteData.addEventListener('click', (e)=> {
// 		 var result = confirm("確定刪除景點(" + name.value + ")的資料?");
		 
// 		 if (result) {
// 				var xhr2 = new XMLHttpRequest();
// 			    xhr2.open("DELETE", "<c:url value='/attractions/' />" + key , true);
// 		   		xhr2.send();
// 		   		xhr2.onreadystatechange = function() {
// 							// 伺服器請求完成
// 		   		if (xhr2.readyState == 4 && (xhr2.status == 200 || xhr2.status == 204) ) {
// 					//window.location.assign(window.location.href);
// 		      		result = JSON.parse(xhr2.responseText);
// 		      		if (result.fail) {
// 		      			divResult.innerHTML = "<font color='red' >"
// 							+ result.fail + "</font>";
// 			  		} else if (result.success) {
// 			  			window.location.href = "<c:url value='/attractionsMain.controller'/>";
// 		      		}    
// 				}
// 			}    
// 		}    
// 	});
   updateData.onclick = function() {
		hasError = false;
   		// 讀取欄位資料	
		var nameValue = document.getElementById("name").value;
		var countiesValue = document.getElementById("counties").value;
		var addressValue = document.getElementById("address").value;
		var imageValue = document.getElementById("image").value;
		var introductionValue = document.getElementById("introduction").value;
		var countValue = document.getElementById("count").value;
		
		var sp1 = document.getElementById('sp1');
		var sp2 = document.getElementById('sp2');
		var sp3 = document.getElementById('sp3');
		var sp4 = document.getElementById('sp4');
		var sp5 = document.getElementById('sp5');
		
		if (!nameValue){
			setErrorFor(sp1, "請輸入景點");
   		} 	else {
   			sp1.innerHTML = "";
   		}
		if (!countiesValue){
			setErrorFor(sp2, "請輸入縣市");
		} else {
			sp2.innerHTML = "";
		}
		if (!addressValue){
			setErrorFor(sp3, "請輸入地址");
		} else {
			sp3.innerHTML = "";
		}
   		if (!imageValue){
			setErrorFor(sp4, "請選擇照片");
		} else {
			sp4.innerHTML = "";
   		}
   		if (!introductionValue){
			setErrorFor(sp5, "不可空白");  
   		} else {
   			sp5.innerHTML = "";
   		}
   		if (hasError){
       		return false;
   		}
   		
   		var xhr1 = new XMLHttpRequest();
   		xhr1.open("PUT", "<c:url value='/attractions/' />" + key, true);
		var jsonAt = {				
			"name": nameValue, 	
			"counties": countiesValue,
			"address": addressValue,
			"image": imageValue,
			"introduction": introductionValue,
			"count" : countValue
   		}
   		xhr1.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
   		xhr1.send(JSON.stringify(jsonAt));
   
 
   	  
   		xhr1.onreadystatechange = function() {
				// 伺服器請求完成
   		if (xhr1.readyState == 4 && (xhr1.status == 200 || xhr1.status == 201) ) {
      		result = JSON.parse(xhr1.responseText);
      		if (result.fail) {
		 		divResult.innerHTML = "<font color='red' >"
					+ result.fail + "</font>";
	  		} else if (result.success) {
				divResult.innerHTML = " ";
					sp1.innerHTML = "";
					sp2.innerHTML = "";
					sp3.innerHTML = "";
					sp4.innerHTML = "";
					sp5.innerHTML = "";	
					
					swal({
						  icon: "success",
						  title: "修改成功",
						  button: {
							    text: "確定",   
						  },
					});	 
	 		} else {
				if (result.nameError) {
					sp1.innerHTML = "<font color='green' size='-2'>"
						+ result.nameError + "</font>";
				} else {
					sp1.innerHTML = "";
	   			}
				if (result.countiesError) {
					sp2.innerHTML = "<font color='green' size='-2'>"
						+ result.countiesError + "</font>";
				} else {
					sp2.innerHTML = "";
    			}
				if (result.addressError) {
					sp3.innerHTML = "<font color='green' size='-2'>"
						+ result.addressError + "</font>";
				} else {
					sp3.innerHTML = "";
				}
				if (result.imageError) {
					sp4.innerHTML = "<font color='green' size='-2'>"
						+ result.imageError + "</font>";
				} else {
					sp4.innerHTML = "";
				}
				if (result.introductionError) {
					sp5.innerHTML = "<font color='green' size='-2'>"
	     				+ result.introductionError + "</font>";
				} else {
					sp5.innerHTML = "";
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
					<li class="breadcrumb-item"><a
						href="<c:url value='/attractionsMain.controller'/>"><font
							style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">回景點首頁</font></font></a></li>
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
								<h2>修改/刪除景點資料</h2>
								</br>
								<div>
									<input type="hidden" class="form-control" id="pk" name="pk">
									<input type="hidden" class="form-control" id="count" name="count">
								</div>

								<div>
									<label for="name">
										<font style="vertical-align: inherit;">景點名稱</font>
											<span class="text-danger">
												<font style="vertical-align: inherit;">*</font>
											</span> 
									</label>
									<div class="form-group">
										<input type="text" class="form-control input-default" id="name" name="name"> 
										<span id="sp1" class="invalid-feedback animated fadeInDown" style="display: block;"></span>
									</div>
								</div>

								<div>
									<label for="counties">
										<font style="vertical-align: inherit;">縣市</font>
											<span class="text-danger">
												<font style="vertical-align: inherit;">*</font>
											</span> 
									</label>
									<div class="form-group">
										<input type="text" class="form-control input-default" id="counties" name="counties"> 
										<span id="sp2" class="invalid-feedback animated fadeInDown" style="display: block;"></span>
									</div>
								</div>

								<div>
									<label for="address">
										<font style="vertical-align: inherit;">完整地址</font>
											<span class="text-danger"> 
												<font style="vertical-align: inherit;">*</font>
											</span> 
									</label>
									<div class="form-group">
										<input type="text" class="form-control input-default" id="address" name="address"> 
										<span id="sp3" class="invalid-feedback animated fadeInDown" style="display: block;"></span>
									</div>
								</div>

								<div>
									<label for="image">
										<font style="vertical-align: inherit;">照片</font>
											<span class="text-danger">
												<font style="vertical-align: inherit;">*</font>
											</span> 
									</label>
									<div class="form-group">
										<input type="hidden" class="form-control input-default" name="image" id="image"> 
										<img src="#" id="image_img" width="350px" height="230px"> 
										<span id="sp4" class="invalid-feedback animated fadeInDown" style="display: block;"></span>
									</div>
								</div>

								<div>
									<label for="introduction">
										<font style="vertical-align: inherit;">介紹</font>
											<span class="text-danger">
												<font style="vertical-align: inherit;">*</font>
											</span> 
									</label>
									<div class="form-group">
										<textarea class="form-control input-default" id="introduction" rows="6"></textarea>
										<span id="sp5" class="invalid-feedback animated fadeInDown" style="display: block;"></span>
									</div>
								</div>

								<div>
									<button class="btn btn-warning" id='updateData'>修改</button>
									<button class="btn btn-danger" id='deleteData'>刪除此筆資料</button>
									<span id="resultMsg"></span>
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

	<script	src="${pageContext.request.contextPath}/plugins/common/common.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/custom.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/settings.js"></script>
	<script src="${pageContext.request.contextPath}/js/gleek.js"></script>
	<script src="${pageContext.request.contextPath}/js/styleSwitcher.js"></script>

	<script	src="${pageContext.request.contextPath}/plugins/validation/jquery.validate.min.js"></script>
	<script	src="${pageContext.request.contextPath}/plugins/validation/jquery.validate-init.js"></script>

</body>

</html>