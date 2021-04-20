
<%@page import="com.iii.trip.blogs.model.ArticleBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<jsp:useBean id="loginuser" class="com.iii.trip.member.model.MemberBean" scope="session"></jsp:useBean>

<jsp:useBean id="up_article" class="com.iii.trip.blogs.model.ArticleBean" scope="session" />
<sql:setDataSource var="ds" dataSource="jndiJdbcConnSQLServer/SpringSystem" />
<c:set var = "empId" value = "<%=up_article.getArticleid_pk()%>"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
</head>
<body>
	<form action="artupdate.controller" >
	<input type="hidden" name="id" value="${id}">
		<table>
		
			<tr>
				<td>標題</td>
				<td><input TYPE="TEXT" name="title" value="${title}"></td>
			</tr>
			<tr>
				<td>內容</td>
				<td><input TYPE="TEXT" name="content" value="${content}"></td>
			</tr>
			<tr>
				<td>修改時間</td>
				<td>
					<%
						Date dNow = new Date();
					SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd hh:mm");
					out.print(ft.format(dNow));
					%>
				</td>
			</tr>

		</table>
		<input type="submit" name="add" value="修改" >
		<input type="button" name="Submit" onclick="javascript:history.back(-1);" value="回到上一頁">
		
	</form>

</body>
</html>