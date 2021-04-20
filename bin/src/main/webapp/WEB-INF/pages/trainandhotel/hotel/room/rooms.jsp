<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.iii.trip.trainandhotel.repository.*"%>
<%@page import="com.iii.trip.trainandhotel.utility.*"%>

<%
int pageNow = request.getAttribute("pageNow") != null ? (int)request.getAttribute("pageNow") : 1;
int maxPage = request.getAttribute("maxPage") != null ? (int)request.getAttribute("maxPage") : 1;
List<Room> list = request.getAttribute("roomList") != null ? (List<Room>) request.getAttribute("roomList") : new ArrayList<>();
Map<Room,List<RoomFacility>> roomFacilityMap = request.getAttribute("roomFacilityMap") != null ? (Map<Room,List<RoomFacility>>) request.getAttribute("roomFacilityMap") : new HashMap<>();

%>
<br><br>
<div class="container">
    <div class="row">
		<%
		for (Room room: list){
			int index = list.indexOf(room);
		%>
		<div class="col-md-4 col-lg-4">
			<div class="project-wrap hotel">
				<a href="#" class="img" style="background-image: url(<%=room.getPic()%>);">
				</a>
				<div class="text p-4">
					<input type="hidden" name=roomId value="<%=room.getId() %>">
					<h3 id="roomDetail" class="tooltip-test" data-toggle="tooltip" title="1" style=" color: black;"><%=room.getName() %></h3>
					<ul>
						<li style="color:black; font-size:18px;">床位 : <%=room.getBed() %></li>
						<li style="color:black; font-size:18px;">人數 : <%=room.getCapacity() %></li>
					</ul>
					<br>
					<dl>
						<dt style="color:#3e8914; font-size:16px;">房間設施 :</dt>
							<%
							for(int i = 0 ; i<roomFacilityMap.get(room).size();i++){
							%>
								<dd><span style="color:#3e8914; font-size:16px">✓ <%=roomFacilityMap.get(room).get(i).getName() %></span></dd>
							<%} %>
					</dl>
					<button class="btn btn-primary"><a href ="#wantBuy" style="color:white;">查詢價格</a></button>		
				</div>
			</div>
		</div>
		<%
		}
		%>
    </div>
</div>

<div class="row mt-5">
	<div class="col text-center">
		<div class="block-27"">
			<ul>
				<li class="page-item <%=(pageNow == 1 ? "disabled" : "")%>"><a href="javascript:changePage(<%=(pageNow - 1) < 1 ? 1 : (pageNow - 1)%>)">&lt;</a></li>
				<%
				for (int i = 0; i < maxPage; i++) {
				%>
				<li class="page-item <%=(pageNow == 1 ? "disabled" : "")%>"><a href="javascript:changePage(<%=(i+1)%>)"><%=(i+1)%></a></li>
				<%
				}
				%>
				<li class="page-item <%=(pageNow == 1 ? "disabled" : "")%>"><a href="javascript:changePage(<%=(pageNow + 1) > maxPage ? maxPage : (pageNow + 1)%>)">&gt;</a></li>
			</ul>
		</div>
	</div>
</div>