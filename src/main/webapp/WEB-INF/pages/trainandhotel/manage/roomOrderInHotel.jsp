<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.iii.trip.trainandhotel.repository.*"%>
<%@page import="com.iii.trip.trainandhotel.service.*"%>
<%
List<RoomOrder> roomOrderList = request.getAttribute("ros") !=null ? (List<RoomOrder>)request.getAttribute("ros") : new ArrayList<>();
Hotel hotel = request.getAttribute("hotel") !=null ? (Hotel)request.getAttribute("hotel") : new Hotel();
%>
<%@ include file="/WEB-INF/pages/trainandhotel/manage/importBody.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trip</title>
<%@ include file="/WEB-INF/pages/managementnav.jsp"%>
</head>
<body>
<div class="content-body">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title" style="font-size:30px"><%=hotel.getName()%>訂單一覽</h4>
						</div>
						<table class="table table-striped table-bordered zero-configuration">
							<thead>
                            	<tr>
                                	<th>房間名稱</th>
                                	<th>訂購開始時間</th>
                                	<th>入住時間</th> 
                                	<th>退房日期</th>       	
                                </tr>
                            </thead>
                            <tbody>
                            <%
                            if(roomOrderList != null && !roomOrderList.isEmpty()){
	                           	for(RoomOrder ro: roomOrderList){
                            %>
                            		<tr>
                            			<td><%=ro.getRoom().getName()%></td>
                            			<td></td>
                            			<td><%=ro.getStartDate().toString()%></td>
                            			<td><%=ro.getEndDate().toString()%>
                            		</tr>
                            <%
                            	}
                            }
                            %>
                            </tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>