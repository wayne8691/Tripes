<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>餐廳首頁</title>

    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/homeStyle.css"  rel="stylesheet">
	
<script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">

// window.onload = function() {
// 	    var divs = document.getElementById("area1");
// 		var xhr = new XMLHttpRequest();
// 		var xhr2 = new XMLHttpRequest();
// 		xhr.open("GET", "<c:url value='/getAllRestaurants' />", true);
// 		xhr.send();
// 		xhr.onreadystatechange = function() {
// 			if (xhr.readyState == 4 && xhr.status == 200) {
// 				var restaurant = JSON.parse(xhr.responseText);
// 				divs.append("<thead><tr align='center'><th style='width: 50px;'>編輯</th><th style='width: 60px;'>編號</th><th style='width: 80px;'>餐廳名稱</th><th style='width: 70px;'>縣市</th>"
// 					   + "<th style='width: 150px;'>完整地址</th><th style='width: 80px;'>營業時間</th><th style='width: 60px;'>店家電話</th><th style='width: 50px;'>美食種類</th><th style='width: 100px;'>照片</th><th style='width: 150px;'>介紹</th></tr></thead>" 
// 					   + "<tbody>");
// 				for(var i=0; i < restaurant.length; i++){
// 					restaurantEdit = "<c:url value='/restaurantEdit/' />";					
// 					var  content = 	"<tr><td align='center'> <a href='" + restaurantEdit + restaurant[i].pk + "'>" 
// 	          		 				 + "<i class='far fa-edit'></i>"
// 		          		 			 +"</a></td>"
// 						   		+ "<td align='center'>" + restaurant[i].pk + "</td>" 
// 						   		+ "<td align='center'>" + restaurant[i].nameRe + "</td>" 
// 						   		+ "<td align='center'>" + restaurant[i].countiesRe + "</td>" 
// 						   		+ "<td align='center'>" + restaurant[i].addressRe + "</td>" 
// 						   		+ "<td align='center'>" + restaurant[i].hoursRe + "</td>" 
// 						   		+ "<td align='center'> " + restaurant[i].phoneRe + "</td>" 
// 						   		+ "<td align='center'>" + restaurant[i].categoryRe + "</td>" 
// 						   		+ "<td align='center'>" +"<img src='" +  restaurant[i].imageRe + "' width='250px' height='156px'>" + "</td>" 
// 						   		+ "<td>" + restaurant[i].introductionRe + "</td></tr>";
// 				}
// 				content += "</tbody></table>";			
// 				divs.append(content);
// 			}
// 		}
// }
		
		var indexPage = 1;
		$(document).ready(function(){
		    load(indexPage);
		});
		function change(page){
			indexPage = page;
		    load(indexPage);
		}
		function load(indexPage){
			console.log("indexPage:" + indexPage);
			$.ajax({
				type:'post',
				url:'/attractions.Restaurant/queryAllRestaurantByPage.controller/' + indexPage,
				dataType:'JSON',
				contentType:'application/json',
				success: function(data) {
					var json = JSON.stringify(data, null, 4);
				    console.log("SUCCESS : ", json);
				    var parsedObjinArray = JSON.parse(json);
				    var j =1;
				    $('#table_id').empty(""); //清空table內的資料
						if(json = null){
					    	$('table').prepend("<tr><td colspan='7' align='center'>暫無資料</td></tr>");
					    }else{
							var table = $('#table_id');
						    attractionsEdit = "<c:url value='/restaurantEdit/' />";
						    table.append("<thead><tr align='center'>"
						    				+ "<th style='width: 30px;'>編輯</th>"
											+ "<th style='width: 30px;'>項目</th>"
											+ "<th style='width: 100px;'>餐廳名稱</th>"
									    	+ "<th style='width: 40px;'>縣市</th>"
									    	+ "<th style='width: 150px;'>完整地址</th>"
									    	+ "<th style='width: 80px;'>營業時間</th>" 
									    	+ "<th style='width: 60px;'>店家電話</th>"
									    	+ "<th style='width: 80px;'>美食種類</th>"				
									    	+ "<th style='width: 150px;'>照片</th>" 
									    	+ "<th style='width: 400px;'>介紹</th>" 
								    	+ "</tr></thead><tbody>");

						    $.each(parsedObjinArray,function(i,n){
								var tr = "<tr>"
								          	+" <td align='center'> <a href='" + attractionsEdit + n.pk + "'><i class='far fa-edit'></i></a></td>"
								          	+ "<td align='center'>" + j + "</td>"
								            + "<td align='center'>" + n.nameRe + "</td>" 
								            + "<td align='center'>" + n.countiesRe + "</td>" 
								            + "<td align='center'>" + n.addressRe + "</td>" 
								            + "<td align='center'>" + n.hoursRe + "</td>" 
								            + "<td align='center'>" + n.phoneRe + "</td>" 
								            + "<td align='center'>" + n.categoryRe + "</td>" 
								            + "<td align='center'>" +"<img src='" + n.imageRe + "' width='250px' height='156px'>" + "</td>" 
								            + "<td align='center'>" + n.introductionRe + "</td>" 
							             + "</tr>";
							    table.append(tr);
							    j =j+1; 
						   });
						    table.append("</tbody><tfoot><tr align='center'>"
						    				+" <th>編輯</th><th>編號</th><th>餐廳名稱</th><th>縣市</th><th>完整地址</th><th>營業時間</th><th>店家電話</th><th>美食種類</th><th>照片</th><th>介紹</th>"
						    				+"</tr></tfoot>");	
					  }
				   },
				   error: function() {
				       console.log("error");
				   }
			  });
	 	}	
</script>
</head>
<jsp:include page="../managementnav.jsp" flush="true"></jsp:include>

<body>
<!--**********************************
    Content body start
***********************************-->
 <div class="content-body">
	<div class="row page-titles mx-0">
        <div class="col p-md-0">
             <ol class="breadcrumb">
                 <li class="breadcrumb-item">
	                 <a href="<c:url value=' http://localhost:8080/managememberchart.controller'/>" > 
	                 	<font style="vertical-align: inherit;">回首頁</font>
	                 </a>
                 	<font style="vertical-align: inherit;">></font>
	                 <a href="<c:url value='/restaurantMain.controller'/>" name="gotoTitle">
		                 <font style="vertical-align: inherit;">餐廳管理</font>
	                 </a>
                 </li>
             </ol>
        </div>
    </div>
      <!-- row -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title" >餐廳管理</h3> 
	                                <div  style='text-align:right;'>
	                                	<a href="<c:url value='/reInitMain.controller'/>" style='color:	#005AB5;'><button type="button" class="btn btn-primary">+新增餐廳</button></a>
	                                </div>
		 				                           		
								<!--  資料顯示  -->
									<table class='table table-striped table-bordered zero-configuration dataTable' id='table_id' role='grid' aria-describedby='DataTables_Table_0_info'>														
									</table>
								<!--  分頁  -->
									<table id="showpage" class='table   zero-configuration'>
										<tr>
											<td align="right">  
											<c:forEach var="i" begin="1" end="${totalPages}" step="1">
												<a href="#gotoTitle"><button id="myPage" value="${i}" onclick="change(${i})" class="btn mb-1 btn-rounded btn-secondary">${i}</button></a>
											</c:forEach>
											共${totalPages}頁  <%--  總筆數:${totalElements} --%>
											</td>
										</tr>										
									</table>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>  
              <!-- #/ container -->
       	</div>      
            



    <!--**********************************
        Scripts
    ***********************************-->
    <script src="${pageContext.request.contextPath}/plugins/common/common.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/js/gleek.js"></script>
    <script src="${pageContext.request.contextPath}/js/styleSwitcher.js"></script>

    <script src="${pageContext.request.contextPath}/plugins/tables/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/tables/js/datatable/dataTables.bootstrap4.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/tables/js/datatable-init/datatable-basic.min.js"></script>	 
	 
</body>
</html>