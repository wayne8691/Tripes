<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importHead.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
window.onload = function(){
	var xhr0 = new XMLHttpRequest();
	xhr0.open("GET", "<c:url value='/getbrowserrecord' />", true);
	xhr0.send();
	xhr0.onreadystatechange = function() {
		// 伺服器請求完成
		if (xhr0.readyState == 4 && (xhr0.status == 200 || xhr0.status == 201) ) {
			var result = JSON.parse(xhr0.responseText);
			
			if(${browserpagelength}==0){
				var allcontent = document.getElementById("allcontent");
				var nocontent = document.getElementById("nocontent");
				allcontent.style.display = "none";
				nocontent.style.display = "";
			}else{
			
			for(let i=1 ; i<=result.countt ; i++){
				var str = "product" + i
				var str1 = "content" + i
				var str2 = "datee" + i
				var str3 = "chimg" + i
				var str4 = "arecord" + i
				var product = document.getElementById(str);
				var content = document.getElementById(str1);
				var datee = document.getElementById(str2);
				var chimg = document.getElementById(str3);
				var arecord = document.getElementById(str4);
				product.innerHTML = result.list[i-1].browserecord;
				content.innerHTML = result.list1[i-1];
				datee.innerHTML = result.list[i-1].browsetime;
				chimg.src = result.list2[i-1];
				arecord.href = result.list3[i-1];
				if(result.countt!=3){
					for(let i=result.countt+1 ; i<=3 ; i++){
						var str0 = "single" + i
						var single = document.getElementById(str0);
						console.log(single.style.display)
						single.style.display = "none";
					}
				}
			}
			}
			
		} 
  	}
}
</script>
<title>Insert title here</title>
</head>
<jsp:include page="../webnav.jsp" flush="true"></jsp:include>
<body>
	<section class="user-profile section  background">
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
								<label for="imgInp"> <img src="${loginuser.getImage1()}"
									alt="" class="" id="preview_progressbarTW_img" />
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
								<li><a class="my-1 d-inline-block"
									href="${pageContext.request.contextPath}/userprofile.controller">編輯個人資料</a></li>
								<li><a class="my-1 d-inline-block"
									href="${pageContext.request.contextPath}/userpassword.controller">修改密碼</a></li>
								<li><a class="my-1 d-inline-block"
									href="${pageContext.request.contextPath}/userloginrecord.controller">登入記錄</a></li>
								<li><a class="my-1 d-inline-block" href="${pageContext.request.contextPath}/bsrecord.controller">瀏覽記錄</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-10 offset-md-1 col-lg-9 offset-lg-0">
					<div class="widget welcome-message">
						<h2>瀏覽紀錄</h2>
					</div>

					<!-- list -->
					<div id="allcontent">
					<c:forEach begin="1" end="3" var="i" >
					<div class="ad-listing-list mt-20">
						<div class="row p-lg-3 p-sm-5 p-4" id="single${i}">
							<div class="col-lg-4 align-self-center">
								<a href="#" id="arecord${i}"> <img
									src=""  alt=""  width="200px" height="150px" id="chimg${i}" >
								</a>
							</div>
							<div class="col-lg-8">
								<div class="row">
									<div class="col-lg-6 col-md-10">
										<div class="ad-listing-content">
											<div id="product${i}">
												
											</div>
											<ul class="list-inline mt-2 mb-3">
												
											</ul>
											<p class="pr-5" id="content${i}"></p>
										</div>
									</div>
									<div class="col-lg-6 align-self-center">
										<div class="product-ratings float-lg-right pb-3" id="datee${i}">
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
					</div>
					<div align="center" style="display:none" id="nocontent">
						<h2>暫無資料</h2>
					</div>
					<!-- page -->
					<div class="pagination justify-content-center py-4">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
<!-- 								<li class="page-item"><a class="page-link" href="" -->
<!-- 									aria-label="Previous"> <span aria-hidden="true">&laquo;</span> -->
<!-- 										<span class="sr-only">Previous</span> -->
<!-- 								</a></li> -->
								<c:forEach begin="1" end="${browserpagelength}" var="i">
									<li class="page-item" id="page${i}"><button class="page-link" onclick="change(this)" value="${i}">${i}</button></li>
								</c:forEach>
<!-- 								<li class="page-item"><a class="page-link" href="" -->
<!-- 									aria-label="Next"> <span aria-hidden="true">&raquo;</span> -->
<!-- 										<span class="sr-only">Next</span> -->
<!-- 								</a></li> -->
							</ul>
						</nav>
					</div>

				</div>


			</div>
		</div>
	</section>
	<footer class="ftco-footer bg-bottom ftco-no-pt"
		style="background-image: url('${pageContext.request.contextPath}/static/images/bg_3.jpg');">
		<%@ include file="/WEB-INF/pages/trainandhotel/footer.jsp"%>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>
	<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importBody.jsp"%>
</body>
<script>
	function change(th){
		var xhr1 = new XMLHttpRequest();
		xhr1.open("GET", "<c:url value='/browserrecordpages/"+th.value+"' />", true);
		xhr1.send();
		xhr1.onreadystatechange = function() {
			// 伺服器請求完成
			if (xhr1.readyState == 4 && (xhr1.status == 200 || xhr1.status == 201) ) {
				var result = JSON.parse(xhr1.responseText);
				console.log(result.total)
				
				for(let i=1 ; i<=result.total ; i++){
					var str = "product" + i
					var str1 = "content" + i
					var str2 = "datee" + i
					var str3 = "chimg" + i
					var str4 = "arecord" + i
					var product = document.getElementById(str);
					var content = document.getElementById(str1);
					var datee = document.getElementById(str2);
					var chimg = document.getElementById(str3);
					var arecord = document.getElementById(str4);
					product.innerHTML = result.list2[i-1];
					content.innerHTML = result.list3[i-1];
					datee.innerHTML = result.list4[i-1];
					chimg.src = result.list1[i-1];
					arecord.href = result.list5[i-1];
					
					if(result.total!=3){
						for(let i=result.total+1 ; i<=3 ; i++){
							var str0 = "single" + i
							var single = document.getElementById(str0);
							console.log(single.style.display)
							single.style.display = "none";
						}
					}else{
						for(let i=1 ; i<=3 ; i++){
							var str0 = "single" + i
							var single = document.getElementById(str0);
							single.style.display = "";
						}
					}
				}
			} 
	  	}
		/* var ha = document.getElementById("page"+th.value);
		for(var i=1;i<4;i++){
			$('#page'+i).attr("class", "page-item");
		}
		for(var i=1;i<3;i++){
			var chimg = document.getElementById("chimg"+i);
			var product = document.getElementById("product"+i);
			var content = document.getElementById("content"+i);
			chimg.src="";
			product.innerHTML="456"
			content.innerHTML="123"	
		}
		console.log(th.value)
		$('#page'+th.value).attr("class", "page-item active"); */
		
	}
</script>
</html>