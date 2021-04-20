<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.iii.trip.trainandhotel.repository.*"%>
<%@page import="com.iii.trip.trainandhotel.service.*"%>
<!DOCTYPE html>
<%
List<Hotel> hotelList = (List<Hotel>) request.getAttribute("hotelList")!= null ? (List<Hotel>) request.getAttribute("hotelList")
        : new ArrayList<>();
for (Hotel hotel : hotelList){        
%>
<tr>													
	<td>
		<input type="hidden" value=<%=hotel.getId()%> name="hotelId">
		<span><%=hotel.getName()%></span>
	</td>
	<td><%=hotel.getUserId() %></td>
	<td><%=hotel.getCreateDate().toString().substring(0,10)  %></td>
	<td><%=hotel.getUpdateDate().toString().substring(0,10) %></td>		
	<td>
		<input type="radio" name ="<%=hotel.getId() %>" value="1" <%=hotel.getPermission().equals("1") ? "checked" : "" %>> 已上架
		<input type="radio" name ="<%=hotel.getId() %>" value="0"<%=hotel.getPermission().equals("0") ? "checked" : "" %>> 尚未上架
	</td>
</tr>
<%
	}
%>