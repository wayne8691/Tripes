<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script>
	window.onload = function() {

	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="../managementnav.jsp" flush="true"></jsp:include>
<body>
	<div class="content-body">

		<!-- row -->

		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">Data Table</h4>
							<div class="table-responsive" id="ttt">
								<table
									class="table table-striped table-bordered zero-configuration">
									<thead>
										<tr>
											
											<th>訂購編號</th>
											<th>房間名稱</th>
											<th>入住日期</th>
											<th>退房日期</th>
							
										</tr>
									</thead>
									<tbody>
										<c:forEach begin="1"  end="${productAllsize}" var="i">
											<tr>
<%-- 												<td><select onchange="p1(this,'${productout.get(i-1).id}')" id="select${i}"> --%>
<!-- 														<option value="selects">請選擇</option> -->
<!-- 														<option value="Hotelout">確認退房</option> -->
<!-- 														<option value="NotHotelout">拒絕退房</option> -->
<!-- 												</select></td> -->
												<td>${productAll.get(i-1).getId()}</td>
												<td>${productAll.get(i-1).getHotel_id().getHotel().getName()}${productAll.get(i-1).getHotel_id().getName()}</td>
												<td>${productAll.get(i-1).getStarday()}</td>
												<td>${productAll.get(i-1).getEndday()}</td>
												
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											
											<th>訂購編號</th>
											<th>房間名稱</th>
											<th>入住日期</th>
											<th>退房日期</th>
											
										</tr>
									</tfoot>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- #/ container -->
	</div>
	
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
	
	
	<script>
// 		function p1(th, idd) {
// 			console.log(idd)
// 			var xhr = new XMLHttpRequest();
// 			xhr.open("Post", "<c:url value='/Manager/productcheckout' />", true);
// 			xhr.setRequestHeader("Content-Type",
// 					"application/x-www-form-urlencoded");
// 			xhr.send("id=" + idd + "&type=" + th.value)
// 			xhr.onreadystatechange = function() {
// 				if (xhr.readyState == 4 && xhr.status == 200) {
// 					console.log(idd)
// 					window.location.assign("<c:url value='/Manager/productoutsAfter' />");
					

// 				}
// 			}
// 		}
	</script>
	
</body>

</html>