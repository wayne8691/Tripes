<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<jsp:useBean id="reg_restaurant" class="com.iii.trip.attractions.model.RestaurantBean" scope="session"/>
	<h2>新增資料如下</h2>
	<form action="restaurant.controller1" method="post">
		<table cellpadding="5" border="5" width="100%">
			<tr >
				<td>景點名稱:</td>
				<td><jsp:getProperty property="nameRe" name="reg_restaurant"/></td>
			</tr>
			<tr>
				<td>縣&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;市:</td>
				<td><jsp:getProperty property="countiesRe" name="reg_restaurant"/></td>
			</tr>
			<tr>
				<td>完整地址:</td>
				<td><jsp:getProperty property="addressRe" name="reg_restaurant"/></td>
			</tr>
			<tr>
				<td>營業時間:</td>
				<td><jsp:getProperty property="hoursRe" name="reg_restaurant"/></td>
			</tr>
			<tr>
				<td>店家電話:</td>
				<td><jsp:getProperty property="phoneRe" name="reg_restaurant"/></td>
			</tr>
			<tr>
				<td>美食種類:</td>
				<td><jsp:getProperty property="categoryRe" name="reg_restaurant"/></td>
			</tr>
			<tr>
				<td>照&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;片:</td> 
				<td><img src="<jsp:getProperty  property="imageRe" name="reg_restaurant"/>" width="100px" height="156px"></td>
			</tr>
			<tr>
				<td>介&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;紹:</td>
				<td><jsp:getProperty property="introductionRe" name="reg_restaurant" /></td>
			</tr>
		</table>
		<br>
		<center>
			<input type="submit" name="confirmRe" value="確認新增">
		</center>
	</form>
</body>
</html>