<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<jsp:include page="../managementnav.jsp" flush="true"></jsp:include>
<body>
	<div class="content-body">
		<div class="container-fluid mt-3">
			<div class="row">
				<div class="col-lg-3 col-sm-6">
					<div class="card gradient-5">
						<div class="card-body">
							<h3 class="card-title text-white">飯店</h3>
							<div class="d-inline-block">
								<h2 class="text-white" id='nowhotel'></h2>
								<p class="text-white mb-0" id="nowdate0"></p>
							</div>
							<span class="float-right display-5 opacity-5"><i
								class="fas fa-bed"></i></span>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="card gradient-8">
						<div class="card-body">
							<h3 class="card-title text-white">景點</h3>
							<div class="d-inline-block">
								<h2 class="text-white" id='nowat'></h2>
								<p class="text-white mb-0" id="nowdate1"></p>
							</div>
							<span class="float-right display-5 opacity-5"><i
								class="fas fa-tree"></i></span>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="card gradient-7">
						<div class="card-body">
							<h3 class="card-title text-white">餐廳</h3>
							<div class="d-inline-block">
								<h2 class="text-white" id='nowre'></h2>
								<p class="text-white mb-0" id="nowdate2"></p>
							</div>
							<span class="float-right display-5 opacity-5"><i
								class="fas fa-utensils"></i></span>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="card gradient-6">
						<div class="card-body">
							<h3 class="card-title text-white">旅遊套票</h3>
							<div class="d-inline-block">
								<h2 class="text-white" id="nowtr"></h2>
								<p class="text-white mb-0" id="nowdate3"></p>
							</div>
							<span class="float-right display-5 opacity-5"><i
								class="fas fa-ticket-alt"></i></span>
						</div>
					</div>
				</div>
				
			</div>
			<div class="row">
				<!-- 熱門景點 -->
				<div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>熱門景點</h4>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>景點</th>
                                                <th>位置</th>
                                                <th>統計日期</th>
                                                <th>點擊率</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th>1</th>
                                                <td id="attractionname1"></td>
                                                <td ><span class="badge badge-primary px-2" id="attractionarea1"></span>
                                                </td>
                                                <td id="attractiondate1"></td>
                                                <td class="color-primary" id="attractiontouch1"></td>
                                            </tr>
                                            <tr>
                                                <th>2</th>
                                                <td id="attractionname2"></td>
                                                <td ><span class="badge badge-danger px-2" id="attractionarea2"></span>
                                                </td>
                                                <td id="attractiondate2"></td>
                                                <td class="color-success" id="attractiontouch2"></td>
                                            </tr>
                                            <tr>
                                                <th>3</th>
                                                <td id="attractionname3"></td>
                                                <td ><span class="badge badge-success px-2" id="attractionarea3"></span>
                                                </td>
                                                <td id="attractiondate3"></td>
                                                <td class="color-danger" id="attractiontouch3"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 熱門餐廳 -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>熱門餐廳 </h4>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>餐廳</th>
                                                <th>位置</th>
                                                <th>統計日期</th>
                                                <th>點擊率</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th>1</th>
                                                <td id="resname1"></td>
                                                <td><span class="badge badge-primary px-2" id="resarea1"></span>
                                                </td>
                                                <td id="resdate1"></td>
                                                <td class="color-primary" id="restouch1"></td>
                                            </tr>
                                            <tr>
                                                <th>2</th>
                                                <td id="resname2"></td>
                                                <td><span class="badge badge-danger px-2" id="resarea2"></span>
                                                </td>
                                                <td id="resdate2"></td>
                                                <td class="color-success" id="restouch2"></td>
                                            </tr>
                                            <tr>
                                                <th>3</th>
                                                <td id="resname3"></td>
                                                <td><span class="badge badge-success px-2" id="resarea3"></span>
                                                </td>
                                                <td id="resdate3"></td>
                                                <td class="color-danger" id="restouch3"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--熱門套票-->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">熱門套票</h4>
                                <div class="table-responsive">
                                    <table class="table header-border">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>熱門套票</th>
                                                <th>區域</th>
                                                <th>銷售數量</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="table-active">
                                                <td>1</td>
                                                <td id="toptrname1"></td>
                                                <td id="toptrarea1"></td>
                                                <td id="toptrcount1"></td>
                                            </tr>
                                            <tr class="table-primary">
                                                <td>1</td>
                                                <td id="toptrname2"></td>
                                                <td id="toptrarea2"></td>
                                                <td id="toptrcount2"></td>
                                            </tr>
                                            <tr class="table-success">
                                                <td>2</td>
                                                <td id="toptrname3"></td>
                                                <td id="toptrarea3"></td>
                                                <td id="toptrcount3"></td>
                                            </tr>
                                        
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--熱門飯店-->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">熱門飯店</h4>
                                <div class="table-responsive">
                                    <table class="table header-border">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>熱門飯店</th>
                                                <th>地址</th>
                                                <th>銷售數量</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="table-info">
                                                <td>1</td>
                                                <td id="tophtname1"></td>
                                                <td id="tophtarea1"></td>
                                                <td id="tophtcount1"></td>
                                            </tr>
                                            <tr class="table-warning">
                                                <td>2</td>
                                                <td id="tophtname2"></td>
                                                <td id="tophtarea2"></td>
                                                <td id="tophtcount2"></td>
                                            </tr>
                                            <tr class="table-danger">
                                                <td>3</td>
                                                <td id="tophtname3"></td>
                                                <td id="tophtarea3"></td>
                                                <td id="tophtcount3"></td>
                                            </tr>
                                        
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                     <!-- 景點分布 -->
                     <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">景點分布</h4>
                                <canvas id="singelBarChart" width="500" height="250"></canvas>
                            </div>
                        </div>
                     </div>
                     <!-- 餐廳分布 -->
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">餐廳分布餐廳分布</h4>
                                <canvas id="polarChart" width="500" height="250"></canvas>
                            </div>
                        </div>
                    </div>
                    <!-- Polar Chart -->
     
			</div>
		</div>
	</div>
		
</body>
  




	<script src="${pageContext.request.contextPath}/managementplugins/common/common.min.js"></script>
    <script src="${pageContext.request.contextPath}/managementjs/custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/managementjs/settings.js"></script>
    <script src="${pageContext.request.contextPath}/managementjs/gleek.js"></script>
    <script src="${pageContext.request.contextPath}/managementjs/styleSwitcher.js"></script>
    
    <script src="${pageContext.request.contextPath}/managementplugins/chart.js/Chart.bundle.min.js"></script>

    
<script>

	window.onload = function() {
		
		var today=new Date();
		var xhr0 = new XMLHttpRequest();
		xhr0.open("Post", "<c:url value='/getotherInf' />", true);
		xhr0.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xhr0.send();
		xhr0.onreadystatechange = function() {
			// 伺服器請求完成
			if (xhr0.readyState == 4&& (xhr0.status == 200 || xhr0.status == 201)) {
				var result = JSON.parse(xhr0.responseText);
				var nowat = document.getElementById("nowat");
				var nowre = document.getElementById("nowre");
				var nowtr = document.getElementById("nowtr");
				var nowhotel = document.getElementById("nowhotel");
				var nowdate1 = document.getElementById("nowdate1");
				var nowdate2 = document.getElementById("nowdate2");
				var nowdate3 = document.getElementById("nowdate3");
				var nowdate0 = document.getElementById("nowdate0");
				if(result.tr1[0].name.indexOf(myStr,0)!= -1){
					console.log("yse")			
					}
				console.log(result);
				nowhotel.innerHTML = result.list0[3];
				nowat.innerHTML = result.list0[0];
				nowre.innerHTML = result.list0[1];
				nowtr.innerHTML = result.list0[2];
				nowdate1.innerHTML = today.getMonth()+1 +"月"+today.getDate()+"日";
				nowdate2.innerHTML = today.getMonth()+1 +"月"+today.getDate()+"日";
				nowdate3.innerHTML = today.getMonth()+1 +"月"+today.getDate()+"日";
				nowdate0.innerHTML = today.getMonth()+1 +"月"+today.getDate()+"日";
				for(var i=1; i<=3; i++){
					var a = document.getElementById("attractionname"+i);
					var b = document.getElementById("attractionarea"+i);
					var c = document.getElementById("attractiondate"+i);
					var d = document.getElementById("attractiontouch"+i);
					var a1 = document.getElementById("resname"+i);
					var b1 = document.getElementById("resarea"+i);
					var c1 = document.getElementById("resdate"+i);
					var d1 = document.getElementById("restouch"+i);
					var a2 = document.getElementById("toptrname"+i);
					var b2 = document.getElementById("toptrarea"+i);
					var c2 = document.getElementById("toptrcount"+i);
					var a3 = document.getElementById("tophtname"+i);
					var b3 = document.getElementById("tophtarea"+i);
					var c3 = document.getElementById("tophtcount"+i);
					var myStr = "】";
					var string = "";
					a.innerHTML = result.list1[i-1].name;
					b.innerHTML = result.list1[i-1].counties;
					c.innerHTML = today.getMonth()+1 +"月"+today.getDate()+"日";
					d.innerHTML = result.list1[i-1].count;	
					a1.innerHTML = result.list2[i-1].nameRe;
					b1.innerHTML = result.list2[i-1].countiesRe;
					c1.innerHTML = today.getMonth()+1 +"月"+today.getDate()+"日";
					d1.innerHTML = result.list2[i-1].countRe;	
					for(let j=0;j<=result.tr1[i-1].name.indexOf(myStr,0);j++){
						string += result.tr1[i-1].name.charAt(j);
						a2.innerHTML = string;
					}
					b2.innerHTML = "起點：" + result.tr1[i-1].origin +"<br>終點：" + result.tr1[i-1].destination;
					c2.innerHTML = result.list6[i-1];
					a3.innerHTML = result.tr2[i-1].name;
					b3.innerHTML = result.tr2[i-1].address;
					c3.innerHTML = result.list8[i-1];
				}
				// single bar chart
			    var ctx = document.getElementById("singelBarChart");
			    ctx.height = 150;
			    var myChart = new Chart(ctx, {
			        type: 'bar',
			        data: {
			            labels: ["北部", "中部", "南部", "東部","外島"],
			            datasets: [
			                {
			                    label: "區域景點",
			                    data: [result.list3[0], result.list3[1], result.list3[2], result.list3[3], result.list3[4]],
			                    borderColor: "rgba(117, 113, 249, 0.9)",
			                    borderWidth: "0",
			                    backgroundColor: "rgba(117, 113, 249, 0.5)"
			                }
			            ]
			        },
			        options: {
			            scales: {
			                yAxes: [{
			                    ticks: {
			                        beginAtZero: true
			                    }
			                }]
			            }
			        }
			    });
			  //polar chart
			    var ctx = document.getElementById("polarChart");
			    ctx.height = 150;
			    var myChart = new Chart(ctx, {
			        type: 'polarArea',
			        data: {
			            datasets: [{
			                data: [result.list4[0], result.list4[1], result.list4[2], result.list4[3], result.list4[4]],
			                backgroundColor: [
			                    "rgba(117, 113, 249,0.9)",
			                    "rgba(117, 113, 249,0.8)",
			                    "rgba(117, 113, 249,0.7)",
			                    "rgba(144,	104,	190,0.7)",
			                    "rgba(117, 113, 249,0.5)"
			                ]

			            }],
			            labels: [
			                "北部",
			                "中部",
			                "南部",
			                "東部",
			                "外島"
			            ]
			        },
			        options: {
			            responsive: true
			        }
			    });
			    //
			}
		}	
			
	}
	
	
	
</script>

</html>