<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="table table-striped table-bordered zero-configuration border-collapse: separate; train   " style='border-radius:20px'>
	<tbody>
		<tr style='background-color: blue;'>
			<td style='background-color: blue; text-align: center; color:white' colspan='2' >我要訂票</td>
		</tr>
		<tr>
			<td>起點</td>													
			<td>
				<select class='option100' name="start" id="start">
					<option value="">--</option>
					<%
					for (TrainStation ts : tsList) {
					%>
					<option value="<%=ts.getName()%>"><%=ts.getName() %> </option>
					<%
					}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<td>終點</td>
			<td>
				<select  id="end" name="end">	
					<option>--</option>
				</select>	
			</td>
		</tr>
		<tr>
			<td>剩餘票數</td> 
			<td><div id="last"></div></td>
		</tr>
		<tr>
			<td>購買張數</td>  
			<td>
				<select  id="buy" onchange='ticketCheckPrice()'>
					<option value="no">請選擇張數</option>
					<%for(int i=1;i<=10;i++){%>
					<option value="<%=i %>"><%=i %></option>
					<%}%>
				</select>
			</td>
		</tr>
		<tr>
			<td>費用</td> 
			<td><span id="price"></span></td>
		</tr>
		<tr>
			<td>購票</td>
			<td><button class="btn btn-primary" onclick="ticketCheckBuy()">加入購物車</button></td>
		</tr>
	</tbody>
</table> 	  