<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有套裝行程</title>

	<script>
		function check(id) {
			console.log(id.value)
			var xhr = new XMLHttpRequest();
			xhr.open("Post", "<c:url value='/travelGroup/getAllGroupsDate'/>", true);
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xhr.send("id=" + id.value);

			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					
					result =JSON.parse(xhr.responseText);
				    console.log(result)
					window.location.assign(result.url);
				}

			}
		}
	</script>
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
											<th>團名ID</th>
											<th>行程名稱</th>
											<th>照片</th>
											<th>銷售價</th>
											<th>出發地點</th>
											<th>目的地</th>
											<th>旅遊天數</th>
											<th>主要特點</th>
											<th>查看</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="groups" items="${getAllGroups}">
											<tr>
												<td>${groups.id}</td>
												<td>${groups.name}</td>
												<td> <img src="${groups.image}" height="200px" width="250px"></td>
												<td>${groups.price}</td>
												<td>${groups.origin}</td>
												<td>${groups.destination}</td>
												<td>${groups.day}</td>
												<td>${groups.feature}</td>
												<td><button class="btn btn-dark" type='button' value='${groups.id}'
														onclick="check(this);">查看</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<th>團名ID</th>
											<th>行程名稱</th>
											<th>照片</th>
											<th>銷售價</th>
											<th>出發地點</th>
											<th>目的地</th>
											<th>旅遊天數</th>
											<th>主要特點</th>
											<th>查看</th>
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
</body>
</html>