<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.iii.trip.trainandhotel.repository.*"%>
<%
	List<Hotel> hbList = request.getAttribute("hbList") != null ? (List<Hotel>) request.getAttribute("hbList")
	        : new ArrayList<>();
	List<String> strList = request.getAttribute("strList") != null ? (List<String>) request.getAttribute("strList")
	        : new ArrayList<>();
	String start = request.getAttribute("start") != null ? (String) request.getAttribute("start") : "";
	String end = request.getAttribute("end") != null ? (String) request.getAttribute("end") : "";
	String cap = request.getAttribute("cap") != null ? (String) request.getAttribute("cap") : "";
	int pageNow = request.getAttribute("pageNow") != null ? (int)request.getAttribute("pageNow") : 1;
	int maxPage = request.getAttribute("maxPage") != null ? (int)request.getAttribute("maxPage") : 1;
	int count = 0;
%>

<section class="ftco-section">
	<div class="container">
	<h1> 找到 <%=hbList.size()%>間住宿</h1>
		<div class="row" >

<%
	for (Hotel hotel : hbList) {
		count++;
%>
			<div class="col-md-4 ftco-animate fadeInUp ftco-animated">
            	<div class="hotel">
	            	 <a href="./emptyRooms?name=<%=hotel.getId()%>&start=<%=start%>&end=<%=end%>&cap=<%=cap%>">
	                 	<img class="img1" src="<%=hotel.getPic() %>" style="width:300px; height:200px;" />
	                    <span class="price"><!-- 房間價位 --> </span>
	                 </a>
	                 <div class="text p-4" style="background-color:white; width:300px; height:120px;" >
	                     <a href="./emptyRooms?name=<%=hotel.getId()%>&start=<%=start%>&end=<%=end%>&cap=<%=cap%>"><h3 style="color: #db0075;"> <%=hotel.getName() %></h3></a>
	                     <p class="location" style="color: #9B1B30; font-size:18px;"><span class="fa fa-map-marker"></span><%=hotel.getCity().getName()%><%=hotel.getAddress() %></p>
	                 </div>
	            </div>
	       </div>

			<%
				if(count % 3 == 0){
			%>		
				</div><div class="row"><div style="weight:200; height:50px;"></div></div><div class="row">
			<%		
					}
				}
			%>
		</div>
	</div>
</section>
