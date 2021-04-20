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
<title>討論區</title>
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
							<h4 class="card-title">文章列表</h4>
							<div class="table-responsive" id="ttt">
								<table
									class="table table-striped table-bordered zero-configuration">
									<thead>
										<tr>
											<th>文章編號</th>
											<th>文章名稱</th>
											<th>文章子版</th>
											<th>文章內容</th>
											<th>點閱率</th>
											<th>發文者名稱</th>
											<th>發文時間</th>
											<th>留言數</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="article" items="${al}">
											<tr>
												<td>${article.articleid_pk}</td>
												<td>${article.title}</td>
												<td>${article.artsubversion}</td>
												<td><button class="btn btn-dark" type='button' value='${article.contenet}'
														onclick="article(this);">文章內容</button>
														</td>
												<td>${article.artclickcount}</td>
												<td>${article.useridString}</td>
												<td>${article.publishtime}</td>
												<td>124</td>
												<td><button class="btn btn-dark" type='button' value='${article}'
														onclick="article(this);">操作</button></td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<th>文章編號</th>
											<th>文章名稱</th>
											<th>文章子版</th>
											<th>文章內容</th>
											<th>點閱率</th>
											<th>發文者名稱</th>
											<th>發文時間</th>
											<th>留言數</th>
											<th>操作</th>
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
	function article(id) {
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
	</script>
	
</body>

</html>