<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
		.previewuser{
 			position:fixed;
 			bottom: 15%;
  			left: 40%;
 			width: 600px;
  			height: 500px;
  			border:1px solid #888888;
  			background-color: #F5F5F5;
  			box-shadow:0px 0px 10px;
  			padding: 10px;
  			transform:translate(-100px,0px);
  			display:none;
  			z-index:1;
		}
		.close{
  			position: absolute;
  			top: 0px;
  			right: 5px;
  			cursor:pointer;/*cursor游標pointer指針:改變鼠標*/
		}
</style>
<script>
window.onload = function(){
	var btnn = document.getElementById("btnn");
	var dialog = document.getElementById("dialog");
	var x = document.getElementById("x");
	var title = document.getElementById("title");
	var content = document.getElementById("content");
	
	var commentlog = document.getElementById("commentlog");
	var x1 = document.getElementById("x1");
	var comment = document.getElementById("comment");
	var artuserid = document.getElementById("artuserid");
	
	x.onclick = function(){
		title.value="";
		content.value="";
		
		dialog.style.display="none";
	}
	x1.onclick = function(){
		comment.value="";
		artuserid.value="";
		
		commentlog.style.display="none";
	}
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
										<%int i=0 ;  %>
										<c:forEach var="article" items="${al}">
											<tr>
												<td>${article.articleid_pk}</td>
												<td>${article.title}</td>
												<td>${article.artsubversion}</td>
												<td><button class="btn btn-dark" type='button' value="<%=i %>"
														onclick="article(this)">文章內容</button>
														</td>
												
												<td>${article.artclickcount}</td>
												<td>${article.useridString}</td>
												<td>${article.publishtime}</td>
												<td><button class="btn btn-dark" type='button' value="<%=i %>"
														onclick="comment(this)">${article.commentBeanArticle_id.size()}</button></td>
												<td><button class="btn btn-dark" type='button' value='<%=i %>'
														onclick="article(this);">操作</button></td>
											</tr>
											<%i++; %>
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
	<div class="previewuser" id="dialog">
			<div class="close" id="x">x</div><br>
			<div align="center"><h2>詳細資料</h2></div><br>
			<div >
				<div >
						<div class="widget personal-info">
							
								<!-- Article Title -->
								<div class="form-group">
									<label for="title">標題</label>
									<input type="text" class="form-control" id="title" size="80" readonly>
								</div>
								
								<!-- Article Content -->
								<div class="form-group">
									<label for="content">內容</label>
									<textarea class="form-control" id="content" readonly cols="50"></textarea>
								</div>
						</div>
				</div>
		</div>
	</div>
	<div class="previewuser" id="commentlog">
			<div class="close" id="x1">x</div><br>
			<div align="center"><h2>留言數</h2></div><br>
			<div >
				<div >
						<div class="widget personal-info">
							
								<!-- Article Title -->
								<div class="form-group">
									<label for="title">留言內容</label>
									<textarea  class="form-control" id="comment" readonly ></textarea>
								</div>
								
								<!-- Article Content -->
								<div class="form-group">
									<label for="content">會員名稱</label>
									<input type="text" class="form-control" id="artuserid" readonly>
								</div>
						</div>
				</div>
		</div>
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
		var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='article.controller' />", true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 201)) {
			
			var article = JSON.parse(xhr.responseText);
			
			var str = "";
			
			
			title.value=article[id.value].title;
			content.value=article[id.value].contenet;
			console.log(article)
		} 
  	}
	dialog.style.display="block";
}
	function comment(idd) {
		var xhr = new XMLHttpRequest();
	xhr.open("GET", "<c:url value='article.controller' />", true);
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr.send();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 201)) {
			
			var comment = JSON.parse(xhr.responseText);
			
			var str = "";
			
			
			comment.value=comment[idd.value].comment;
			artuserid.value=comment[idd.value].useridString;
			console.log(article)
		} 
  	}
	commentlog.style.display="block";
}
	</script>
	
</body>

</html>