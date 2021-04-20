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
					<div class="card gradient-1">
						<div class="card-body">
							<h3 class="card-title text-white">交易次數</h3>
							<div class="d-inline-block">
								<h2 class="text-white" id='querySelector'></h2>
								<p class="text-white mb-0" id='nowDatetimes'></p>
							</div>
							<span class="float-right display-5 opacity-5"><i
								class="fa fa-shopping-cart"></i></span>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="card gradient-2">
						<div class="card-body">
							<h3 class="card-title text-white">交易總金額</h3>
							<div class="d-inline-block">
								<h2 class="text-white" id='price'></h2>
								<p class="text-white mb-0" id='nowDate'></p>
							</div>
							<span class="float-right display-5 opacity-5"><i
								class="fa fa-money"></i></span>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="card gradient-3">
						<div class="card-body">
							<h3 class="card-title text-white">用戶人數</h3>
							<div class="d-inline-block">
								<h2 class="text-white" id="custernum"></h2>
								<p class="text-white mb-0" id="newcusterdate"></p>
							</div>
							<span class="float-right display-5 opacity-5"><i
								class="fa fa-users"></i></span>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="card gradient-4">
						<div class="card-body">
							<h3 class="card-title text-white">系統管理員</h3>
							<div class="d-inline-block">
								<h2 class="text-white" id="admin"></h2>
								<p class="text-white mb-0"></p>
							</div>
							<span class="float-right display-5 opacity-5"><i
								class="fas fa-user-secret"></i></span>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">會員權限分佈圖</h4>
							<div id="pie-chart" class="ct-chart ct-golden-section"></div>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">７天內會員登入次數</h4>
                                <div id="distributed-series" class="ct-chart ct-golden-section"></div>
                            </div>
                        </div>
                 </div>
                 <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">會員地區分佈圖</h4>
                                <div id="flotPie1" class="flot-chart"></div>
                            </div>
                        </div>
                 </div>
              	 <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">會員年齡分佈圖</h4>
                                <div id="flotPie2" class="flot-chart"></div>
                            </div>
                        </div>
               	</div>
               	<div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">銷售分佈圖</h4>
                                <div id="morris-donut-chart"></div>
                            </div>
                        </div>
                    </div>
                    
                     <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">銷售曲線圖</h4>
                                <div id="morris-area-chart"></div>
                            </div>
                        </div>
                    </div>
			</div>
		</div>
	</div>
		
</body>
  




	<script src="${pageContext.request.contextPath}/managementplugins/common/common.min.js"></script>
    <script src="${pageContext.request.contextPath}/managementjs/custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/managementjs/settings.js"></script>
    <script src="${pageContext.request.contextPath}/managementjs/gleek.js"></script>
    <script src="${pageContext.request.contextPath}/managementjs/styleSwitcher.js"></script>

    <script src="${pageContext.request.contextPath}/managementplugins/chartist/js/chartist.min.js"></script>
    <script src="${pageContext.request.contextPath}/managementplugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>
	<script src="${pageContext.request.contextPath}/managementplugins/flot/js/jquery.flot.min.js"></script>
    <script src="${pageContext.request.contextPath}/managementplugins/flot/js/jquery.flot.pie.js"></script>
    <script src="${pageContext.request.contextPath}/managementplugins/flot/js/jquery.flot.resize.js"></script>
    <script src="${pageContext.request.contextPath}/managementplugins/flot/js/jquery.flot.spline.js"></script>
    <script src="${pageContext.request.contextPath}/managementplugins/raphael/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath}/managementplugins/morris/morris.min.js"></script>
<script>

	window.onload = function() {
		
		var today=new Date();
		var xhr0 = new XMLHttpRequest();
		xhr0.open("Post", "<c:url value='/getcustomernum' />", true);
		xhr0.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xhr0.send();
		xhr0.onreadystatechange = function() {
			// 伺服器請求完成
			if (xhr0.readyState == 4&& (xhr0.status == 200 || xhr0.status == 201)) {
				var result = JSON.parse(xhr0.responseText);
				var custernum = document.getElementById("custernum");
				var newcusterdate = document.getElementById("newcusterdate");
				var admin = document.getElementById("admin");
				custernum.innerHTML = result.list1.length;
				newcusterdate.innerHTML = result.list1[result.list1.length - 1].registertime
						.substr(0, 10);
				admin.innerHTML = result.list2.length;
				
				//Pie chart with custom labels
				var data = {
					      labels: ['系統管理員', '一般管理員', '一般會員', '未認證會員', '停權會員'],
					      series: [result.list3[0], result.list3[1], result.list3[2], result.list3[3], result.list3[4]]
					    };
				var options = {
					      labelInterpolationFnc: function(value) {
					        return value[0]
					      }
					    };
				var responsiveOptions = [
					      ['screen and (min-width: 640px)', {
					        chartPadding: 30,
					        labelOffset: 100,
					        labelDirection: 'explode',
					        labelInterpolationFnc: function(value) {
					          return value;
					        }
					      }],
					      ['screen and (min-width: 1024px)', {
					        labelOffset: 80,
					        chartPadding: 20
					      }]
					    ];
				new Chartist.Pie('#pie-chart', data, options, responsiveOptions);
				console.log(result.list5)
				//Distributed series
				new Chartist.Bar('#distributed-series', {
				    labels: [(today.getMonth()+1)+'月'+(today.getDate()-6)+'日', (today.getMonth()+1)+'月'+(today.getDate()-5)+'日',
				    	(today.getMonth()+1)+'月'+(today.getDate()-4)+'日', (today.getMonth()+1)+'月'+(today.getDate()-3)+'日', 
				    	(today.getMonth()+1)+'月'+(today.getDate()-2)+'日', (today.getMonth()+1)+'月'+(today.getDate()-1)+'日',
				    	(today.getMonth()+1)+'月'+(today.getDate())+'日'],
				    series: [result.list5[6], result.list5[5], result.list5[4], result.list5[3], result.list5[2], result.list5[1], result.list5[0]]
				  }, {
				    distributeSeries: true,
				    plugins: [
				      Chartist.plugins.tooltip()
				    ]
				});
				
				/**************** PIE CHART *******************/
			    var piedata = [{
			            label: "14歲以下",
			            data: [
			                [1, result.list6[0]]
			            ],
			            color: '#272727'
			        },
			        {
			            label: "14~20歲",
			            data: [
			                [1, result.list6[1]]
			            ],
			            color: '#6ed3cf'
			        },
			        {
			            label: "21~30歲",
			            data: [
			                [1, result.list6[2]]
			            ],
			            color: '#9068be'
			        },
			        {
			            label: "31~40歲",
			            data: [
			                [1, result.list6[3]]
			            ],
			            color: '#e62739'
			        },
			        {
			            label: "41~50歲",
			            data: [
			                [1, result.list6[4]]
			            ],
			            color: 'gray'
			        },
			        {
			            label: "51~65歲",
			            data: [
			                [1, result.list6[5]]
			            ],
			            color: 'skyblue'
			        },
			        {
			            label: "65歲以上",
			            data: [
			                [1, result.list6[6]]
			            ],
			            color: 'green'
			        }
			    ];
				
			    var piedata1 = [{
		            label: "北部",
		            data: [
		                [1, result.list4[0]]
		            ],
		            color: '#272727'
		        },
		        {
		            label: "中部",
		            data: [
		                [1, result.list4[1]]
		            ],
		            color: '#6ed3cf'
		        },
		        {
		            label: "南部",
		            data: [
		                [1, result.list4[2]]
		            ],
		            color: '#9068be'
		        },
		        {
		            label: "東部",
		            data: [
		                [1, result.list4[3]]
		            ],
		            color: '#e62739'
		        },
		        {
		            label: "外島",
		            data: [
		                [1, result.list4[4]]
		            ],
		            color: 'green'
		        }
		    ];
				
			    $.plot('#flotPie1', piedata1, {
			        series: {
			            pie: {
			                show: true,
			                radius: 1,
			                label: {
			                    show: true,
			                    radius: 2 / 3,
			                    formatter: labelFormatter,
			                    threshold: 0.01
			                }
			            }
			        },
			        grid: {
			            hoverable: true,
			            clickable: true
			        }
			    });
			    
			    $.plot('#flotPie2', piedata, {
			        series: {
			            pie: {
			                show: true,
			                radius: 1,
			                innerRadius: 0.5,
			                label: {
			                    show: true,
			                    radius: 2 / 3,
			                    formatter: labelFormatter,
			                    threshold: 0.01
			                }
			            }
			        },
			        grid: {
			            hoverable: true,
			            clickable: true
			        }
			    });
				
				
			
			
			}
		}
		
		var xhr1 = new XMLHttpRequest();
		xhr1.open("Post", "<c:url value='/Manager/Statistical' />", true);
		xhr1.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xhr1.send();
		xhr1.onreadystatechange = function() {
			// 伺服器請求完成
			if (xhr1.readyState == 4
					&& (xhr1.status == 200 || xhr1.status == 201)) {
				
				var rest = JSON.parse(xhr1.responseText);
				console.log(rest)
				var times = document.getElementById("querySelector");
				var price = document.getElementById("price");
				
				
				var nowDatetimes = document.getElementById("nowDatetimes");
				var nowDate = document.getElementById("nowDate");
				
				times.innerHTML = rest.order.length;
				price.innerHTML = rest.price;
 						
				nowDatetimes.innerHTML = rest.date;
				nowDate.innerHTML = rest.date;
				
				
				
				
				// Morris donut chart
				Morris.Donut({
			        element: 'morris-donut-chart',
			        data: [{
			            label: "飯店",
			            value: rest.room,

			        }, {
			            label: "火車套票",
			            value: rest.train
			        }, {
			            label: "套裝行程",
			            value: rest.travel
			        }],
			        resize: true,
			        colors: ['#4d7cff', '#7571F9', '#9097c4']
			    });
				
				
				
				Morris.Area({
			        element: 'morris-area-chart',
			        data: [{
			            period: '2021-04-01',
			            smartphone: 0,
			            windows: 0,
			            mac: 0
			        }, {
			            period: '2021-04-15',
			            smartphone: rest.dateroom01,
			            windows:rest.datetrain01,
			            mac: rest.datetravel01
			        },{
			            period: '2021-04-15',
			            smartphone: rest.dateroom15,
			            windows:rest.datetrain15,
			            mac: rest.datetravel15
			        }, {
			            period: '2021-04-23',
			            smartphone: rest.dateroom23,
			            windows:rest.datetrain23,
			            mac: rest.datetravel23
			        }
			        


			        ],
			        xkey: 'period',
			        ykeys: ['smartphone', 'windows', 'mac'],
			        labels: ['飯店', '火車套票','套裝行程'],
			        pointSize: 3,
			        fillOpacity: 0,
			        pointStrokeColors: ['#7571F9', '#4d7cff', '#9097c4'],
			        behaveLikeLine: true,
			        gridLineColor: 'transparent',
			        lineWidth: 3,
			        hideHover: 'auto',
			        lineColors: ['#7571F9', '#4d7cff', '#9097c4'],
			        resize: true

			    });
				
				
				
				
				
				
			}
		}
		
		
		
		
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	 
	
	
	
	
	function labelFormatter(label, series) {
        return "<div style='font-size:8pt; text-align:center; padding:2px; color:white;'>"  + Math.round(series.percent) + "%</div>";
    }
</script>

</html>