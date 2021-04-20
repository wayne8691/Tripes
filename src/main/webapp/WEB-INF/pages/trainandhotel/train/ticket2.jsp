<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.iii.trip.trainandhotel.repository.*"%>
<% List<Train> trainList = request.getAttribute("start") != null ? (List<Train>) request.getAttribute("start")
	        : new ArrayList<>();
	for(Train train: trainList){
%>
		<option><%=train.getDest() %></option>
<%
	}
%>