<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.onload = function(){
		
		var xhr0 = new XMLHttpRequest();
		xhr0.open("Post","<c:url value='/getcustomernum' />",true); 
		xhr0.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xhr0.send();
		xhr0.onreadystatechange = function() {
				// 伺服器請求完成
				if (xhr0.readyState == 4 && (xhr0.status == 200 || xhr0.status == 201) ) {
					var result = JSON.parse(xhr0.responseText);
					var custernum = document.getElementById("custernum");
					var newcusterdate = document.getElementById("newcusterdate");
					var admin = document.getElementById("admin");
					custernum.innerHTML = result.list1.length;
					newcusterdate.innerHTML = result.list1[result.list1.length-1].registertime.substr(0,10);
					admin.innerHTML = result.list2.length;
				} 
		}
	
// 	//交易統計圖
// 	var xhr0 = new XMLHttpRequest();
// 	xhr0.open("Post","<c:url value='/getcustomernum' />",true); 
// 	xhr0.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
// 	xhr0.send();
// 	xhr0.onreadystatechange = function() {
// 			// 伺服器請求完成
// 			if (xhr0.readyState == 4 && (xhr0.status == 200 || xhr0.status == 201) ) {
// 				var result = JSON.parse(xhr0.responseText);
// 				var custernum = document.getElementById("custernum");
// 				var newcusterdate = document.getElementById("newcusterdate");
// 				var admin = document.getElementById("admin");
// 				custernum.innerHTML = result.list1.length;
// 				newcusterdate.innerHTML = result.list1[result.list1.length-1].registertime.substr(0,10);
// 				admin.innerHTML = result.list2.length;
// 			} 
// 	}
}
	
	
	
	
	
</script>
</head>
<jsp:include page="managementnav.jsp" flush="true"></jsp:include>
<body>
	<div class="content-body">
		<div class="container-fluid mt-3">
			<div class="row">
				<div class="col-lg-3 col-sm-6">
					<div class="card gradient-1">
						<div class="card-body">
							<h3 class="card-title text-white">交易次數</h3>
							<div class="d-inline-block">
								<h2 class="text-white"></h2>
								<p class="text-white mb-0"></p>
							</div>
							<span class="float-right display-5 opacity-5"><i
								class="fa fa-shopping-cart"></i></span>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="card gradient-2">
						<div class="card-body">
							<h3 class="card-title text-white">交易總金額</h3>
							<div class="d-inline-block">
								<h2 class="text-white" id='price'></h2>
								<p class="text-white mb-0" id='nowDate'></p>
							</div>
							<span class="float-right display-5 opacity-5"><i
								class="fa fa-money"></i></span>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="card gradient-3">
						<div class="card-body">
							<h3 class="card-title text-white">用戶人數</h3>
							<div class="d-inline-block">
								<h2 class="text-white" id="custernum"></h2>
								<p class="text-white mb-0" id="newcusterdate"></p>
							</div>
							<span class="float-right display-5 opacity-5"><i
								class="fa fa-users"></i></span>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="card gradient-4">
						<div class="card-body">
							<h3 class="card-title text-white">管理員</h3>
							<div class="d-inline-block">
								<h2 class="text-white" id="admin"></h2>
								<p class="text-white mb-0"></p>
							</div>
							<span class="float-right display-5 opacity-5"><i
								class="fas fa-user-secret"></i></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<!--**********************************
        Scripts
    ***********************************-->
    <script src="${pageContext.request.contextPath}/managementplugins/common/common.min.js"></script>
    <script src="${pageContext.request.contextPath}/managementjs/custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/managementjs/settings.js"></script>
    <script src="${pageContext.request.contextPath}/managementjs/gleek.js"></script>
    <script src="${pageContext.request.contextPath}/managementjs/styleSwitcher.js"></script>

    <!-- Chartjs -->
    <script src="${pageContext.request.contextPath}/managementplugins/chart.js/Chart.bundle.min.js"></script>
    <!-- Circle progress -->
    <script src="${pageContext.request.contextPath}/managementplugins/circle-progress/circle-progress.min.js"></script>
    <!-- Datamap -->
    <script src="${pageContext.request.contextPath}/managementplugins/d3v3/index.js"></script>
    <script src="${pageContext.request.contextPath}/managementplugins/topojson/topojson.min.js"></script>
    <!-- Morrisjs -->
    <script src="${pageContext.request.contextPath}/managementplugins/raphael/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath}/managementplugins/morris/morris.min.js"></script>
    <!-- Pignose Calender -->
    <script src="${pageContext.request.contextPath}/managementplugins/moment/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/managementplugins/pg-calendar/js/pignose.calendar.min.js"></script>
    <!-- ChartistJS -->
    <script src="${pageContext.request.contextPath}/managementplugins/chartist/js/chartist.min.js"></script>
    <script src="${pageContext.request.contextPath}/managementplugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>


	<script src="${pageContext.request.contextPath}/managementplugins/tables/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/managementplugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
    <script src="${pageContext.request.contextPath}/managementplugins/tables/js/datatable-init/datatable-basic.min.js"></script>
</html>