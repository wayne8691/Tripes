<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>確認</title>
<style type="text/css">
        body {
            background-color: #F0F0F0;
        }
        table{
	        margin: auto;
	        background-color: #ffffff;
	        box-shadow:5px 5px 5px #BEBEBE;
        }
        td{
			width: 150px;
			border: 1px solid #ADADAD;
			text-align: center;
			margin: auto;
		}
	   	h2{
	   		text-align: center;
	   		color:	#003D79;
	   	}
	   	img{
			width:250px;
		}
		table {
			margin: auto;
			width: 50%;
			border: 1px solid #ADADAD;
		}
</style>
 
</head>
<body>
	<jsp:useBean id="attractionsBean" class="com.iii.trip.attractions.model.AttractionsBean" scope="session"/>
	<h2>新增資料如下</h2>
	<form action="attractions.controller1" method="post">
		<table cellpadding="5" border="5" width="100%">
			<tr>
				<td>景點名稱:</td>
				<td><jsp:getProperty property="name" name="attractionsBean"/></td>
			</tr>
			<tr>
				<td>縣&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;市:</td>
				<td><jsp:getProperty property="counties" name="attractionsBean"/></td>
			</tr>
			<tr>
				<td>完整地址:</td>
				<td><jsp:getProperty property="address" name="attractionsBean"/></td>
			</tr>
			<tr>
				<td>照&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;片:</td> 
				<td><img src="<jsp:getProperty  property="image" name="attractionsBean"/>" width="100px" height="156px"></td>
			</tr>
			<tr>
				<td>介&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;紹:</td>
				<td><jsp:getProperty property="introduction" name="attractionsBean" /></td>
			</tr>
		</table>
		<br>
		<center>
			<input type="submit" name="confirm" value="確認新增">
		</center>
	</form>
</body>
</html>