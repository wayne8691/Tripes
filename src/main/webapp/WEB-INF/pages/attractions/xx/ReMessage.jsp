<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Refresh" content="2,URL=restaurantMain.controller">
<title>message</title>
<style type="text/css">
   	h2{
   		text-align: center;
   		color:	#003060;
   	}
   	h4
   	{
   		text-align: center;
   		color:	#003060;
   	}

</style>
	<script type="text/javascript">
		function out(sec){
			var span1 = document.getElementById("span");
			if(--sec>0){
				setTimeout("out("+sec+")", 1000);
			}
			span1.innerHTML=sec;
		}
	</script>

</head>
<body onload="out(2)">

	<h2>${requestScope.message}</h2>
	<h4 align="center">請等候跳轉頁面倒數中...<span id="span"></span></h4>
</body>
</html>