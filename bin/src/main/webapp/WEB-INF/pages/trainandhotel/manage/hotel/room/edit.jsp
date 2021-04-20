<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.iii.trip.trainandhotel.repository.*"%>
<%@page import="com.iii.trip.trainandhotel.service.*"%>
<%
Room room = (Room)request.getAttribute("room");
List<String> hfRelationList = null;
List<RoomFacility> rfList = null;
if(request.getAttribute("roomFacilityRelationList") != null){
	hfRelationList = (List<String>) request.getAttribute("roomFacilityRelationList");
}

if(request.getAttribute("roomFacilityList") != null){
	rfList = (List<RoomFacility>) request.getAttribute("roomFacilityList");
}
%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>房間 <%=room.getName() %> 編輯</title>
<%@ include file="/WEB-INF/pages/trainandhotel/manage/importBody.jsp"%>

</head>

<body>
<%@ include file="/WEB-INF/pages/managementnav.jsp"%>
	<div class="content-body">
		<div class="row page-titles mx-0">
			<div class="col p-md-0"></div>
		</div>
		<div class="container-fluid">
			<div class="row">
			<div class="card-body">
				<h1>編輯房間</h1>
			</div>
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="basic-form">
							<form action=./update method="post" enctype="multipart/form-data">
								<input type="hidden" value="<%=room.getId()%>" name="id" />
								<h4 class="card-title">所在縣市:</h4>
								<div class="basic-form">
									<div class="form-group">
										<select class="form-control" id="sel1" name="cityId" disabled>
											<option value="<%=room.getHotel().getCity().getId() %>"><%=room.getHotel().getCity().getName()%></option>
										</select>
									</div>
									<h4 class="card-title">房間名稱:</h4>
									<div class="form-group">
										<input type="text" name="name"	class="form-control input-default" value="<%=room.getName()%>" style="border-color:black;">
									</div>
									<h4 class="card-title">房間人數:</h4>
									<div class="form-group">
										<input type="text" name="cap" class="form-control input-default" value="<%=room.getCapacity()%>" style="border-color:black;">
									</div>
									<h4 class="card-title">房間價格</h4>
									<div class="form-group">
										<input type="number" name="price" class="form-control h-150px" value="<%=room.getPrice()%>" style="border-color:black;">
									</div>
									<h4 class="card-title">房間床位</h4>
									<div class="form-group">
										<input type="number" name="bed" class="form-control h-150px" value="<%=room.getBed()%>" style="border-color:black;">
									</div>
									<h4 class="card-title">房間提供服務</h4>
									<%
										for (RoomFacility rf : rfList) {
											String checked = hfRelationList.contains(rf.getId()) ? "checked" : "";
									%>
											<div class="form-group">
												<div class="form-check form-check-inline">
													<label class="form-check-label" style="color:black;">
														<input type="checkbox" name="roomFacility" class="form-check-input" value="<%=rf.getId()%>" <%=checked%>>
														<span><%=rf.getName() %></span>
													</label>
												</div>
											</div>
									<%
										}
									%>
										<hr />
										<h4 class="card-title">旅館照片</h4>
										<div class="basic-form">
											<div class="form-group">
												<img class="img1" src="<%=room.getPic() %>" style="width: 256px;" />
											 <input type="file" name="pic" class="form-control-file" accept="image/*">
											</div>
										</div>
									</div>
									<div class="col-auto">
										<button type="submit" class="btn btn-dark mb-2">確定</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>		
		</div>
	</div>
</body>

</html>