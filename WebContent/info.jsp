<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="lib.BookData" %>
<%@ page import="lib.OrdersData" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <base href="<%=basePath%>">
        <link href="css/model.css" rel="stylesheet" type="text/css" />
<title>info</title>
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
<% 
String usrname = ((User)session.getAttribute("User")).usrname;
%>
	<tr>
		<td>欢迎，<%= usrname %></td>
	</tr>
	<tr> 
		<td>编号</td> 
		<td>人数</td> 
		<td>起始日期</td>
		<td>截止日期</td> 
		<td>房间</td>
	</tr>
<%
String res = (String)session.getAttribute("book_info");
if(res.equals("")){
%>
	<tr>
		<td>暂无</td>
	</tr>

<% }else{
	String[] infos = res.split("#");
	for(int i=0; i<infos.length; i++){
		String[] info = infos[i].split(";");
%>
	<tr> 
		<td><%= info[0] %></td>
		<td><%= info[1] %></td>
		<td><%= info[2] %></td>
		<td><%= info[3] %></td>
		<td><%= info[4] %></td>
	<% session.setAttribute("book_id", info[0]); %>
		<form method="post" action="/Hotel/Control">
		<td><input type="submit" value="删除订单"></td>
		<td><input type="hidden" name="action" value="delBook"></td>
		</form>
	</tr>
<% 	}
}%>
</table>
<table>
	<tr>
		<td>编号</td>
		<td>车次/航班</td>
		<td>日期</td>
	</tr>
<%
res = (String)session.getAttribute("order_info");
if(res.equals("")){
%>
	<tr>
		<td>暂无</td>
	</tr>
<% 
}else{
	String[] infos = res.split("#");
	for(int i=0; i<infos.length; i++){
		String[] info = infos[i].split(";");
%>
	<tr>
		<td><%= info[0] %></td>
		<td><%= info[1] %></td>
		<td><%= info[2] %></td>
	</tr>
<%	}
} %>
</table>
</div>
</body>
</html>