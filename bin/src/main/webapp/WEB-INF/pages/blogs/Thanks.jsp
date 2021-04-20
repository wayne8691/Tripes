<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%
response.setContentType("text/html;charset=UTF-8");
%>
<jsp:useBean id="loginuser" class="com.iii.trip.member.model.MemberBean" scope="session"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>發表</title>
<script type="text/javascript">
function f(){
	location.href="http://localhost:8080/TripWeb/userBlogHome.controller";
	}
	let t =window.setTimeout(f,2000);

</script>
</head>
<body>
發表成功
</body>
</html>