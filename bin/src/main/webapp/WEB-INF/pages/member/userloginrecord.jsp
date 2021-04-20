<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/trainandhotel/hotel/importHead.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
		<div class="widget welcome-message">
					<h2>登入紀錄</h2>
				</div>
		<table border="1" class="st" id="table">
  		<thead>
  			<tr>
    			<th>登入時間</th>
    			<th>最後使用時間</th>
    		</tr>
    	</thead> 
    	<tbody>
    		<c:forEach begin="1" end="${loginrecordlist.size()}" var="i">
    		<tr>
	    			<td>${loginrecordlist.get(i-1).getLogin_time()}</td>
	    		<td>${loginrecordlist.get(i-1).getLogout_time()}</td>
    		</tr>
    		</c:forEach>
    	</tbody>
  		</table>
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
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- DataTables v1.10.16 -->
<link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet" />
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script>
$(function(){
    $('#table').DataTable({
        "searching": true, //搜尋功能, 預設是開啟
        "paging": true, //分頁功能, 預設是開啟
        order: [[1, 'des']], //排序功能, 預設是開啟
        "lengthMenu": [ 8, 10, 20],
        "pageinate":{
            "first":"第一頁",
            "previous":"上一頁",
            "next":"下一頁",
            "last":"最後一頁"
        }
    });
})
</script>
</html>