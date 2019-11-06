<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="bean.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bookSuccess</title>
        <base href="<%=basePath%>">
        <link href="css/model.css" rel="stylesheet" type="text/css" />
</head>
<body>
<style type="text/css">    
     body{
        font-size:24px;    
        background-image: url(images/bg.jpg);    
        background-size:cover;  
     }    
</style> 
 
    <!-- header -->
    <div align="center">
        <img src="images/top.jpg" />
    </div>
    </br>
    
<div align="center">
<table>
	<tr>
		<td>预订成功，订单信息如下：</td>
	</tr>
	<tr>
		<td>编号</td>
		<td>用户</td>
		<td>人数</td>
		<td>起始日期</td>
		<td>截止日期</td>
		<td>房间</td>
	</tr>
	<tr>
		<% Book book = (Book)session.getAttribute("Book"); %>
		<td><%= session.getAttribute("id") %></td>
		<td><%= ((User)session.getAttribute("User")).usrname %></td>
		<td><%= book.count %></td>
		<td><%= book.start %></td>
		<td><%= book.end %></td>
		<td><%= session.getAttribute("book_rooms") %></td>
	</tr>
	<tr><form action="book.jsp">
		<td><input type="submit" value="返回预订"></td>
		</form>
	</tr>
</table>
</div>
</body>
</html>