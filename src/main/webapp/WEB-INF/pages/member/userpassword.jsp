<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importHead.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	window.onload = function() {
		
		var userid = document.getElementById("userid");
		var newpassword = document.getElementById("new-password");
		var confirmpassword = document.getElementById("confirm-password");
		var updatepwd = document.getElementById("updatepwd");
		
		updatepwd.onclick = function(){
			var xhr2 = new XMLHttpRequest();
  			xhr2.open("Post","<c:url value='/upadatePwdaction' />",true); 
  			xhr2.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xhr2.send("newpassword=" + newpassword.value + "&confirmpassword=" + confirmpassword.value + "&userid=" + userid.value);
  	  		xhr2.onreadystatechange = function() {
			// 伺服器請求完成
				if (xhr2.readyState == 4 && (xhr2.status == 200 || xhr2.status == 201) ) {
					var result = JSON.parse(xhr2.responseText);
					
					if(result.success){
						Swal.fire('OK',"更改成功，請重新登錄!",'success').then(function() {window.location.assign("<c:url value='/login.controller' />");})
					} else if(result.fail){
						Swal.fire("Error!", result.fail , "error");
					}
				}
	  		}
		}
		
	}
</script>
<title>Insert title here</title>
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
						
						<!-- User Name -->
						<h5 class="text-center" id="ih2">${loginuser.getName()}</h5>
						<input type="hidden" id="userid" value="${loginuser.getUserid()}">
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
					<h2>更改密碼</h2>
					<p>定期更新您的密碼，讓帳戶安全有保障</p>
				</div>
				
				<!-- Personal read-only information -->
				<div class="row">
					
					
					<div class="col-lg-6 col-md-6">
						<!-- Change Password -->
					<div class="widget change-password">
						<h3 class="widget-header user">變更密碼</h3>
						
							<!-- New Password -->
							<div class="form-group">
								<label for="new-password">新密碼</label>
								<input type="password" class="form-control" id="new-password">
							</div>
							<!-- Confirm New Password -->
							<div class="form-group">
								<label for="confirm-password">確認新密碼</label>
								<input type="password" class="form-control" id="confirm-password">
							</div>
							<!-- Submit Button -->
							<button id="updatepwd" class="btn btn-transparent">確認更改</button>
							
					
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
</body>
</html>