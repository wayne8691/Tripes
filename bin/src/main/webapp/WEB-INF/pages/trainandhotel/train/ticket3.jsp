<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.iii.trip.trainandhotel.repository.*"%>
<% List<Train> trainList = request.getAttribute("ticket") != null ? (List<Train>) request.getAttribute("ticket")
	        : new ArrayList<>();
	for(Train train: trainList){
%>
		<%=train.getQuantity()%>
<%
	}
%>
	