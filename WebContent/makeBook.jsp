<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>makekBook</title>
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
<%
if("ok_but_few".equals(session.getAttribute("book_check"))){
%>
	所选方案无法正常满足人数要求，但允许预订<br>
<%	session.setAttribute("book_check","");  %>
<% }else if("ok_book".equals(session.getAttribute("book_check"))){
%>
	所选方案合理<br>
<%	session.setAttribute("book_check","");
}
%>
<form method="post" action="/Hotel/Control">
	<input type="submit" value="确认预订">
	<input type="hidden" name="action" value="confirm_book">
</form>
</div>
</body>
</html>