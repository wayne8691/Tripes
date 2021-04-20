<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="loginuser" class="com.iii.trip.member.model.MemberBean"
	scope="session"></jsp:useBean>

<sql:setDataSource var="ds" dataSource="jndiJdbcConnSQLServer/SpringSystem" />
<sql:query sql="select * From Article" var="rs" dataSource="${ds}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
</head>
<body>
	<table border="1">
		<th>ArticleID</th>
		<th>title</th>
		<th>Contenet</th>
		<th>PublishTime</th>
		<th><input type="button" value="回首頁"
			onclick="location.href='http://localhost:8080/TripWeb/bloghome.controller'"></th>
		<c:forEach var="row" items="${rs.rows}">
				<tr>
					<td>${row.ArticleID}</td>
					<td>${row.Title}</td>
					<td>${row.Content1}</td>
					<td>${row.PublishTime}</td>
			<td><form action="blogUpdateArtcle.controller">
			<input type="hidden" name="id" value="${row.ArticleID}">
			<input type="hidden" name="title" value="${row.Title}">
			<input type="hidden" name="content" value="${row.Content1}">
					<input type="submit" name="updataid" value="updataid">
			</form></td>
			<td><form action="artremove.controller">
			<input type="hidden" name="id" value="${row.ArticleID}">
			<input type="submit" name="del" value="刪除"  >
			</form></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>