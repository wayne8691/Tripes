<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iii.trip.trainandhotel.repository.*"%>
<%@page import="com.iii.trip.trainandhotel.service.*"%>
<%
Hotel hotel = request.getAttribute("hotel") != null?(Hotel)  request.getAttribute("hotel") : new Hotel();
List<Room> roomList = request.getAttribute("rooms") != null?(List<Room>)  request.getAttribute("rooms") : new ArrayList<>();
String intro = "";
for (String p: hotel.getIntro().split("\\n")) {
    intro += "<p>" + p + "</p>";   
}

%>

<!DOCTYPE html>
<html lang="utf-8">

<head>
<meta charset="UTF-8">
<title>Trip</title>
<%@ include file="/WEB-INF/pages/trainandhotel/manage/importBody.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/pages/managementnav.jsp"%>
	<div class="content-body">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title"><%=hotel.getName()%>  房間一覽</h4>
								<input type="hidden" id=hotelId value="<%=hotel.getId() %>">
								<a class="btn mb-1 btn-info" href="./hotel/room/insert?hotelId=<%=hotel.getId() %>">新增房間</a>
								<div class="d-flex flex-row-reverse">
									<div class="click02 btn btn-dark" style="float: right">搜尋</div>
									<input type="text" id=blursearch style="float: right">
								</div>
							</div>
							<table  class="table table-striped table-bordered zero-configuration">   
								<thead>	
									<tr>
		 								<th>房間名稱</th>
										<th>人數</th>
										<th>圖片</th> 
		                                <th>價格</th>        	
		                                <th>編輯</th>
		                                <th>刪除</th>        	
		                            </tr>
		                        </thead>
								<tbody id="result">
								<%
									for(Room room:roomList){
								%>
									<tr>													
	    								<td>
	    									<div value=<%=room.getName()%> name="roomName"> <%=room.getName()%></div>
	    								</td>
	    								<td><%=room.getCapacity() %></td>
	    								<td><img src="<%=room.getPic()%>" width="100px"></td>
	    								<td><%=String.valueOf(room.getPrice().intValue())%></td>
	    								<td><a type="button" class="btn mb-1 btn-success" href="./hotel/room/edit?id=<%=room.getId()%>">編輯</a></td>
	    								<td><div class="btn mb-1 btn-danger" onclick="deleteById('<%=room.getId()%>', '<%=room.getName()%>');">刪除</div></td>
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
	function deleteById(id, name) {
		if (confirm("是否刪除 " + name + " ?")) {
			$.ajax({
				dataType : "JSON",
				method : "post",
				url : "./hotel/room/del",
				data : {
					id : id
				},
				beforeSend : function() {
				},
				success : function(data) {
					console.log(data);
					if (data.status) {
						swal("刪除成功", "返回清單", "success")
						.then(() => {location.reload();});
					} else {
						alert(data.msg);
					}
				},
				error : function(xhr, status, error) {
					swal("刪除失敗", "返回清單", "error")
						.then(() => {location.reload();});
				},
				complete : function(xhr, status) {
				}
			});
		}
	}

	function deleteById(id, name) {
		swal({
		    title: "確定要刪除" + name + "?",
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
		.then((isConfirm) => {
			console.log(isConfirm);
			if (isConfirm) {
				$.ajax({
					dataType : "JSON",
					method : "post",
					url : "./hotel/room/del",
					data : {
						id : id
					},
					beforeSend : function() {
					},
					success : function(data) {
						if (data.status) {
							swal(data.msg, "", data.type)
							.then(() => {location.reload();});
						} else {
							swal(data.msg, "", data.type);
						}
					},
					error : function(xhr, status, error) {
					},
					complete : function(xhr, status) {
					}
				});
			}
		});
	};
	
	$().ready(function(){
		$(".click02").on("click",function(){
			var key = document.getElementById('blursearch').value;
			var hotelId = document.getElementById('hotelId').value;
			$.ajax({
				url: "http://localhost:8080/trainandhotel/manage/hotel/room/blurResultRoom",
				method: "POST",
				data : {
					key: key,
					hotelId: hotelId
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
	<%if (request.getAttribute("msg") != null) {%>
		swal("<%=request.getAttribute("msg")%>",'',"<%=request.getAttribute("type")%>");
	<%}%>
	</script>
</body>
</html>