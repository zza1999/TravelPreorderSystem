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
<title>book</title>
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
    
<% 
if("single_less".equals(session.getAttribute("book_check"))){
	out.print("<script type=\"text/javascript\"> alert(\"单人间不足，剩余"+(int)session.getAttribute("sr")+"间！\"); </script>");
	session.setAttribute("book_check","");
}else if("double_less".equals(session.getAttribute("book_check"))){
	out.print("<script type=\"text/javascript\"> alert(\"双人间不足，剩余"+(int)session.getAttribute("dr")+"间！\"); </script>");
	session.setAttribute("book_check","");
}
%>
<div align="center">
<table>
	<tr><%= "欢迎,"+(String)session.getAttribute("usrname") %></tr>
	<tr><form method="post" action="/Hotel/Control">
		<td>单人间数:</td>
		<td><input type="text" name="singleRoom" value="0" style="width:80%"></td>
	</tr>
	<tr>
		<td>双人间数:</td>
		<td><input type="text" name="doubleRoom" value="0" style="width:80%"></td>
	</tr>
	<tr>
		<td>总人数:</td>
		<td><input type="text" name="count" value="0" style="width:80%"></td>
	</tr>
	<tr>
		<td>起始日期:</td>
		<td><input type="date" name="start" value="2019-01-01" style="width:80%"></td>
	</tr>
	<tr>
		<td>截止日期:</td>
		<td><input type="date" name="end" value="2019-01-01" style="width:80%"></td>
	</tr>
	<tr>
		<td><input type="submit" value="确认"></td>
		<td><input type="hidden" name="action" value="book"></td>
		</form>
	</tr>
	<tr><form action="main.jsp">
		<td><input type="submit" value="返回主菜单"></td>
		</form>
	</tr>
</table>
</div>
</body>
</html>