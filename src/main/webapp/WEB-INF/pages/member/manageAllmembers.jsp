<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
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
	var thuserid = document.getElementById("thuserid");
	var email = document.getElementById("email");
	var birthday = document.getElementById("birthday");
	var phone = document.getElementById("phone");
	var chname = document.getElementById("chname");
	var address = document.getElementById("address");
	var address1 = document.getElementById("address1");
	var registertime = document.getElementById("registertime");
	
	x.onclick = function(){
		thuserid.value="";
		email.value="";
		phone.value="";
		chname.value="";
		address.value= "";
		address1.value= "";
		birthday.value="";
		registertime.value="";
		dialog.style.display="none";
	}
}
function ha(user){
	var xhr0 = new XMLHttpRequest();
	xhr0.open("Post","<c:url value='/findthismember' />",true); 
	xhr0.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xhr0.send("userid=" + user );
	xhr0.onreadystatechange = function() {
			// 伺服器請求完成
			if (xhr0.readyState == 4 && (xhr0.status == 200 || xhr0.status == 201) ) {
				var result = JSON.parse(xhr0.responseText);
				var str = "";
				if(result[0].a_address!= null){
					str += result[0].a_address ;
					str += result[0].b_address ;
				}
				
				thuserid.value=result[0].userid;
				email.value=result[0].email;
				phone.value=result[0].phone;
				chname.value=result[0].name;
				address.value= str;
				address1.value= result[0].c_address;
				birthday.value=result[0].birthday;
				registertime.value=result[0].registertime;
			} 
	  	}
	dialog.style.display="block";
	console.log(user)
}
</script>
<meta charset="UTF-8">
<title>會員資訊</title>
</head>
<jsp:include page="../managementnav.jsp" flush="true" ></jsp:include>
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
                                    <table  class="table table-striped table-bordered zero-configuration">
                                        <thead >
                                            <tr>
                                                <th>職位</th>
                                                <th>會員Id</th>
                                                <th>會員姓名</th>
                                                <th>會員信箱</th>
                                                <th>最後上線時間</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach begin="1" end="${summembers}" var="i">
    												<tr>    													
    													<td>
    														<select onchange="f1(this,'${allmembers.get(i-1).getUserid()}')" id="select${i}">
    															<c:choose>
    																<c:when test="${allmembers.get(i-1).getStatus()=='a_Admin'}">
                                										<option value="a_Admin">a_Admin(Admin)</option>
                                									</c:when>
                                									<c:when test="${allmembers.get(i-1).getStatus()=='b_Manager'}">
                                										<option value="b_Manager">b_Manager(一般管理員)</option>
                                									</c:when>
                                									<c:when test="${allmembers.get(i-1).getStatus()=='c_Member'}">
                                										<option value="c_Member">c_Member(一般會員)</option>
                                									</c:when>
        															<c:when test="${allmembers.get(i-1).getStatus()=='y_Notcertified'}">
                                										<option value="y_Notcertified">y_Notcertified(未認證會員)</option>
                                									</c:when>
                                									<c:when test="${allmembers.get(i-1).getStatus()=='z_Suspension'}">
                                										<option value="z_Suspension">z_Suspension(停權會員)</option>
                                									</c:when>
																</c:choose>
    															<option value="a_Admin">a_Admin(Admin)</option>
    															<option value="b_Manager">b_Manager(一般管理員)</option>
    															<option value="c_Member">c_Member(一般會員)</option>
    															<option value="y_Notcertified">y_Notcertified(未認證會員)</option>
    															<option value="z_Suspension">z_Suspension(停權會員)</option>
    														</select>
    													</td>
    													<td><img src="${allmembers.get(i-1).getImage1()}" class=" rounded-circle mr-3" width="40px" height="40px" alt="">
    														<a style="color:blue;cursor:pointer;" onclick="ha('${allmembers.get(i-1).getUserid()}')">
    														${allmembers.get(i-1).getUserid()}
    														</a>
    													</td>
    													<td>${allmembers.get(i-1).getName()}</td>
    													<td>${allmembers.get(i-1).getEmail()}</td>
    													<td>${lastlogintime.get(i-1)}</td>
    												</tr>
											</c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>職位</th>
                                                <th>會員Id</th>
                                                <th>會員姓名</th>
                                                <th>會員信箱</th>
                                                <th>最後上線時間</th>
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
			<div class="row">
				<div class="col-lg-6 col-md-6">
						<div class="widget personal-info">
							
								<!-- User Name -->
								<div class="form-group">
									<label for="thuserid">用戶</label>
									<input type="text" class="form-control" id="thuserid" readonly>
								</div>
								
								<!-- Bitthday -->
								<div class="form-group">
									<label for="birthday">生日</label>
									<input type="text" class="form-control" id="birthday" readonly>
								</div>
								
								<div class="form-group">
									<label for="address">住址</label>
									<input type="text" class="form-control" id="address" readonly>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" id="address1" readonly>
								</div>
								
						</div>
					</div><div class="col-lg-6 col-md-6">
						<div class="widget personal-info">
							
								<div class="form-group">
									<label for="chname">中文姓名</label>
									<input type="text" class="form-control" id="chname" readonly>
								</div>
								
								<div class="form-group">
									<label for="phone">聯絡電話</label>
									<input type="text" class="form-control" id="phone" readonly>
								</div>
								
								<!-- Email -->
								<div class="form-group">
									<label for="email">信箱</label>
									<input type="text" class="form-control" id="email"  readonly>
								</div>
								<div class="form-group">
									<label for="email">註冊時間</label>
									<input type="text" class="form-control" id="registertime"  readonly>
								</div>
						</div>
					</div>
			</div>
		</div>
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
<script>
	function f1(th,idd){
		var xhr = new XMLHttpRequest();
			xhr.open("Post","<c:url value='/updatestatus' />",true); 
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xhr.send("userid=" + idd + "&status=" + th.value);
	}
</script>    
</body>

</html>