<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.iii.trip.trainandhotel.repository.*"%>
<%@page import="com.iii.trip.trainandhotel.service.*"%>
<!DOCTYPE html>
<%
List<Hotel> hotelList = (List<Hotel>) request.getAttribute("hotels")!= null ? (List<Hotel>) request.getAttribute("hotels")
        : new ArrayList<>();
for (Hotel hotel : hotelList){        
%>
	<tr>													
	   <td>
		   <input type="hidden" name="hotelId" value=<%=hotel.getId()%> name="hotelId">
		   <a href="./hotelInfo?hotelId=<%=hotel.getId()%>"> <%=hotel.getName()%></a>
	   </td>
	   <td><%=hotel.getCity().getName() %></td>   
	   <td><%=hotel.getCreateDate().toString().substring(0,10) %></td>
	   <td><%=hotel.getUpdateDate().toString().substring(0,10) %></td>
	   <td><%=hotel.getClickCount() %></td>
	   <td><a type="button" class="btn mb-1 btn-success" href="./hotel/edit?id=<%=hotel.getId()%>">編輯</a></td>
	   <td><div class="btn mb-1 btn-danger" onclick="deleteById('<%=hotel.getId()%>', '<%=hotel.getName()%>');">刪除</div></td>
   </tr>
<%
}
%>
