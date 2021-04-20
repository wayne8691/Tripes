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
											<th>訂購會員</th>
											<th>付款金額</th>
											<th>購買日期</th>
											<th>退房申請數量</th>
											<th width="350px">管理購買商品</th>
										</tr>
									</thead>
									<tbody>
								        <%int i=0; %>
										<c:forEach var="orders" items="${order}"  varStatus="i">
										
											<tr>
												<td>${orders.id}</td>
												<td>${orders.member_id}</td>
												<td>${orders.sumPrice}</td>
												<td>${orders.date}</td>
												<td>${count[i.index]}</td>
												<td><button class="btn btn-dark" type='button' value='${orders.id}'
														onclick="product(this);">檢視房間</button>
													<button  class="btn btn-dark" type='button' value='${orders.id}'
														onclick="productout(this);">退房處理</button>
													<button class="btn btn-dark" type='button' value='${orders.id}'
														onclick="productoutNotOut(this);">無法退房</button>
												</td>
											</tr>
										
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<th>訂單編號</th>
											<th>訂購會員</th>
											<th>付款金額</th>
											<th>購買日期</th>
											<th>管理購買商品</th>
											<th>退房申請數量</th>
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
		function product(id) {
			console.log(id.value)
			var xhr = new XMLHttpRequest();
			xhr.open("Post", "<c:url value='/Manager/ManagerAllproducts'/>", true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.send("id=" + id.value);

			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					
					result =JSON.parse(xhr.responseText);
				   console.log(result)
					window.location.assign(result.url);
				}

			}
		}

		function productout(id) {
			console.log(id.value)
			var xhr = new XMLHttpRequest();
			xhr.open("Post", "<c:url value='/productouts/Manager'/>", true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.send("id=" + id.value);

			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					window.location.assign("http://localhost:8080/Managerproducts");
							
				}
			}
		}
		function productoutNotOut(id) {
			console.log(id.value)
			var xhr = new XMLHttpRequest();
			xhr.open("Post", "<c:url value='/Manager/notrppmout'/>", true);
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xhr.send("id=" + id.value);

			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					window.location.assign("http://localhost:8080/Managerproductsnotout");
							
				}

			}
		}
	</script>
</body>

</html>