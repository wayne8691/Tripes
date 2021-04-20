<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.iii.trip.trainandhotel.repository.*"%>
<%@page import="com.iii.trip.trainandhotel.service.*"%>
<!DOCTYPE html>
<html lang="utf-8">
<%
	List<Hotel> hotelList = (List<Hotel>) request.getAttribute("hotelList")!= null ? (List<Hotel>) request.getAttribute("hotelList")
	        : new ArrayList<>();
%>
<%@ include file="/WEB-INF/pages/trainandhotel/manage/importBody.jsp"%>
<head>
	<%@ include file="/WEB-INF/pages/managementnav.jsp"%>
</head>

<body>
	<div class="content-body">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title" style="font-size:30px">旅館管理</h4>
							<a class="btn mb-1 btn-info " href="./hotel/insert">新增旅館</a>
							<div class="d-flex flex-row-reverse">
							<div class="click02 btn btn-dark" style="float: right">搜尋</div>
								<input type="text" id=blursearch style="float: right">
							</div>
						</div>
						<table class="table table-striped table-bordered zero-configuration">
							<thead>
                            	<tr>
                                	<th>旅館名稱</th>
                                	<th>所在縣市</th>
                                	<th>新增時間</th>
                                	<th>上次修改日期</th> 
                                	<th>點擊次數</th>
                                	<th>房間一覽</th>
                                	<th>編輯</th>        	
                                	<th>刪除</th>        	
                                </tr>
                            </thead>
							<tbody id="result">
								<%
									for (int i = 0; i < hotelList.size(); i++) {
								%>
									<tr>
										<td><%=hotelList.get(i).getName()%></div></td>
										<td><%=hotelList.get(i).getCity().getName() %></td>
    									<td><%=hotelList.get(i).getCreateDate().toString().substring(0,10)%></td>
    									<td><%=hotelList.get(i).getUpdateDate().toString().substring(0,10)%></td>
    									<td><%=hotelList.get(i).getClickCount()%></td>
    									<td><a type="button" class="btn mb-1 btn-dark" href="./hotelInfo?hotelId=<%=hotelList.get(i).getId()%>">房間一覽</a></td>
    									<td><a type="button" class="btn mb-1 btn-success" href="./hotel/edit?id=<%=hotelList.get(i).getId()%>">編輯</a></td>
    									<td><div class="btn mb-1 btn-danger" onclick="deleteById('<%=hotelList.get(i).getId()%>', '<%=hotelList.get(i).getName()%>');">刪除</div></td>
    								</tr>
    							<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	    $().ready(function(){
			$(".click02").on("click",function(){
				var key = document.getElementById('blursearch').value;
		
				$.ajax({
					url: "http://localhost:8080/trainandhotel/manage/blurResult",
					method: "POST",
					data : {
						key: key
					},
					beforeSend:function() {
				    },
				    success:function(response) {
				    	$("#result").html(response);
				    	swal("查詢完成","","success");
				    },
				    error:function(xhr, status, error) {
				    	swal("查詢失敗", "返回清單", "error")
				    },
				    complete:function(xhr, status) {
				    }
				});
			});
		});
	
		function deleteById(id, name) {
			swal({
			    title: "確定要刪除" + name + "?",
			    text: "請輸入你要刪除的原因",
			    content: {
				    element: "input",
				    attributes: {
				        placeholder: "寫下原因",
				        type: "string",
				    }
			    },
			    icon: "warning",
			    buttons: {
				    cancel: {
					    text: "取消",
					    value: false,
					    visible: true,
					    className: "",
					    closeModal: true
				    },
				    confirm: {
					    text: "確定",
					    value: true,
					    visible: true,
					    className: "",
					    closeModal: true
				    }
			    }
			})
			.then((inputVal) => {
				if (inputVal === false) {
					return false;
				}
				
				$.ajax({
					dataType : "JSON",
					method : "post",
					url : "./del",
					data : {
						id : id,
						reason: inputVal
					},
					beforeSend : function() {
					},
					success : function(data) {
						if (data.status) {
							swal(data.msg, data.title, data.type)
							.then(() => {location.reload();});
						} else {
							swal(data.msg, data.title, data.type);
						}
					},
					error : function(xhr, status, error) {
					},
					complete : function(xhr, status) {
					}
				});
			});
		};
		
		<%if (request.getAttribute("msg") != null) {%>
			swal("<%=request.getAttribute("msg")%>",'',"<%=request.getAttribute("type")%>");
		<%}%>
	
	</script>
</body>
</html>