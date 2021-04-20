<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iii.trip.trainandhotel.repository.*"%>
<%@page import="com.iii.trip.trainandhotel.service.*"%>
<%
List<Hotel> hotels = (List<Hotel>)request.getAttribute("hotelList");
String hotelId = (String)request.getAttribute("hotelId");
Hotel hotel = (Hotel)request.getAttribute("hotel");

List<RoomFacility> rfList = request.getAttribute("roomFacilityList") != null ? (List<RoomFacility>) request.getAttribute("roomFacilityList")
		: new ArrayList<>();
%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>新增房間</title>
<%@ include file="/WEB-INF/pages/trainandhotel/manage/importBody.jsp"%>
</head>

<body>
	<%@ include file="/WEB-INF/pages/managementnav.jsp"%>
	<div class="content-body">
		<div class="row page-titles mx-0">
			<div class="col p-md-0">
			</div>
		</div>
		<div class="container-fluid">
			<div class="row">
				<div class="card-body">
					<h1>新增房間</h1>
					<div class="click101 btn btn-dark mb-2">快速輸入</div>
				</div>
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div class="basic-form">
								<form action=./insert method="post" enctype="multipart/form-data">
									<input type="hidden" name="hotelId" value="<%=hotel.getId()%>" />
									<h4 class="card-title">旅館名稱:</h4>
									<div class="basic-form">
										<div class="form-group">
											<select	class="form-control" id="sel1" disabled>
												<option value="<%= hotel.getId() %>" ><%=hotel.getName() %></option>
											</select>
										</div>
										<h4 class="card-title">房間名稱:</h4>												
										<div class="form-group">
											<input type="text" name="name"class="form-control input-default" placeholder="">
										</div>
										<h4 class="card-title">房間價格:</h4>
										<div class="form-group">
											<input type="text" name="price"class="form-control input-default" placeholder="">
										</div>
										<h4 class="card-title">房間人數:</h4>
										<div class="form-group">
											<input type="text" name="cap" class="form-control input-default" placeholder="">
										</div>
										<h4 class="card-title">房間床位:</h4>
										<div class="form-group">
											<input type="number" name="bed" min="1" max="5"	class="form-control input-default" placeholder="">
										</div>
										<h4 class="card-title">房間提供服務</h4>
										<%
											for (RoomFacility rf : rfList) {
										%>
												<div class="form-group">
													<div class="form-check form-check-inline">
														<label class="form-check-label" style="color:black;">
															<input type="checkbox" name="roomFacility" class="form-check-input" value="<%=rf.getId()%>"> <%=rf.getName() %>
														</label>
													</div>
												</div>
										<%
											}
										%>
										<hr/>
										<h4 class="card-title">房間照片</h4>
						                <div class="basic-form">
						                	<div class="form-group">
						                    	<input type="file" name="pic" class="form-control-file">
						                    </div>
			                            </div>
						        		<div class="col-auto">
                                        	<button type="submit" class="btn btn-dark mb-2">確定</button>
                                        </div>
									</div>
								</form>
							</div>
						</div>
                   	</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	$().ready(function(){
		
		$(".click101").on("click", function(){
			$("input[name='name']").val('單人房');
			$("input[name='price']").val('2000');
			$("input[name='cap']").val('1');
			$("input[name='bed']").val('1');
		});
		
		$(".click102").on("click", function(){
			$("input[name='name']").val('雙人房');
			$("input[name='price']").val('3000');
			$("input[name='cap']").val('2');
			$("input[name='bed']").val('1');
		});
		
	});
	</script>
	
</body>

</html>