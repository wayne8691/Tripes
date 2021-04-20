<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.iii.trip.trainandhotel.repository.*"%>
<%@page import="com.iii.trip.trainandhotel.service.*"%>
<%
Hotel hotel = (Hotel) request.getAttribute("hotel");
List<String> hfRelationList = (List<String>) request.getAttribute("hotelFacilityRelationList");
List<HotelFacility> hfList = (List<HotelFacility>) request.getAttribute("hotelFacilityList");
List<HotelTag> tagList = (List<HotelTag>) request.getAttribute("tagList");
List<String> tagRelationList = (List<String>) request.getAttribute("tagRelationList");
System.out.println(request.getAttribute("tagRelationList"));

if(request.getAttribute("hotelFacilityRelationList") == null){
	hfRelationList = new ArrayList<>();
}

if(request.getAttribute("hotelFacilityList") == null){
	hfList = new ArrayList<>();
}

if(request.getAttribute("tagRelationList") == null){
	tagRelationList = new ArrayList<>();
}

if(request.getAttribute("tagList") == null){
	tagList = new ArrayList<>();
}

%>
<!DOCTYPE html>
<html lang="utf-8">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>編輯旅館</title>
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
				<h1>編輯旅館</h1>
			</div>
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="basic-form">
							<form action=./updateOwner method="post" enctype="multipart/form-data">
								<input type="hidden" value="<%=hotel.getId()%>" name="id" />
								<h4 class="card-title">所在縣市:</h4>
								<div class="basic-form">
									<div class="form-group">
										<select class="form-control" id="sel1" name="cityId" disabled>
											<option value="<%=hotel.getCity().getId()%>"><%=hotel.getCity().getName()%></option>
										</select>
									</div>
									<h4 class="card-title">旅館名稱:</h4>
									<div class="form-group">
										<input type="text" name="name" class="form-control input-default" value="<%=hotel.getName()%>" disabled>
									</div>
									<h4 class="card-title">旅館地址:</h4>
									<div class="form-group">
										<input type="text" name="address" class="form-control input-default" value="<%=hotel.getAddress()%>" disabled>
									</div>
									<h4 class="card-title">飯店介紹</h4>
									<div class="form-group">
										<textarea class="form-control h-150px" rows="10" id="comment" name="intro" disabled><%=hotel.getIntro()%></textarea>
									</div>
									<h4 class="card-title">飯店電話</h4>
									<div class="form-group">
										<input type="text" name="phone" class="form-control input-default"	value="<%=hotel.getPhone()%>" disabled>
									</div>
									<div class="row">
									<h4 class="card-title">飯店提供服務</h4>
										<div class="col">
									<%
										for (HotelFacility hf : hfList) {
											String checked = hfRelationList.contains(hf.getId()) ? "checked" : "";
									%>
											<div class="form-group">
												<div class="form-check form-check-inline">
													<label class="form-check-label" style="color:black;" disabled>
														<input type="checkbox" name="hotelFacility" class="form-check-input" value="<%=hf.getId()%>" <%=checked%> >
														<span><%=hf.getName() %></span>
													</label>
												</div>
											</div>
									<%
										}
									%>
									</div>
									<h4 class="card-title">飯店標籤</h4>
									<div class="col">
									<%
										for (HotelTag tag : tagList) {
											String checked = tagRelationList.contains(tag.getId()) ? "checked" : "";
									%>
									<div class="form-group">
											<div class="form-check form-check-inline">
												<label class="form-check-label" style="color:black;" disabled>
													<input type="checkbox" name="hotelTags" class="form-check-input" value="<%=tag.getId()%>" <%=checked %> >
													<span> <%=tag.getName() %></span>
												</label>
											</div>
											</div>
									<%
										}
									%>
									</div>
									</div>
										<hr />
										<h4 class="card-title">旅館照片</h4>
										<div class="basic-form">
											<div class="form-group">
												<img class="img1" src="<%=hotel.getPic() %>" style="width: 256px;" /> <input type="file" name="pic" class="form-control-file">
											</div>
										</div>
									</div>
									<h4 class="card-title">飯店所有人</h4>
									<div class="form-group">
										<input type="text" name="owner" class="form-control input-default"	value="">
									</div>
									<div class="col-auto">
										<button type="submit" class="btn btn-dark mb-2">Submit</button>
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