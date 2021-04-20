<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.iii.trip.trainandhotel.repository.*"%>
<%@page import="com.iii.trip.trainandhotel.service.*"%>
<!DOCTYPE html>
<%
List<Room> roomList = (List<Hotel>) request.getAttribute("rooms")!= null ? (List<Room>) request.getAttribute("rooms")
        : new ArrayList<>();
for (Room room : roomList){        
%>
	<tr>													
		<td>
	    	<input type="text" name="hotelId" value=<%=room.getName()%> name="hotelId" disabled>
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
