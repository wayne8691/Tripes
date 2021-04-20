<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>景點首頁</title>

    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="${pageContext.request.contextPath}/plugins/tables/css/datatable/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/userstyle.css"  rel="stylesheet">
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">


// 	 window.onload = function() {
		
// 			var xhr = new XMLHttpRequest();
// 			var xhr2 = new XMLHttpRequest();
// 			xhr.open("GET", "<c:url value='attractions.getAllAttractions' />", true);
// 			xhr.send();
// 			xhr.onreadystatechange = function() {
// 				if (xhr.readyState == 4 && xhr.status == 200) {
// 					var content = "<table class='table table-striped table-bordered zero-configuration dataTable' id='table_id' role='grid' aria-describedby='DataTables_Table_0_info'>";
								
// 					content += " <thead><tr align='center'><th style='width: 30px;'>編輯</th>"
// 							+ "<th style='width: 30px;'>編號</th>"
// 							+ "<th style='width: 100px;'>景點名稱</th>"
// 						    + "<th style='width: 40px;'>縣市</th> <th style='width: 250px;'>完整地址</th> <th style='width: 150px;'>照片</th> <th style='width: 400px;'>介紹</th> " 
// 						    + "</tr></thead>" 
// 						    + "<tbody>";
// 					var attractions = JSON.parse(xhr.responseText);
// // 					alert(attractions);
// 					for(var i=0; i < attractions.length; i++){
// 						attractionsEdit = "<c:url value='/attractionsEdit/' />";
// 		    		    content += 	"<tr><td align='center'> <a href='" + attractionsEdit + attractions[i].pk + "'>" 
//  						          		  + "<i class='far fa-edit'></i>"
//  						          		  +"</a></td>"
// 									   + "<td align='center'>" + attractions[i].pk + "</td>" 
// 								 	   + "<td align='center'>" + attractions[i].name + "</td>" 
// 							           + "<td align='center'>" + attractions[i].counties + "</td>" 
// 							           + "<td align='center'>" + attractions[i].address + "</td>" 
// 							           + "<td align='center'>" +"<img src='" + attractions[i].image + "' width='250px' height='156px'>" + "</td>" 
// 							           + "<td>" + attractions[i].introduction + "</td></tr>";
// 					}
// 					content += "</tbody>"
//  							+"<tfoot><tr align='center'><th>編輯</th><th>編號</th><th>景點名稱</th>"
//  							+"<th>縣市</th><th>完整地址</th><th>照片</th><th>介紹</th></tr></tfoot>"
// 						 + "</table>";
// 					var divs = document.getElementById("area1");
// 					divs.innerHTML = content;
// 				}
// 			}
// 			console.log("hello");
// 	 }
// 		$(document).ready( function () {
// 			 $('#table_id').DataTable();
// 		} );
		
	var indexPage = 1;
	var totalPages;
		$(document).ready(function(){
		    load(indexPage);
		    load(totalPages);
		});
	
		function change(page){
			indexPage = page;
		    load(indexPage);
		}
		function back(){
			if(indexPage > 1){
		    indexPage = indexPage - 1;
		    load(indexPage);
			}
		}
		function next(totalPagesValue){
			if(indexPage < totalPagesValue){
				indexPage = indexPage + 1;
				load(indexPage);
			}	
		} 

		function load(indexPage){
			console.log("indexPage:" + indexPage);
			$.ajax({
				type:'post',
				url:'/attractions/queryAllAttractionsByPage.controller/' + indexPage,
				dataType:'JSON',
				contentType:'application/json',
				success: function(data) {
					var j =1;
					var json = JSON.stringify(data, null, 4);
				    console.log("SUCCESS : ", json);
				    var parsedObjinArray = JSON.parse(json);
				    $('#table_id').empty(""); //清空table內的資料
						if(json = null){
					    	$('table').prepend("<tr><td colspan='7' align='center'>暫無資料</td></tr>");
					    }else{
					    	console.log(parsedObjinArray)
							var table = $('#table_id');
						    attractionsEdit = "<c:url value='/attractionsEdit/' />";
						    table.append("<thead><tr align='center'>"
						    				+" <th style='width: 5%;'>編輯</th>"
											+ "<th style='width: 5%;'>項目</th>"
											+ "<th style='width: 10%;'>景點名稱</th>"
									    	+ "<th style='width: 20%;'>完整地址</th>"
									    	+ "<th style='width: 15%;'>照片</th>" 
									    	+ "<th style='width: 45%;'>介紹</th>" 
								    	+ "</tr></thead><tbody>");
						    $.each(parsedObjinArray,function(i,n){
								var tr = "<tr>"
								          	+" <td align='center' style='font-size:18px;'> <a href='" + attractionsEdit + parsedObjinArray[j-1].pk + "'><i class='far fa-edit'></i></a></td>"
								          	+ "<td align='center'>" + j + "</td>"
								            + "<td align='center'>" + n.name + "</td>" 
								            + "<td align='center'>" + n.address + "</td>" 
								            + "<td align='center'>" +"<img src='" + n.image + "' width='200px' height='125px'>" + "</td>" 
								            + "<td>" + n.introduction + "</td>" 
							             + "</tr>";							           
							    table.append(tr);
							    j ++; 
						   });
						    table.append("</tbody><tfoot><tr align='center'>"
						    				+" <th>編輯</th><th>項目</th><th>景點名稱</th><th>完整地址</th><th>照片</th><th>介紹</th>"
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
                  	 <a href="<c:url value='/attractionsMain.controller'/>" name="gotoTitle">
                  	 	<font style="vertical-align: inherit;">景點管理</font>
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
                                <h3 class="card-title" > 景點管理</h3> 
	                                <div style='text-align:right;'>
	                                	<a href="<c:url value='/atInitMain.AtInitForm'/>" style='color:	#005AB5;' ><button type="button" class="btn btn-primary">+新增景點</button></a>
	                                </div>
					                           		
								<!--  資料顯示  -->
									<table class='table table-striped table-bordered zero-configuration dataTable' id='table_id' role='grid' aria-describedby='DataTables_Table_0_info'>														
									</table>
								<!--  分頁  -->
									<table id="showpage" class='table zero-configuration'>
										<tr>
											<td align="right">  
											<c:forEach var="i" begin="1" end="${totalPages}" step="1">
												<a href="#gotoTitle"><button id="myPage" value="${i}" onclick="change(${i})" class="btn mb-1 btn-rounded btn-secondary">${i}</button></a>
											</c:forEach>
											共${totalPages}頁 <%--  總筆數:${totalElements} --%>
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